--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.4
-- Dumped by pg_dump version 9.3.4
-- Started on 2014-06-27 16:21:05 BRT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 2121 (class 0 OID 20525)
-- Dependencies: 173
-- Data for Name: state; Type: TABLE DATA; Schema: public; Owner: root
--

COPY state (id, name, uf, country_id, created_at, created_by) FROM stdin;
1	Acre	AC	1	2013-12-04 17:26:44.727418	1
2	Alagoas	AL	1	2013-12-04 17:26:44.727418	1
3	Amapá	AP	1	2013-12-04 17:26:44.727418	1
4	Amazonas	AM	1	2013-12-04 17:26:44.727418	1
5	Bahia	BA	1	2013-12-04 17:26:44.727418	1
6	Ceará	CE	1	2013-12-04 17:26:44.727418	1
7	Distrito Federal	DF	1	2013-12-04 17:26:44.727418	1
8	Espírito Santo	ES	1	2013-12-04 17:26:44.727418	1
9	Goiás	GO	1	2013-12-04 17:26:44.727418	1
10	Maranhão	MA	1	2013-12-04 17:26:44.727418	1
11	Mato Grosso	MT	1	2013-12-04 17:26:44.727418	1
12	Mato Grosso do Sul	MS	1	2013-12-04 17:26:44.727418	1
13	Minas Gerais	MG	1	2013-12-04 17:26:44.727418	1
14	Pará	PA	1	2013-12-04 17:26:44.727418	1
15	Paraíba	PB	1	2013-12-04 17:26:44.727418	1
16	Paraná	PR	1	2013-12-04 17:26:44.727418	1
17	Pernambuco	PE	1	2013-12-04 17:26:44.727418	1
18	Piauí	PI	1	2013-12-04 17:26:44.727418	1
19	Rio de Janeiro	RJ	1	2013-12-04 17:26:44.727418	1
20	Rio Grande do Norte	RN	1	2013-12-04 17:26:44.727418	1
21	Rio Grande do Sul	RS	1	2013-12-04 17:26:44.727418	1
22	Rondônia	RO	1	2013-12-04 17:26:44.727418	1
23	Roraima	RR	1	2013-12-04 17:26:44.727418	1
24	Santa Catarina	SC	1	2013-12-04 17:26:44.727418	1
25	São Paulo	SP	1	2013-12-04 17:26:44.727418	1
26	Sergipe	SE	1	2013-12-04 17:26:44.727418	1
27	Tocantins	TO	1	2013-12-04 17:26:44.727418	1
\.


--
-- TOC entry 2126 (class 0 OID 0)
-- Dependencies: 172
-- Name: state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('state_id_seq', 1, false);


-- Completed on 2014-06-27 16:21:05 BRT

--
-- PostgreSQL database dump complete
--

