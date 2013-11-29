--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.9
-- Dumped by pg_dump version 9.1.9
-- Started on 2013-11-29 16:53:14 BRST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 3276 (class 0 OID 57392)
-- Dependencies: 179 3277
-- Data for Name: vehicle_color; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vehicle_color (id, name, created_at) FROM stdin;
1	Laranja	2013-09-14 01:00:49.552732
2	Marrom	2013-09-14 01:00:49.552732
3	Prata	2013-09-14 01:00:49.552732
4	Preto	2013-09-14 01:00:49.552732
5	Rosa	2013-09-14 01:00:49.552732
6	Roxo	2013-09-14 01:00:49.552732
7	Verde	2013-09-14 01:00:49.552732
8	Vermelho	2013-09-14 01:00:49.552732
9	Vinho	2013-09-14 01:00:49.552732
10	Branco	2013-09-14 01:00:49.552732
11	Bege	2013-09-14 01:00:49.552732
12	Dourado	2013-09-14 01:00:49.552732
13	Chumbo	2013-09-14 01:00:49.552732
14	Cinza	2013-09-14 01:00:49.552732
15	Azul	2013-09-14 01:00:49.552732
16	Amarelo	2013-09-14 01:00:49.552732
17	Outra	2013-09-14 01:00:49.552732
\.


--
-- TOC entry 3281 (class 0 OID 0)
-- Dependencies: 178
-- Name: vehicle_color_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('vehicle_color_id_seq', 11, true);


-- Completed on 2013-11-29 16:53:14 BRST

--
-- PostgreSQL database dump complete
--

