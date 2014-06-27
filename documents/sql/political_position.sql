--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.4
-- Dumped by pg_dump version 9.3.4
-- Started on 2014-06-27 16:21:48 BRT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 2120 (class 0 OID 20633)
-- Dependencies: 186
-- Data for Name: political_position; Type: TABLE DATA; Schema: public; Owner: root
--

COPY political_position (id, "position") FROM stdin;
1	Presidente
2	Governador
3	Prefeito
4	Senador
6	Deputado estadual
7	Vereador
5	Deputado federal
\.


--
-- TOC entry 2125 (class 0 OID 0)
-- Dependencies: 185
-- Name: political_position_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('political_position_id_seq', 1, false);


-- Completed on 2014-06-27 16:21:49 BRT

--
-- PostgreSQL database dump complete
--

