--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.9
-- Dumped by pg_dump version 9.1.9
-- Started on 2013-09-14 01:01:04 BRT

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 2102 (class 0 OID 54739)
-- Dependencies: 180 2103
-- Data for Name: vehicle_color; Type: TABLE DATA; Schema: public; Owner: postgres
--
truncate vehicle_color cascade;

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
-- TOC entry 2107 (class 0 OID 0)
-- Dependencies: 179
-- Name: vehicle_color_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('vehicle_color_id_seq', 10, true);


-- Completed on 2013-09-14 01:01:04 BRT

--
-- PostgreSQL database dump complete
--

