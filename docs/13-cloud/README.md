# 13. Cloud


> 📄 **[Scarica questa sezione in PDF](../../pdf/13-cloud.pdf)** — utile per la stampa o la lettura offline.


Nella sezione precedente hai visto come è "fatto" un software: monolite o
microservizi, frontend e backend, database, code di messaggi. Ora facciamo un
passo ulteriore e ci chiediamo: **dove vive fisicamente tutto questo?** Su
quali macchine viene eseguito il codice? Dove sono salvati i dati?

La risposta, oggi, nella grande maggioranza dei casi è: **nel cloud**. In
questa sezione capirai cosa significa davvero questa parola (che spesso viene
usata in modo vago, quasi magico), quali sono i principali modelli con cui si
"affitta" il cloud, e come si chiamano i pezzi principali di Azure e AWS, i
due grandi fornitori che incontrerai più spesso lavorando in ambito DevOps.

## 🎯 Obiettivi della sezione

Al termine di questa sezione saprai:

- spiegare cos'è il cloud computing con parole tue, senza tecnicismi;
- distinguere IaaS, PaaS e SaaS e sapere chi gestisce cosa in ciascun modello;
- riconoscere i nomi dei principali servizi Azure e i loro equivalenti AWS;
- capire cosa significano scalabilità verticale/orizzontale, pay-as-you-go,
  regioni e alta disponibilità.

---

## 13.1 Cos'è il cloud computing

Immagina di dover organizzare una cena per 50 persone. Hai due opzioni:

1. Comprare pentole, forni, piatti, tavoli e sedie per 50 persone, tenerli in
   un magazzino tutto l'anno e usarli una volta ogni tanto.
2. Affittare una sala da un catering: paghi solo per l'evento, usi le loro
   attrezzature, e quando hai finito non devi più pensarci.

Per decenni, le aziende che avevano bisogno di far girare un software hanno
fatto la scelta (1): compravano server fisici, li installavano in una stanza
climatizzata (la "sala server"), pagavano tecnici per manutenerli, e se il
software cresceva dovevano comprare altri server. Se il software calava di
utilizzo, quei server restavano lì, comprati e pagati, a fare poco.

Il **cloud computing** è la scelta (2) applicata all'informatica: invece di
possedere e gestire tu i server fisici, **usi via internet i server e le
risorse informatiche di qualcun altro** (un "provider cloud" come Microsoft,
Amazon o Google), pagando solo per quello che usi e quando lo usi.

> **Analogia**: possedere un data center è come costruirsi una casa da zero —
> devi comprare il terreno, costruire le fondamenta, tirare su i muri,
> allacciare le utenze. Usare il cloud è come **affittare un appartamento già
> arredato**: entri, usi quello che c'è, e quando ti serve una stanza in più
> la aggiungi (o la togli) senza dover ristrutturare un edificio.

In pratica, quando un'azienda "mette il software sul cloud" significa che il
codice, i database e i file non girano più su un server fisico di sua
proprietà dentro il suo ufficio, ma su server che appartengono a un provider
cloud, distribuiti in enormi data center in giro per il mondo, ai quali si
accede via internet.

Questo cambia radicalmente il modo di lavorare:

- non serve comprare hardware in anticipo "per sicurezza": si aggiungono
  risorse quando servono, in pochi minuti;
- non serve occuparsi di manutenzione fisica (cambiare un disco rotto,
  sostituire un alimentatore): è il provider che ci pensa;
- si paga in base al consumo, non un costo fisso indipendentemente dall'uso.

---

## 13.2 I tre modelli principali: IaaS, PaaS, SaaS

Non tutto il cloud è uguale: quando "affitti" qualcosa dal cloud, puoi
affittare **più o meno responsabilità**. Il modo più semplice per capirlo è
pensare a come si può abitare in un posto: puoi comprare un terreno e
costruire tu la casa, puoi affittare un appartamento arredato, oppure puoi
prenotare una stanza d'hotel con servizio completo.

Nel mondo cloud questi tre livelli si chiamano **IaaS**, **PaaS** e **SaaS**.

### 13.2.1 IaaS — Infrastructure as Service

**IaaS** significa "infrastruttura come servizio". Il provider ti affitta
l'**infrastruttura grezza**: server virtuali, spazio di archiviazione (dischi
virtuali) e rete. Tutto il resto — sistema operativo, aggiornamenti,
programmi installati, sicurezza a livello di software — è **compito tuo**.

