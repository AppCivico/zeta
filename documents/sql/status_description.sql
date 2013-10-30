--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.9
-- Dumped by pg_dump version 9.1.9
-- Started on 2013-10-30 18:39:50 BRST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 2129 (class 0 OID 60645)
-- Dependencies: 241 2130
-- Data for Name: status_description; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY status_description (id, description) FROM stdin;
1	Ativo
2	Inativo
3	Removido
4	Em aprovação
5	Rejeitado
\.


--
-- TOC entry 2134 (class 0 OID 0)
-- Dependencies: 240
-- Name: status_description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('status_description_id_seq', 3, true);


-- Completed on 2013-10-30 18:39:50 BRST

--
-- PostgreSQL database dump complete
--

