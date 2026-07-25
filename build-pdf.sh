#!/usr/bin/env bash
#
# build-pdf.sh — Rigenera i PDF del corso di onboarding DevOps a partire dai
# Markdown in docs/NN-nome-sezione/README.md.
#
# Per ogni sezione genera pdf/NN-nome-sezione.pdf, e genera inoltre
# pdf/corso-completo.pdf che concatena tutte le sezioni in ordine numerico
# con un indice (table of contents).
#
# I blocchi ```mermaid``` vengono pre-renderizzati in SVG con mermaid-cli
# (npx @mermaid-js/mermaid-cli) e sostituiti con immagini nel Markdown
# temporaneo passato a pandoc. Se mermaid-cli non è disponibile o fallisce,
# lo script ripiega automaticamente su un blocco di codice ben etichettato
# ("Diagramma") così la generazione non si blocca.
#
# Idempotente: può essere rieseguito quante volte serve, sovrascrive i PDF
# esistenti e pulisce le sue directory temporanee ad ogni esecuzione.
#
# Requisiti: pandoc, weasyprint (usato da pandoc come --pdf-engine), node/npx,
# pdfunite (poppler-utils, opzionale ma consigliato per corso-completo.pdf).

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOCS_DIR="$ROOT_DIR/docs"
PDF_DIR="$ROOT_DIR/pdf"
WORK_DIR="$(mktemp -d "${TMPDIR:-/tmp}/build-pdf.XXXXXX")"
MMDC_PUPPETEER_CFG="$WORK_DIR/puppeteer-config.json"

trap 'rm -rf "$WORK_DIR"' EXIT

mkdir -p "$PDF_DIR"

# ---------------------------------------------------------------------------
# Mermaid CLI: verifica disponibilità una sola volta.
# ---------------------------------------------------------------------------
MERMAID_AVAILABLE=0
if command -v npx >/dev/null 2>&1; then
  echo '{"args": ["--no-sandbox"]}' > "$MMDC_PUPPETEER_CFG"
  if npx -y -p @mermaid-js/mermaid-cli mmdc --version >/dev/null 2>&1; then
    MERMAID_AVAILABLE=1
    echo "[build-pdf] mermaid-cli disponibile: i diagrammi mermaid verranno renderizzati come immagini SVG."
  else
    echo "[build-pdf] ATTENZIONE: mermaid-cli non disponibile/funzionante: i diagrammi mermaid resteranno come blocchi di codice."
  fi
else
  echo "[build-pdf] ATTENZIONE: npx non trovato: i diagrammi mermaid resteranno come blocchi di codice."
fi

MMDC_FAILURES=0

# ---------------------------------------------------------------------------
# CSS condiviso per leggibilità (font, margini, tabelle, code block, titoli).
# ---------------------------------------------------------------------------
CSS_FILE="$WORK_DIR/style.css"
cat > "$CSS_FILE" <<'CSS'
@page {
  size: A4;
  margin: 2cm 1.8cm;
  @bottom-center {
    content: counter(page);
    font-size: 9pt;
    color: #666;
  }
}

body {
  font-family: "Helvetica Neue", Helvetica, Arial, "Liberation Sans", sans-serif;
  font-size: 10.5pt;
  line-height: 1.5;
  color: #1a1a1a;
}

h1, h2, h3, h4, h5, h6 {
  font-family: "Helvetica Neue", Helvetica, Arial, "Liberation Sans", sans-serif;
  color: #0b3d91;
  line-height: 1.25;
  page-break-after: avoid;
}

h1 {
  font-size: 22pt;
  border-bottom: 3px solid #0b3d91;
  padding-bottom: 0.2em;
  margin-top: 0;
}

h2 {
  font-size: 15pt;
  border-bottom: 1px solid #c7d3e8;
  padding-bottom: 0.15em;
  margin-top: 1.3em;
}

h3 {
  font-size: 12.5pt;
  color: #16497a;
  margin-top: 1.1em;
}

