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
-- Name: game; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.game (
    game_id integer NOT NULL,
    player_id integer NOT NULL,
    total_guess integer DEFAULT 100
);


ALTER TABLE public.game OWNER TO freecodecamp;

--
-- Name: player; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.player (
    player_id integer NOT NULL,
    username character varying(50) NOT NULL,
    play_times integer DEFAULT 1
);


ALTER TABLE public.player OWNER TO freecodecamp;

--
-- Name: player_player_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.player_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_player_id_seq OWNER TO freecodecamp;

--
-- Name: player_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.player_player_id_seq OWNED BY public.player.player_id;


--
-- Name: secret; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.secret (
    game_id integer NOT NULL,
    secret_number integer NOT NULL
);


ALTER TABLE public.secret OWNER TO freecodecamp;

--
-- Name: secret_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.secret_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secret_game_id_seq OWNER TO freecodecamp;

--
-- Name: secret_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.secret_game_id_seq OWNED BY public.secret.game_id;


--
-- Name: player player_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.player ALTER COLUMN player_id SET DEFAULT nextval('public.player_player_id_seq'::regclass);


--
-- Name: secret game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.secret ALTER COLUMN game_id SET DEFAULT nextval('public.secret_game_id_seq'::regclass);


--
-- Data for Name: game; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.game VALUES (397, 15056, 264);
INSERT INTO public.game VALUES (398, 15056, 781);
INSERT INTO public.game VALUES (399, 15057, 38);
INSERT INTO public.game VALUES (400, 15057, 716);
INSERT INTO public.game VALUES (401, 15056, 651);
INSERT INTO public.game VALUES (402, 15056, 456);
INSERT INTO public.game VALUES (403, 15056, 969);
INSERT INTO public.game VALUES (404, 15058, 508);
INSERT INTO public.game VALUES (405, 15058, 414);
INSERT INTO public.game VALUES (406, 15059, 908);
INSERT INTO public.game VALUES (407, 15059, 264);
INSERT INTO public.game VALUES (408, 15058, 62);
INSERT INTO public.game VALUES (409, 15058, 770);
INSERT INTO public.game VALUES (410, 15058, 85);
INSERT INTO public.game VALUES (411, 15060, 642);
INSERT INTO public.game VALUES (412, 15060, 9);
INSERT INTO public.game VALUES (413, 15061, 219);
INSERT INTO public.game VALUES (414, 15061, 846);
INSERT INTO public.game VALUES (415, 15060, 50);
INSERT INTO public.game VALUES (416, 15060, 746);
INSERT INTO public.game VALUES (417, 15060, 190);
INSERT INTO public.game VALUES (418, 15062, 448);
INSERT INTO public.game VALUES (419, 15062, 758);
INSERT INTO public.game VALUES (420, 15063, 9);
INSERT INTO public.game VALUES (421, 15063, 296);
INSERT INTO public.game VALUES (422, 15062, 811);
INSERT INTO public.game VALUES (423, 15062, 464);
INSERT INTO public.game VALUES (424, 15062, 371);


--
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.player VALUES (15057, 'user_1671676567456', 2);
INSERT INTO public.player VALUES (15056, 'user_1671676567457', 5);
INSERT INTO public.player VALUES (15059, 'user_1671676749553', 2);
INSERT INTO public.player VALUES (15058, 'user_1671676749554', 5);
INSERT INTO public.player VALUES (15061, 'user_1671676799179', 2);
INSERT INTO public.player VALUES (15060, 'user_1671676799180', 5);
INSERT INTO public.player VALUES (15063, 'user_1671676858026', 2);
INSERT INTO public.player VALUES (15062, 'user_1671676858027', 5);


--
-- Data for Name: secret; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.secret VALUES (397, 263);
INSERT INTO public.secret VALUES (398, 780);
INSERT INTO public.secret VALUES (399, 37);
INSERT INTO public.secret VALUES (400, 715);
INSERT INTO public.secret VALUES (401, 649);
INSERT INTO public.secret VALUES (402, 455);
INSERT INTO public.secret VALUES (403, 968);
INSERT INTO public.secret VALUES (404, 507);
INSERT INTO public.secret VALUES (405, 413);
INSERT INTO public.secret VALUES (406, 907);
INSERT INTO public.secret VALUES (407, 263);
INSERT INTO public.secret VALUES (408, 60);
INSERT INTO public.secret VALUES (409, 769);
INSERT INTO public.secret VALUES (410, 84);
INSERT INTO public.secret VALUES (411, 641);
INSERT INTO public.secret VALUES (412, 8);
INSERT INTO public.secret VALUES (413, 218);
INSERT INTO public.secret VALUES (414, 845);
INSERT INTO public.secret VALUES (415, 48);
INSERT INTO public.secret VALUES (416, 745);
INSERT INTO public.secret VALUES (417, 189);
INSERT INTO public.secret VALUES (418, 447);
INSERT INTO public.secret VALUES (419, 757);
INSERT INTO public.secret VALUES (420, 8);
INSERT INTO public.secret VALUES (421, 295);
INSERT INTO public.secret VALUES (422, 809);
INSERT INTO public.secret VALUES (423, 463);
INSERT INTO public.secret VALUES (424, 370);


--
-- Name: player_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.player_player_id_seq', 15063, true);


--
-- Name: secret_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.secret_game_id_seq', 424, true);


--
-- Name: player player_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (player_id);


--
-- Name: secret secret_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.secret
    ADD CONSTRAINT secret_pkey PRIMARY KEY (game_id);


--
-- Name: game game_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.secret(game_id);


--
-- Name: game game_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.player(player_id);


--
-- PostgreSQL database dump complete
--

