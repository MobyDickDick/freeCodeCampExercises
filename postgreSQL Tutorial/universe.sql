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
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type integer,
    distance numeric,
    description text
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
    name character varying(50) NOT NULL,
    planet_id integer,
    diameter integer,
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
-- Name: other_celestial_bodies; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.other_celestial_bodies (
    other_celestial_bodies_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.other_celestial_bodies OWNER TO freecodecamp;

--
-- Name: other_celestial_bodies_ocb_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.other_celestial_bodies_ocb_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.other_celestial_bodies_ocb_id_seq OWNER TO freecodecamp;

--
-- Name: other_celestial_bodies_ocb_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.other_celestial_bodies_ocb_id_seq OWNED BY public.other_celestial_bodies.other_celestial_bodies_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    number_of_moons integer,
    description text,
    has_life boolean,
    star_id integer,
    has_ring boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: planet_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_galaxy_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    number_of_planets integer,
    mass_in_sun_masses numeric,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_serial_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_serial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_serial_id_seq OWNER TO freecodecamp;

--
-- Name: star_serial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_serial_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: other_celestial_bodies other_celestial_bodies_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_celestial_bodies ALTER COLUMN other_celestial_bodies_id SET DEFAULT nextval('public.other_celestial_bodies_ocb_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_galaxy_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_serial_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Mercie', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'M103', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Canis-Major-Zwerg', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Ursa Major II', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Great Magellan Cloud', NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Europa', 5, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Kalisto', 5, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Io', 5, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Ganymed', 5, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Titan', 6, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Metis', 5, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Himalia', 5, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Lysithea', 5, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Elara', 5, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Phobos', 4, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Deimos', 4, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Adrastea', 5, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Amalthea', 5, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Thebe', 5, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Kallisto', 5, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'Themisto', 5, NULL, NULL);
INSERT INTO public.moon VALUES (23, 'Leda', 5, NULL, NULL);
INSERT INTO public.moon VALUES (24, 'Ersa', 5, NULL, NULL);
INSERT INTO public.moon VALUES (25, 'S/2018 J 2', 5, NULL, NULL);
INSERT INTO public.moon VALUES (27, 'Pandia', 5, NULL, NULL);
INSERT INTO public.moon VALUES (30, 'S/2011 J 3', 5, NULL, NULL);
INSERT INTO public.moon VALUES (31, 'Dia', 5, NULL, NULL);
INSERT INTO public.moon VALUES (32, 'S/2018 J 4', 5, NULL, NULL);
INSERT INTO public.moon VALUES (33, 'Carpo', 5, NULL, NULL);
INSERT INTO public.moon VALUES (34, 'Valetudo', 5, NULL, NULL);
INSERT INTO public.moon VALUES (35, 'Euporie', 5, NULL, NULL);
INSERT INTO public.moon VALUES (36, 'S/2003 J 18', 5, NULL, NULL);
INSERT INTO public.moon VALUES (37, 'Eupheme', 5, NULL, NULL);
INSERT INTO public.moon VALUES (38, 'S/2021 J 3', 5, NULL, NULL);
INSERT INTO public.moon VALUES (39, 'S/2010 J 2', 5, NULL, NULL);
INSERT INTO public.moon VALUES (40, 'S/2016 J 1', 5, NULL, NULL);
INSERT INTO public.moon VALUES (41, 'Mneme', 5, NULL, NULL);
INSERT INTO public.moon VALUES (42, 'Euanthe', 5, NULL, NULL);
INSERT INTO public.moon VALUES (43, 'S/2003 J 16', 5, NULL, NULL);
INSERT INTO public.moon VALUES (44, 'Harpalyke', 5, NULL, NULL);
INSERT INTO public.moon VALUES (45, 'Orthosie', 5, NULL, NULL);
INSERT INTO public.moon VALUES (46, 'Helike', 5, NULL, NULL);
INSERT INTO public.moon VALUES (47, 'S/2021 J 2', 5, NULL, NULL);
INSERT INTO public.moon VALUES (48, 'Praxidike', 5, NULL, NULL);
INSERT INTO public.moon VALUES (49, 'S/2017 J 3', 5, NULL, NULL);
INSERT INTO public.moon VALUES (50, 'S/2021 J 1', 5, NULL, NULL);
INSERT INTO public.moon VALUES (51, 'S/2003 J 12', 5, NULL, NULL);
INSERT INTO public.moon VALUES (52, 'S/2017 J 7', 5, NULL, NULL);
INSERT INTO public.moon VALUES (53, 'S/2022 J 1', 5, NULL, NULL);
INSERT INTO public.moon VALUES (54, 'Thelxinoe', 5, NULL, NULL);
INSERT INTO public.moon VALUES (55, 'Thyone', 5, NULL, NULL);
INSERT INTO public.moon VALUES (56, 'S/2003 J 2', 5, NULL, NULL);
INSERT INTO public.moon VALUES (57, 'Ananke', 5, NULL, NULL);
INSERT INTO public.moon VALUES (58, 'Iocaste', 5, NULL, NULL);
INSERT INTO public.moon VALUES (59, 'Hermippe', 5, NULL, NULL);
INSERT INTO public.moon VALUES (60, 'S/2017 J 9', 5, NULL, NULL);
INSERT INTO public.moon VALUES (62, 'S/2022 J 2', 5, NULL, NULL);
INSERT INTO public.moon VALUES (63, 'Philophrosyne', 5, NULL, NULL);
INSERT INTO public.moon VALUES (64, 'S/2016 J 3', 5, NULL, NULL);
INSERT INTO public.moon VALUES (65, 'Pasithee', 5, NULL, NULL);
INSERT INTO public.moon VALUES (66, 'S/2017 J 8', 5, NULL, NULL);
INSERT INTO public.moon VALUES (67, 'S/2021 J 6', 5, NULL, NULL);
INSERT INTO public.moon VALUES (68, 'S/2003 J 24', 5, NULL, NULL);
INSERT INTO public.moon VALUES (69, 'Eurydome', 5, NULL, NULL);
INSERT INTO public.moon VALUES (70, 'S/2011 J 2', 5, NULL, NULL);
INSERT INTO public.moon VALUES (71, 'S/2003 J 4', 5, NULL, NULL);
INSERT INTO public.moon VALUES (72, 'Chaldene', 5, NULL, NULL);
INSERT INTO public.moon VALUES (73, 'S/2017 J 2', 5, NULL, NULL);
INSERT INTO public.moon VALUES (74, 'Isonoe', 5, NULL, NULL);
INSERT INTO public.moon VALUES (75, 'S/2021 J 4', 5, NULL, NULL);
INSERT INTO public.moon VALUES (76, 'Kallichore', 5, NULL, NULL);
INSERT INTO public.moon VALUES (77, 'Erinome', 5, NULL, NULL);
INSERT INTO public.moon VALUES (78, 'Kale', 5, NULL, NULL);
INSERT INTO public.moon VALUES (79, 'Eirene', 5, NULL, NULL);
INSERT INTO public.moon VALUES (80, 'Aitne', 5, NULL, NULL);
INSERT INTO public.moon VALUES (81, 'Eukelade', 5, NULL, NULL);
INSERT INTO public.moon VALUES (82, 'Arche', 5, NULL, NULL);
INSERT INTO public.moon VALUES (83, 'Taygete', 5, NULL, NULL);
INSERT INTO public.moon VALUES (84, 'S/2016 J 4', 5, NULL, NULL);
INSERT INTO public.moon VALUES (85, 'S/2011 J 1', 5, NULL, NULL);
INSERT INTO public.moon VALUES (86, 'Carme', 5, NULL, NULL);
INSERT INTO public.moon VALUES (87, 'Herse', 5, NULL, NULL);
INSERT INTO public.moon VALUES (88, 'S/2003 J 19', 5, NULL, NULL);
INSERT INTO public.moon VALUES (89, 'S/2010 J 1', 5, NULL, NULL);
INSERT INTO public.moon VALUES (90, 'S/2003 J 9', 5, NULL, NULL);
INSERT INTO public.moon VALUES (91, 'S/2017 J 5', 5, NULL, NULL);
INSERT INTO public.moon VALUES (92, 'S/2017 J 6', 5, NULL, NULL);
INSERT INTO public.moon VALUES (93, 'Kalyke', 5, NULL, NULL);
INSERT INTO public.moon VALUES (94, 'Hegemone', 5, NULL, NULL);
INSERT INTO public.moon VALUES (95, 'S/2018 J 3', 5, NULL, NULL);
INSERT INTO public.moon VALUES (96, 'S/2021 J 5', 5, NULL, NULL);
INSERT INTO public.moon VALUES (97, 'Pasiphae', 5, NULL, NULL);
INSERT INTO public.moon VALUES (98, 'Sponde', 5, NULL, NULL);
INSERT INTO public.moon VALUES (99, 'S/2003 J 10', 5, NULL, NULL);
INSERT INTO public.moon VALUES (100, 'Megaclite', 5, NULL, NULL);
INSERT INTO public.moon VALUES (101, 'Cyllene', 5, NULL, NULL);
INSERT INTO public.moon VALUES (102, 'S/2017 J 1', 5, NULL, NULL);
INSERT INTO public.moon VALUES (103, 'Aoede', 5, NULL, NULL);
INSERT INTO public.moon VALUES (104, 'Autonoe', 5, NULL, NULL);
INSERT INTO public.moon VALUES (105, 'Callirrhoe', 5, NULL, NULL);
INSERT INTO public.moon VALUES (106, 'S/2003 J 23', 5, NULL, NULL);
INSERT INTO public.moon VALUES (107, 'Sinope', 5, NULL, NULL);
INSERT INTO public.moon VALUES (108, 'Kore', 5, NULL, NULL);
INSERT INTO public.moon VALUES (109, '', 5, NULL, NULL);


--
-- Data for Name: other_celestial_bodies; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.other_celestial_bodies VALUES (1, 'Haley comet', NULL);
INSERT INTO public.other_celestial_bodies VALUES (2, 'Gaspra', NULL);
INSERT INTO public.other_celestial_bodies VALUES (3, 'Pallas', NULL);
INSERT INTO public.other_celestial_bodies VALUES (4, 'Tschurjumow-
Gerassimenko', NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', NULL, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', NULL, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', NULL, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', NULL, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (8, 'Neptun', NULL, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (9, '2M1207 b', NULL, NULL, NULL, 13, NULL);
INSERT INTO public.planet VALUES (10, 'Gliese 1214 b', NULL, NULL, NULL, 14, NULL);
INSERT INTO public.planet VALUES (11, 'HD 20782 b', NULL, NULL, NULL, 15, NULL);
INSERT INTO public.planet VALUES (12, 'KELT9b', NULL, NULL, NULL, 15, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, NULL, 1);
INSERT INTO public.star VALUES (2, 'Brachium', NULL, NULL, 1);
INSERT INTO public.star VALUES (3, 'Nemsis', NULL, NULL, 1);
INSERT INTO public.star VALUES (4, 'Antares', NULL, NULL, 1);
INSERT INTO public.star VALUES (5, 'Sirius', NULL, NULL, 1);
INSERT INTO public.star VALUES (6, 'Beteigeuze', NULL, NULL, 1);
INSERT INTO public.star VALUES (13, '2M1207', NULL, NULL, 1);
INSERT INTO public.star VALUES (14, 'Gliese 1214', NULL, NULL, 1);
INSERT INTO public.star VALUES (15, 'HD 20782', NULL, NULL, 1);
INSERT INTO public.star VALUES (16, 'KELT9', NULL, NULL, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 109, true);


--
-- Name: other_celestial_bodies_ocb_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.other_celestial_bodies_ocb_id_seq', 4, true);


--
-- Name: planet_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_galaxy_id_seq', 12, true);


--
-- Name: star_serial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_serial_id_seq', 16, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: other_celestial_bodies other_celestial_bodies_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_celestial_bodies
    ADD CONSTRAINT other_celestial_bodies_name_key UNIQUE (name);


--
-- Name: other_celestial_bodies other_celestial_bodies_ocb_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_celestial_bodies
    ADD CONSTRAINT other_celestial_bodies_ocb_id_key UNIQUE (other_celestial_bodies_id);


--
-- Name: other_celestial_bodies other_celestial_bodies_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_celestial_bodies
    ADD CONSTRAINT other_celestial_bodies_pkey PRIMARY KEY (other_celestial_bodies_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: moon unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: star fk_galaxy_id_ref; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id_ref FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id_ref; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id_ref FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id_ref; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id_ref FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

