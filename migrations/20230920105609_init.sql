-- +goose Up
-- +goose StatementBegin
CREATE SCHEMA omnicars;

CREATE TYPE omnicars.role AS ENUM('USER', 'ADMIN');

CREATE TABLE omnicars.user (
    id SERIAL PRIMARY KEY UNIQUE,
    email VARCHAR NOT NULL UNIQUE,
    fisrt_name VARCHAR NOT NULL,
    last_name VARCHAR,
    role omnicars.role NOT NULL DEFAULT('USER')
);

CREATE TABLE omnicars.vendor (
    id SERIAL PRIMARY KEY UNIQUE,
    title VARCHAR NOT NULL UNIQUE
);

CREATE TYPE omnicars.transmission_type AS ENUM('MANUAL', 'AUTOMATIC', 'CVT');
CREATE TYPE omnicars.fuel_type AS ENUM('GASOLINE', 'DIESEL', 'HYBRID', 'ELECTRIC');

CREATE TABLE omnicars.engine (
    id SERIAL PRIMARY KEY UNIQUE,
    model VARCHAR NOT NULL UNIQUE,
    vendor INT NOT NULL,
    power INT NOT NULL,
    fuel omnicars.fuel_type NOT NULL,
    max_rev INT NOT NULL,
    torque SMALLINT NOT NULL,
    cylinders SMALLINT NOT NULL,
    bore FLOAT NOT NULL,
    stroke FLOAT NOT NULL,
    compression_rate FLOAT NOT NULL,

    CONSTRAINT engine_vendor
        FOREIGN KEY(vendor) REFERENCES omnicars.vendor(id)
);

CREATE TABLE omnicars.car (
    id SERIAL PRIMARY KEY UNIQUE,
    model VARCHAR NOT NULL UNIQUE,
    vendor INT NOT NULL,
    year SMALLINT NOT NULL,
    engine INT NOT NULL,
    transmission omnicars.transmission_type NOT NULL,

    CONSTRAINT car_vendor
        FOREIGN KEY(vendor) REFERENCES omnicars.vendor(id),
    
    CONSTRAINT car_engine
        FOREIGN KEY(engine) REFERENCES omnicars.engine(id)
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE omnicars.user;
DROP TABLE omnicars.car;
DROP TYPE omnicars.role;
DROP TYPE omnicars.transmission_type;
DROP TYPE omnicars.fuel_type;
DROP TABLE omnicars.engine;
DROP TABLE omnicars.vendor;

DROP SCHEMA omnicars;
-- +goose StatementEnd