> **Analogia**: è come affittare un **terreno con già lo scheletro di un
> edificio** (fondamenta, struttura portante, allacci alla rete elettrica e
> idrica). Il proprietario ti garantisce che lo scheletro sta in piedi e che
> l'elettricità arriva. Ma le pareti interne, gli impianti, l'arredamento e
> le tinteggiature te li fai tu.

Esempio concreto: una **macchina virtuale** su Azure o AWS. Il provider ti dà
un computer virtuale con una certa potenza di calcolo, ma sei tu a installare
il sistema operativo, gli aggiornamenti di sicurezza, il software applicativo
e a occuparti della configurazione.

Chi usa IaaS: chi ha bisogno di massimo controllo e flessibilità, o deve
migrare software esistente pensato per girare su server "tradizionali" senza
riscriverlo.

> **Esempio pratico**: il team deve spostare un vecchio applicativo
> gestionale, pensato per girare su un server Windows in ufficio, senza
> riscriverlo. La soluzione è creare una macchina virtuale IaaS: si installa
> lo stesso sistema operativo, si copiano gli stessi file, si configurano le
> stesse porte di rete. Non cambia una riga di codice. Il vantaggio non è
> "meno lavoro da fare" ma "niente hardware da comprare e mantenere": se la
> macchina virtuale si rivela sottodimensionata, in pochi minuti il team ne
> aumenta la potenza (CPU, RAM) dal pannello di controllo del provider,
> invece di aspettare settimane per un nuovo server fisico.

### 13.2.2 PaaS — Platform as Service

**PaaS** significa "piattaforma come servizio". Il provider ti affitta anche
**la piattaforma** su cui far girare il software: sistema operativo,
ambiente di esecuzione (runtime), database già pronti e gestiti. Tu ti devi
occupare solo di scrivere e distribuire il tuo codice.

> **Analogia**: è l'**appartamento già arredato**. Non devi costruire i muri
> né comprare i mobili: trovi tutto pronto, incluse le utenze allacciate. Ti
> devi solo preoccupare di viverci, cioè — nel caso del software — di
> scrivere e pubblicare il codice della tua applicazione.

Esempio concreto: **Azure App Service**, dove carichi il codice della tua
applicazione web e il provider si occupa di far girare il sistema operativo,
il runtime (per esempio .NET o Node.js), gli aggiornamenti di sicurezza e la
scalabilità di base. Oppure un database gestito come **Azure SQL Database**,
dove non devi installare né amministrare tu il motore del database: esiste
già, pronto all'uso, e il provider si occupa di backup, patch e affidabilità.

Chi usa PaaS: la maggior parte dei team che sviluppano applicazioni moderne,
perché permette di concentrarsi sul codice senza perdere tempo a gestire
server e sistemi operativi.

> **Esempio pratico**: un developer del team finisce di scrivere una nuova
> funzionalità per l'applicazione web del progetto. Con un servizio PaaS,
> pubblica il codice (spesso con un comando o con la pipeline vista nella
> sezione 11) e in pochi minuti la nuova versione è online, raggiungibile via
> browser, senza che nessuno debba configurare un sistema operativo, aprire
> porte di rete o installare un runtime a mano. In parallelo, i dati
> dell'applicazione vivono in un database gestito: nessuno del team deve
> occuparsi di installare il motore del database, programmare i backup
> notturni o applicare le patch di sicurezza — il provider lo fa in
> automatico, e se qualcosa va storto è possibile ripristinare un backup
> recente con pochi clic.

### 13.2.3 SaaS — Software as Service

**SaaS** significa "software come servizio". Qui non affitti infrastruttura
né piattaforma: **usi direttamente un software già finito**, di solito via
browser, senza installare nulla e senza sapere (né doverti preoccupare di)
dove e come girano i server dietro.

> **Analogia**: è l'**hotel a servizio completo**. Non ti preoccupi di
> struttura, arredamento, pulizie o lenzuola: prenoti la stanza, entri, e
> tutto è già pronto per essere usato. Il tuo unico compito è vivere la tua
> vacanza (cioè usare il software per il tuo lavoro).

