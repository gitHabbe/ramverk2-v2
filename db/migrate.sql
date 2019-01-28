-- User account template
-- CREATE
CREATE TABLE IF NOT EXISTS users (
    email VARCHAR(255) NOT NULL,
    password VARCHAR(60) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    UNIQUE(email)
);

CREATE TABLE IF NOT EXISTS reports (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    writer VARCHAR(255) NOT NULL,
    kmom CHAR(6) NOT NULL,
    report VARCHAR(5000) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id),
    UNIQUE (kmom)
);

-- INSERT

INSERT INTO reports (writer, kmom, report)
VALUES
    (
        "niklas@bth.se",
        "kmom01",
        "Att använda ett ramverk för att hantera sitt backend när man jobbar med nodejs är en väldigt bra idé tycker jag. I linux-kursen så lärde jag mig att deklarera och hantera routes utan att använda något extra verktyg. Det sköter faktiskt jobbet förvånansvärt bra, men inte lika snyggt som vad Express har ett erbjuda. 

    Det var rätt smart att dela in varje route, alternativt subroute, i sin egen fil som i sin tur är ett objekt som sedan skickar data och statuskod tillbaka till användaren. Det kändes väldigt “vanilla” på något sätt så jag kan helt klart se hur många föredrar ett ramverk för att slippa deklarera innehålls-typen osv. Jag valde att jobba med Express eftersom övningarna använder det vilket gör det enkelt att hänga med. Detta är även bra eftersom den är extremt populär vilket i sin tur kan leda till jobb. Både MERN och MEAN stack använder sig av detta ramverk och det verkar vara hett på marknaden just nu. 

    Jag kikade lite på Meteorjs och NestJS för att kunna jämföra dom litegrann. Meteor verkar komma med sin egen “mall-motor” vilket är händigt, men dessa struktur är inte något jag tycker om. Självklart skulle jag behöva bygga något själv för att verkligen få en inblick på hur det fungerar men just nu ser det inte lovande ut. Nest däremot verkar gå med en helt annan stil. Visserligen har jag aldrig använt Laravel tidigare men dom verkar nästa dela syntax på någon nivå. Jag kan helt klart se mig själv återvänta till Nest eftersom jag är väldigt intresserad av denna typ av struktur. Eftersom jag inte tog ramverk1 så har jag heller ingen erfarenhet med denna jobbmetod. 

    Just nu så finns det inte så mycket kod att hantera i min applikation så planera hur mitt fil-träd ska se ut är inte så lätt. Jag har funderat på att separera alla routes i en egen fil i ‘routes’ katalogen tillsammans med dess subroutes. Beroende på hur den växer så kanske jag byter struktur alternativt delar in det ännu mindre om subroutesen blir för många. Jag ska försöka bara noggrann att namnge mina filer och funktioner så att navigering mellan filer och routrar är enkelt. Ofta kan man bli förvirrad om man gör en slarvig struktur som man sedan glömt bort hur man tänkte.  

    För mina rapporter så är dom just nu textfiler som jag läser in med node-modulen “fs”. Varje kursmoment har sin egen route som i sin tur läser sin egen fil och skickar det som ett json objekt till användare som gör en förfrågan. Självklart hade jag kunnat skriva det rakt i en json-fil men jag tänkte hur det skulle kunna hanteras om en bloggare skrev i en markdown eller i detta fall en text-fil. 

    Något som jag verkligen kommer ta med mig från detta kursmoment var hur man startar en server som sedan publiceras till allmänheten. Detta är väldigt bra att kunna eftersom det gör utveckling mycket roligare då man kan dela med sig av sitt arbete enklare. Jag är nyfiken på hur ett frontend sedan kopplas till detta. Oftast så brukar man bygga ihop alla filer till en minifierad fil som sedan läggs i en build eller dist katalog. Jag misstänker att kommande uppgifter svarar på dessa frågor."
);