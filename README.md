1. ##### Introduzione



**1.1 Contesto e storia del progetto**

Il nostro progetto si basa sul migliorare ed implementare nuove funzionalità per **CHATBYPICS,** un prototipo di applicazione mobile che si pone l'obiettivo di dare agli utenti con complessi bisogni comunicativi (CCN) un sistema di messaggistica istantanea che implementi la Comunicazione Aumentativa e Alternativa (CAA). Ogni utente CCN ha uno o più tutor che supervisiona l'utilizzo dell'app e lo accompagna nell'utilizzo. inoltre sono presenti utenti non CCN che non necessitano di un tutor e possono utilizzare l'app in autonomia.

L'applicazione esistente è sviluppata in Flutter ed utilizza un database Firebase per l'archiviazione dei dati, da essa ereditiamo alcune funzioni già implementate come:

* Interfaccia Chat Simbolica: Composizione di messaggi tramite selezione di pittogrammi (ARASAAC e personalizzati).
* Gestione Utenti Ruolo-centrica: Distinzione tra utenti con bisogni comunicativi complessi (CCN), Tutor e Partner Comunicativi (CP)
* Gestione Contatti e Tutorship: Il tutor gestisce le impostazioni, la lista amici e la visibilità dei pittogrammi per l'utente CCN.

alcune di esse necessitano di migliorie sostanziali che le rendano più user-friendly.





**1.2** **Obiettivi del progetto**

I nostri obiettivi primari sono:

1. Rendere più intuitiva ed accessibile l'interfaccia dell'applicazione.
2. Sviluppare una tastiera per i pittogrammi che possa rendere migliore l'esperienza degli utenti con CAA
3. Migliorare la personalizzazione delle raccolte di pittogrammi per il tutore e mettere due categorie interamente personalizzate chiamate "preferiti".



gli obiettivi secondari sono:

1. Implementazione di un algoritmo predittivo che possa consigliare il pittogramma più adatto al contesto del messaggio digitato dall'utente.

2\. Implementare login alternativi più accessibili all'utente CCN

3\. Implementare file audio associati ai pittogrammi come in app di scrittura CAA già esistenti.







**1.3 Risultati attesi**

Ci aspettiamo di riuscire ad implementare tutti gli obiettivi primari citati nel punto (1.2). Mentre invece ci riserviamo la possibilità di implementare gli obiettivi secondari solo qualora fosse possibile farlo entro i tempi previsti dalla deadline.







##### 2\. Modello di processo



Come modello di processo seguiremo SCRUM, i milestone che abbiamo definito sono:

* Migliorare l'accessibilità dell'applicazione in toto.
* categorizzare con una logica migliorata i pittogrammi.
* Migliorare la logica di controllo del tutor sui pittogrammi dell'utente CCN
* sviluppare una tastiera che disponga meglio i pittogrammi



I milestone vengono considerati raggiunti in seguito alla validazione di un esperto nella CAA.



Il progetto verrà gestito attraverso i seguenti principi:

1. Sprints: La durata di ogni Sprint sarà di circa 7 giorni.

2\. Incrementi: Al termine di ogni due Sprint verrà prodotto un incremento di prodotto potenzialmente rilasciabile e funzionante.

3\. Prioritizzazione: La backlog del prodotto verrà gestita dal Team, garantendo che le funzionalità primarie siano sviluppate prima di quelle secondarie.







#### 3\. Organizzazione di progetto



**3.1 Struttura Organizzativa Esterna**



Il progetto CHATBYPICS si colloca in un contesto accademico ma con una forte rilevanza sociale:



* Organizzazione Madre: È rappresentata dall'Università degli Studi di Bergamo, Corso di Ingegneria del Software. Questa è l'organizzazione che supervisiona e valuta il processo di sviluppo, garantendo l'aderenza agli standard, alle metodologie e ai deliverable richiesti dal curriculum. Il controllo avviene tramite i Docenti (Prof. Gargantini e Dott.ssa Bonfanti).



* Organizzazione Utente: È rappresentata dagli Utenti CCN, Tutori e dagli educatori specializzati in CAA. Sebbene non sia un cliente formale con un contratto economico, questa organizzazione fornisce i requisiti funzionali e non funzionali, e detiene l'autorità di validazione per la qualità e l'usabilità del prodotto (quality gate).





**3.2 Composizione e ruoli del team**



* Project manager e SCRUM master: Alessandro Girgini.
* Programmatori: Leonardo Ravasio, Scaburri Francesco, Alessandro Girgini.
* Tester: Scaburri Francesco.



Lo sviluppo del progetto verrà affiancato all'utilizzo di GitHub per il controllo di versione e la gestione degli issue.





##### 4\. Standard, linee guida, procedure



**4.1 Standard di documentazione**

La relazione finale sarà prodotta in formato Latex e sarà compilata in un unico file PDF, Che dovrà comprendere:

