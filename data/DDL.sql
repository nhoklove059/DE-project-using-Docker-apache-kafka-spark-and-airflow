CREATE TABLE circuits
(
    circuitId  INT PRIMARY KEY,
    circuitRef VARCHAR(50),
    name       VARCHAR(100),
    location   VARCHAR(100),
    country    VARCHAR(50),
    lat        DECIMAL(9, 6),
    lng        DECIMAL(9, 6),
    alt        INT,
    url        TEXT
);

CREATE TABLE IF NOT EXISTS constructors
(
    constructorId  INT PRIMARY KEY,
    constructorRef VARCHAR(50),
    name           TEXT,
    nationality    TEXT,
    url            TEXT
);

CREATE TABLE drivers
(
    driverId    INT PRIMARY KEY,
    driverRef   VARCHAR(50) UNIQUE,
    number      INT,
    code        VARCHAR(3),
    forename    VARCHAR(50),
    surname     VARCHAR(50),
    dob         DATE,
    nationality VARCHAR(50),
    url         TEXT
);


CREATE TABLE IF NOT EXISTS Seasons
(
    year VARCHAR(4) PRIMARY KEY,
    url  VARCHAR(150)
);

CREATE TABLE IF NOT EXISTS status
(
    statusId INT PRIMARY KEY,
    status   varchar(50)
);

CREATE TABLE IF NOT EXISTS races
(
    raceId      INT PRIMARY KEY,
    year        INT,
    round       INT,
    circuitId   INT REFERENCES circuits (circuitId),
    name        TEXT,
    date        DATE,
    time        TIME,
    url         TEXT,
    fp1_date    DATE,
    fp1_time    TIME,
    fp2_date    DATE,
    fp2_time    TIME,
    fp3_date    DATE,
    fp3_time    TIME,
    quali_date  DATE,
    quali_time  TIME,
    sprint_date DATE,
    sprint_time TIME
);

CREATE TABLE IF NOT EXISTS constructor_results
(
    constructorResultsId INT PRIMARY KEY,
    raceId               INT REFERENCES races (raceId),
    constructorId        INT REFERENCES constructors (constructorId),
    points               INT,
    status               TEXT
);

CREATE TABLE IF NOT EXISTS constructor_standings
(
    constructorStandingsId INT PRIMARY KEY,
    raceId                 INT REFERENCES races (raceId),
    constructorId          INT REFERENCES constructors (constructorId),
    points                 INT,
    position               INT,
    positionText           VARCHAR(5),
    wins                   INT
);

CREATE TABLE IF NOT EXISTS driver_standings
(
    driverStandingsId INT PRIMARY KEY,
    raceId            INT REFERENCES races (raceId),
    driverId          INT REFERENCES drivers (driverId),
    points            FLOAT,
    position          INT,
    positionText      VARCHAR(10),
    wins              INT
);

CREATE TABLE IF NOT EXISTS lap_times
(
    raceId       INT REFERENCES races (raceId),
    driverId     INT REFERENCES drivers (driverId),
    lap          INT,
    position     INT,
    time         INTERVAL,
    milliseconds BIGINT
);

CREATE TABLE IF NOT EXISTS pit_stops
(
    raceId       INT REFERENCES races (raceId),
    driverId     INT REFERENCES drivers (driverId),
    stop         INT,
    lap          INT,
    time         TIME,
    duration     INTERVAL,
    milliseconds INT
);

CREATE TABLE IF NOT EXISTS qualifying
(
    qualifyId     INT PRIMARY KEY,
    raceId        INT REFERENCES races (raceId),
    driverId      INT REFERENCES drivers (driverId),
    constructorId INT REFERENCES constructors (constructorId),
    number        INT,
    position      INT,
    q1            TIME,
    q2            TIME,
    q3            TIME
);

CREATE TABLE IF NOT EXISTS results
(
    resultId        INT PRIMARY KEY,
    raceId          INT REFERENCES races (raceId),
    driverId        INT REFERENCES drivers (driverId),
    constructorId   INT REFERENCES constructors (constructorId),
    number          INT,
    grid            INT,
    position        INT,
    positionText    VARCHAR(10),
    positionOrder   INT,
    points          FLOAT,
    laps            INT,
    time            INTERVAL,
    milliseconds    BIGINT,
    fastestLap      INT,
    rank            INT,
    fastestLapTime  INTERVAL,
    fastestLapSpeed FLOAT,
    statusId        INT
);

CREATE TABLE IF NOT EXISTS sprint_results
(
    resultId       INT PRIMARY KEY,
    raceId         INT REFERENCES races (raceId),
    driverId       INT REFERENCES drivers (driverId),
    constructorId  INT REFERENCES constructors (constructorId),
    number         INT,
    grid           INT,
    position       INT,
    positionText   VARCHAR(10),
    positionOrder  INT,
    points         FLOAT,
    laps           INT,
    time           INTERVAL,
    milliseconds   BIGINT,
    fastestLap     INT,
    fastestLapTime INTERVAL,
    statusId       INT
);