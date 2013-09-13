--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.9
-- Dumped by pg_dump version 9.1.9
-- Started on 2013-09-09 13:33:18 BRT

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 2086 (class 0 OID 53602)
-- Dependencies: 227 2087
-- Data for Name: vehicle_color; Type: TABLE DATA; Schema: public; Owner: postgres
--
truncate vehicle_color cascade;

COPY vehicle_color (id, name, created_at) FROM stdin;
1	Laranja	2013-09-09 13:30:56.742192
2	Marrom	2013-09-09 13:30:56.742192
3	Prata	2013-09-09 13:30:56.742192
4	Preto	2013-09-09 13:30:56.742192
5	Rosa	2013-09-09 13:30:56.742192
6	Roxo	2013-09-09 13:30:56.742192
7	Verde	2013-09-09 13:30:56.742192
8	Vermelho	2013-09-09 13:30:56.742192
9	Vinho	2013-09-09 13:30:56.742192
10	Outra	2013-09-09 13:30:56.742192
\.


--
-- TOC entry 2091 (class 0 OID 0)
-- Dependencies: 226
-- Name: vehicle_color_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('vehicle_color_id_seq', 10, true);


-- Completed on 2013-09-09 13:33:18 BRT

--
-- PostgreSQL database dump complete
--

