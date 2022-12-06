[![CI pipeline](https://github.com/Dontosh/pgr301-eksamen_22/actions/workflows/ci.yml/badge.svg)](https://github.com/Dontosh/pgr301-eksamen_22/actions/workflows/ci.yml)
[![Terraform CloudWatch](https://github.com/Dontosh/pgr301-eksamen_22/actions/workflows/cloudwatch_dashboard.yml/badge.svg)](https://github.com/Dontosh/pgr301-eksamen_22/actions/workflows/cloudwatch_dashboard.yml)
[![Docker build](https://github.com/Dontosh/pgr301-eksamen_22/actions/workflows/docker.yml/badge.svg)](https://github.com/Dontosh/pgr301-eksamen_22/actions/workflows/docker.yml)

# PG301_eksamen

## Del 1 - DevOps prinsipper
### Spørsmål:
* Hva er utfordringene med dagens systemutviklingsprosess - og hvordan vil innføring av DevOps kunne være med på å løse disse? Hvilke DevOps prinsipper blir brutt?
### Svar:
Utfordringene med dagens systemutviklingsprosess er mange. Et eksempel er at markedet krever mer enn noen gang. Kunder krever hastighet og forbedringer hele tiden, og det har tradisjonelt sett vært vanskelig å imøtekomme. Det er her DevOps er revolusjonerende. 

Et annet eksempel er at tradisjonelt sett jobbet noen i "Dev"-delen, altså som utviklere. Og når man var ferdig med å lage et system, så lempet man det over på "Ops"-folkene, altså "operations"-og tok ferie eller gikk over på et annet prosjekt. Problemet her er at det er utrolig lite effektivt. Hvordan kan noen hos "Ops" vite hvorfor visse valg i koden er tatt, når de ikke har skrevet det selv? Hvis noe går galt, så må de ta kontakt med utviklerne, som ikke alltid er tilgjengelige. Det er her flaskehalsen kommer inn i bildet. Så ved å bruke DevOps-metoden, har man som utvikler også ansvar for vedlikehold av koden. Man er både "dev" og "ops" - derav DevOps. I tillegg kan DevOps sammen med skyteknologi gjøre prosessen fra ide til ferdig feature ute på nettet betraktelig mye raskere. Bedrifter har erfart å gå fra omtrent 1-2 prod-pusher hver 3. eller 6. måned, til flere hundre om dagen. 

Et eksempel på et DevOps-prinsipp som ofte blir brutt, er CD (Continuous Deployment). Noen bedrifter jobber gjerne i et såkalt "trunk based development" miljø, hvor man oppretter "feature branches" som alltid "merges" rett inn i Main og ut i produksjon. Problemet her er at folk ofte jobber lenge i en "feature branch", og når de omsider bestemmer seg for å opprette en "pull request" og "merge" denne med Main, så ligger den ørtenhundre "commits" bak Main. Da har man brutt hele prinsippiet med å kontinuerlig "merge" inn i Main og ut i produksjon, og må heller bruke mye unødvendig tid på "merge conflicts". 

Et annet eksempel på et DevOps-prinsipp som ofte blir brutt er ende-til-ende eierskap. Noen lager gjerne en feature, deployer denne og tenker ikke mer på det. I DevOps har man selv ansvar for egen kode, og må følge den opp etter at man har deployet.

### Spørsmål:
* En vanlig respons på mange feil under release av ny funksjonalitet er å gjøre det mindre hyppig, og samtidig forsøke å legge på mer kontroll og QA. Hva er problemet med dette ut ifra et DevOps perspektiv, og hva kan være en bedre tilnærming?
### Svar:
En bedre tilnærming kan - og burde i mine øyne - være at da må man i hvert fall release ny funksjonalitet, om ikke oftere. Man bør ikke være redd for at det kan gå galt, men heller se på det som en mulighet for å ta lærdom om hvorfor det gikk galt. Det er bedre å oppdage feilen tidligere og hyppigere, enn større og mer komplekse feil "down the line".

### Spørsmål:
* Teamet overleverer kode til en annen avdelng som har ansvar for drift - hva er utfordringen med dette ut ifra et DevOps perspektiv, og hvilke gevinster kan man få ved at team han ansvar for både drift- og utvikling?
### Svar:
Jeg touchet innom noe av dette i besvarelsen over, men utfordringen er at man som ansvarlig for drift faktisk ikke har skrevet koden, og dermed ofte ikke vet hvorfor visse valg er gjort. Hvis en feil oppstår, og man på drift ikke har skrevet koden, må man kanskje bruke tid på å spørre utvikleren, som kanskje er på ferie eller opptatt med et annet prosjekt. Her stopper det opp, og man bruker mye tid på å gå frem og tilbake. En annen utfordring er mer på et menneskelig nivå, nemlig ansvar. Hvis man ikke har skrevet noen kode, men har fått som jobb å være ansvarlig for den, så sitter man ikke med den samme ansvarsfølelsen. Man har ikke "skin in the game", altså det er ingen stor risiko fordi "noen andre skrev jo koden, det er ikke min feil at ting ikke funker".

Hvis man på den andre siden faktisk hadde ansvar for BÅDE å skrive koden, samt drift av koden, da har man absolutt "skin in the game". Det er deg som utvikler det står på, fordi du har faktisk skrevet koden. Og det er du som er ansvarlig for vedlikehold. Som er resultat av dette, er man mer investert og lager kode med mindre sjanse for feil, samt at man kan være rask til å rette opp i koden hvis noe skulle skje. Man følger et produkt igjennom hele stadiet fra ide til produkt, og er med videre når produktet er ute i verden og passer på at ting fungerer som det skal. 

### Spørsmål:
* Å release kode ofte kan også by på utfordringer. Beskriv hvilke- og hvordan vi kan bruke DevOps prinsipper til å redusere eller fjerne risiko ved hyppige leveraner.
### Svar: 
Det at man releaser kode ofte gjør at kunden får en rask og god brukeropplevelse, men det kan - og vil - også føre til at man gjør feil. Og feilen vil dukke opp oftere, og kunden vil bli direkte påvirket av dette.

For å redusere eller fjerne risiko ved hyppige leveranser, kan man implementere flere "safeguards". Et eksempel kan være å innføre branch-protection, slik at man ikke får merget feature-branchen sin med Main, før man har opprettet en pull request. Da kan man også sette opp at man ikke får godkjent pull requesten uten en code-review, altså at noen andre ser over koden og godkjenner eller ber deg gjøre det på nytt eller gjøre om. Man kan også sette opp i build-pipelinen, ved å for eksempel bruke GitHub Actions, at alle tester skal kjøre grønt før man får en vellykket build. Ingenting får lov til å gå til produksjon før det er reviewet, og alle tester kjører grønt. 

## Del 2 - CI
### Oppgave 3
Fremgangsmåte for å konfigurere branch protection:
* Gå inn på "settings" i forken, og naviger til siden "branches" som ligger under "Code and automation" til venstre. Deretter, klikk på "Add branch protection rule". 
* For å gjøre slik at man ikke kan pushe direkte til main, kan man gjøre flere ting. En måte - men som dog er ganske ekstremt - er å låse branchen ved å huke av "lock branch". Da kan kan sette opp egne regler for adminbrukere, slik at noen har lov til å "bypass branch protection rules". Man kan også gjøre det jeg beskriver i punktet under, som er mindre ekstremt. 
* For å gjøre slik at man er nødt til å lage en pull request for å merge til main, huk av for "Require a pull request before merging". Som standard vil det kreves minst en person til code-review, men her kan man velge selv hvor mange. 
* For at koden kun man merges med main fra feature branch når GitHub Actions har verifisert requesten, huk av for "Require status checks to pass before merging". Her kan man sette opp at alle testene må være grønne og GH Actions bygget må ikke feile, før man kan merge med main. 

## Del 3 - Docker
### Oppgave 1
Jeg måtte legge inn GitHub secrets, som docker.yml-filen baserte seg på. Nemlig token og brukernavn fra Dockerhub-kontoen min. Etter at jeg la inn det, ble bygget vellykket. Grunnen til at workflowen feilet, var nemlig det; det fantes ingen secrets lagt inn og det var da umulig å logge inn i Dockerhub.  
### Oppgave 2
Jeg oppdaterte jdk i Dockerfile til 11, slik at den matcher det pom.xml er bygget med. Og alt fungerer lokalt. Men når jeg pusher imaget til Dockerhub, så får jeg samme feilmld om version mismatch når jeg forsøker å kjøre Dockerhub-imaget fra Cloud9. Jeg har sjekket selve imaget i Dockerhub, og der står det tydelig at det kjører på openjdk:11. Jeg forsøkte da å lage en ny tag - som jeg kalte shopiflai - og prøvde å kjøre denne i stedet. Og da fungerte det; jeg kunne kjøre docker run dockerhub_username/shopiflai uten problemer. Det virker som om JDK på imaget shopifly ikke ble oppdatert. 
### Oppgave 3
For at sensor skal få sin fork til å laste opp container image til sitt eget ECR repo, må hen gjøre følgende:
* Gå til IAM (Identity and Access Management) på aws.amazon.com
* Naviger til Users, under Access management
* Opprett bruker om ikke gjort fra før av
* Søk og klikk på brukeren din, og gå til fanen Security credentials
* Klikk så på Create access key om du ikke har en fra før av, og legg både ID og Secret inn i GitHub Secrets, med samme navn på variabelen som blir referert til i docker.yml-filen. 
* På linje 23 i docker.yml kan du endre navn på tag om du vil
* Hvis du endret tag, sørg for å oppdatere tag-navn på linje 24 til den nyopprettede
* Også på linje 24, endre der hvor det står 1049 til ditt ECR brukernavn
* Linje 25, endre der hvor det står 1049 til ditt ECR brukernavn. 

## Del 5 - Terraform og CloudWatch Dashboards
### Oppgave 1
* Forklar med egne ord. Hva er årsaken til dette problemet? Hvorfor forsøker Terraform å opprette en bucket, når den allerede eksisterer?
* Årsaken er at det ikke er spesifisert noen bucket i provider.tf, så Terraform forsøker da å opprette en ny hver gang. Vi må legge på en backend-blokk i provider.tf, for å fortelle Terraform at vi vil lagre state-informasjonen i en egen bucket. I tillegg la jeg inn et ekstra steg i bygget, som importerer bucketen jeg allerede har laget, slik at Terraform vet å bruke den i stedet for å forsøke å opprette en ny.
