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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(20) NOT NULL,
    type character varying(20) NOT NULL,
    distance_from_earth numeric(5,1),
    galaxy_id integer NOT NULL,
    diameter integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(20) NOT NULL,
    has_water boolean NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    orbital_period numeric(10,1)
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
    name character varying(20) NOT NULL,
    mass numeric(10,2) NOT NULL,
    diameter integer NOT NULL,
    density integer NOT NULL,
    gravity numeric(5,1) NOT NULL,
    has_life boolean NOT NULL,
    no_of_moons integer,
    distance_from_sun numeric(6,1) NOT NULL,
    notes text,
    galaxy_id integer,
    star_id integer,
    planet_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_moon (
    planet_moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.planet_moon OWNER TO freecodecamp;

--
-- Name: planet_moon_planet_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_moon_planet_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_moon_planet_moon_id_seq OWNER TO freecodecamp;

--
-- Name: planet_moon_planet_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_moon_planet_moon_id_seq OWNED BY public.planet_moon.planet_moon_id;


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
    name character varying(20) NOT NULL,
    solar_mass integer,
    surface_temp integer,
    galaxy_id integer,
    star_id integer NOT NULL,
    star_type character varying(32) NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_moon planet_moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon ALTER COLUMN planet_moon_id SET DEFAULT nextval('public.planet_moon_planet_moon_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 'Spiral', 0.0, 1, 100000);
INSERT INTO public.galaxy VALUES ('Andromeda', 'Spiral', 2.5, 4, 220000);
INSERT INTO public.galaxy VALUES ('Messier 87', 'Elliptical', 55.0, 2, 130000);
INSERT INTO public.galaxy VALUES ('Cigar (M82)', 'Irregular', 12.0, 3, 14000);
INSERT INTO public.galaxy VALUES ('Whirlpool (M51)', 'Spiral', 30.0, 5, 60000);
INSERT INTO public.galaxy VALUES ('Triangulum (M33)', 'Unbarred', 3.0, 6, 60000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('The Moon', false, 3, 1, 27.3);
INSERT INTO public.moon VALUES ('Europa', true, 5, 2, 3.5);
INSERT INTO public.moon VALUES ('Titan', false, 6, 3, 15.9);
INSERT INTO public.moon VALUES ('Ganymede', true, 5, 4, 7.2);
INSERT INTO public.moon VALUES ('Callisto', true, 5, 5, 16.7);
INSERT INTO public.moon VALUES ('Io', false, 5, 6, 1.8);
INSERT INTO public.moon VALUES ('Triton', true, 8, 7, 5.9);
INSERT INTO public.moon VALUES ('Enceladus', true, 6, 8, 1.4);
INSERT INTO public.moon VALUES ('Rhea', false, 6, 9, 4.5);
INSERT INTO public.moon VALUES ('Dione', true, 6, 10, 2.7);
INSERT INTO public.moon VALUES ('Oberon', false, 7, 11, 13.5);
INSERT INTO public.moon VALUES ('Iapetus', true, 6, 12, 79.3);
INSERT INTO public.moon VALUES ('Hyperion', false, 6, 13, 21.3);
INSERT INTO public.moon VALUES ('Phobos', false, 4, 14, 0.3);
INSERT INTO public.moon VALUES ('Ariel', false, 7, 15, 2.5);
INSERT INTO public.moon VALUES ('Umbriel', false, 7, 16, 4.1);
INSERT INTO public.moon VALUES ('Proteus', false, 8, 17, 1.2);
INSERT INTO public.moon VALUES ('Mimas', false, 6, 18, 0.9);
INSERT INTO public.moon VALUES ('Charon', false, 9, 19, 6.4);
INSERT INTO public.moon VALUES ('Thebe', false, 5, 20, 0.7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 0.33, 4879, 5427, 3.7, false, 0, 57.9, NULL, 1, 1, 1);
INSERT INTO public.planet VALUES ('Venus', 4.87, 12104, 5243, 8.9, false, 0, 108.2, NULL, 1, 1, 2);
INSERT INTO public.planet VALUES ('Earth', 5.97, 12756, 5514, 9.8, true, 1, 149.6, NULL, 1, 1, 3);
INSERT INTO public.planet VALUES ('Mars', 0.64, 6792, 3933, 3.7, false, 2, 227.9, NULL, 1, 1, 4);
INSERT INTO public.planet VALUES ('Jupiter', 1898.00, 142984, 1326, 23.1, false, 67, 778.6, NULL, 1, 1, 5);
INSERT INTO public.planet VALUES ('Saturn', 568.00, 120536, 687, 9.0, false, 62, 1433.5, NULL, 1, 1, 6);
INSERT INTO public.planet VALUES ('Uranus', 86.80, 51118, 1271, 8.7, false, 27, 2872.5, NULL, 1, 1, 7);
INSERT INTO public.planet VALUES ('Neptune', 102.00, 49528, 1638, 11.0, false, 14, 4495.1, NULL, 1, 1, 8);
INSERT INTO public.planet VALUES ('Pluto', 0.01, 2377, 203, 0.6, false, 5, 5906.1, NULL, 1, 1, 9);
INSERT INTO public.planet VALUES ('Ceres', 0.01, 940, 216, 0.3, false, 0, 257.0, NULL, 1, 1, 10);
INSERT INTO public.planet VALUES ('Eris', 0.01, 2326, 252, 0.8, false, 1, 10125.0, NULL, 1, 1, 11);
INSERT INTO public.planet VALUES ('Makemake', 0.04, 1430, 203, 0.6, false, 1, 52800.0, NULL, 1, 1, 12);


--
-- Data for Name: planet_moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_moon VALUES (1, 3, 1, 'Earth');
INSERT INTO public.planet_moon VALUES (2, 3, 1, NULL);
INSERT INTO public.planet_moon VALUES (3, 5, 2, NULL);
INSERT INTO public.planet_moon VALUES (4, 6, 3, NULL);
INSERT INTO public.planet_moon VALUES (5, 5, 4, NULL);
INSERT INTO public.planet_moon VALUES (6, 5, 5, NULL);
INSERT INTO public.planet_moon VALUES (7, 5, 6, NULL);
INSERT INTO public.planet_moon VALUES (8, 8, 7, NULL);
INSERT INTO public.planet_moon VALUES (9, 6, 8, NULL);
INSERT INTO public.planet_moon VALUES (10, 6, 9, NULL);
INSERT INTO public.planet_moon VALUES (11, 6, 10, NULL);
INSERT INTO public.planet_moon VALUES (12, 7, 11, NULL);
INSERT INTO public.planet_moon VALUES (13, 6, 12, NULL);
INSERT INTO public.planet_moon VALUES (14, 6, 13, NULL);
INSERT INTO public.planet_moon VALUES (15, 4, 14, NULL);
INSERT INTO public.planet_moon VALUES (16, 7, 15, NULL);
INSERT INTO public.planet_moon VALUES (17, 7, 16, NULL);
INSERT INTO public.planet_moon VALUES (18, 8, 17, NULL);
INSERT INTO public.planet_moon VALUES (19, 6, 18, NULL);
INSERT INTO public.planet_moon VALUES (20, 9, 19, NULL);
INSERT INTO public.planet_moon VALUES (21, 5, 20, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('The Sun', 1, 5500, 1, 1, 'G type main sequence');
INSERT INTO public.star VALUES ('Siruis', 2, 17934, 1, 2, 'A type main sequence');
INSERT INTO public.star VALUES ('Betelgeuse', 20, 7012, 1, 3, 'red supergiant');
INSERT INTO public.star VALUES ('Rigel', 12, 11000, 1, 4, 'blue-white supergiant');
INSERT INTO public.star VALUES ('Antares', 15, 3500, 1, 5, 'red supergiant');
INSERT INTO public.star VALUES ('Altair', 1, 7600, 1, 6, 'A type main sequence');


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_moon_planet_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_moon_planet_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 8, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_moon planet_moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_pkey PRIMARY KEY (planet_moon_id);


--
-- Name: planet_moon planet_moon_planet_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_planet_moon_id_key UNIQUE (planet_moon_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


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
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet_moon planet_moon_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: planet_moon planet_moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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