h4, h5, h6 {
  font-size: 11pt;
  color: #16497a;
}

p, li {
  orphans: 3;
  widows: 3;
}

a {
  color: #0b5fff;
  text-decoration: none;
}

code {
  font-family: "DejaVu Sans Mono", "Liberation Mono", Consolas, monospace;
  background-color: #f0f0f0;
  color: #a2274c;
  padding: 0.1em 0.3em;
  border-radius: 3px;
  font-size: 0.92em;
}

pre {
  background-color: #f4f4f4;
  border: 1px solid #ddd;
  border-left: 4px solid #0b3d91;
  border-radius: 3px;
  padding: 0.6em 0.8em;
  overflow-wrap: break-word;
  white-space: pre-wrap;
  page-break-inside: avoid;
}

pre code {
  background-color: transparent;
  color: #1a1a1a;
  padding: 0;
  font-size: 0.85em;
}

blockquote {
  border-left: 4px solid #8faadc;
  background-color: #f4f7fc;
  margin: 1em 0;
  padding: 0.5em 1em;
  color: #2a2a2a;
}

table {
  border-collapse: collapse;
  width: 100%;
  margin: 1em 0;
  font-size: 0.92em;
  page-break-inside: avoid;
}

th, td {
  border: 1px solid #ccc;
  padding: 0.4em 0.6em;
  text-align: left;
  vertical-align: top;
}

th {
  background-color: #0b3d91;
  color: #ffffff;
}

tr:nth-child(even) td {
  background-color: #f6f8fc;
}

hr {
  border: none;
  border-top: 1px solid #ccc;
  margin: 1.5em 0;
}

img {
  max-width: 100%;
  display: block;
  margin: 1em auto;
}

figure.mermaid-diagram {
  text-align: center;
  margin: 1.2em 0;
  page-break-inside: avoid;
}

figure.mermaid-diagram figcaption {
  font-size: 0.85em;
  color: #555;
  font-style: italic;
  margin-top: 0.3em;
}

.section-cover {
  text-align: center;
  margin-top: 30%;
  page-break-after: always;
}

.section-cover .kicker {
  font-size: 12pt;
  letter-spacing: 0.15em;
  text-transform: uppercase;
  color: #6a7d9c;
}

.section-cover h1 {
  border-bottom: none;
  font-size: 30pt;
  margin-top: 0.4em;
}

nav#TOC {
  page-break-after: always;
}

nav#TOC ul {
  list-style: none;
  padding-left: 1em;
}

nav#TOC > ul {
  padding-left: 0;
}

nav#TOC a {
  color: #1a1a1a;
}
CSS

