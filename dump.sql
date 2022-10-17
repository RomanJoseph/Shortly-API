--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    token uuid NOT NULL,
    userid integer NOT NULL,
    createdat timestamp without time zone DEFAULT now()
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    shorturl text NOT NULL,
    url text NOT NULL,
    userid integer NOT NULL,
    visitcount integer DEFAULT 0,
    createdat timestamp without time zone DEFAULT now()
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    createdat timestamp without time zone DEFAULT now()
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (18, 'b51fe5d2-f9c6-4f34-9cbb-8f393f403b49', 16, '2022-10-17 13:24:26.79486');
INSERT INTO public.sessions VALUES (19, '0bf5cf33-4901-46bb-82ed-32543692526d', 37, '2022-10-17 13:32:09.251292');
INSERT INTO public.sessions VALUES (20, '3b6d19dd-b863-48df-bb95-628331b142f0', 18, '2022-10-17 13:58:10.39899');
INSERT INTO public.sessions VALUES (21, '9a6536d6-cbb5-4867-bc54-59c4eb0feb1b', 38, '2022-10-17 14:13:06.182113');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (11, '1_pBMNq2', 'www.google.com', 17, 78, '2022-10-17 13:24:19.827066');
INSERT INTO public.urls VALUES (15, '3lBPk0Es', 'https://www.google.com', 16, 32, '2022-10-17 13:24:19.827066');
INSERT INTO public.urls VALUES (16, 'n_IsXn92', 'https://www.google.com', 16, 61, '2022-10-17 13:24:19.827066');
INSERT INTO public.urls VALUES (17, '5AHV6NNv', 'https://www.google.com', 16, 79, '2022-10-17 13:24:19.827066');
INSERT INTO public.urls VALUES (18, 'iAOO3BE2', 'https://www.google.com', 16, 42, '2022-10-17 13:24:19.827066');
INSERT INTO public.urls VALUES (19, 'NvZ9tKEw', 'https://www.google.com', 16, 12, '2022-10-17 13:24:19.827066');
INSERT INTO public.urls VALUES (20, '6tvkmXmG', 'https://www.google.com', 37, 7, '2022-10-17 13:56:12.65818');
INSERT INTO public.urls VALUES (21, '6rKzvc8H', 'https://www.gmail.com', 38, 50, '2022-10-17 14:14:05.517945');
INSERT INTO public.urls VALUES (22, 'EazFbbFP', 'https://www.gmail.com', 38, 50, '2022-10-17 14:14:07.747889');
INSERT INTO public.urls VALUES (23, 'GbENjeif', 'https://www.gmail.com', 38, 12, '2022-10-17 14:14:08.094686');
INSERT INTO public.urls VALUES (24, 's14DH8dZ', 'https://www.gmail.com', 38, 12, '2022-10-17 14:14:08.434246');
INSERT INTO public.urls VALUES (25, '6_h7iEFL', 'https://www.gmail.com', 38, 36, '2022-10-17 14:14:08.813282');
INSERT INTO public.urls VALUES (26, 'GcafzHBK', 'https://www.gmail.com', 38, 5, '2022-10-17 14:14:09.155038');
INSERT INTO public.urls VALUES (27, 'Dy_PKKij', 'https://www.gmail.com', 38, 5, '2022-10-17 14:14:09.476424');
INSERT INTO public.urls VALUES (28, 'eb1q2Mw3', 'https://www.gmail.com', 38, 5, '2022-10-17 14:14:09.814074');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (17, 'joseph', 'jose.luiz.roman@uel.br', '$2b$10$jMb.GByRvSho2ZkgXy.xBuOIrUC0H55WbrPB7XfM4MjwRjyLoLZsS', '2022-10-17 11:29:47.964954');
INSERT INTO public.users VALUES (16, 'joseph', 'romanjose3008@gmail.com', '$2b$10$QzTkwFGSZ029ydimF5D/puuCqESznXDHByykqGr2VzHG2p596UzdW', '2022-10-17 11:29:47.964954');
INSERT INTO public.users VALUES (18, 'teste', 'teste@gmail.com', '$2b$10$g577ooWkes5A7tOZdZsRtelmQmVNTlgtXnx.uJLs/cg2eXfW/l7Zm', '2022-10-17 13:28:19.45964');
INSERT INTO public.users VALUES (20, 'teste1', 'teste1@gmail.com', '$2b$10$Xm2gopFwP31qUkZ6ZRs73e5c2tCqmFPxqMXQV81ey9hZ85aRHCmsi', '2022-10-17 13:28:32.585674');
INSERT INTO public.users VALUES (21, 'teste12', 'teste12@gmail.com', '$2b$10$aNANWQ4kYVxvzJLE5sIkQumvz8/tLlPhU/H7KiO5K4kXJ.OT/UyQ2', '2022-10-17 13:28:46.943389');
INSERT INTO public.users VALUES (22, 'teste123', 'teste123@gmail.com', '$2b$10$oZoeXpWYVJchJNb1Vpla7.jA7MCxxFKUQDl4kEpk080jTIjNtE1bq', '2022-10-17 13:28:50.317784');
INSERT INTO public.users VALUES (23, 'teste1234', 'teste1234@gmail.com', '$2b$10$ioOpvKjFTxRGwbfNXz/ot.cTAfMivlBkaUqzYhnDJHkaD5.BZDxku', '2022-10-17 13:28:53.999543');
INSERT INTO public.users VALUES (24, 'teste12345', 'teste12345@gmail.com', '$2b$10$1grqk/vOFoubKlZUfP8hJe4bJ3ZfFmVlWt50fbmGcudmsHFajvHUi', '2022-10-17 13:29:08.261713');
INSERT INTO public.users VALUES (26, 'teste123456', 'teste123456@gmail.com', '$2b$10$QRDT78XIPltEVFZTs.L..OEK3uskIgj56q2BNjKAE5IJ0ahO.g1iu', '2022-10-17 13:29:16.377714');
INSERT INTO public.users VALUES (27, 'teste1234567', 'teste1234567@gmail.com', '$2b$10$CIeZKFwC6lhQyHeDpC/G/.IDatl6Fs20HXmC2ANPGPzDVTEkXJRpu', '2022-10-17 13:29:22.964812');
INSERT INTO public.users VALUES (28, 'teste12345678', 'teste12345678@gmail.com', '$2b$10$oP4sVy46Vo0sXnN5V8fJjutVTvIFuzfNgN2glmCt04ILEQK4qntGO', '2022-10-17 13:29:28.740993');
INSERT INTO public.users VALUES (29, 'teste123456789', 'teste123456789@gmail.com', '$2b$10$Y4/Gipt57NVQx7WV4iM2h.EcNliOCYLHCbq/jJfV3PJ1OGGTfOKrG', '2022-10-17 13:29:34.602188');
INSERT INTO public.users VALUES (30, 'teste10', 'teste10@gmail.com', '$2b$10$sm8cA7XKQ8MnAFySgY57.u5nKHZdJEcigzue.cm.up/EvKN.DhDzu', '2022-10-17 13:29:46.302342');
INSERT INTO public.users VALUES (31, 'teste11', 'teste11@gmail.com', '$2b$10$WxCy1yj1FkhzRAAmqmCELO4f8nmVi2ETg0RESa1rkPWNhOZYX47Zi', '2022-10-17 13:30:02.336902');
INSERT INTO public.users VALUES (33, 'teste13', 'teste13@gmail.com', '$2b$10$t6tRqVtQey2s25ORthbcre3s8TyDAO2aXLcT4Kvx58xie/KbrUQNa', '2022-10-17 13:30:14.068259');
INSERT INTO public.users VALUES (34, 'teste21', 'teste19@gmail.com', '$2b$10$G9zZjo53tvh63RSKCRgdf..qTp2FarGIeRYPKOODVyQfLtfxTbGue', '2022-10-17 13:30:22.388824');
INSERT INTO public.users VALUES (35, 'teste30', 'teste30@gmail.com', '$2b$10$siQEW3PrcfhnFShYZPNQyOMgKe.Y9/zgZV4YGzWX6ziPfudD.dybG', '2022-10-17 13:30:44.941447');
INSERT INTO public.users VALUES (36, 'teste45', 'teste45@gmail.com', '$2b$10$o8.tIa0Cc8fWLlMp6beYc.y2aPI6IJ2cx.QHQXKaWBsEqcixxx6qS', '2022-10-17 13:30:51.64034');
INSERT INTO public.users VALUES (37, 'teste70', 'teste70@gmail.com', '$2b$10$AfMbugD6B3OVNY7eTm7ps.Tm4FwKqybt8z4xSp35IHaOT6SYltoSS', '2022-10-17 13:31:14.002342');
INSERT INTO public.users VALUES (38, 'zero', 'zezeroawk@gmail.com', '$2b$10$r6xjdlWGIkMKifL5eezFgOQH3VrNdjqp5Zgh272.aJlyFCIu0N66y', '2022-10-17 14:12:33.394421');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 21, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 28, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 38, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(id);


--
-- Name: urls urls_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

