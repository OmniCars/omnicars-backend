--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8
-- Dumped by pg_dump version 14.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: car_assistbrake_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.car_assistbrake_enum AS ENUM (
    'ABS'
);


ALTER TYPE public.car_assistbrake_enum OWNER TO postgres;

--
-- Name: car_cabinsteer_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.car_cabinsteer_enum AS ENUM (
    'LEFT',
    'RIGHT'
);


ALTER TYPE public.car_cabinsteer_enum OWNER TO postgres;

--
-- Name: car_config_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.car_config_enum AS ENUM (
    'INLINE',
    'V',
    'BOXER'
);


ALTER TYPE public.car_config_enum OWNER TO postgres;

--
-- Name: car_drivewheel_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.car_drivewheel_enum AS ENUM (
    'FRONT',
    'REAR',
    'ALL'
);


ALTER TYPE public.car_drivewheel_enum OWNER TO postgres;

--
-- Name: car_frontbrakes_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.car_frontbrakes_enum AS ENUM (
    'VENTILATED',
    'DISC'
);


ALTER TYPE public.car_frontbrakes_enum OWNER TO postgres;

--
-- Name: car_fueltype_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.car_fueltype_enum AS ENUM (
    'GASOLINE',
    'DIESEL',
    'ELECTRIC'
);


ALTER TYPE public.car_fueltype_enum OWNER TO postgres;

--
-- Name: car_gearboxtype_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.car_gearboxtype_enum AS ENUM (
    'MANUAL',
    'AUTOMATIC'
);


ALTER TYPE public.car_gearboxtype_enum OWNER TO postgres;

--
-- Name: car_rearbrakes_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.car_rearbrakes_enum AS ENUM (
    'VENTILATED',
    'DISC'
);


ALTER TYPE public.car_rearbrakes_enum OWNER TO postgres;

--
-- Name: user_role_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.user_role_enum AS ENUM (
    'USER',
    'ADMIN'
);


ALTER TYPE public.user_role_enum OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: car; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.car (
    id integer NOT NULL,
    "vendorId" integer,
    model character varying NOT NULL,
    variation character varying NOT NULL,
    year smallint NOT NULL,
    acceleration double precision,
    "maxWeight" double precision,
    "maxLoad" double precision,
    "maxSpeed" double precision,
    "fuelConsumption" double precision,
    "fuelCapacity" double precision,
    "gearboxType" public.car_gearboxtype_enum NOT NULL,
    "gearboxNumber" integer,
    "engineModel" character varying NOT NULL,
    power double precision NOT NULL,
    "minPowerRpm" double precision,
    "maxPowerRpm" double precision NOT NULL,
    "powerPerLitre" double precision NOT NULL,
    "fuelType" public.car_fueltype_enum NOT NULL,
    torque double precision NOT NULL,
    "minTorqueRpm" double precision NOT NULL,
    "maxTorqueRpm" double precision NOT NULL,
    config public.car_config_enum NOT NULL,
    cylinders smallint NOT NULL,
    bore double precision NOT NULL,
    stroke double precision NOT NULL,
    "compressionRate" double precision NOT NULL,
    "driveWheel" public.car_drivewheel_enum NOT NULL,
    "tireWidth" double precision,
    "tireProfile" double precision,
    "tireRim" double precision,
    "wheelWidth" double precision,
    "wheelHeight" double precision,
    "frontBrakes" public.car_frontbrakes_enum NOT NULL,
    "rearBrakes" public.car_rearbrakes_enum NOT NULL,
    "assistBrake" public.car_assistbrake_enum NOT NULL,
    "cabinMaterial" character varying,
    "cabinSteer" public.car_cabinsteer_enum NOT NULL,
    "cabinSeats" smallint NOT NULL,
    "trunkSpaceMin" double precision,
    "trunkSpaceMax" double precision
);


ALTER TABLE public.car OWNER TO postgres;

--
-- Name: car_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.car_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.car_id_seq OWNER TO postgres;

--
-- Name: car_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.car_id_seq OWNED BY public.car.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    email character varying NOT NULL,
    "firstName" character varying NOT NULL,
    "lastName" character varying NOT NULL,
    role public.user_role_enum DEFAULT 'USER'::public.user_role_enum NOT NULL,
    password character varying(64) NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: vendor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor (
    id integer NOT NULL,
    title character varying NOT NULL
);


ALTER TABLE public.vendor OWNER TO postgres;

--
-- Name: vendor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_id_seq OWNER TO postgres;

--
-- Name: vendor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_id_seq OWNED BY public.vendor.id;


--
-- Name: car id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car ALTER COLUMN id SET DEFAULT nextval('public.car_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: vendor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor ALTER COLUMN id SET DEFAULT nextval('public.vendor_id_seq'::regclass);


--
-- Data for Name: car; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.car (id, "vendorId", model, variation, year, acceleration, "maxWeight", "maxLoad", "maxSpeed", "fuelConsumption", "fuelCapacity", "gearboxType", "gearboxNumber", "engineModel", power, "minPowerRpm", "maxPowerRpm", "powerPerLitre", "fuelType", torque, "minTorqueRpm", "maxTorqueRpm", config, cylinders, bore, stroke, "compressionRate", "driveWheel", "tireWidth", "tireProfile", "tireRim", "wheelWidth", "wheelHeight", "frontBrakes", "rearBrakes", "assistBrake", "cabinMaterial", "cabinSteer", "cabinSeats", "trunkSpaceMin", "trunkSpaceMax") FROM stdin;
1	1	Supra	MK5 A90	2020	5.2	\N	\N	\N	\N	52	AUTOMATIC	8	B46B20O1	258	5000	6500	129.1	GASOLINE	400	1550	4400	INLINE	4	82	94.6	10.2	REAR	255	40	18	\N	\N	VENTILATED	VENTILATED	ABS	\N	LEFT	2	\N	\N
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, email, "firstName", "lastName", role, password) FROM stdin;
\.


--
-- Data for Name: vendor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor (id, title) FROM stdin;
1	Toyota
\.


--
-- Name: car_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.car_id_seq', 1, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 1, false);


--
-- Name: vendor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_id_seq', 1, true);


--
-- Name: car PK_55bbdeb14e0b1d7ab417d11ee6d; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car
    ADD CONSTRAINT "PK_55bbdeb14e0b1d7ab417d11ee6d" PRIMARY KEY (id);


--
-- Name: vendor PK_931a23f6231a57604f5a0e32780; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor
    ADD CONSTRAINT "PK_931a23f6231a57604f5a0e32780" PRIMARY KEY (id);


--
-- Name: user PK_cace4a159ff9f2512dd42373760; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY (id);


--
-- Name: car FK_61448951f7a612714bf70e0b5e4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car
    ADD CONSTRAINT "FK_61448951f7a612714bf70e0b5e4" FOREIGN KEY ("vendorId") REFERENCES public.vendor(id);


--
-- PostgreSQL database dump complete
--