# ---------------------------------------------------------------------------
# Funzione: pre-processa un README.md sostituendo i blocchi ```mermaid```
# con immagini SVG renderizzate (se possibile). Scrive il risultato in $2.
# ---------------------------------------------------------------------------
preprocess_mermaid() {
  local src_md="$1"
  local dst_md="$2"
  local assets_dir="$3"

  local rc=0
  python3 - "$src_md" "$dst_md" "$assets_dir" "$MERMAID_AVAILABLE" "$MMDC_PUPPETEER_CFG" <<'PYEOF' || rc=$?
import re
import sys
import subprocess
import os

src_md, dst_md, assets_dir, mermaid_available, puppeteer_cfg = sys.argv[1:6]
mermaid_available = mermaid_available == "1"

with open(src_md, "r", encoding="utf-8") as f:
    content = f.read()

os.makedirs(assets_dir, exist_ok=True)

pattern = re.compile(r"```mermaid\n(.*?)```", re.DOTALL)

counter = 0
failures = 0

def render_block(match):
    global counter, failures
    counter += 1
    code = match.group(1)

    if not mermaid_available:
        return "```text\n[Diagramma mermaid #%d — vedi versione online]\n%s```" % (counter, code)

    mmd_path = os.path.join(assets_dir, "diagram-%02d.mmd" % counter)
    svg_path = os.path.join(assets_dir, "diagram-%02d.svg" % counter)
    with open(mmd_path, "w", encoding="utf-8") as fh:
        fh.write(code)

    cmd = [
        "npx", "-y", "-p", "@mermaid-js/mermaid-cli", "mmdc",
        "-i", mmd_path, "-o", svg_path,
        "--puppeteerConfigFile", puppeteer_cfg,
        "--backgroundColor", "white",
    ]
    try:
        subprocess.run(cmd, check=True, capture_output=True, timeout=90)
        if os.path.exists(svg_path) and os.path.getsize(svg_path) > 0:
            rel = os.path.relpath(svg_path, os.path.dirname(dst_md))
            return "\n![Diagramma %d](%s)\n" % (counter, rel)
        raise RuntimeError("svg vuoto o assente")
    except Exception as exc:
        failures += 1
        sys.stderr.write("[build-pdf] mermaid fallito per blocco #%d: %s\n" % (counter, exc))
        return "```text\n[Diagramma mermaid #%d — non renderizzabile, vedi versione online]\n%s```" % (counter, code)

new_content = pattern.sub(render_block, content)

with open(dst_md, "w", encoding="utf-8") as f:
    f.write(new_content)

if failures:
    sys.exit(42)
PYEOF
  if [ "$rc" -eq 42 ]; then
    MMDC_FAILURES=$((MMDC_FAILURES + 1))
  fi
  return 0
}

# ---------------------------------------------------------------------------
# Estrae il titolo (prima riga "# ...") di un README per usarlo come
# frontespizio di sezione.
# ---------------------------------------------------------------------------
extract_title() {
  local md_file="$1"
  grep -m1 -E '^# ' "$md_file" | sed -E 's/^# +//'
}

# ---------------------------------------------------------------------------
# Rimuove la riga di link "Scarica questa sezione in PDF" (non ha senso
# dentro il PDF stesso) e normalizza qualche dettaglio prima della conversione.
# ---------------------------------------------------------------------------
strip_pdf_download_hint() {
  local md_file="$1"
  # Rimuove il blockquote con il link di download PDF, se presente.
  python3 - "$md_file" <<'PYEOF'
import re
import sys

path = sys.argv[1]
with open(path, "r", encoding="utf-8") as f:
    content = f.read()

content = re.sub(
    r"^> 📄.*Scarica questa sezione in PDF.*$\n?",
    "",
    content,
    flags=re.MULTILINE,
)

with open(path, "w", encoding="utf-8") as f:
    f.write(content)
PYEOF
}

# ---------------------------------------------------------------------------
# Individua tutte le sezioni docs/NN-*/README.md, ordinate numericamente.
# ---------------------------------------------------------------------------
mapfile -t SECTION_DIRS < <(find "$DOCS_DIR" -mindepth 1 -maxdepth 1 -type d -name '[0-9][0-9]-*' | sort)

if [ "${#SECTION_DIRS[@]}" -eq 0 ]; then
  echo "[build-pdf] Nessuna sezione trovata in $DOCS_DIR" >&2
  exit 1
fi

echo "[build-pdf] Trovate ${#SECTION_DIRS[@]} sezioni."

SECTION_PDFS=()

for dir in "${SECTION_DIRS[@]}"; do
  section_name="$(basename "$dir")"
  md_file="$dir/README.md"

  if [ ! -f "$md_file" ]; then
    echo "[build-pdf] Salto $section_name: README.md non trovato." >&2
    continue
  fi

  out_pdf="$PDF_DIR/${section_name}.pdf"
  section_work="$WORK_DIR/$section_name"
  mkdir -p "$section_work"

  tmp_md="$section_work/README.md"
  cp "$md_file" "$tmp_md"
  strip_pdf_download_hint "$tmp_md"
  preprocess_mermaid "$tmp_md" "$tmp_md" "$section_work/assets"

  title="$(extract_title "$md_file")"
  [ -z "$title" ] && title="$section_name"

  echo "[build-pdf] Genero $out_pdf  (\"$title\")"

  pandoc "$tmp_md" \
    -o "$out_pdf" \
    --pdf-engine=weasyprint \
    --standalone \
    --css "$CSS_FILE" \
    --metadata title="$title" \
    --resource-path="$section_work:$dir" \
    2> "$section_work/pandoc.log" || {
      echo "[build-pdf] ERRORE nella generazione di $out_pdf, log:" >&2
      cat "$section_work/pandoc.log" >&2
      exit 1
    }

  SECTION_PDFS+=("$out_pdf")
