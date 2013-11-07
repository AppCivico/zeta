--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.9
-- Dumped by pg_dump version 9.1.9
-- Started on 2013-11-03 17:24:59 BRST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 2132 (class 0 OID 57303)
-- Dependencies: 166 2133
-- Data for Name: tracker; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tracker (id, code, vehicle_id, created_at, status, iccid, mobile_number) FROM stdin;
1	356495040599153	5	2013-10-03 13:25:54.910983	1	\N	\N
4	11874000084652	\N	2013-11-01 17:16:17.581049	1	\N	\N
5	11874000087671	\N	2013-11-01 17:16:44.81214	1	\N	\N
6	11874000088489	\N	2013-11-01 17:17:04.800222	1	\N	\N
7	11874000087903	\N	2013-11-01 17:17:28.061564	1	\N	\N
8	11874000089453	\N	2013-11-01 17:17:53.025315	1	\N	\N
9	11874000090519	\N	2013-11-01 17:18:12.298126	1	\N	\N
10	11874000087721	\N	2013-11-01 17:18:29.04023	1	\N	\N
11	11874000089271	\N	2013-11-01 17:18:46.879585	1	\N	\N
12	11874000088240	\N	2013-11-01 17:19:05.502868	1	\N	\N
13	11874000089198	\N	2013-11-01 17:19:22.188353	1	\N	\N
2	011874000196878	5	2013-10-14 15:19:35.814503	1	\N	\N
\.


--
-- TOC entry 2137 (class 0 OID 0)
-- Dependencies: 165
-- Name: tracker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tracker_id_seq', 13, true);


-- Completed on 2013-11-03 17:24:59 BRST

--
-- PostgreSQL database dump complete
--

