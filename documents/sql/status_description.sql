--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.9
-- Dumped by pg_dump version 9.1.9
-- Started on 2013-11-29 16:52:32 BRST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 3275 (class 0 OID 60645)
-- Dependencies: 240 3276
-- Data for Name: status_description; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY status_description (id, description) FROM stdin;
1	Ativo
2	Inativo
3	Removido
4	Aprovado pelo associado
5	Aprovado pela campanha
6	Rejeitado pelo associado
7	Rejeitado pela campanha
8	Em aprovação
9	Enviado
10	Recebido
\.


--
-- TOC entry 3280 (class 0 OID 0)
-- Dependencies: 239
-- Name: status_description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('status_description_id_seq', 3, true);


-- Completed on 2013-11-29 16:52:32 BRST

--
-- PostgreSQL database dump complete
--

