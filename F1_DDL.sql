CREATE TABLE circuits
(
    circuit_id   VARCHAR(50) PRIMARY KEY,
    circuit_name TEXT NOT NULL,
    locality     TEXT NOT NULL,
    country      TEXT NOT NULL,
    latitude     FLOAT,
    longitude    FLOAT,
    url          TEXT
);

CREATE TABLE Seasons
(
    season VARCHAR(4) PRIMARY KEY,
    url    TEXT
);

CREATE TABLE races
(
    race_id    SERIAL PRIMARY KEY,
    season     INT  NOT NULL,
    round      INT  NOT NULL,
    race_name  TEXT NOT NULL,
    circuit_id VARCHAR(50) REFERENCES circuits (circuit_id),
    race_date  DATE NOT NULL,
    race_time  TIME NOT NULL,
    url        TEXT
);

CREATE TABLE IF NOT EXISTS results
(
    result_id         SERIAL PRIMARY KEY,
    race_id           INT REFERENCES races (race_id),
    driver_id         VARCHAR(50) REFERENCES drivers (driver_id),
    constructor_id    VARCHAR(50) REFERENCES constructors (constructor_id),
    grid              INT,
    position          INT,
    position_text     VARCHAR(5),
    points            INT,
    laps              INT,
    status            VARCHAR(50),
    time              TEXT,
    time_millis       BIGINT,
    fastest_lap       INT,
    fastest_lap_time  TEXT,
    fastest_lap_speed DECIMAL
);

CREATE TABLE constructors
(
    constructor_id VARCHAR(50) PRIMARY KEY,
    name           TEXT NOT NULL,
    nationality    TEXT NOT NULL,
    url            TEXT
);

CREATE TABLE IF NOT EXISTS drivers
(
    driver_id        VARCHAR(50) PRIMARY KEY,
    permanent_number INT,
    code             VARCHAR(5),
    given_name       VARCHAR(50),
    family_name      VARCHAR(50),
    date_of_birth    DATE,
    nationality      VARCHAR(50),
    url              TEXT
);

CREATE TABLE sprint_results
(
    sprint_id        SERIAL PRIMARY KEY,
    race_id          INT REFERENCES races (race_id),
    driver_id        VARCHAR(50) REFERENCES drivers (driver_id),
    constructor_id   VARCHAR(50) REFERENCES constructors (constructor_id),
    grid             INT,
    position         INT,
    points           INT,
    laps             INT,
    status           TEXT,
    time             TEXT,
    fastest_lap      INT,
    fastest_lap_time TEXT
);

CREATE TABLE qualifying_results
(
    qualifying_id  SERIAL PRIMARY KEY,
    race_id        INT REFERENCES races (race_id),
    driver_id      VARCHAR(50) REFERENCES drivers (driver_id),
    constructor_id VARCHAR(50) REFERENCES constructors (constructor_id),
    position       INT,
    q1_time        TEXT,
    q2_time        TEXT,
    q3_time        TEXT
);

CREATE TABLE pit_stops
(
    pit_stop_id SERIAL PRIMARY KEY,
    race_id     INT REFERENCES races (race_id),
    driver_id   VARCHAR(50) REFERENCES drivers (driver_id),
    lap         INT,
    stop_number INT,
    stop_time   TIME,
    duration    INTERVAL
);

CREATE TABLE lap_times
(
    lap_time_id SERIAL PRIMARY KEY,
    race_id     INT REFERENCES races (race_id),
    lap_number  INT,
    driver_id   VARCHAR(50) REFERENCES drivers (driver_id),
    position    INT,
    lap_time    INTERVAL
);

CREATE TABLE driver_standings
(
    standing_id    SERIAL PRIMARY KEY,
    season         INT,
    round          INT,
    driver_id      VARCHAR(50) REFERENCES drivers (driver_id),
    position       INT,
    points         INT,
    wins           INT,
    constructor_id VARCHAR(50) REFERENCES constructors (constructor_id)
);

CREATE TABLE constructor_standings
(
    standing_id    SERIAL PRIMARY KEY,
    season         INT,
    round          INT,
    constructor_id VARCHAR(50) REFERENCES constructors (constructor_id),
    position       INT,
    points         INT,
    wins           INT
);

CREATE TABLE status
(
    status_id SERIAL PRIMARY KEY,
    status    VARCHAR(50) UNIQUE,
    count     INT
);