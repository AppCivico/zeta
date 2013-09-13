--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.9
-- Dumped by pg_dump version 9.1.9
-- Started on 2013-09-09 13:33:42 BRT

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 2086 (class 0 OID 53614)
-- Dependencies: 229 2087
-- Data for Name: vehicle_body_style; Type: TABLE DATA; Schema: public; Owner: postgres
--
truncate vehicle_body_style cascade;

COPY vehicle_body_style (id, name, created_at) FROM stdin;
1	Buggy	2013-09-09 13:26:22.479937
2	Conversível	2013-09-09 13:26:22.479937
3	Cupê	2013-09-09 13:26:22.479937
4	Hatchback	2013-09-09 13:26:22.479937
5	Minivan	2013-09-09 13:26:22.479937
6	Perua/SW	2013-09-09 13:26:22.479937
7	Picape	2013-09-09 13:26:22.479937
8	Sedã	2013-09-09 13:26:22.479937
9	Utilitário esportivo	2013-09-09 13:26:22.479937
10	Van/Utilitário	2013-09-09 13:26:22.479937
\.


--
-- TOC entry 2091 (class 0 OID 0)
-- Dependencies: 228
-- Name: vehicle_body_style_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('vehicle_body_style_id_seq', 10, true);


-- Completed on 2013-09-09 13:33:42 BRT

--
-- PostgreSQL database dump complete
--

