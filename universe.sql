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
    galaxy_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(20) NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

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
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 'Spiral', 0.0, 1);
INSERT INTO public.galaxy VALUES ('Messier 87', 'Elliptical', 55.0, 2);
INSERT INTO public.galaxy VALUES ('Cigar (M82)', 'Irregular', 12.0, 3);
INSERT INTO public.galaxy VALUES ('Andromeda', 'Spiral', 2.5, 4);
INSERT INTO public.galaxy VALUES ('Whirlpool (M51)', 'Spiral', 30.0, 5);
INSERT INTO public.galaxy VALUES ('Triangulum (M33)', 'Unbarred', 3.0, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 0.33, 4879, 5427, 3.7, false, 0, 57.9, NULL, 1, 1);
INSERT INTO public.planet VALUES ('Venus', 4.87, 12104, 5243, 8.9, false, 0, 108.2, NULL, 1, 1);
INSERT INTO public.planet VALUES ('Earth', 5.97, 12756, 5514, 9.8, true, 1, 149.6, NULL, 1, 1);
INSERT INTO public.planet VALUES ('Mars', 0.64, 6792, 3933, 3.7, false, 2, 227.9, NULL, 1, 1);
INSERT INTO public.planet VALUES ('Jupiter', 1898.00, 142984, 1326, 23.1, false, 67, 778.6, NULL, 1, 1);
INSERT INTO public.planet VALUES ('Saturn', 568.00, 120536, 687, 9.0, false, 62, 1433.5, NULL, 1, 1);
INSERT INTO public.planet VALUES ('Uranus', 86.80, 51118, 1271, 8.7, false, 27, 2872.5, NULL, 1, 1);
INSERT INTO public.planet VALUES ('Neptune', 102.00, 49528, 1638, 11.0, false, 14, 4495.1, NULL, 1, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('The Sun', 1, 5500, 1, 1, 'G type main sequence');
INSERT INTO public.star VALUES ('Siruis', 2, 17934, 1, 2, 'A type main sequence');
INSERT INTO public.star VALUES ('Betelgeuse', 20, 7012, 1, 3, 'red supergiant');
INSERT INTO public.star VALUES ('Rigel', 12, 11000, 1, 4, 'blue-white supergiant');
INSERT INTO public.star VALUES ('Antares', 15, 3500, 1, 5, 'red supergiant');


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
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


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
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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
