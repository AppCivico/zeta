--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.9
-- Dumped by pg_dump version 9.1.9
-- Started on 2013-09-14 01:20:03 BRT

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 2101 (class 0 OID 56704)
-- Dependencies: 235 2102
-- Data for Name: vehicle_parking_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vehicle_parking_type (id, name) FROM stdin;
1	Privado sem exposição
2	Rua / Avenida
3	Privado com exposição
\.


--
-- TOC entry 2106 (class 0 OID 0)
-- Dependencies: 234
-- Name: vehicle_parking_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('vehicle_parking_type_id_seq', 16, true);


-- Completed on 2013-09-14 01:20:03 BRT

--
-- PostgreSQL database dump complete
--