Esempi concreti che usi già ogni giorno: **Gmail** o **Outlook** (posta
elettronica), **Office 365** o **Google Workspace** (documenti e foglio di
calcolo), **Salesforce** (gestione clienti), la stessa **Azure DevOps** che
hai visto nella sezione 10, o **Slack**/**Teams** per la comunicazione. In
tutti questi casi apri un browser, accedi con le tue credenziali, e il
software è già lì, funzionante, aggiornato, senza che tu debba installare o
gestire nulla.

Chi usa SaaS: chiunque abbia bisogno di una funzionalità (email, CRM,
gestione progetti) senza voler sviluppare o mantenere il software che la
fornisce.

> **Esempio pratico**: il team ha bisogno di gestire il backlog, le pipeline
> e i repository del progetto. Nessuno "installa" Azure DevOps su un server:
> ci si registra, si apre il browser, si accede con le proprie credenziali e
> il servizio è già lì, pronto all'uso e aggiornato dal provider senza che il
> team debba fare nulla. Lo stesso vale per la posta elettronica aziendale o
> per lo strumento di videochiamata usato nei daily: sono tutti software
> "già finiti", usati così come sono, senza che qualcuno in azienda ne debba
> gestire l'infrastruttura sottostante.

---

## 13.3 Confronto: chi gestisce cosa

La differenza chiave tra IaaS, PaaS e SaaS è **quanta responsabilità di
gestione resta al cliente e quanta passa al provider cloud**. Più si sale da
IaaS verso SaaS, meno cose deve gestire il cliente (ma meno controllo ha).

```mermaid
flowchart TB
    subgraph OnPrem["🏠 On-Premise<br/>(server proprio in azienda)"]
        direction TB
        O1[Applicazioni]
        O2[Dati]
        O3[Runtime]
        O4[Middleware]
        O5[Sistema Operativo]
        O6[Virtualizzazione]
        O7[Server]
        O8[Storage]
        O9[Rete]
    end
    style OnPrem fill:#ffe0e0
```

La tabella seguente è il modo più chiaro per vedere la "torta delle
responsabilità": ogni riga è uno strato tecnico, e la cella indica **chi**
se ne occupa.

| Livello / Strato          | On-Premise (server proprio) | IaaS | PaaS | SaaS |
|----------------------------|:---:|:---:|:---:|:---:|
| Applicazioni               | 🧑 Cliente | 🧑 Cliente | 🧑 Cliente | ☁️ Provider |
| Dati                        | 🧑 Cliente | 🧑 Cliente | 🧑 Cliente | 🧑 Cliente* |
| Runtime (linguaggio, librerie) | 🧑 Cliente | 🧑 Cliente | ☁️ Provider | ☁️ Provider |
| Middleware                 | 🧑 Cliente | 🧑 Cliente | ☁️ Provider | ☁️ Provider |
| Sistema operativo           | 🧑 Cliente | 🧑 Cliente | ☁️ Provider | ☁️ Provider |
| Virtualizzazione            | 🧑 Cliente | ☁️ Provider | ☁️ Provider | ☁️ Provider |
| Server (hardware fisico)    | 🧑 Cliente | ☁️ Provider | ☁️ Provider | ☁️ Provider |
| Storage (fisico)            | 🧑 Cliente | ☁️ Provider | ☁️ Provider | ☁️ Provider |
| Rete (fisica)               | 🧑 Cliente | ☁️ Provider | ☁️ Provider | ☁️ Provider |

\* *anche in SaaS i dati che inserisci nel software (es. le tue email, i tuoi
documenti) restano "tuoi": il provider li custodisce e li protegge, ma il
contenuto è di tua responsabilità (es. non condividere per errore un file
sensibile).*

In sintesi, salendo da IaaS a SaaS **deleghi progressivamente più lavoro
operativo al provider**, in cambio di **meno controllo diretto** su come le
cose sono configurate. Non esiste un livello "migliore" in assoluto: la
scelta dipende da quanto controllo serve rispetto a quanta comodità si vuole.

```mermaid
flowchart LR
    A[On-Premise<br/>Controllo massimo<br/>Impegno massimo] --> B[IaaS<br/>Server virtuali]
    B --> C[PaaS<br/>Piattaforma gestita]
    C --> D[SaaS<br/>Software pronto<br/>Controllo minimo<br/>Impegno minimo]

    style A fill:#ffcccc
    style B fill:#ffe0b3
    style C fill:#fff4b3
    style D fill:#d4f7d4
```

---

## 13.4 Azure: panoramica generale

**Microsoft Azure** è la piattaforma cloud di Microsoft, ed è quella che
incontrerai più spesso in questo corso e nel lavoro quotidiano, dato che il
team usa già Azure DevOps (sezione 10). Azure offre centinaia di servizi;
qui vediamo solo i concetti principali, giusto per riconoscerli quando li
sentirai nominare.

- **Macchine virtuali (Virtual Machines)** — il servizio IaaS di base: un
  server virtuale su cui installare qualsiasi sistema operativo e software,
  esattamente come faresti su un computer fisico.
- **Azure App Service** — il servizio PaaS per pubblicare applicazioni web e
  API senza gestire server o sistemi operativi: carichi il codice, Azure fa
  girare tutto il resto.
- **Database gestiti** (es. **Azure SQL Database**, **Cosmos DB**) — database
  pronti all'uso, con backup automatici, aggiornamenti e scalabilità gestiti
  dal provider: non devi installare né amministrare tu il motore del
  database.
- **Storage** (es. **Azure Blob Storage**) — spazio per salvare file, backup,
  immagini, documenti: una specie di "grande armadio" accessibile via
  internet, pensato per grandi quantità di dati.
- **Azure Kubernetes Service (AKS)** — servizio gestito per eseguire
  container orchestrati con Kubernetes (concetto già visto nella sezione 2),
  senza dover installare e configurare Kubernetes da zero.

Non serve memorizzare questi nomi: basta sapere che esistono e a cosa
servono a grandi linee, così quando il team dice "l'abbiamo messo su App
Service" o "i dati sono su Blob Storage" saprai di cosa si sta parlando.

---

## 13.5 AWS: la principale alternativa

**Amazon Web Services (AWS)** è il principale concorrente di Azure (ed è
storicamente il pioniere del cloud computing su larga scala). Alcuni
progetti o clienti usano AWS invece di (o insieme ad) Azure, quindi è utile
riconoscere i nomi equivalenti:

| Concetto                     | Azure               | AWS                  |
|-------------------------------|---------------------|----------------------|
| Macchine virtuali (IaaS)      | Virtual Machines    | EC2                  |
| Piattaforma per applicazioni web (PaaS) | App Service | Elastic Beanstalk    |
| Storage di file/oggetti       | Blob Storage        | S3                   |
| Database relazionale gestito  | Azure SQL Database  | RDS                  |
| Container orchestrati         | AKS                 | EKS                  |
| Funzioni serverless           | Azure Functions     | Lambda               |

Il concetto importante da portarti via non è il nome preciso di ogni
servizio, ma il fatto che **i grandi provider cloud offrono tutti gli stessi
tipi di servizio**, solo con nomi diversi. Una volta capito il concetto (es.
"storage per file"), riconoscere l'equivalente su un altro provider è
semplice.

---

## 13.6 Scalabilità: verticale vs orizzontale

Uno dei grandi vantaggi del cloud è la **scalabilità**: la capacità di
adattare le risorse informatiche disponibili in base a quanto ne serve in un
dato momento, in modo rapido.

Esistono due modi per scalare:

- **Scalabilità verticale** ("scale up"): dare **più risorse alla stessa
  macchina** (più potenza di calcolo, più memoria). È come sostituire il
  motore di un'auto con uno più potente: la stessa auto va più veloce, ma
  c'è un limite a quanto puoi potenziarla.
- **Scalabilità orizzontale** ("scale out"): aggiungere **più macchine** che
  lavorano in parallelo, distribuendo il carico tra loro. È come aggiungere
  più corsie a un'autostrada: non rendi ogni auto più veloce, ma fai passare
  più traffico complessivamente.

```mermaid
flowchart TB
    subgraph Verticale["Scalabilità VERTICALE (scale up)"]
        direction LR
        V1["🖥️ 1 server<br/>piccolo"] -->|potenzio| V2["🖥️🖥️ 1 server<br/>più potente"]
    end

    subgraph Orizzontale["Scalabilità ORIZZONTALE (scale out)"]
        direction LR
        H1["🖥️ 1 server"] -->|aggiungo altri server| H2["🖥️ 🖥️ 🖥️ 🖥️<br/>più server in parallelo"]
    end
```

Nel cloud, la scalabilità orizzontale è particolarmente potente perché si
possono aggiungere (o togliere) macchine in pochi minuti, spesso in modo
**automatico** in base al traffico reale (es. più macchine durante i saldi
di un e-commerce, meno durante la notte). Questo sarebbe quasi impossibile
con server fisici di proprietà, dove comprare un nuovo server richiede
settimane.

---

## 13.7 Pay-as-you-go: paghi solo quello che usi

Il modello di pagamento tipico del cloud si chiama **pay-as-you-go** ("paga
in base a quanto usi"), ed è probabilmente il cambiamento più concreto
rispetto al vecchio modo di gestire l'infrastruttura.

> **Analogia**: è come la bolletta della luce o dell'acqua: non paghi una
> cifra fissa indipendentemente da quanto consumi, ma in base ai consumi
> effettivi (kWh usati, litri consumati). Se un mese consumi meno, paghi
> meno.

Nel cloud questo significa, per esempio, che se hai una macchina virtuale
attiva 3 ore al giorno, paghi solo per quelle 3 ore (e non per le 24). Se il
tuo sito ha un picco di traffico per una settimana e poi torna normale, puoi
scalare su e poi tornare giù, pagando solo per il periodo di picco.

Questo modello è molto diverso dall'acquisto di un server fisico, dove il
costo è quasi tutto "anticipato" (compri il server, che poi resta tuo per
anni, usato o no).

---

## 13.8 Regioni, data center e alta disponibilità

I provider cloud non hanno un solo, enorme data center: ne hanno **decine**,
sparsi in tutto il mondo, organizzati in **regioni** (per esempio "Europa
occidentale", "Stati Uniti orientali", "Asia sud-orientale"). Ogni regione
contiene a sua volta più data center fisicamente separati.

Questo ha due vantaggi principali:

- **Vicinanza geografica**: puoi far girare il tuo software in una regione
  vicina ai tuoi utenti, così le pagine si caricano più velocemente (meno
  distanza = meno tempo di viaggio dei dati).
- **Alta disponibilità**: se un data center ha un problema (es. un guasto
  elettrico), il software può continuare a funzionare perché è distribuito
  su più data center o più regioni. È come avere due farmacie in città
  invece di una sola: se una chiude per un imprevisto, l'altra resta aperta
  e il servizio continua.

Non serve approfondire i dettagli tecnici dell'alta disponibilità in questa
fase: basta sapere che è uno dei motivi per cui le grandi aziende scelgono il
cloud invece di un singolo server fisico in un singolo posto — meno rischio
di interruzioni del servizio.

---

## 13.9 Riepilogo: cosa ti serve ricordare

- **Cloud computing**: usare risorse informatiche (server, storage, rete) di
  qualcun altro via internet, invece di possedere e gestire hardware
  proprio — come affittare un appartamento invece di costruirsi una casa.
- **IaaS**: affitti l'infrastruttura grezza (server virtuali, storage, rete);
  gestisci tu sistema operativo e software.
- **PaaS**: affitti anche la piattaforma (OS, runtime, database gestiti); ti
  concentri solo sul codice.
- **SaaS**: usi un software finito via browser (Gmail, Office 365,
  Salesforce); non gestisci nulla sotto.
- Più sali da IaaS a SaaS, meno responsabilità di gestione hai (e meno
  controllo).
- **Azure** (Microsoft) e **AWS** (Amazon) sono i due principali provider
  cloud: offrono gli stessi tipi di servizi con nomi diversi (es. Virtual
  Machines/EC2, App Service/Elastic Beanstalk, Blob Storage/S3).
- **Scalabilità verticale**: più risorse alla stessa macchina. **Scalabilità
  orizzontale**: più macchine in parallelo.
- **Pay-as-you-go**: paghi in base al consumo reale, come una bolletta.
- **Regioni e data center**: i provider distribuiscono le loro
  infrastrutture in tutto il mondo, garantendo vicinanza agli utenti e
  **alta disponibilità** (continuità del servizio anche in caso di guasti
  locali).

---

## ✅ Checklist di autoverifica

- Sapresti spiegare cos'è il cloud computing con un'analogia tua?
- Sai distinguere IaaS, PaaS e SaaS e dire, per ciascuno, cosa gestisce il
  cliente e cosa il provider?
- Sapresti nominare almeno due servizi Azure e i loro equivalenti AWS?
- Sai spiegare la differenza tra scalabilità verticale e orizzontale?
- Sai spiegare cosa significa "pay-as-you-go" con un esempio concreto?
- Sai spiegare perché avere più regioni/data center aiuta l'alta
  disponibilità?

---

## 📝 Esercizi pratici

1. **Mappa il progetto sul modello IaaS/PaaS/SaaS.** Chiedi a un collega
   developer o operations quali servizi cloud usa il progetto e prova a
   classificarli come IaaS, PaaS o SaaS (es. "usiamo una macchina virtuale
   per X" è IaaS, "il sito web gira su un servizio di hosting gestito" è
   PaaS). Scrivi la lista su un foglio o in un documento.
   ✅ **Come verificare**: mostra la tua classificazione alla tua collega
   Scrum Master/PM o al developer che hai intervistato e fatti confermare se
   hai classificato correttamente almeno 3 servizi su 4.

2. **Costruisci la tua "torta delle responsabilità".** Senza guardare la
   tabella della sezione 13.3, ridisegna a mano su un foglio le righe
   Applicazioni/Dati/Runtime/Sistema operativo/Server e prova a compilare le
   colonne On-Premise, IaaS, PaaS, SaaS indicando chi gestisce cosa.
   ✅ **Come verificare**: confronta il tuo schema con la tabella originale
   nella sezione 13.3; se hai più di due celle diverse, rileggi la sezione
   13.2 prima di andare avanti.

3. **Traduci Azure in AWS (e viceversa).** Prendi 4 servizi Azure a caso tra
   quelli citati nella sezione 13.4 (es. Virtual Machines, App Service, Blob
   Storage, AKS) e scrivi a memoria il loro equivalente AWS, senza guardare
   la tabella della sezione 13.5. Poi controlla.
   ✅ **Come verificare**: hai indovinato almeno 3 corrispondenze su 4 senza
   guardare la tabella.

4. **Scalabilità verticale o orizzontale?** Pensa a tre scenari reali (es.
   "il sito del progetto ha un picco di traffico durante una campagna
   marketing", "un singolo processo di calcolo è troppo lento", "un servizio
   deve restare disponibile anche se una macchina si guasta") e per ciascuno
   decidi se serve scalabilità verticale, orizzontale, o entrambe,
   motivando la scelta a voce alta o per scritto.
   ✅ **Come verificare**: chiedi a un collega tecnico di ascoltare/leggere
   le tue tre risposte e dirti se il ragionamento (non necessariamente la
   soluzione tecnica esatta) è sensato.

5. **Calcola un pay-as-you-go semplificato.** Immagina una macchina virtuale
   che costa 0,10 € all'ora. Calcola quanto costerebbe tenerla attiva 24
   ore su 24 per un mese, e quanto costerebbe invece tenerla attiva solo 8
   ore al giorno nei giorni lavorativi. Confronta i due numeri.
   ✅ **Come verificare**: il secondo scenario deve costare meno di un terzo
   del primo; se il conto non torna, rileggi la sezione 13.7 sul concetto di
   pagamento a consumo.

6. **Individua le regioni del progetto reale.** Chiedi a un collega
   developer o a chi si occupa dell'infrastruttura in quale regione (o
   regioni) cloud gira il progetto, e se è previsto un meccanismo di
   ripristino in caso di guasto di un data center (anche solo "sappiamo che
   esiste un piano B" è una risposta valida a questo livello).
   ✅ **Come verificare**: sai rispondere, in una frase, alla domanda "cosa
   succederebbe se il data center principale del progetto avesse un
   problema per un giorno?" basandoti su quello che hai scoperto.

---

## 🔗 Collegamenti

- [14. Sicurezza](../14-sicurezza/README.md) — dove vedremo come proteggere i dati e i sistemi che girano su queste infrastrutture cloud
- [15. Ambienti di sviluppo](../15-ambienti-di-sviluppo/README.md) — dove vedremo come sviluppo, test e produzione si organizzano concretamente, spesso proprio su infrastrutture cloud come quelle viste qui

## 📚 Risorse

- [Microsoft Azure – Cos'è il cloud computing](https://azure.microsoft.com/it-it/resources/cloud-computing-dictionary/what-is-cloud-computing) — introduzione ufficiale ai concetti base del cloud
- [Microsoft Learn – Modelli di cloud computing: IaaS, PaaS, SaaS](https://learn.microsoft.com/it-it/azure/cloud-adoption-framework/) — panoramica dei modelli di servizio cloud
- [AWS – What is Cloud Computing?](https://aws.amazon.com/what-is-cloud-computing/) — la spiegazione ufficiale di Amazon Web Services
- [AWS – Tipi di cloud computing](https://aws.amazon.com/types-of-cloud-computing/) — approfondimento su IaaS, PaaS e SaaS lato AWS
- [Microsoft Learn – Panoramica dei servizi Azure](https://learn.microsoft.com/it-it/azure/?product=popular) — elenco dei servizi Azure più usati
