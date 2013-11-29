--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.9
-- Dumped by pg_dump version 9.1.9
-- Started on 2013-11-29 16:54:18 BRST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 3275 (class 0 OID 57404)
-- Dependencies: 181 3276
-- Data for Name: vehicle_parking_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vehicle_parking_type (id, name) FROM stdin;
3	Privado com exposição
1	Rua / Avenida
2	Privado sem exposição
\.


--
-- TOC entry 3280 (class 0 OID 0)
-- Dependencies: 180
-- Name: vehicle_parking_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('vehicle_parking_type_id_seq', 16, true);


-- Completed on 2013-11-29 16:54:18 BRST

--
-- PostgreSQL database dump complete
--

