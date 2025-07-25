--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

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
-- Name: cafe; Type: TABLE; Schema: public; Owner: cafe_u
--

CREATE TABLE public.cafe (
    id integer NOT NULL,
    nom character varying(100),
    description text,
    reference bigint,
    origine character varying(100),
    prix_au_kilo numeric(10,2),
    caracteristique_principale character varying(50),
    disponible boolean
);


ALTER TABLE public.cafe OWNER TO cafe_u;

--
-- Name: cafe_id_seq; Type: SEQUENCE; Schema: public; Owner: cafe_u
--

CREATE SEQUENCE public.cafe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cafe_id_seq OWNER TO cafe_u;

--
-- Name: cafe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cafe_u
--

ALTER SEQUENCE public.cafe_id_seq OWNED BY public.cafe.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: cafe_u
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    firstname text NOT NULL,
    lastname text NOT NULL,
    email text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public."user" OWNER TO cafe_u;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: cafe_u
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO cafe_u;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cafe_u
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: cafe id; Type: DEFAULT; Schema: public; Owner: cafe_u
--

ALTER TABLE ONLY public.cafe ALTER COLUMN id SET DEFAULT nextval('public.cafe_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: cafe_u
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: cafe; Type: TABLE DATA; Schema: public; Owner: cafe_u
--

COPY public.cafe (id, nom, description, reference, origine, prix_au_kilo, caracteristique_principale, disponible) FROM stdin;
1	Espresso	Café fort et concentré préparé en faisant passer de l'eau chaude à travers du café finement moulu	100955890	Italie	20.99	Corsé	t
2	Columbian	Café moyennement corsé avec une acidité vive et une saveur riche	100955894	Colombie	18.75	Acide	t
3	Ethiopian Yirgacheffe	Réputé pour son arôme floral, son acidité vive et ses notes de saveur citronnée.	105589090	Éthiopie	22.50	Fruité	t
4	Brazilian Santos	Café doux et lisse avec un profil de saveur de noisette.	134009550	Brésil	17.80	Doux	t
5	Guatemalan Antigua	Café corsé avec des nuances chocolatées et une pointe d'épice.	256505890	Guatemala	21.25	Corsé	t
6	Kenyan AA	Café complexe connu pour son acidité rappelant le vin et ses saveurs fruitées	295432730	Kenya	23.70	Acide	t
7	Sumatra Mandheling	Café profond et terreux avec un corps lourd et une faible acidité.	302932754	Indonésie	19.95	Corsé	t
8	Costa Rican Tarrazu	Café vif et net avec une finition propre et une acidité vive.	327302954	Costa Rica	24.50	Acide	t
9	Vietnamese Robusta	Café audacieux et fort avec une saveur robuste distinctive.	549549090	Vietnam	16.75	Épicé	t
10	Tanzanian Peaberry	Acidité vive avec un profil de saveur rappelant le vin et un corps moyen.	582954954	Tanzanie	26.80	Fruité	t
11	Jamaican Blue Mountain	Reconnu pour sa saveur douce, son acidité vive et son absence d'amertume.	589100954	Jamaïque	39.25	Doux	t
12	Rwandan Bourbon	Café avec des notes florales prononcées, une acidité vive et un corps moyen.	650753915	Rwanda	21.90	Fruité	t
13	Panamanian Geisha	Café rare aux arômes floraux complexes, une acidité brillante et un profil de saveur distinctif.	795501340	Panama	42.00	Fruité	t
14	Peruvian Arabica	Café équilibré avec des notes de chocolat, une acidité modérée et un corps velouté.	954589100	Pérou	19.40	Chocolaté	f
15	Hawaiian Kona	Café rare au goût riche, une acidité douce et des nuances subtiles.	958090105	Hawaï	55.75	Doux	f
16	Nicaraguan Maragogipe	Café avec des notes de fruits, une acidité vive et un corps plein.	691550753	Nicaragua	28.60	Fruité	f
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: cafe_u
--

COPY public."user" (id, firstname, lastname, email, password) FROM stdin;
1	momo	popon	momo@gmail.com	57E36D18FED48EDACF4982BBD493DA71
2	widi	mama	goto@gmail.com	379547E062FE0E6BF2F8013FA65D68C4
3	lotro	game	game_lotro@gmail.com	4CD61ABCA285E143D038B7BE874549BD
4	Amos	Perkins	jucavohep@mailinator.com	$2b$10$whiPDFjX0iSYAC1tmv/WGOHjhUXkeF.Qb.Jn.GUfqZmi.UmFkphxy
5	Devin	Byers	wibacyma@mailinator.com	$2b$10$sthisdD0jpg9qPBfIfAAHuSbWkTii6cE9gTDOF18HsAw86vSuLjkC
6	Fatima	Cote	jutyxo@mailinator.com	$2b$10$OXtCd5q0NBTv6Mc6vEcouexm8rKBCMY6nNbvoa8k7jQX.CS6PIKq.
7	Melissa	Rose	musemo@mailinator.com	$2b$10$LR.dwhOcC/0JOjdB82KUGe3zk1H54GSDtcG/vL2kiQlgg58X1Qvsy
\.


--
-- Name: cafe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cafe_u
--

SELECT pg_catalog.setval('public.cafe_id_seq', 16, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cafe_u
--

SELECT pg_catalog.setval('public.user_id_seq', 7, true);


--
-- Name: cafe cafe_pkey; Type: CONSTRAINT; Schema: public; Owner: cafe_u
--

ALTER TABLE ONLY public.cafe
    ADD CONSTRAINT cafe_pkey PRIMARY KEY (id);


--
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: cafe_u
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: cafe_u
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

