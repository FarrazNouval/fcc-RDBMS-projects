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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
    year integer NOT NULL,
    round character varying(31) NOT NULL,
    opponent_goals integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_id integer NOT NULL
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
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    name character varying(50) NOT NULL,
    team_id integer NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 2018, 'Final', 2, 4, 2, 1);
INSERT INTO public.games VALUES (2, 2018, 'Third Place', 0, 2, 4, 3);
INSERT INTO public.games VALUES (3, 2018, 'Semi-Final', 1, 2, 4, 2);
INSERT INTO public.games VALUES (4, 2018, 'Semi-Final', 0, 1, 3, 1);
INSERT INTO public.games VALUES (5, 2018, 'Quarter-Final', 2, 3, 5, 2);
INSERT INTO public.games VALUES (6, 2018, 'Quarter-Final', 0, 2, 6, 4);
INSERT INTO public.games VALUES (7, 2018, 'Quarter-Final', 1, 2, 7, 3);
INSERT INTO public.games VALUES (8, 2018, 'Quarter-Final', 0, 2, 8, 1);
INSERT INTO public.games VALUES (9, 2018, 'Eighth-Final', 1, 2, 9, 4);
INSERT INTO public.games VALUES (10, 2018, 'Eighth-Final', 0, 1, 10, 6);
INSERT INTO public.games VALUES (11, 2018, 'Eighth-Final', 2, 3, 11, 3);
INSERT INTO public.games VALUES (12, 2018, 'Eighth-Final', 0, 2, 12, 7);
INSERT INTO public.games VALUES (13, 2018, 'Eighth-Final', 1, 2, 13, 2);
INSERT INTO public.games VALUES (14, 2018, 'Eighth-Final', 1, 2, 14, 5);
INSERT INTO public.games VALUES (15, 2018, 'Eighth-Final', 1, 2, 15, 8);
INSERT INTO public.games VALUES (16, 2018, 'Eighth-Final', 3, 4, 16, 1);
INSERT INTO public.games VALUES (17, 2014, 'Final', 0, 1, 16, 17);
INSERT INTO public.games VALUES (18, 2014, 'Third Place', 0, 3, 7, 18);
INSERT INTO public.games VALUES (19, 2014, 'Semi-Final', 0, 1, 18, 16);
INSERT INTO public.games VALUES (20, 2014, 'Semi-Final', 1, 7, 7, 17);
INSERT INTO public.games VALUES (21, 2014, 'Quarter-Final', 0, 1, 19, 18);
INSERT INTO public.games VALUES (22, 2014, 'Quarter-Final', 0, 1, 3, 16);
INSERT INTO public.games VALUES (23, 2014, 'Quarter-Final', 1, 2, 9, 7);
INSERT INTO public.games VALUES (24, 2014, 'Quarter-Final', 0, 1, 1, 17);
INSERT INTO public.games VALUES (25, 2014, 'Eighth-Final', 1, 2, 20, 7);
INSERT INTO public.games VALUES (26, 2014, 'Eighth-Final', 0, 2, 8, 9);
INSERT INTO public.games VALUES (27, 2014, 'Eighth-Final', 0, 2, 21, 1);
INSERT INTO public.games VALUES (28, 2014, 'Eighth-Final', 1, 2, 22, 17);
INSERT INTO public.games VALUES (29, 2014, 'Eighth-Final', 1, 2, 12, 18);
INSERT INTO public.games VALUES (30, 2014, 'Eighth-Final', 1, 2, 23, 19);
INSERT INTO public.games VALUES (31, 2014, 'Eighth-Final', 0, 1, 10, 16);
INSERT INTO public.games VALUES (32, 2014, 'Eighth-Final', 1, 2, 24, 3);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES ('France', 1);
INSERT INTO public.teams VALUES ('Croatia', 2);
INSERT INTO public.teams VALUES ('Belgium', 3);
INSERT INTO public.teams VALUES ('England', 4);
INSERT INTO public.teams VALUES ('Russia', 5);
INSERT INTO public.teams VALUES ('Sweden', 6);
INSERT INTO public.teams VALUES ('Brazil', 7);
INSERT INTO public.teams VALUES ('Uruguay', 8);
INSERT INTO public.teams VALUES ('Colombia', 9);
INSERT INTO public.teams VALUES ('Switzerland', 10);
INSERT INTO public.teams VALUES ('Japan', 11);
INSERT INTO public.teams VALUES ('Mexico', 12);
INSERT INTO public.teams VALUES ('Denmark', 13);
INSERT INTO public.teams VALUES ('Spain', 14);
INSERT INTO public.teams VALUES ('Portugal', 15);
INSERT INTO public.teams VALUES ('Argentina', 16);
INSERT INTO public.teams VALUES ('Germany', 17);
INSERT INTO public.teams VALUES ('Netherlands', 18);
INSERT INTO public.teams VALUES ('Costa Rica', 19);
INSERT INTO public.teams VALUES ('Chile', 20);
INSERT INTO public.teams VALUES ('Nigeria', 21);
INSERT INTO public.teams VALUES ('Algeria', 22);
INSERT INTO public.teams VALUES ('Greece', 23);
INSERT INTO public.teams VALUES ('United States', 24);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 24, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

