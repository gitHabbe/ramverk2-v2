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
    )
;