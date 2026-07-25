# 18. Libri consigliati


> 📄 **[Scarica questa sezione in PDF](https://darioschioppi.github.io/corso-onboarding-devops/pdf/18-libri-consigliati.pdf)** — utile per la stampa o la lettura offline.


Le sezioni da 1 a 17 di questo corso ti hanno già dato tutto ciò che ti serve per muovere i primi passi nel ruolo: i fondamenti tecnici, i framework Agile/Scrum, il Project Management e il mondo DevOps. Questa sezione è diversa dalle altre: non introduce concetti nuovi e obbligatori, ma raccoglie **12 libri di riferimento**, indicati direttamente dal responsabile del team, pensati per **approfondire con più calma e più profondità** ciò che nel corso hai visto in forma sintetica.

## La logica dei 5 livelli

I libri sono organizzati in **5 livelli di lettura progressiva**, costruiti seguendo la stessa logica "a mattoncini" con cui è organizzato il resto del corso (lo ricordi dalla sezione 1: non puoi costruire il tetto se non hai ancora le fondamenta):

- **Livello 0 – Fondamenti di informatica**: rafforza la sezione 2. Utile soprattutto se, arrivando da un percorso gestionale, senti ancora un po' di terreno instabile sotto i piedi quando si parla di computer, reti o architetture di base.
- **Livello 1 – Sviluppo software**: rafforza la sezione 3 (Come nasce un software) e la sezione 4 (Git e GitLab). Ti aiuta a capire **come lavorano davvero gli sviluppatori** che gestirai e con cui parlerai ogni giorno — non per scrivere codice tu stesso, ma per capire le loro priorità, i loro vincoli e il loro linguaggio.
- **Livello 2 – Agile**: rafforza le sezioni 5 (Agile), 6 (Scrum) e 7 (Kanban). È il livello più direttamente collegato al ruolo che andrai a occupare: Scrum Master.
- **Livello 3 – Project Management**: rafforza la sezione 8 (Project Management) e fa da ponte verso la sezione 9 (DevOps), mostrando cosa succede quando i metodi "leggeri" di Agile incontrano progetti complessi, reali, con tutte le loro frizioni.
- **Livello 4 – DevOps**: rafforza le sezioni 9-14 (il Blocco C del corso, quello più tecnico), con un'attenzione particolare a **perché** le pratiche DevOps funzionano, supportata da dati e ricerca, non solo da intuizione.

Non c'è un obbligo di leggerli tutti né di seguire l'ordine alla lettera: sono pensati per essere agganciati **al momento giusto del tuo percorso**, quando l'argomento del livello corrispondente è già "caldo" perché lo hai appena studiato o lo stai osservando dal vivo nel team. Per questo, ogni libro qui sotto include un suggerimento su **quando** leggerlo rispetto al [Piano di studio](../17-piano-di-studio/README.md) a 8 settimane.

> 💡 **Come usare questa sezione**: non è pensata per essere letta tutta subito. Torna qui ogni volta che completi un blocco di sezioni del corso (ad esempio dopo aver finito la sezione 6 su Scrum) e scegli il libro del livello corrispondente che ti interessa di più. Va benissimo leggerne solo alcuni, o leggerli fuori ordine, se un argomento ti appassiona particolarmente.

---

## Livello 0 – Fondamenti di informatica

### "Code" – Charles Petzold

Questo libro racconta, con un linguaggio quasi narrativo e senza dare per scontato nulla, come si arriva dai concetti più elementari (interruttori, codice binario) fino a un computer moderno funzionante. È il libro ideale se, dopo la sezione 2, ti restano ancora dei dubbi su **cosa succede davvero dentro la macchina** quando parliamo di CPU, memoria o istruzioni: qui lo vedrai costruito pezzo per pezzo, in modo che l'intuizione resti solida anche quando in team si parla di argomenti più avanzati come container o cloud.

- **Quando leggerlo**: consigliato durante la settimana 1-2, in parallelo o subito dopo la sezione 2 (Fondamenti di informatica).
- **Difficoltà**: Media (richiede attenzione ma nessuna competenza pregressa).
- **Tempo stimato**: 10-12 ore di lettura complessiva.

### "Computer Science Distilled" – Wladston Ferreira Filho

Un libro molto compatto e visuale, pensato per chi vuole avere una mappa d'insieme dei concetti chiave dell'informatica (algoritmi, strutture dati, basi di reti e sistemi) senza addentrarsi nei dettagli tecnici che, nel tuo ruolo, non ti serviranno mai scrivere in prima persona. È un ottimo complemento "riassuntivo" alla sezione 2 del corso: dove il corso spiega con analogie, questo libro offre schemi e diagrammi che aiutano a fissare i concetti in memoria a lungo termine.

- **Quando leggerlo**: consigliato durante la settimana 2, come ripasso rapido dopo la sezione 2.
- **Difficoltà**: Facile (molto sintetico e visuale).
- **Tempo stimato**: 4-6 ore di lettura complessiva.

### "Computer Networking: A Top-Down Approach" – Kurose & Ross (capitoli introduttivi)

Questo è il manuale universitario di riferimento per le reti informatiche: non serve leggerlo per intero (è pensato per un intero corso semestrale), ma i **capitoli introduttivi** sulla struttura di internet, sui protocolli TCP/IP e su HTTP/HTTPS offrono un livello di dettaglio superiore a quello della sezione 2, utile se nel team senti spesso discussioni su reti, ambienti e connessioni tra servizi e vuoi capirle a fondo, non solo a livello di analogia.

- **Quando leggerlo**: lettura di consolidamento dopo la settimana 2, oppure più avanti se emergono dubbi specifici su reti durante le sezioni su Cloud (13) o CI/CD (11).
- **Difficoltà**: Impegnativo (è un testo universitario, anche se i capitoli iniziali sono i più accessibili).
- **Tempo stimato**: 6-8 ore per i soli capitoli introduttivi.

---

## Livello 1 – Sviluppo software

### "Clean Code" – Robert C. Martin

Non diventerai uno sviluppatore, ma capire **cosa rende il codice "buono" o "scadente"** agli occhi di chi lo scrive ti aiuta moltissimo a comprendere discussioni di code review, stime più lunghe del previsto per "ripulire" una parte di codice (il cosiddetto debito tecnico) o perché il team insiste su determinate pratiche. Questo libro, uno dei più citati nel mondo dello sviluppo software, ti dà il vocabolario e la sensibilità per capire quelle conversazioni dall'interno, collegandosi direttamente a quanto visto nella sezione 3 sul ciclo di vita del software e sulla code review.

- **Quando leggerlo**: consigliato durante la settimana 3, dopo aver completato la sezione 3 (Come nasce un software) e la sezione 4 (Git e GitLab).
- **Difficoltà**: Media (alcuni esempi di codice, ma i concetti generali sono comprensibili anche senza saperlo scrivere).
- **Tempo stimato**: 10-12 ore di lettura complessiva.

### "The Pragmatic Programmer" – Andrew Hunt & David Thomas

Un classico che va oltre il "come scrivere codice" per parlare di **come pensano e lavorano gli sviluppatori**: gestione degli errori, automazione, comunicazione con il team, cura dei dettagli. È particolarmente utile per un futuro Scrum Master perché offre uno sguardo diretto sulla mentalità delle persone che facilitatore e coordinerai, aiutandoti a capire le loro priorità quando negozi scadenze o priorità del backlog.

- **Quando leggerlo**: consigliato durante la settimana 3-4, come lettura di accompagnamento a "Clean Code" o subito dopo.
- **Difficoltà**: Media.
- **Tempo stimato**: 8-10 ore di lettura complessiva.

---

## Livello 2 – Agile

### "Scrum: The Art of Doing Twice the Work in Half the Time" – Jeff Sutherland

Scritto da uno dei co-creatori di Scrum, questo libro racconta la nascita del framework attraverso storie concrete (compresi progetti falliti prima dell'adozione di Scrum), rendendo tangibile il "perché" dietro le pratiche che hai studiato nella sezione 6 in modo più formale. È una lettura quasi narrativa, perfetta per consolidare la motivazione dietro Sprint, Daily Scrum e Retrospective proprio mentre inizi a osservarle dal vivo nel team, secondo la Fase 1 (Osservazione) del tuo percorso di crescita.

- **Quando leggerlo**: consigliato durante la settimana 4-5, subito dopo la sezione 6 (Scrum), mentre osservi le prime cerimonie del team.
- **Difficoltà**: Facile (scorrevole, orientato agli aneddoti più che alla teoria pura).
- **Tempo stimato**: 6-8 ore di lettura complessiva.

### "Essential Scrum" – Kenneth Rubin

Se il libro di Sutherland è la storia e la motivazione, questo è il **manuale di riferimento**: copre in modo sistematico ruoli, eventi e artefatti di Scrum, con diagrammi chiari e casi limite che il corso, per motivi di sintesi, non può trattare in dettaglio (ad esempio come gestire Sprint con più team, o come stimare backlog molto grandi). È il libro da tenere sul comodino durante la Fase 2 (Affiancamento attivo), quando comincerai a condurre tu stesso alcune cerimonie.

- **Quando leggerlo**: lettura di consolidamento dopo la settimana 5, quando inizi a facilitare direttamente le prime attività.
- **Difficoltà**: Media (più denso e sistematico del libro di Sutherland).
- **Tempo stimato**: 12-15 ore di lettura complessiva.

---

## Livello 3 – Project Management

### "Making Things Happen" – Scott Berkun

Un libro sul project management che non segue la logica rigida del Waterfall universitario, ma parla di gestione dei progetti nel mondo reale: comunicazione, gestione delle pressioni, decisioni sotto incertezza. Si collega direttamente alla sezione 8, dove hai visto che il project management in un contesto Agile è più simile a "un navigatore che aggiorna la rotta" che a un piano rigido: questo libro approfondisce esattamente quella metafora con esempi pratici su stakeholder, rischi e comunicazione.

- **Quando leggerlo**: consigliato durante la settimana 5-6, subito dopo la sezione 8 (Project Management).
- **Difficoltà**: Media.
- **Tempo stimato**: 10-12 ore di lettura complessiva.

### "The Phoenix Project" – Gene Kim, Kevin Behr, George Spafford

Un romanzo aziendale (sì, è scritto come una storia, non come un manuale) che segue un IT manager alle prese con un progetto in crisi, mostrando in modo molto realistico le tensioni tra sviluppo, operations e business che la cultura DevOps cerca di risolvere. È probabilmente il libro più "riconoscibile" di questa lista per chi lavora nel team: molte delle dinamiche raccontate (rilasci in ritardo, colpe scaricate tra reparti, pressione degli stakeholder) sono facilmente riconducibili a episodi reali che osserverai. Fa da ponte naturale verso la sezione 9 (DevOps).

- **Quando leggerlo**: consigliato durante la settimana 6, come transizione tra il blocco Project Management e il blocco DevOps del corso.
- **Difficoltà**: Facile (si legge come un romanzo, nonostante i temi tecnici).
- **Tempo stimato**: 8-10 ore di lettura complessiva.

---

## Livello 4 – DevOps

### "The DevOps Handbook" – Gene Kim, Jez Humble, Patrick Debois, John Willis

Se "The Phoenix Project" racconta la storia in forma di romanzo, questo libro ne è il **manuale operativo**: spiega in modo sistematico i principi e le pratiche DevOps (i tre flussi, l'automazione, il modello CALMS che hai già incontrato nella sezione 9) con esempi reali di aziende che li hanno adottati. È il testo di riferimento per capire in profondità tutto il Blocco C del corso (sezioni 9-14), collegando cultura, pratiche tecniche e risultati di business in un unico quadro coerente.

- **Quando leggerlo**: consigliato durante la settimana 7, dopo aver completato la sezione 9 (DevOps) e la sezione 11 (CI/CD).
- **Difficoltà**: Impegnativo (denso, ma organizzato in modo molto chiaro).
- **Tempo stimato**: 15-18 ore di lettura complessiva.

### "Accelerate" – Nicole Forsgren, Jez Humble, Gene Kim

Un libro diverso dagli altri: qui la cultura DevOps non viene raccontata per aneddoti ma **misurata con dati e ricerca scientifica**, mostrando quali pratiche (deployment frequenti, automazione, cultura blameless) sono statisticamente collegate a team e organizzazioni ad alte prestazioni. È la lettura ideale per chi, come te, viene da un percorso gestionale abituato a ragionare per KPI e metriche: ti dà argomenti solidi per spiegare al cliente o ai responsabili **perché** certe pratiche DevOps valgono l'investimento, andando oltre l'intuizione.

- **Quando leggerlo**: lettura di consolidamento dopo la settimana 7-8, come chiusura del percorso DevOps del corso e apertura verso l'autonomia della Fase 3.
- **Difficoltà**: Impegnativo (alcuni capitoli hanno un taglio statistico/metodologico).
- **Tempo stimato**: 10-12 ore di lettura complessiva.

---

## Tabella riepilogativa

| # | Livello | Titolo | Autore/i | Difficoltà | Tempo stimato |
|---|---------|--------|----------|------------|----------------|
| 1 | 0 – Fondamenti di informatica | Code | Charles Petzold | Media | 10-12 ore |
| 2 | 0 – Fondamenti di informatica | Computer Science Distilled | Wladston Ferreira Filho | Facile | 4-6 ore |
| 3 | 0 – Fondamenti di informatica | Computer Networking: A Top-Down Approach (cap. introduttivi) | Kurose & Ross | Impegnativo | 6-8 ore |
| 4 | 1 – Sviluppo software | Clean Code | Robert C. Martin | Media | 10-12 ore |
| 5 | 1 – Sviluppo software | The Pragmatic Programmer | Andrew Hunt & David Thomas | Media | 8-10 ore |
| 6 | 2 – Agile | Scrum: The Art of Doing Twice the Work in Half the Time | Jeff Sutherland | Facile | 6-8 ore |
| 7 | 2 – Agile | Essential Scrum | Kenneth Rubin | Media | 12-15 ore |
| 8 | 3 – Project Management | Making Things Happen | Scott Berkun | Media | 10-12 ore |
| 9 | 3 – Project Management | The Phoenix Project | Gene Kim, Kevin Behr, George Spafford | Facile | 8-10 ore |
| 10 | 4 – DevOps | The DevOps Handbook | Gene Kim, Jez Humble, Patrick Debois, John Willis | Impegnativo | 15-18 ore |
| 11 | 4 – DevOps | Accelerate | Nicole Forsgren, Jez Humble, Gene Kim | Impegnativo | 10-12 ore |

> 📌 **Nota importante**: questi 12 libri sono un **arricchimento facoltativo**, non un requisito per completare il corso o per essere operativo nel ruolo — ma sono **fortemente raccomandati** dal responsabile del team, perché offrono una profondità che nessun corso di onboarding può dare in poche settimane. Non c'è alcuna fretta: molti di questi libri richiedono decine di ore di lettura e hanno tutto il senso di essere letti **con calma, anche ben oltre le 8 settimane iniziali** del [Piano di studio](../17-piano-di-studio/README.md), magari uno al mese nei primi 6-12 mesi di lavoro. L'importante è tornare a questa lista ogni volta che un argomento del corso ti ha incuriosito e vuoi andare più a fondo.

---

## 🔗 Collegamenti

- [19. Risorse online](../19-risorse-online/README.md) — altri materiali gratuiti (articoli, video, documentazione ufficiale) da consultare insieme o in alternativa ai libri
- [17. Piano di studio](../17-piano-di-studio/README.md) — il programma delle 8 settimane a cui agganciare le letture suggerite in questa sezione

## 📚 Risorse

- [Goodreads](https://www.goodreads.com) — per leggere recensioni, valutazioni e trovare edizioni (anche in italiano) di ciascun libro prima di acquistarlo
- [O'Reilly Online Learning](https://www.oreilly.com) — molti di questi titoli (in particolare quelli sullo sviluppo software e su DevOps) sono disponibili in versione e-book con abbonamento, spesso già incluso in piani aziendali
- Tutti i libri elencati sono inoltre disponibili sui principali store online (versione cartacea e e-book) e in molte biblioteche universitarie, essendo testi di riferimento ampiamente diffusi nel settore
