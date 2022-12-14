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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: guesses; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.guesses (
    guess_id integer NOT NULL,
    games_played integer,
    best_game integer,
    user_id integer
);


ALTER TABLE public.guesses OWNER TO freecodecamp;

--
-- Name: guesses_guess_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.guesses_guess_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guesses_guess_id_seq OWNER TO freecodecamp;

--
-- Name: guesses_guess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.guesses_guess_id_seq OWNED BY public.guesses.guess_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: guesses guess_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guesses ALTER COLUMN guess_id SET DEFAULT nextval('public.guesses_guess_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: guesses; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.guesses VALUES (1, NULL, 440, 9);
INSERT INTO public.guesses VALUES (2, NULL, 126, 10);
INSERT INTO public.guesses VALUES (3, NULL, 814, 9);
INSERT INTO public.guesses VALUES (4, NULL, 476, 9);
INSERT INTO public.guesses VALUES (5, NULL, 192, 9);
INSERT INTO public.guesses VALUES (6, NULL, 11, 11);
INSERT INTO public.guesses VALUES (7, NULL, 10, 13);
INSERT INTO public.guesses VALUES (8, NULL, 11, 13);
INSERT INTO public.guesses VALUES (9, NULL, 11, 13);
INSERT INTO public.guesses VALUES (10, NULL, 230, 15);
INSERT INTO public.guesses VALUES (11, NULL, 840, 15);
INSERT INTO public.guesses VALUES (12, NULL, 399, 16);
INSERT INTO public.guesses VALUES (13, NULL, 541, 16);
INSERT INTO public.guesses VALUES (14, NULL, 111, 15);
INSERT INTO public.guesses VALUES (15, NULL, 530, 15);
INSERT INTO public.guesses VALUES (16, NULL, 382, 15);
INSERT INTO public.guesses VALUES (17, NULL, 975, 17);
INSERT INTO public.guesses VALUES (18, NULL, 969, 17);
INSERT INTO public.guesses VALUES (19, NULL, 486, 18);
INSERT INTO public.guesses VALUES (20, NULL, 451, 18);
INSERT INTO public.guesses VALUES (21, NULL, 536, 17);
INSERT INTO public.guesses VALUES (22, NULL, 904, 17);
INSERT INTO public.guesses VALUES (23, NULL, 200, 17);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1671041766497');
INSERT INTO public.users VALUES (2, 'user_1671041766496');
INSERT INTO public.users VALUES (3, 'user_1671042024243');
INSERT INTO public.users VALUES (4, 'user_1671042024242');
INSERT INTO public.users VALUES (5, 'user_1671045271827');
INSERT INTO public.users VALUES (6, 'user_1671045271826');
INSERT INTO public.users VALUES (7, 'user_1671047196243');
INSERT INTO public.users VALUES (8, 'user_1671047196242');
INSERT INTO public.users VALUES (9, 'user_1671048767641');
INSERT INTO public.users VALUES (10, 'user_1671048767640');
INSERT INTO public.users VALUES (11, 'mushu');
INSERT INTO public.users VALUES (12, 'shifu');
INSERT INTO public.users VALUES (13, 'spike');
INSERT INTO public.users VALUES (15, 'user_1671049714817');
INSERT INTO public.users VALUES (16, 'user_1671049714816');
INSERT INTO public.users VALUES (17, 'user_1671050309228');
INSERT INTO public.users VALUES (18, 'user_1671050309227');


--
-- Name: guesses_guess_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.guesses_guess_id_seq', 23, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 18, true);


--
-- Name: guesses guesses_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guesses
    ADD CONSTRAINT guesses_pkey PRIMARY KEY (guess_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: guesses guesses_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guesses
    ADD CONSTRAINT guesses_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

