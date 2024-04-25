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
    name character varying(30) NOT NULL,
    type text NOT NULL,
    diameter_ly integer,
    distance_mly numeric(10,3)
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
    name character varying(30) NOT NULL,
    radius_km numeric(10,3),
    visible_by_eye boolean,
    planet_id integer
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
    name character varying(30) NOT NULL,
    known_moons integer,
    mass_relative_to_earth numeric(10,3),
    radius_relative_to_earth numeric(10,3),
    is_dwarf boolean,
    star_id integer,
    visible_by_eye boolean,
    planet_type_id integer NOT NULL
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_type_id integer NOT NULL,
    radius_relative_to_sol numeric(10,3),
    mass_relative_to_sol numeric(10,3),
    visible_by_eye boolean,
    galaxy_id integer,
    known_planets integer
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
-- Name: star_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_type (
    star_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.star_type OWNER TO freecodecamp;

--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_type_star_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_type_star_type_id_seq OWNER TO freecodecamp;

--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_type_star_type_id_seq OWNED BY public.star_type.star_type_id;


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
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_type star_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type ALTER COLUMN star_type_id SET DEFAULT nextval('public.star_type_star_type_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'barred spiral', 87400, 0.000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'barred spiral', 152000, 2.500);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 'spiral satellite', 32200, 0.200);
INSERT INTO public.galaxy VALUES (4, 'Eye of God', 'intermediate spiral', 2000000, 61.000);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 'spiral', 1693000, 20.900);
INSERT INTO public.galaxy VALUES (6, 'Butterfly Galaxies', 'colliding unbarred spiral', NULL, 62.000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1738.000, true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 11.267, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 6.200, false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 1821.600, true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 1560.800, true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 2634.100, true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 2410.300, true, 5);
INSERT INTO public.moon VALUES (8, 'Mimas', 198.200, false, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 252.100, false, 6);
INSERT INTO public.moon VALUES (10, 'Tethys', 533.100, false, 6);
INSERT INTO public.moon VALUES (11, 'Dione', 561.400, false, 6);
INSERT INTO public.moon VALUES (12, 'Rhea', 763.800, false, 6);
INSERT INTO public.moon VALUES (13, 'Titan', 2574.730, false, 6);
INSERT INTO public.moon VALUES (14, 'Iapetus', 735.600, false, 6);
INSERT INTO public.moon VALUES (15, 'Ariel', 578.900, false, 7);
INSERT INTO public.moon VALUES (16, 'Umbriel', 584.700, false, 7);
INSERT INTO public.moon VALUES (17, 'Titania', 788.900, false, 7);
INSERT INTO public.moon VALUES (18, 'Oberon', 761.400, false, 7);
INSERT INTO public.moon VALUES (19, 'Miranda', 235.800, false, 7);
INSERT INTO public.moon VALUES (20, 'Triton', 1353.400, false, 8);
INSERT INTO public.moon VALUES (21, 'Pluto', 606.000, false, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, 0.055, 0.383, false, 1, true, 8);
INSERT INTO public.planet VALUES (2, 'Venus', 0, 0.815, 0.950, false, 1, true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1.000, 1.000, false, 1, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 2, 0.107, 0.533, false, 1, true, 8);
INSERT INTO public.planet VALUES (5, 'Jupiter', 95, 317.800, 10.973, false, 1, true, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 146, 95.159, 9.140, false, 1, true, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 28, 14.536, 4.007, false, 1, false, 3);
INSERT INTO public.planet VALUES (8, 'Neptune', 16, 17.147, 3.883, false, 1, false, 3);
INSERT INTO public.planet VALUES (9, 'Pluto', 5, 0.002, 0.187, true, 1, false, 9);
INSERT INTO public.planet VALUES (10, 'CERES', 0, 0.000, 0.074, true, 1, false, 9);
INSERT INTO public.planet VALUES (11, 'Kappa Andromedae B', 0, 4131.764, 17.584, false, 11, false, 5);
INSERT INTO public.planet VALUES (12, 'Kepler 138d', 0, 2.100, 1.510, false, 12, false, 6);
INSERT INTO public.planet VALUES (13, 'Kepler-10b', 0, 3.720, 1.470, false, 13, false, 7);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Earth-Like', 'a planet with a composition and mass similar to Earth');
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', 'a massive planet composed mainly of hydrogen and helium');
INSERT INTO public.planet_type VALUES (3, 'Ice Giant', 'a massive planet composed mainly of elements other than hydrogen and helium, but not solid matter');
INSERT INTO public.planet_type VALUES (4, 'Mega-Earth', 'a massive planet composed mainly of rock or other solid matter');
INSERT INTO public.planet_type VALUES (5, 'Super-Jupiter', 'a gas giant more massive than Jupiter');
INSERT INTO public.planet_type VALUES (6, 'Gas Dwarf', 'a planet larger than earth but less massive than Neptune with a gaseous atmosphere and a relatively small rocky or liquid core');
INSERT INTO public.planet_type VALUES (7, 'Super-Earth', 'a planet with a mass smaller than a gas dwarf, but significantly greater than Earth''s');
INSERT INTO public.planet_type VALUES (8, 'Sub-Earth', 'a planet substantially less massive than Earth');
INSERT INTO public.planet_type VALUES (9, 'Dwarf Planet', 'a planetary-mass object that is rounded due to gravity, but not large enough to sweep its orbit of similar sized objects');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 1.000, 1.000, true, 1, 8);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 1.711, 2.063, true, 1, 0);
INSERT INTO public.star VALUES (3, 'Rigil Kentaurus', 1, 1.218, 1.079, true, 1, 2);
INSERT INTO public.star VALUES (4, 'Arcturus', 2, 25.400, 1.080, true, 1, 0);
INSERT INTO public.star VALUES (5, 'Gamma Crucis', 2, 120.000, 1.500, true, 1, 0);
INSERT INTO public.star VALUES (7, 'Gliesse 440', 3, 0.010, 0.560, false, 1, 0);
INSERT INTO public.star VALUES (6, 'Procyon B', 3, 0.012, 0.602, false, 1, 0);
INSERT INTO public.star VALUES (8, 'Van Maanen''s Star', 3, 0.011, 0.670, false, 1, 0);
INSERT INTO public.star VALUES (9, 'Lacaille 8760', 5, 0.510, 0.600, false, 1, 0);
INSERT INTO public.star VALUES (10, 'Lalande 21185', 5, 0.392, 0.390, false, 1, 2);
INSERT INTO public.star VALUES (11, 'Kappa Andromedae', 1, 2.290, 2.768, true, 1, 1);
INSERT INTO public.star VALUES (12, 'Kepler-138', 5, 0.535, 0.535, false, 1, 3);
INSERT INTO public.star VALUES (13, 'Kepler-10', 1, 1.065, 0.910, false, 1, 3);


--
-- Data for Name: star_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_type VALUES (1, 'main sequence', 'the most common type of star; can vary greatly in colour, brightness, and mass');
INSERT INTO public.star_type VALUES (2, 'red giant', 'smaller main sequence stars that run out of hydrogen in the core expand and become red giants');
INSERT INTO public.star_type VALUES (3, 'white dwarf', 'the cooling core of a red giant that has finished shedding its atmosphere');
INSERT INTO public.star_type VALUES (4, 'neutron star', 'stars too large to create a red giant but too small to produce a black hole go supernova nd leave behind an incredibly dense neutron star');
INSERT INTO public.star_type VALUES (5, 'red dwarf', 'a type of very small main sequence star that can live for a very long time; as a result, it is the most common star type in the galaxy');


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
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 9, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 13, true);


--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_type_star_type_id_seq', 13, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key1 UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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
-- Name: star_type star_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_name_key UNIQUE (name);


--
-- Name: star_type star_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_pkey PRIMARY KEY (star_type_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


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
-- Name: star star_star_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_type_id_fkey FOREIGN KEY (star_type_id) REFERENCES public.star_type(star_type_id);


--
-- PostgreSQL database dump complete
--