done

# ---------------------------------------------------------------------------
# corso-completo.pdf: un unico documento con copertina, indice e tutte le
# sezioni in ordine, generato direttamente da pandoc (un solo documento
# Markdown concatenato) così l'indice (--toc) funziona correttamente.
# In alternativa più semplice/robusta: unione dei singoli PDF con pdfunite,
# preceduti da una pagina di indice generata separatamente.
# ---------------------------------------------------------------------------
echo "[build-pdf] Genero pdf/corso-completo.pdf"

COMBINED_MD="$WORK_DIR/corso-completo.md"
COMBINED_ASSETS="$WORK_DIR/combined-assets"
mkdir -p "$COMBINED_ASSETS"

{
  echo "---"
  echo "title: Corso di Onboarding DevOps"
  echo "---"
  echo
  echo "<div class=\"section-cover\">"
  echo
  echo "<div class=\"kicker\">Corso di Onboarding</div>"
  echo
  echo "# Da neolaureato a Junior Project Manager / Scrum Master"
  echo
  echo "</div>"
  echo
} > "$COMBINED_MD"

for dir in "${SECTION_DIRS[@]}"; do
  section_name="$(basename "$dir")"
  md_file="$dir/README.md"
  [ -f "$md_file" ] || continue

  section_work="$WORK_DIR/$section_name"
  tmp_md="$section_work/README.md"
  # Riusa il markdown pre-processato (mermaid già renderizzato) creato nel
  # loop precedente, ma copia gli asset SVG nella cartella condivisa del
  # documento combinato con path aggiornati.
  combined_section_md="$WORK_DIR/combined-$section_name.md"

  if [ -d "$section_work/assets" ]; then
    mkdir -p "$COMBINED_ASSETS/$section_name"
    cp -r "$section_work"/assets/. "$COMBINED_ASSETS/$section_name/" 2>/dev/null || true
    sed -E "s#\]\(assets/#](combined-assets/${section_name}/#g" "$tmp_md" > "$combined_section_md"
  else
    cp "$tmp_md" "$combined_section_md"
  fi

  echo "" >> "$COMBINED_MD"
  cat "$combined_section_md" >> "$COMBINED_MD"
  echo "" >> "$COMBINED_MD"
  echo '<div style="page-break-after: always;"></div>' >> "$COMBINED_MD"
  echo "" >> "$COMBINED_MD"
done

pandoc "$COMBINED_MD" \
  -o "$PDF_DIR/corso-completo.pdf" \
  --pdf-engine=weasyprint \
  --standalone \
  --toc \
  --toc-depth=2 \
  --metadata title="Corso di Onboarding DevOps" \
  --css "$CSS_FILE" \
  --resource-path="$WORK_DIR" \
  2> "$WORK_DIR/pandoc-combined.log" || {
    echo "[build-pdf] ERRORE nella generazione di corso-completo.pdf, log:" >&2
    cat "$WORK_DIR/pandoc-combined.log" >&2
    exit 1
  }

echo
echo "[build-pdf] Completato. PDF generati in $PDF_DIR:"
ls -la "$PDF_DIR"

if [ "$MMDC_FAILURES" -gt 0 ]; then
  echo
  echo "[build-pdf] ATTENZIONE: $MMDC_FAILURES sezione/i hanno avuto almeno un diagramma mermaid non renderizzabile (lasciato come blocco di codice)."
fi
