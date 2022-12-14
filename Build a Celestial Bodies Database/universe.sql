--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: discoverer; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.discoverer (
    discoverer_id integer NOT NULL,
    name character varying(20) NOT NULL,
    nationality character varying(20)
);


ALTER TABLE public.discoverer OWNER TO freecodecamp;

--
-- Name: discoverer_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.discoverer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discoverer_id_seq OWNER TO freecodecamp;

--
-- Name: discoverer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.discoverer_id_seq OWNED BY public.discoverer.discoverer_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    galaxy_type character varying(20) NOT NULL,
    has_life boolean,
    has_planet boolean,
    age_in_million_years integer NOT NULL,
    description text,
    name character varying(20) NOT NULL,
    stars_in_million integer,
    dist_from_earth numeric(7,2),
    discoverer_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km numeric(6,2) NOT NULL,
    period_d numeric(6,2),
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_million_years integer NOT NULL,
    planet_type character varying(30) NOT NULL,
    star_id integer NOT NULL,
    distance_from_earth numeric(6,2),
    name character varying(20) NOT NULL,
    discoverer_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    age_in_million_years integer,
    galaxy_id integer,
    bigger_than_sun boolean,
    is_binary boolean,
    type text,
    diameter_million_km numeric(5,3) NOT NULL,
    discoverer_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: discoverer discoverer_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoverer ALTER COLUMN discoverer_id SET DEFAULT nextval('public.discoverer_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: discoverer; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.discoverer VALUES (1, 'GALILEO GALILEI', 'italy');
INSERT INTO public.discoverer VALUES (2, 'ABDURRAHMAN AS-SUFI', 'persia');
INSERT INTO public.discoverer VALUES (3, 'PAOLO MAFFEI', 'italy');
INSERT INTO public.discoverer VALUES (4, 'EDWARD PIGOTT', 'english');
INSERT INTO public.discoverer VALUES (5, 'JOHANN ELERT BODE', 'german');
INSERT INTO public.discoverer VALUES (6, 'ROBERT INNES', 'scotland');
INSERT INTO public.discoverer VALUES (7, 'NASA', NULL);
INSERT INTO public.discoverer VALUES (8, 'ALVAN GRAHAM CLARK', 'america');
INSERT INTO public.discoverer VALUES (9, 'WILLIAM HERSCHEL', 'english');
INSERT INTO public.discoverer VALUES (10, 'JOHN COUCH ADAMS', 'english');
INSERT INTO public.discoverer VALUES (11, 'ELISA QUINTANA', 'mexico');
INSERT INTO public.discoverer VALUES (12, 'CLYDE TOMBAUGH', 'america');
INSERT INTO public.discoverer VALUES (13, 'GIUSEPPE PIAZZI', 'italy');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (3, 'irregular', NULL, NULL, 13800, ' ', 'Canis Major Dwarf', 1000000, 25000.00, NULL);
INSERT INTO public.galaxy VALUES (1, 'spiral', true, true, 13610, 'we live in this galaxy', 'Milky Way', 100000, 26.67, 1);
INSERT INTO public.galaxy VALUES (2, 'spiral', false, NULL, 10010, ' ', 'Andromeda', 1000000, 2.57, 2);
INSERT INTO public.galaxy VALUES (4, 'elliptical', NULL, NULL, 10000, '', 'Maffei 1', NULL, 9295.00, 3);
INSERT INTO public.galaxy VALUES (5, 'spiral', false, true, 13280, '', 'Black Eye', 100000, 24.01, 4);
INSERT INTO public.galaxy VALUES (6, 'grand design spiral', NULL, NULL, 13310, '', 'Bode\s', 250000, 11.74, 5);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'phobos', 5, 23.00, 0.00, '');
INSERT INTO public.moon VALUES (1, 'moon', 1, 3467.00, 0.32, '');
INSERT INTO public.moon VALUES (3, 'delmos', 5, 13.00, 1.26, '');
INSERT INTO public.moon VALUES (5, 'amalthea', 5, 200.00, 0.50, '');
INSERT INTO public.moon VALUES (6, 'thebe', 5, 90.00, 0.67, '');
INSERT INTO public.moon VALUES (7, 'io', 5, 3637.00, 1.77, '');
INSERT INTO public.moon VALUES (8, 'europa', 7, 3138.00, 3.55, '');
INSERT INTO public.moon VALUES (9, 'ganymede', 7, 5262.00, 7.16, '');
INSERT INTO public.moon VALUES (10, 'callisto', 7, 4800.00, 16.69, '');
INSERT INTO public.moon VALUES (11, 'atlas', 7, 40.00, 0.60, '');
INSERT INTO public.moon VALUES (12, 'pandora', 7, 100.00, 0.63, '');
INSERT INTO public.moon VALUES (13, 'janus', 7, 190.00, 0.69, '');
INSERT INTO public.moon VALUES (14, 'titan', 8, 5150.00, 15.95, '');
INSERT INTO public.moon VALUES (15, 'dione', 8, 1120.00, 2.74, '');
INSERT INTO public.moon VALUES (16, 'rhea', 8, 1530.00, 4.52, '');
INSERT INTO public.moon VALUES (17, 'ariel', 9, 1160.00, 2.52, '');
INSERT INTO public.moon VALUES (18, 'miranda', 9, 485.00, 1.41, '');
INSERT INTO public.moon VALUES (19, 'titania', 9, 1610.00, 8.71, '');
INSERT INTO public.moon VALUES (20, 'puck', 9, 170.00, 0.76, '');
INSERT INTO public.moon VALUES (21, 'galatea', 9, 150.00, 0.40, '');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'we live in this planet', true, false, 4543, 'rocky', 2, NULL, 'earth', 11);
INSERT INTO public.planet VALUES (4, 'distance in million light years. age in years from its discovered', false, false, 23, 'extragalatic', 3, 2.00, 'PA-99-N2', 11);
INSERT INTO public.planet VALUES (2, '', false, true, 4503, 'rocky', 1, 77.00, 'mercury', 1);
INSERT INTO public.planet VALUES (3, '', true, true, 4503, 'rocky', 1, 61.00, 'venus', 1);
INSERT INTO public.planet VALUES (5, '', false, false, 4603, 'rocky', 2, 54.60, 'mars', 1);
INSERT INTO public.planet VALUES (7, '', false, false, 4603, 'gas giant', 2, 960.00, 'jupiter', 1);
INSERT INTO public.planet VALUES (8, '', false, false, 4503, 'gas giant', 2, 1200.00, 'saturn', 1);
INSERT INTO public.planet VALUES (9, '', false, false, 4503, 'ice giant', 2, 2600.00, 'uranus', 9);
INSERT INTO public.planet VALUES (10, '', false, true, 4503, 'ice giant', 2, 4300.00, 'neptune', 10);
INSERT INTO public.planet VALUES (11, '', false, true, 6000, 'super earth exoplanet', 1, 55.70, 'Kepler-186f', 11);
INSERT INTO public.planet VALUES (12, '', false, true, 4600, 'gas giant', 1, 4280.00, 'pluto', 12);
INSERT INTO public.planet VALUES (13, '', false, true, 240, 'rocky', 1, 413.00, 'ceres', 13);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', 4603, 1, NULL, false, 'yellow dwarf', 1.392, NULL);
INSERT INTO public.star VALUES (3, 'Delta Andromedae', 3000, 2, true, true, 'orange', 22.270, NULL);
INSERT INTO public.star VALUES (5, 'Atakoraka', 3554, 3, false, NULL, 'yellow dwarf', 0.012, NULL);
INSERT INTO public.star VALUES (2, 'proxima centauri', 4850, 1, false, false, 'red dwarf', 0.214, 6);
INSERT INTO public.star VALUES (4, 'Adhara', 23, 3, true, true, 'blue luminous giant star', 13.927, 7);
INSERT INTO public.star VALUES (6, 'Sirius', 242, 3, true, true, 'white dwarf', 2.400, 8);


--
-- Name: discoverer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.discoverer_id_seq', 13, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: discoverer discoverer_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoverer
    ADD CONSTRAINT discoverer_id_key UNIQUE (discoverer_id);


--
-- Name: discoverer discoverer_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoverer
    ADD CONSTRAINT discoverer_name_key UNIQUE (name);


--
-- Name: discoverer discoverer_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoverer
    ADD CONSTRAINT discoverer_pkey PRIMARY KEY (discoverer_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy discoverer_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT discoverer_galaxy_id_fkey FOREIGN KEY (discoverer_id) REFERENCES public.discoverer(discoverer_id);


--
-- Name: planet discoverer_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT discoverer_planet_fkey FOREIGN KEY (discoverer_id) REFERENCES public.discoverer(discoverer_id);


--
-- Name: star discoverer_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT discoverer_star_id_fkey FOREIGN KEY (discoverer_id) REFERENCES public.discoverer(discoverer_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

