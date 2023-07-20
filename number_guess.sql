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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    number_guesses integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(100) NOT NULL,
    games_played integer DEFAULT 0 NOT NULL,
    best_game integer DEFAULT 0 NOT NULL
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
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (15, 8, 13);
INSERT INTO public.games VALUES (16, 8, 13);
INSERT INTO public.games VALUES (17, 9, 9);
INSERT INTO public.games VALUES (18, 10, 10);
INSERT INTO public.games VALUES (19, 10, 10);
INSERT INTO public.games VALUES (20, 11, 821);
INSERT INTO public.games VALUES (21, 11, 327);
INSERT INTO public.games VALUES (22, 12, 433);
INSERT INTO public.games VALUES (23, 12, 443);
INSERT INTO public.games VALUES (24, 11, 934);
INSERT INTO public.games VALUES (25, 11, 919);
INSERT INTO public.games VALUES (26, 11, 671);
INSERT INTO public.games VALUES (27, 13, 536);
INSERT INTO public.games VALUES (28, 13, 430);
INSERT INTO public.games VALUES (29, 14, 598);
INSERT INTO public.games VALUES (30, 14, 858);
INSERT INTO public.games VALUES (31, 13, 400);
INSERT INTO public.games VALUES (32, 13, 863);
INSERT INTO public.games VALUES (33, 13, 694);
INSERT INTO public.games VALUES (34, 15, 180);
INSERT INTO public.games VALUES (35, 15, 164);
INSERT INTO public.games VALUES (36, 16, 377);
INSERT INTO public.games VALUES (37, 16, 423);
INSERT INTO public.games VALUES (38, 15, 484);
INSERT INTO public.games VALUES (39, 15, 888);
INSERT INTO public.games VALUES (40, 15, 398);
INSERT INTO public.games VALUES (41, 17, 391);
INSERT INTO public.games VALUES (42, 17, 362);
INSERT INTO public.games VALUES (43, 18, 355);
INSERT INTO public.games VALUES (44, 17, 87);
INSERT INTO public.games VALUES (45, 17, 244);
INSERT INTO public.games VALUES (46, 17, 433);
INSERT INTO public.games VALUES (47, 19, 469);
INSERT INTO public.games VALUES (48, 19, 219);
INSERT INTO public.games VALUES (49, 20, 450);
INSERT INTO public.games VALUES (50, 20, 239);
INSERT INTO public.games VALUES (51, 19, 274);
INSERT INTO public.games VALUES (52, 19, 366);
INSERT INTO public.games VALUES (53, 19, 668);
INSERT INTO public.games VALUES (54, 21, 835);
INSERT INTO public.games VALUES (55, 21, 289);
INSERT INTO public.games VALUES (56, 22, 239);
INSERT INTO public.games VALUES (57, 22, 56);
INSERT INTO public.games VALUES (58, 21, 846);
INSERT INTO public.games VALUES (59, 21, 121);
INSERT INTO public.games VALUES (60, 21, 206);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (11,'Fabrizio Bruno',2,100);
INSERT INTO public.users VALUES (12, 'user_1658766211693', 2, 433);
INSERT INTO public.users VALUES (11, 'user_1658766211694', 5, 327);
INSERT INTO public.users VALUES (14, 'user_1658766224949', 2, 598);
INSERT INTO public.users VALUES (13, 'user_1658766224950', 5, 400);
INSERT INTO public.users VALUES (16, 'user_1689868010108', 2, 377);
INSERT INTO public.users VALUES (15, 'user_1689868010109', 5, 164);
INSERT INTO public.users VALUES (18, 'user_1689868068448', 1, 355);
INSERT INTO public.users VALUES (17, 'user_1689868068449', 5, 87);
INSERT INTO public.users VALUES (20, 'user_1689868108423', 2, 239);
INSERT INTO public.users VALUES (19, 'user_1689868108424', 5, 219);
INSERT INTO public.users VALUES (22, 'user_1689868139797', 2, 56);
INSERT INTO public.users VALUES (21, 'user_1689868139798', 5, 121);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 60, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 22, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--
