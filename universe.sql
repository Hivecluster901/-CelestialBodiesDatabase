--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(200) NOT NULL,
    age_in_billions_of_years numeric(6,3),
    type character varying(30),
    is_heavier_than_our_galaxy boolean
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
    name character varying(200) NOT NULL,
    planet_id integer NOT NULL,
    is_heavier_than_moon boolean,
    mass_in_earth_mass numeric(5,2)
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
-- Name: mrg_star_galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.mrg_star_galaxy (
    number_of_planets integer,
    age_in_billions_of_years numeric(6,3),
    mrg_star_galaxy_id integer NOT NULL,
    galaxy_galaxy_id integer,
    star_galaxy_galaxy_id integer,
    name character varying(200) NOT NULL,
    galaxy_name character varying(200)
);


ALTER TABLE public.mrg_star_galaxy OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(200) NOT NULL,
    star_id integer,
    number_of_moons integer,
    is_heavier_than_earth boolean,
    description text
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
    name character varying(200) NOT NULL,
    galaxy_id integer,
    number_of_planets integer,
    is_heavier_than_sun boolean
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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'our galaxy', 13.610, 'spiral galaxy', false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10.010, 'spiral_galaxy', true);
INSERT INTO public.galaxy VALUES (3, 'NGC 1300', NULL, 'spiral_galaxy', true);
INSERT INTO public.galaxy VALUES (4, 'Firewors', 0.005, 'spiral_galaxy', false);
INSERT INTO public.galaxy VALUES (5, 'Black Eye', 13.280, 'spiral_galaxy', false);
INSERT INTO public.galaxy VALUES (6, 'Comet', 1.000, 'spiral_galaxy', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 1, false, 0.01);
INSERT INTO public.moon VALUES (2, 'dummy1', 1, true, 0.03);
INSERT INTO public.moon VALUES (3, 'dummy2', 4, false, 1.50);
INSERT INTO public.moon VALUES (4, 'dummy3', 2, false, 0.70);
INSERT INTO public.moon VALUES (5, 'dummy4', 2, false, 0.70);
INSERT INTO public.moon VALUES (6, 'dummy5', 2, false, 0.70);
INSERT INTO public.moon VALUES (7, 'dummy6', 2, false, 0.70);
INSERT INTO public.moon VALUES (8, 'dummy7', 3, true, 0.01);
INSERT INTO public.moon VALUES (9, 'dummy8', 3, true, 0.01);
INSERT INTO public.moon VALUES (10, 'dummy9', 3, true, 0.01);
INSERT INTO public.moon VALUES (11, 'dummy10', 3, true, 0.01);
INSERT INTO public.moon VALUES (12, 'dummy11', 8, true, 0.01);
INSERT INTO public.moon VALUES (15, 'dummy12', 12, true, 0.20);
INSERT INTO public.moon VALUES (16, 'dummy13', 6, true, 0.20);
INSERT INTO public.moon VALUES (17, 'dummy14', 9, true, 0.20);
INSERT INTO public.moon VALUES (18, 'dummy15', 9, false, 0.75);
INSERT INTO public.moon VALUES (19, 'dummy16', 2, false, 0.75);
INSERT INTO public.moon VALUES (20, 'dummy17', 2, false, 0.75);
INSERT INTO public.moon VALUES (21, 'dummy18', 10, false, 0.08);
INSERT INTO public.moon VALUES (22, 'dummy19', 10, false, 0.08);


--
-- Data for Name: mrg_star_galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.mrg_star_galaxy VALUES (8, 13.610, 1, 1, 1, 'Sun', 'our galaxy');
INSERT INTO public.mrg_star_galaxy VALUES (NULL, 13.610, 2, 1, 1, 'Antares', 'our galaxy');
INSERT INTO public.mrg_star_galaxy VALUES (5, 13.610, 3, 1, 1, 'Alpha Centauri', 'our galaxy');
INSERT INTO public.mrg_star_galaxy VALUES (0, 13.610, 4, 1, 1, 'Betelgeuse', 'our galaxy');
INSERT INTO public.mrg_star_galaxy VALUES (NULL, 10.010, 5, 2, 2, 'Alpheratz', 'Andromeda');
INSERT INTO public.mrg_star_galaxy VALUES (NULL, 10.010, 6, 2, 2, 'Mirach', 'Andromeda');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1, false, 'The planet we live in');
INSERT INTO public.planet VALUES (2, 'Mars', 1, 2, false, 'The planet we might live in the future.');
INSERT INTO public.planet VALUES (3, 'Mercury', 1, 0, false, NULL);
INSERT INTO public.planet VALUES (4, 'Venus', 1, 0, false, 'Extreme change of temperature');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 95, true, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 146, true, NULL);
INSERT INTO public.planet VALUES (7, 'Neptune', 1, 16, true, NULL);
INSERT INTO public.planet VALUES (8, 'Uranus', 1, 27, true, NULL);
INSERT INTO public.planet VALUES (9, 'Aether', 2, 12, true, NULL);
INSERT INTO public.planet VALUES (10, 'Thanatos', 2, 1, false, NULL);
INSERT INTO public.planet VALUES (11, 'Polyphemus', 2, 14, true, NULL);
INSERT INTO public.planet VALUES (12, 'Crius', 2, 51, true, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 8, false);
INSERT INTO public.star VALUES (2, 'Antares', 1, NULL, true);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 1, 5, false);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 0, true);
INSERT INTO public.star VALUES (5, 'Alpheratz', 2, NULL, true);
INSERT INTO public.star VALUES (6, 'Mirach', 2, NULL, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: mrg_star_galaxy mrg_star_galaxy_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mrg_star_galaxy
    ADD CONSTRAINT mrg_star_galaxy_id_unique UNIQUE (mrg_star_galaxy_id);


--
-- Name: mrg_star_galaxy mrg_star_galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mrg_star_galaxy
    ADD CONSTRAINT mrg_star_galaxy_pkey PRIMARY KEY (mrg_star_galaxy_id);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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