* Project plan
* Gestione del progetto: Descrive le metodologie di lavoro adottate e come il team ha gestito il ciclo di vita del software e la collaborazione.
* Requisiti: Delinea le funzionalità del progetto, le aspettative di qualità del sistema.
* Design: Descrive la struttura interna del sistema.
* Testing: Documenta il piano e i risultati delle attività di verifica e validazione del codice.
* Maintenance: elenca le attività svolte per migliorare e evolvere il codice dopo l'implementazione iniziale.





##### 5\. Attività di gestione



I membri del team di sviluppo presenteranno il lavoro svolto durante la sprint review tramite esposizione del codice e dei risultati ottenuti dai test.



##### 6\. Rischi



Il rischio maggiore che prevediamo di poter incontrare è relativo alla mancanza di documentazione e mancato rispetto di convenzioni da parte del team precedente. Inoltre riteniamo possibile che le feature da implementare possano richiedere troppo tempo rispetto a quello disponibile.



7\. Personale

Il team è composto da 3 membri con disponibilità part-time. L'impegno previsto è costante lungo tutta la durata del progetto. Non sono previste variazioni di organico.







8\. Metodi e Tecniche

* Sviluppo: Flutter framework (Dart language). IDE utilizzato: Android Studio.
* Design: Mockup creati in illustrator, poi ricreati in Flutter
* Testing:

 



9\. Garanzia di Qualità (Quality Assurance)



La qualità sarà garantita attraverso:

* Peer Review: Ogni Pull Request deve essere approvata da almeno un altro membro del team.
* Metriche: Monitoraggio della copertura dei test e rispetto delle linee guida di accessibilità.
* Validazione Utente: Se possibile, sessioni di test con educatori o simulazione di scenari d'uso reali.





10\. pacchetti di lavoro (da discutere)

11\. Risorse

* Hardware: Laptop personale dei membri del team.
* Software: Flutter SDK, Git, Compilatore LaTeX (Overleaf), Emulatori Android/iOS e almeno un dispositivo fisico per test reali.
* Servizi: Firebase (Piano Spark/Blaze), GitHub.



#### 12\. Budget e programma

Il progetto CHATBYPICS è sviluppato come attività accademica nell’ambito di un esame universitario e, di conseguenza, non prevede un budget economico né costi finanziari da sostenere. Tutte le risorse impiegate (strumenti software, ambienti di sviluppo e servizi di supporto) sono messe a disposizione gratuitamente dall’università o sono basate su tecnologie open source.



In assenza di vincoli di budget, la pianificazione del progetto si concentra esclusivamente sulla gestione del tempo e sull’organizzazione delle attività, al fine di rispettare le scadenze previste dal corso. Il programma di lavoro è articolato in fasi ben definite, ciascuna con obiettivi specifici:



* Analisi dei requisiti: finalizzata alla comprensione del problema e del contesto applicativo dell’AAC.
* Progettazione: comprendente la definizione dell’architettura del sistema e delle principali scelte progettuali.
* Implementazione: dedicata allo sviluppo dell’applicazione e delle sue funzionalità principali.
* Testing e validazione: per verificare la correttezza, l’usabilità e la coerenza del prototipo rispetto ai requisiti.
* Preparazione della consegna finale: includendo la documentazione e il materiale per la presentazione dell’esame.



L’avanzamento del progetto viene monitorato attraverso il completamento delle singole fasi e delle relative milestone, consentendo di individuare eventuali ritardi e di riorganizzare le attività rimanenti. Questo approccio garantisce una gestione efficace del tempo e un allineamento costante con gli obiettivi didattici del corso.



#### 13\. Cambiamenti

Nel corso del progetto è prevedibile che si verifichino cambiamenti nei requisiti, nelle soluzioni tecniche o nelle priorità di sviluppo. In particolare, nel contesto di un’applicazione AAC, possono emergere nuove esigenze legate all’accessibilità, all’usabilità o all’integrazione con il contesto educativo.



Per la gestione dei cambiamenti, il progetto adotta un approccio strutturato:

* Ogni richiesta di modifica viene analizzata in termini di impatto su tempi, costi e qualità.
* Le modifiche ai requisiti vengono documentate e approvate prima dell’implementazione.
* Le variazioni vengono integrate nel piano di progetto e comunicate a tutti i membri del team.
* Questo approccio consente di mantenere il controllo del progetto, riducendo il rischio di ritardi e garantendo la coerenza complessiva del sistema.



### 14\. Consegna

La consegna del progetto CHATBYPICS prevede la fornitura di tutti gli artefatti necessari a dimostrare il corretto completamento del lavoro.



In particolare, la consegna comprende:



Codice sorgente: il codice completo dell’applicazione mobile.



Documentazione tecnica: comprensiva di descrizione dell’architettura, delle scelte progettuali e delle tecnologie utilizzate.



Prototipo funzionante: l’applicazione installabile su dispositivi mobili o utilizzabile tramite emulatore.



Manuali: eventuali manuali utente o linee guida per l’utilizzo dell’applicazione.



La procedura di consegna prevede una verifica finale del funzionamento del sistema e la presentazione del progetto, durante la quale vengono illustrati obiettivi, risultati ottenuti e possibili sviluppi futuri.



