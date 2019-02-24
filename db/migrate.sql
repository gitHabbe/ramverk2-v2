-- User account template
-- DROP TABLES
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS reports;

CREATE TABLE IF NOT EXISTS users (
    email VARCHAR(255) NOT NULL,
    password VARCHAR(60) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    UNIQUE(email)
);

-- CREATE TABLES

CREATE TABLE IF NOT EXISTS reports (
    id INTEGER,
    kmom CHAR(6) NOT NULL,
    writer VARCHAR(255) NOT NULL,
    report VARCHAR(5000) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id),
    UNIQUE (kmom)
);

-- INSERT

INSERT INTO reports (`kmom`, `writer`, `report`)
VALUES
    (
        "kmom01",
        "niklas@bth.se",
        "Att använda ett ramverk för att hantera sitt backend när man jobbar med nodejs är en väldigt bra idé tycker jag. I linux-kursen så lärde jag mig att deklarera och hantera routes utan att använda något extra verktyg. Det sköter faktiskt jobbet förvånansvärt bra, men inte lika snyggt som vad Express har ett erbjuda. 

        Det var rätt smart att dela in varje route, alternativt subroute, i sin egen fil som i sin tur är ett objekt som sedan skickar data och statuskod tillbaka till användaren. Det kändes väldigt “vanilla” på något sätt så jag kan helt klart se hur många föredrar ett ramverk för att slippa deklarera innehålls-typen osv. Jag valde att jobba med Express eftersom övningarna använder det vilket gör det enkelt att hänga med. Detta är även bra eftersom den är extremt populär vilket i sin tur kan leda till jobb. Både MERN och MEAN stack använder sig av detta ramverk och det verkar vara hett på marknaden just nu. 

        Jag kikade lite på Meteorjs och NestJS för att kunna jämföra dom litegrann. Meteor verkar komma med sin egen “mall-motor” vilket är händigt, men dessa struktur är inte något jag tycker om. Självklart skulle jag behöva bygga något själv för att verkligen få en inblick på hur det fungerar men just nu ser det inte lovande ut. Nest däremot verkar gå med en helt annan stil. Visserligen har jag aldrig använt Laravel tidigare men dom verkar nästa dela syntax på någon nivå. Jag kan helt klart se mig själv återvänta till Nest eftersom jag är väldigt intresserad av denna typ av struktur. Eftersom jag inte tog ramverk1 så har jag heller ingen erfarenhet med denna jobbmetod. 

        Just nu så finns det inte så mycket kod att hantera i min applikation så planera hur mitt fil-träd ska se ut är inte så lätt. Jag har funderat på att separera alla routes i en egen fil i ‘routes’ katalogen tillsammans med dess subroutes. Beroende på hur den växer så kanske jag byter struktur alternativt delar in det ännu mindre om subroutesen blir för många. Jag ska försöka bara noggrann att namnge mina filer och funktioner så att navigering mellan filer och routrar är enkelt. Ofta kan man bli förvirrad om man gör en slarvig struktur som man sedan glömt bort hur man tänkte.  

        För mina rapporter så är dom just nu textfiler som jag läser in med node-modulen “fs”. Varje kursmoment har sin egen route som i sin tur läser sin egen fil och skickar det som ett json objekt till användare som gör en förfrågan. Självklart hade jag kunnat skriva det rakt i en json-fil men jag tänkte hur det skulle kunna hanteras om en bloggare skrev i en markdown eller i detta fall en text-fil. 

        Något som jag verkligen kommer ta med mig från detta kursmoment var hur man startar en server som sedan publiceras till allmänheten. Detta är väldigt bra att kunna eftersom det gör utveckling mycket roligare då man kan dela med sig av sitt arbete enklare. Jag är nyfiken på hur ett frontend sedan kopplas till detta. Oftast så brukar man bygga ihop alla filer till en minifierad fil som sedan läggs i en build eller dist katalog. Jag misstänker att kommande uppgifter svarar på dessa frågor."
    ),
    (
        "kmom02",
        "niklas@bth.se",
        "Det var inga större problem att sätta igång med utvecklandet för frontend-delen av applikationen. Jag valde att installera och importera Axios för att snabbare kunna hämta data från min server och databas. Axios har kort och snygg syntax för att hämta information och den konverterar även datan direkt till JSON så den kortar även ner mitt projekt samtidigt som den blir mer läsbar. Valet för vilket ramverk jag skulle använda var rätt enkelt. React är väldigt populärt på marknaden och kommer förhoppningsvis en dag ge mig ett jobb. Detta betydde inte att jag rakt av ignorerade dom andra 2 verktygen eftersom jag är även intresserad av att lära mig dom någon dag också. Tidigare så var jag inte lika villig men eftersom jag nu valde att få en insikt så lockar det mer. Traversy Media har fantastiska videoklipp på dom här ramverken och det var väldigt underhållande och lärorikt att gå igenom hans material.
        
        Strukturerna som Angular och Vue har har börjat intressera mig. Tidigare tyckte jag det var idiotiskt att skapa sin style i samma fil som man gör en komponent i men nu har jag börjat acceptera det mer och mer på grund av Vue. Reacts metod för att göra det är helt klart sämre än dom andra 2 tycker jag men förhoppningsvis så blir det en ändring på det. Min största fundering ligger i hur man delar med sig av style som andra komponenter kan använda, alternativt hämtar style som är implementerad för att stridas runt i applikationen. Sedan tidigare kurser så har vi bara importerat 1 css-fil och jobbat från det. Jag undrar om man kan korta ner laddningstider, eller tiden det tar för ett tema att applicera, genom att individuellt importera enbart den lilla style som är nödvändig för komponenten eller om det enbart är för strukturens skull.
        
        Den största anledningen till att jag vill gå djupare in i React är för att en dag förstå hur Redux fungerar. Det känns konstigt att lära sig ytligare ett ramverk på en lägre nivå innan jag vet hur en “state” på riktigt lever i hela applikationen och inte bara skickas genom komponenter som en egenskap. Enligt det videoklipp som bifogades tillsammans med kursmomentet så pratade John Papa om hur alla 3 har sitt eget bibliotek för att hantera det här problemet. Om jag en dag kan lyckas lösa det dilemmat med React via Redux så är det väldigt bra att kunna ta med sig till Angular och Vue. Jag vet att Redux har väldigt mycket “boilerplate” kod för att få det att fungera, jag är nyfiken på om dom andra 2 också har det.
        
        Om det är något som är ett gigantiskt TIL för den här veckan så är det publicering. Det känns så otroligt bra att på någon sorts nivå sitta på kunskap för att ladda upp både front och back-end på en Linuxmaskin till allmänheten. Detta ger mig mycket mer motivation att bygga projekt eftersom jag kan visa upp dom mycket enklare. Tidigare guider som jag gått igenom var inte lika bra och jag tycker inte riktigt om github-page eller heroku så mycket än. Ovanpå det är det väldigt bra att fylla kunskapsbanken med JWT-hantering. Jag vet inte hur mycket säkerhet eller autentisering det bidrar med, men det känns som ett nog stort “buzzword” att det är bra att kunna. Baserat på lite kort läsning så räcker den inte som autentisering så just nu förstår jag inte dess roll i applikationen mer än att identifiera vem som loggat in. Kanske är det allt som den gör, skapar en session med lite sparad information och ser till att informationen är konsekvent och inte förändras under användning.
        
        Något som jag verkligen vill ta med mig till React och mer eller mindre alla mina ändra språk är typhantering. Angular var helt klart mest strikt med detta och jag tror det är bäst så. TypeScript finns ju alltid redo att implementera i projekten så om jag lyckas hålla mig i fas med kursen så kanske det blir till att konvertera om lite kod till det formatet och syntaxen. Under utforskandet av ramverk så upptäckte jag även React PropTypes. Det är något som jag hört talas om tidigare men aldrig riktigt läst upp vad det tillför. Kanske är det i den tråden man borde börja."
    ),
    (
        "kmom03",
        "niklas@bth.se",
        "Docker var helt nytt för mig. Det är något som jag hört talas mycket om men aldrig riktigt prövat. Mer eller mindre alla som använt Docker verkar älska det, så jag är glad att det är inkluderat i denna kurs. Installationen gick väldigt bra på en MacBook så det var inga problem att komma in i miljön. Innan jag satt igång med uppgifterna så tog jag en kort kurs om mjukvaran för att få lite mer självförtroende medan jag sätter mig in i arbetet. Kursen var väldigt lärorik och gav en fantastisk bas att jobba ifrån. Tyvärr har jag inte riktigt någon typ av referens att jämföra med för att se var Docker briljerar. Möjligtvis att det går att väga mot den miljö som vi satt upp i kursen Linux. Under den installationen så valde att inte använda något typ av användargränssnitt som involverar att använda musen, på så vis liknar dom varandra. Självklart så installerar Docker alla sina miljöer mycket snabbare och kan skapa många olika versioner av samma teknologier nästan omedelbart. Inte en speciellt jämn tävling kan man tycka, även om Linux installationen skulle vara automatiserad.


        Jag har aldrig riktigt jobbat med att designa enhetstester innan den officiella koden är skapad. Det väcker helt klart funderingar och frågor som jag inte riktigt är redo att svara på just nu. Det verkar helt klart intressant eftersom många problem och buggar kan bli funna innan hemsidan ens startat. Det är möjligt att typhantering härstammar från denna programmeringsstil så att man får lite mer kontroll och kan anta lite mer om det resultat som förväntas. Som TIL för denna vecka så är listan för stor för att korta ner den till 1 teknologi. Allt detta kring Docker, statushantering, fetching och kodteckning har fyllt kunskapsbanken så mycket att alla förtjänar beröm. Docker lite mer än dom andra måste jag ju säga men det är mest eftersom vi gjort lite liknande metoder för resterande nämnda. 


        Det var ingen större tankeprocess som skedde innan jag valde vilka verktyg jag skulle använda för enhetshantering och kodtäckning. Till skillnad från när jag valde ramverk för backend så tog jag hjälpmedel som inte fanns i exemplen men fortfarande var populära bland dagens utvecklare. Till en början tyckte jag det var konstigt hur nästa alla använda sig av filtypen yml, men såhär i efterhand så är den väldigt läsbar och väcker inte många frågetecken som programmerare. 


        Jag är medveten att det var lugnt att göra ett enhetstest som inte testar någonting men jag valde ändå att utveckla ett litet falskt API för att se vilken typ av respons Jest, Coveralls och Travis gav mig. Coveralls gav mig mest problem eftersom den till en början vägrade generera sin överblick. Det var svårt att hitta problemet och andra verkade ha liknande dilemma. Enligt dokumentationen så behöver man inte ange en token för projekt som har öppen källkod, men av någon anledning så tvingades jag göra det ändå.


        Docker utan enhetstester kan kännas lite tomt. Annat än att installationen går igenom utan felmeddelanden så verkar det inte finnas mycket mer data att använda. Såvida man inte vill testa ett gäng funktioner eller verktyg manuellt så misstänker jag att man måste ha några typer av tester för att få ut något av det. Jag vet fortfarande inte hur man tester komponenter som är för frontend delen av applikationen än. Just nu känns det meningslöst men förhoppningsvis så försvinner den känslan i framtiden. Just nu känns det som om vem som helst kan skriva tester som ger 100% kodtäckning. Eftersom dom är så viktiga skulle jag verkligen vilja veta vad som gör tester bra och dåliga då båda kan se lika bra ut på papper i form av rapportering, men i verkligen har helt olika effektivitet."
    ),
    (
        "kmom04",
        "niklas@bth.se",
        "För att få någon typ av tillit av min kod så tycker jag att minst 80% kodtäckning är nödvändigt. Så länge den inte är något metod som förlitar sig på att en slumpmässig variabel ska vara en speciellt värde så är det inte så svårt att uppnå. Jag kommer alltid tillbaka till samma fråga varje gång vi gör enhetstester för projekt i alla dessa kurser. ”Hur skriver man bra enhetstester?”. Föreläsningen som länkades tillsammans med materialet för denna vecka var väldigt intressant att titta på. Det jobbiga med videon var hur mycket energi och fokus han tilldelade på hur ett test kan vara helt meningslöst och att man inte ska anpassa sin kod efter tester som många har gjort tidigare. Det stora målet är ju att applikationen ska flyta och fungera som förväntat, ingen typ av test ska hindra implementation av funktionalitet. Han gick tyvärr inte in på vad som definierar ett bra test är. Det enda som jag kan ta med mig från lektionen var mest bara att data som förväntas från en databas ska undersökas. Det är inte okej att förvänta sig att den information som man skapat, redigerat eller raderat verkligen är påverkad på det sätt man tror, det måste testas.

        
        Att hantera Selenium och alla dess verktyg var något jag verkligen hatade. Dokumentationen som fanns online var väldigt dålig. Jag tror det mestadels beror på hur detta redskap har stöd för så många programmeringsspråk och alla bara blir ett stort kluster av olika lösningar på nästan samma problem. Inte en enda Google träff länkade mig till den officiella hemsidan som första resultat vilket är väldigt vanligt för andra språk eller bibliotek. I framtiden hoppas jag verkligen att något geni uppfinner ett verktyg som kan ersätta Selenium, likt hur Docker nästan tog död virtuella miljöer. Kanske existerar redan dessa verktyg och jag helt enkelt inte medveten om dom än bara, vi får hoppas på det. Eftersom jag valde att använda Jest istället för Mocka som artiklarna gör så blev det en hel en experimentering innan resultatet liknade vad som efterfrågades. Istället för Chai’s metod för att efterfråga mitt backends routrar så hittade jag Supertest vilket fungerade jättebra. Detta mestadels för att Chai verkar sammanstöta med Jest för att skriva själv testerna, men det är alltid bra att ha kunskap i fler typer av bibliotek för att åstadkomma nästan samma resultat. Nu har jag artiklarna som referens till Mocka och min egen kod för Jest.

        
        Mitt TIL för detta vecka är mest hur tester allmänt beter sig på en frontend applikation. Jag hade hoppats på något som eventuellt undersöker hur en komponent beter sig individuellt istället för hela projektet i helhet. Kanske är det svårt med tanke på att dom är beroende av varandra i en typ av trädstruktur, men just nu går vägen bara nedåt i alla fall. Vem vet, det är möjligt att det globala tillståndet är enklare att testa när man jobbar med tekniker som Redux."
    ),
    (
        "kmom05",
        "niklas@bth.se",
        "Återigen så var det ett lärorikt och nödvändigt kursmoment med teknologier som jag förmodligen kommer använda inom snar framtid. Några kompisar har frågat om jag kan programmera en webapplikation för att kunna jämföra tider och dra slutsatser baserat på en simpel algoritm och det är något jag skulle vilja pröva på. Socket-programmering var rätt simpelt ändå skulle jag vilja påstå. Värt att tänka på är väl att jag inte gjorde en graf som tar emot data och visa en representation av hur förändringen påverkar den. Att bara skicka meddelanden fram och tillbaka mellan back-end och front-end gick rätt bra att implementera. Jag ångrar lite att jag använde Socketio direkt från början, istället borde jag brukat den inbyggda som kommer med JavaScript och Node. Detta eftersom man får en bättre förståelse för vad ett ramverk eller bibliotek verkligen tar hand om så att man kan ta med sig av erfarenhet till andra språk vilket är otroligt viktigt och användbart.
        
        
        Egentligen vill jag säga att det var min första interaktion med denna typ av utvecklingen men det är inte riktigt fallet. Jag har prövat ett bibliotek som ansluter sig till en chatt och håller koll på vilka meddelanden som skickas. Min applikation letade efter kända fraser och reagerade med ett anpassat svar. Likt Socketio så tog det hand om en del inställningar för att lätta på trycket för mig som utvecklare, så det kändes inte som jag kunde ta med mig mycket av detta till något annat projekt. Det gav mig inte riktigt en “flashback” förrän jag var nästa klar med implementeringen men nästa gång skulle jag vilja göra det lite mer nativt. Det är en otroligt kraftfull teknik som jag helt klart kommer återvänta till. Ibland funderar jag på om vissa hemsidor som inte direkt visar en chatt eller något annat som tyder på realtidsprogrammering använder det ändå. Typ hur vissa element dyker upp efter att man navigerat runt lite till andra routes eller hur det blir något typ av förändring på nuvarande sida på grund av nya inlägg trots att man inte laddat om applikationen. Det kan ju hända det är en timer som går varje minut (eller vad dom ju anger) och hämtar data från databasen eller att den jobbar mot webhooks som signalerar om att något nytt har hänt.
        
        
        Chatten fungerar utan några större problem. Tyvärr kan jag inte visa antalet personer som anslutit sig mot min tjänst, men annars fungerar den fint. Jag hade hoppats att händelsen som kopplar från en användare skulle ge mer information om den personen men hittade inte något som kunde ta del av den datan. Istället så skickar den ett meddelande om att något har lämnat istället. Det är möjligt att en databas kan hantera denna typ av information bättre men just nu ser jag inte hur den kan ens ska få den kopplingen till att börja med. Nu såhär i skrivandets stund så vill jag minnas något om ID när man kopplar upp sig. Kanske kunde jag sparat dom uppgifterna till state, men Socketio har ju ingen aning om vad det ska jämföras mot efter avskiljningen."
    )
;