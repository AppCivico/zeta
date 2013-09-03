--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.9
-- Dumped by pg_dump version 9.1.9
-- Started on 2013-09-03 16:05:16 BRT

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

truncate city cascade;

--
-- TOC entry 2066 (class 0 OID 44594)
-- Dependencies: 181 2067
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY city (id, name, created_at, state_id, country_id, name_url) FROM stdin;
9278	São Paulo	2013-09-03 16:04:39.338617	25	1	sao-paulo
1	Acrelândia	2013-09-03 15:30:12.389704	1	1	acrelandia
2	Assis Brasil	2013-09-03 15:30:12.389704	1	1	assis-brasil
844	Ipu	2013-09-03 15:30:12.389704	6	1	ipu
3	Brasiléia	2013-09-03 15:30:12.389704	1	1	brasileia
4	Bujari	2013-09-03 15:30:12.389704	1	1	bujari
5	Capixaba	2013-09-03 15:30:12.389704	1	1	capixaba
6	Cruzeiro do Sul	2013-09-03 15:30:12.389704	1	1	cruzeiro-do-sul
7	Epitaciolândia	2013-09-03 15:30:12.389704	1	1	epitaciolandia
8	Feijó	2013-09-03 15:30:12.389704	1	1	feijo
9	Jordão	2013-09-03 15:30:12.389704	1	1	jordao
10	Mâncio Lima	2013-09-03 15:30:12.389704	1	1	mancio-lima
11	Manoel Urbano	2013-09-03 15:30:12.389704	1	1	manoel-urbano
12	Marechal Thaumaturgo	2013-09-03 15:30:12.389704	1	1	marechal-thaumaturgo
13	Plácido de Castro	2013-09-03 15:30:12.389704	1	1	placido-de-castro
14	Porto Acre	2013-09-03 15:30:12.389704	1	1	porto-acre
15	Porto Walter	2013-09-03 15:30:12.389704	1	1	porto-walter
16	Rio Branco	2013-09-03 15:30:12.389704	1	1	rio-branco
17	Rodrigues Alves	2013-09-03 15:30:12.389704	1	1	rodrigues-alves
18	Santa Rosa do Purus	2013-09-03 15:30:12.389704	1	1	santa-rosa-do-purus
19	Sena Madureira	2013-09-03 15:30:12.389704	1	1	sena-madureira
20	Senador Guiomard	2013-09-03 15:30:12.389704	1	1	senador-guiomard
21	Tarauacá	2013-09-03 15:30:12.389704	1	1	tarauaca
22	Xapuri	2013-09-03 15:30:12.389704	1	1	xapuri
32	Água Branca	2013-09-03 15:30:12.389704	2	1	agua-branca
33	Anadia	2013-09-03 15:30:12.389704	2	1	anadia
34	Arapiraca	2013-09-03 15:30:12.389704	2	1	arapiraca
35	Atalaia	2013-09-03 15:30:12.389704	2	1	atalaia
36	Barra de Santo Antônio	2013-09-03 15:30:12.389704	2	1	barra-de-santo-antonio
37	Barra de São Miguel	2013-09-03 15:30:12.389704	2	1	barra-de-sao-miguel
38	Batalha	2013-09-03 15:30:12.389704	2	1	batalha
39	Belém	2013-09-03 15:30:12.389704	2	1	belem
40	Belo Monte	2013-09-03 15:30:12.389704	2	1	belo-monte
41	Boca da Mata	2013-09-03 15:30:12.389704	2	1	boca-da-mata
42	Branquinha	2013-09-03 15:30:12.389704	2	1	branquinha
43	Cacimbinhas	2013-09-03 15:30:12.389704	2	1	cacimbinhas
44	Cajueiro	2013-09-03 15:30:12.389704	2	1	cajueiro
45	Campestre	2013-09-03 15:30:12.389704	2	1	campestre
46	Campo Alegre	2013-09-03 15:30:12.389704	2	1	campo-alegre
47	Campo Grande	2013-09-03 15:30:12.389704	2	1	campo-grande
48	Canapi	2013-09-03 15:30:12.389704	2	1	canapi
49	Capela	2013-09-03 15:30:12.389704	2	1	capela
50	Carneiros	2013-09-03 15:30:12.389704	2	1	carneiros
51	Chã Preta	2013-09-03 15:30:12.389704	2	1	cha-preta
52	Coité do Nóia	2013-09-03 15:30:12.389704	2	1	coite-do-noia
53	Colônia Leopoldina	2013-09-03 15:30:12.389704	2	1	colonia-leopoldina
54	Coqueiro Seco	2013-09-03 15:30:12.389704	2	1	coqueiro-seco
55	Coruripe	2013-09-03 15:30:12.389704	2	1	coruripe
56	Craíbas	2013-09-03 15:30:12.389704	2	1	craibas
57	Delmiro Gouveia	2013-09-03 15:30:12.389704	2	1	delmiro-gouveia
58	Dois Riachos	2013-09-03 15:30:12.389704	2	1	dois-riachos
59	Estrela de Alagoas	2013-09-03 15:30:12.389704	2	1	estrela-de-alagoas
60	Feira Grande	2013-09-03 15:30:12.389704	2	1	feira-grande
61	Feliz Deserto	2013-09-03 15:30:12.389704	2	1	feliz-deserto
62	Flexeiras	2013-09-03 15:30:12.389704	2	1	flexeiras
63	Girau do Ponciano	2013-09-03 15:30:12.389704	2	1	girau-do-ponciano
64	Ibateguara	2013-09-03 15:30:12.389704	2	1	ibateguara
65	Igaci	2013-09-03 15:30:12.389704	2	1	igaci
66	Igreja Nova	2013-09-03 15:30:12.389704	2	1	igreja-nova
67	Inhapi	2013-09-03 15:30:12.389704	2	1	inhapi
68	Jacaré dos Homens	2013-09-03 15:30:12.389704	2	1	jacare-dos-homens
69	Jacuípe	2013-09-03 15:30:12.389704	2	1	jacuipe
70	Japaratinga	2013-09-03 15:30:12.389704	2	1	japaratinga
71	Jaramataia	2013-09-03 15:30:12.389704	2	1	jaramataia
72	Jequiá da Praia	2013-09-03 15:30:12.389704	2	1	jequia-da-praia
73	Joaquim Gomes	2013-09-03 15:30:12.389704	2	1	joaquim-gomes
74	Jundiá	2013-09-03 15:30:12.389704	2	1	jundia
75	Junqueiro	2013-09-03 15:30:12.389704	2	1	junqueiro
76	Lagoa da Canoa	2013-09-03 15:30:12.389704	2	1	lagoa-da-canoa
77	Limoeiro de Anadia	2013-09-03 15:30:12.389704	2	1	limoeiro-de-anadia
78	Maceió	2013-09-03 15:30:12.389704	2	1	maceio
79	Major Isidoro	2013-09-03 15:30:12.389704	2	1	major-isidoro
80	Mar Vermelho	2013-09-03 15:30:12.389704	2	1	mar-vermelho
81	Maragogi	2013-09-03 15:30:12.389704	2	1	maragogi
82	Maravilha	2013-09-03 15:30:12.389704	2	1	maravilha
83	Marechal Deodoro	2013-09-03 15:30:12.389704	2	1	marechal-deodoro
84	Maribondo	2013-09-03 15:30:12.389704	2	1	maribondo
85	Mata Grande	2013-09-03 15:30:12.389704	2	1	mata-grande
86	Matriz de Camaragibe	2013-09-03 15:30:12.389704	2	1	matriz-de-camaragibe
87	Messias	2013-09-03 15:30:12.389704	2	1	messias
88	Minador do Negrão	2013-09-03 15:30:12.389704	2	1	minador-do-negrao
89	Monteirópolis	2013-09-03 15:30:12.389704	2	1	monteiropolis
90	Murici	2013-09-03 15:30:12.389704	2	1	murici
91	Novo Lino	2013-09-03 15:30:12.389704	2	1	novo-lino
92	Olho d`Água das Flores	2013-09-03 15:30:12.389704	2	1	olho-d-agua-das-flores
93	Olho d`Água do Casado	2013-09-03 15:30:12.389704	2	1	olho-d-agua-do-casado
94	Olho d`Água Grande	2013-09-03 15:30:12.389704	2	1	olho-d-agua-grande
95	Olivença	2013-09-03 15:30:12.389704	2	1	olivenca
96	Ouro Branco	2013-09-03 15:30:12.389704	2	1	ouro-branco
97	Palestina	2013-09-03 15:30:12.389704	2	1	palestina
98	Palmeira dos Índios	2013-09-03 15:30:12.389704	2	1	palmeira-dos-indios
99	Pão de Açúcar	2013-09-03 15:30:12.389704	2	1	pao-de-acucar
100	Pariconha	2013-09-03 15:30:12.389704	2	1	pariconha
101	Paripueira	2013-09-03 15:30:12.389704	2	1	paripueira
102	Passo de Camaragibe	2013-09-03 15:30:12.389704	2	1	passo-de-camaragibe
103	Paulo Jacinto	2013-09-03 15:30:12.389704	2	1	paulo-jacinto
104	Penedo	2013-09-03 15:30:12.389704	2	1	penedo
105	Piaçabuçu	2013-09-03 15:30:12.389704	2	1	piacabucu
106	Pilar	2013-09-03 15:30:12.389704	2	1	pilar
107	Pindoba	2013-09-03 15:30:12.389704	2	1	pindoba
108	Piranhas	2013-09-03 15:30:12.389704	2	1	piranhas
109	Poço das Trincheiras	2013-09-03 15:30:12.389704	2	1	poco-das-trincheiras
110	Porto Calvo	2013-09-03 15:30:12.389704	2	1	porto-calvo
111	Porto de Pedras	2013-09-03 15:30:12.389704	2	1	porto-de-pedras
112	Porto Real do Colégio	2013-09-03 15:30:12.389704	2	1	porto-real-do-colegio
113	Quebrangulo	2013-09-03 15:30:12.389704	2	1	quebrangulo
114	Rio Largo	2013-09-03 15:30:12.389704	2	1	rio-largo
115	Roteiro	2013-09-03 15:30:12.389704	2	1	roteiro
116	Santa Luzia do Norte	2013-09-03 15:30:12.389704	2	1	santa-luzia-do-norte
117	Santana do Ipanema	2013-09-03 15:30:12.389704	2	1	santana-do-ipanema
118	Santana do Mundaú	2013-09-03 15:30:12.389704	2	1	santana-do-mundau
119	São Brás	2013-09-03 15:30:12.389704	2	1	sao-bras
120	São José da Laje	2013-09-03 15:30:12.389704	2	1	sao-jose-da-laje
121	São José da Tapera	2013-09-03 15:30:12.389704	2	1	sao-jose-da-tapera
122	São Luís do Quitunde	2013-09-03 15:30:12.389704	2	1	sao-luis-do-quitunde
123	São Miguel dos Campos	2013-09-03 15:30:12.389704	2	1	sao-miguel-dos-campos
124	São Miguel dos Milagres	2013-09-03 15:30:12.389704	2	1	sao-miguel-dos-milagres
125	São Sebastião	2013-09-03 15:30:12.389704	2	1	sao-sebastiao
126	Satuba	2013-09-03 15:30:12.389704	2	1	satuba
127	Senador Rui Palmeira	2013-09-03 15:30:12.389704	2	1	senador-rui-palmeira
128	Tanque d`Arca	2013-09-03 15:30:12.389704	2	1	tanque-d-arca
129	Taquarana	2013-09-03 15:30:12.389704	2	1	taquarana
130	Teotônio Vilela	2013-09-03 15:30:12.389704	2	1	teotonio-vilela
131	Traipu	2013-09-03 15:30:12.389704	2	1	traipu
132	União dos Palmares	2013-09-03 15:30:12.389704	2	1	uniao-dos-palmares
133	Viçosa	2013-09-03 15:30:12.389704	2	1	vicosa
159	Alvarães	2013-09-03 15:30:12.389704	4	1	alvaraes
160	Amaturá	2013-09-03 15:30:12.389704	4	1	amatura
161	Anamã	2013-09-03 15:30:12.389704	4	1	anama
162	Anori	2013-09-03 15:30:12.389704	4	1	anori
163	Apuí	2013-09-03 15:30:12.389704	4	1	apui
164	Atalaia do Norte	2013-09-03 15:30:12.389704	4	1	atalaia-do-norte
165	Autazes	2013-09-03 15:30:12.389704	4	1	autazes
166	Barcelos	2013-09-03 15:30:12.389704	4	1	barcelos
167	Barreirinha	2013-09-03 15:30:12.389704	4	1	barreirinha
168	Benjamin Constant	2013-09-03 15:30:12.389704	4	1	benjamin-constant
169	Beruri	2013-09-03 15:30:12.389704	4	1	beruri
170	Boa Vista do Ramos	2013-09-03 15:30:12.389704	4	1	boa-vista-do-ramos
171	Boca do Acre	2013-09-03 15:30:12.389704	4	1	boca-do-acre
172	Borba	2013-09-03 15:30:12.389704	4	1	borba
173	Caapiranga	2013-09-03 15:30:12.389704	4	1	caapiranga
174	Canutama	2013-09-03 15:30:12.389704	4	1	canutama
175	Carauari	2013-09-03 15:30:12.389704	4	1	carauari
176	Careiro	2013-09-03 15:30:12.389704	4	1	careiro
177	Careiro da Várzea	2013-09-03 15:30:12.389704	4	1	careiro-da-varzea
178	Coari	2013-09-03 15:30:12.389704	4	1	coari
179	Codajás	2013-09-03 15:30:12.389704	4	1	codajas
180	Eirunepé	2013-09-03 15:30:12.389704	4	1	eirunepe
181	Envira	2013-09-03 15:30:12.389704	4	1	envira
182	Fonte Boa	2013-09-03 15:30:12.389704	4	1	fonte-boa
183	Guajará	2013-09-03 15:30:12.389704	4	1	guajara
184	Humaitá	2013-09-03 15:30:12.389704	4	1	humaita
185	Ipixuna	2013-09-03 15:30:12.389704	4	1	ipixuna
186	Iranduba	2013-09-03 15:30:12.389704	4	1	iranduba
187	Itacoatiara	2013-09-03 15:30:12.389704	4	1	itacoatiara
188	Itamarati	2013-09-03 15:30:12.389704	4	1	itamarati
189	Itapiranga	2013-09-03 15:30:12.389704	4	1	itapiranga
190	Japurá	2013-09-03 15:30:12.389704	4	1	japura
191	Juruá	2013-09-03 15:30:12.389704	4	1	jurua
192	Jutaí	2013-09-03 15:30:12.389704	4	1	jutai
193	Lábrea	2013-09-03 15:30:12.389704	4	1	labrea
194	Manacapuru	2013-09-03 15:30:12.389704	4	1	manacapuru
195	Manaquiri	2013-09-03 15:30:12.389704	4	1	manaquiri
196	Manaus	2013-09-03 15:30:12.389704	4	1	manaus
197	Manicoré	2013-09-03 15:30:12.389704	4	1	manicore
198	Maraã	2013-09-03 15:30:12.389704	4	1	maraa
199	Maués	2013-09-03 15:30:12.389704	4	1	maues
200	Nhamundá	2013-09-03 15:30:12.389704	4	1	nhamunda
201	Nova Olinda do Norte	2013-09-03 15:30:12.389704	4	1	nova-olinda-do-norte
202	Novo Airão	2013-09-03 15:30:12.389704	4	1	novo-airao
203	Novo Aripuanã	2013-09-03 15:30:12.389704	4	1	novo-aripuana
204	Parintins	2013-09-03 15:30:12.389704	4	1	parintins
205	Pauini	2013-09-03 15:30:12.389704	4	1	pauini
206	Presidente Figueiredo	2013-09-03 15:30:12.389704	4	1	presidente-figueiredo
207	Rio Preto da Eva	2013-09-03 15:30:12.389704	4	1	rio-preto-da-eva
208	Santa Isabel do Rio Negro	2013-09-03 15:30:12.389704	4	1	santa-isabel-do-rio-negro
209	Santo Antônio do Içá	2013-09-03 15:30:12.389704	4	1	santo-antonio-do-ica
210	São Gabriel da Cachoeira	2013-09-03 15:30:12.389704	4	1	sao-gabriel-da-cachoeira
211	São Paulo de Olivença	2013-09-03 15:30:12.389704	4	1	sao-paulo-de-olivenca
212	São Sebastião do Uatumã	2013-09-03 15:30:12.389704	4	1	sao-sebastiao-do-uatuma
213	Silves	2013-09-03 15:30:12.389704	4	1	silves
214	Tabatinga	2013-09-03 15:30:12.389704	4	1	tabatinga
215	Tapauá	2013-09-03 15:30:12.389704	4	1	tapaua
216	Tefé	2013-09-03 15:30:12.389704	4	1	tefe
217	Tonantins	2013-09-03 15:30:12.389704	4	1	tonantins
218	Uarini	2013-09-03 15:30:12.389704	4	1	uarini
219	Urucará	2013-09-03 15:30:12.389704	4	1	urucara
220	Urucurituba	2013-09-03 15:30:12.389704	4	1	urucurituba
222	Amapá	2013-09-03 15:30:12.389704	3	1	amapa
653	Una	2013-09-03 15:30:12.389704	5	1	una
223	Calçoene	2013-09-03 15:30:12.389704	3	1	calcoene
224	Cutias	2013-09-03 15:30:12.389704	3	1	cutias
225	Ferreira Gomes	2013-09-03 15:30:12.389704	3	1	ferreira-gomes
226	Itaubal	2013-09-03 15:30:12.389704	3	1	itaubal
227	Laranjal do Jari	2013-09-03 15:30:12.389704	3	1	laranjal-do-jari
228	Macapá	2013-09-03 15:30:12.389704	3	1	macapa
229	Mazagão	2013-09-03 15:30:12.389704	3	1	mazagao
230	Oiapoque	2013-09-03 15:30:12.389704	3	1	oiapoque
231	Pedra Branca do Amaparí	2013-09-03 15:30:12.389704	3	1	pedra-branca-do-amapari
232	Porto Grande	2013-09-03 15:30:12.389704	3	1	porto-grande
233	Pracuúba	2013-09-03 15:30:12.389704	3	1	pracuuba
234	Santana	2013-09-03 15:30:12.389704	3	1	santana
235	Serra do Navio	2013-09-03 15:30:12.389704	3	1	serra-do-navio
236	Tartarugalzinho	2013-09-03 15:30:12.389704	3	1	tartarugalzinho
237	Vitória do Jari	2013-09-03 15:30:12.389704	3	1	vitoria-do-jari
253	Abaíra	2013-09-03 15:30:12.389704	5	1	abaira
254	Abaré	2013-09-03 15:30:12.389704	5	1	abare
255	Acajutiba	2013-09-03 15:30:12.389704	5	1	acajutiba
256	Adustina	2013-09-03 15:30:12.389704	5	1	adustina
257	Água Fria	2013-09-03 15:30:12.389704	5	1	agua-fria
258	Aiquara	2013-09-03 15:30:12.389704	5	1	aiquara
259	Alagoinhas	2013-09-03 15:30:12.389704	5	1	alagoinhas
260	Alcobaça	2013-09-03 15:30:12.389704	5	1	alcobaca
261	Almadina	2013-09-03 15:30:12.389704	5	1	almadina
262	Amargosa	2013-09-03 15:30:12.389704	5	1	amargosa
263	Amélia Rodrigues	2013-09-03 15:30:12.389704	5	1	amelia-rodrigues
264	América Dourada	2013-09-03 15:30:12.389704	5	1	america-dourada
265	Anagé	2013-09-03 15:30:12.389704	5	1	anage
266	Andaraí	2013-09-03 15:30:12.389704	5	1	andarai
267	Andorinha	2013-09-03 15:30:12.389704	5	1	andorinha
268	Angical	2013-09-03 15:30:12.389704	5	1	angical
269	Anguera	2013-09-03 15:30:12.389704	5	1	anguera
270	Antas	2013-09-03 15:30:12.389704	5	1	antas
271	Antônio Cardoso	2013-09-03 15:30:12.389704	5	1	antonio-cardoso
272	Antônio Gonçalves	2013-09-03 15:30:12.389704	5	1	antonio-goncalves
273	Aporá	2013-09-03 15:30:12.389704	5	1	apora
274	Apuarema	2013-09-03 15:30:12.389704	5	1	apuarema
275	Araças	2013-09-03 15:30:12.389704	5	1	aracas
276	Aracatu	2013-09-03 15:30:12.389704	5	1	aracatu
277	Araci	2013-09-03 15:30:12.389704	5	1	araci
278	Aramari	2013-09-03 15:30:12.389704	5	1	aramari
279	Arataca	2013-09-03 15:30:12.389704	5	1	arataca
280	Aratuípe	2013-09-03 15:30:12.389704	5	1	aratuipe
281	Aurelino Leal	2013-09-03 15:30:12.389704	5	1	aurelino-leal
282	Baianópolis	2013-09-03 15:30:12.389704	5	1	baianopolis
283	Baixa Grande	2013-09-03 15:30:12.389704	5	1	baixa-grande
284	Banzaê	2013-09-03 15:30:12.389704	5	1	banzae
285	Barra	2013-09-03 15:30:12.389704	5	1	barra
286	Barra da Estiva	2013-09-03 15:30:12.389704	5	1	barra-da-estiva
287	Barra do Choça	2013-09-03 15:30:12.389704	5	1	barra-do-choca
288	Barra do Mendes	2013-09-03 15:30:12.389704	5	1	barra-do-mendes
289	Barra do Rocha	2013-09-03 15:30:12.389704	5	1	barra-do-rocha
290	Barreiras	2013-09-03 15:30:12.389704	5	1	barreiras
291	Barro Alto	2013-09-03 15:30:12.389704	5	1	barro-alto
292	Barro Preto (antigo Gov. Lomanto Jr.)	2013-09-03 15:30:12.389704	5	1	barro-preto-antigo-gov.-lomanto-jr.
293	Barrocas	2013-09-03 15:30:12.389704	5	1	barrocas
294	Belmonte	2013-09-03 15:30:12.389704	5	1	belmonte
295	Belo Campo	2013-09-03 15:30:12.389704	5	1	belo-campo
296	Biritinga	2013-09-03 15:30:12.389704	5	1	biritinga
297	Boa Nova	2013-09-03 15:30:12.389704	5	1	boa-nova
298	Boa Vista do Tupim	2013-09-03 15:30:12.389704	5	1	boa-vista-do-tupim
299	Bom Jesus da Lapa	2013-09-03 15:30:12.389704	5	1	bom-jesus-da-lapa
300	Bom Jesus da Serra	2013-09-03 15:30:12.389704	5	1	bom-jesus-da-serra
301	Boninal	2013-09-03 15:30:12.389704	5	1	boninal
302	Bonito	2013-09-03 15:30:12.389704	5	1	bonito
303	Boquira	2013-09-03 15:30:12.389704	5	1	boquira
304	Botuporã	2013-09-03 15:30:12.389704	5	1	botupora
305	Brejões	2013-09-03 15:30:12.389704	5	1	brejoes
306	Brejolândia	2013-09-03 15:30:12.389704	5	1	brejolandia
307	Brotas de Macaúbas	2013-09-03 15:30:12.389704	5	1	brotas-de-macaubas
308	Brumado	2013-09-03 15:30:12.389704	5	1	brumado
309	Buerarema	2013-09-03 15:30:12.389704	5	1	buerarema
310	Buritirama	2013-09-03 15:30:12.389704	5	1	buritirama
311	Caatiba	2013-09-03 15:30:12.389704	5	1	caatiba
312	Cabaceiras do Paraguaçu	2013-09-03 15:30:12.389704	5	1	cabaceiras-do-paraguacu
313	Cachoeira	2013-09-03 15:30:12.389704	5	1	cachoeira
314	Caculé	2013-09-03 15:30:12.389704	5	1	cacule
315	Caém	2013-09-03 15:30:12.389704	5	1	caem
316	Caetanos	2013-09-03 15:30:12.389704	5	1	caetanos
317	Caetité	2013-09-03 15:30:12.389704	5	1	caetite
318	Cafarnaum	2013-09-03 15:30:12.389704	5	1	cafarnaum
319	Cairu	2013-09-03 15:30:12.389704	5	1	cairu
320	Caldeirão Grande	2013-09-03 15:30:12.389704	5	1	caldeirao-grande
321	Camacan	2013-09-03 15:30:12.389704	5	1	camacan
322	Camaçari	2013-09-03 15:30:12.389704	5	1	camacari
323	Camamu	2013-09-03 15:30:12.389704	5	1	camamu
324	Campo Alegre de Lourdes	2013-09-03 15:30:12.389704	5	1	campo-alegre-de-lourdes
325	Campo Formoso	2013-09-03 15:30:12.389704	5	1	campo-formoso
326	Canápolis	2013-09-03 15:30:12.389704	5	1	canapolis
327	Canarana	2013-09-03 15:30:12.389704	5	1	canarana
328	Canavieiras	2013-09-03 15:30:12.389704	5	1	canavieiras
329	Candeal	2013-09-03 15:30:12.389704	5	1	candeal
330	Candeias	2013-09-03 15:30:12.389704	5	1	candeias
331	Candiba	2013-09-03 15:30:12.389704	5	1	candiba
332	Cândido Sales	2013-09-03 15:30:12.389704	5	1	candido-sales
333	Cansanção	2013-09-03 15:30:12.389704	5	1	cansancao
334	Canudos	2013-09-03 15:30:12.389704	5	1	canudos
335	Capela do Alto Alegre	2013-09-03 15:30:12.389704	5	1	capela-do-alto-alegre
336	Capim Grosso	2013-09-03 15:30:12.389704	5	1	capim-grosso
337	Caraíbas	2013-09-03 15:30:12.389704	5	1	caraibas
338	Caravelas	2013-09-03 15:30:12.389704	5	1	caravelas
339	Cardeal da Silva	2013-09-03 15:30:12.389704	5	1	cardeal-da-silva
340	Carinhanha	2013-09-03 15:30:12.389704	5	1	carinhanha
341	Casa Nova	2013-09-03 15:30:12.389704	5	1	casa-nova
342	Castro Alves	2013-09-03 15:30:12.389704	5	1	castro-alves
343	Catolândia	2013-09-03 15:30:12.389704	5	1	catolandia
344	Catu	2013-09-03 15:30:12.389704	5	1	catu
345	Caturama	2013-09-03 15:30:12.389704	5	1	caturama
346	Central	2013-09-03 15:30:12.389704	5	1	central
347	Chorrochó	2013-09-03 15:30:12.389704	5	1	chorrocho
348	Cícero Dantas	2013-09-03 15:30:12.389704	5	1	cicero-dantas
349	Cipó	2013-09-03 15:30:12.389704	5	1	cipo
350	Coaraci	2013-09-03 15:30:12.389704	5	1	coaraci
351	Cocos	2013-09-03 15:30:12.389704	5	1	cocos
352	Conceição da Feira	2013-09-03 15:30:12.389704	5	1	conceicao-da-feira
353	Conceição do Almeida	2013-09-03 15:30:12.389704	5	1	conceicao-do-almeida
354	Conceição do Coité	2013-09-03 15:30:12.389704	5	1	conceicao-do-coite
355	Conceição do Jacuípe	2013-09-03 15:30:12.389704	5	1	conceicao-do-jacuipe
356	Conde	2013-09-03 15:30:12.389704	5	1	conde
357	Condeúba	2013-09-03 15:30:12.389704	5	1	condeuba
358	Contendas do Sincorá	2013-09-03 15:30:12.389704	5	1	contendas-do-sincora
359	Coração de Maria	2013-09-03 15:30:12.389704	5	1	coracao-de-maria
360	Cordeiros	2013-09-03 15:30:12.389704	5	1	cordeiros
361	Coribe	2013-09-03 15:30:12.389704	5	1	coribe
362	Coronel João Sá	2013-09-03 15:30:12.389704	5	1	coronel-joao-sa
363	Correntina	2013-09-03 15:30:12.389704	5	1	correntina
364	Cotegipe	2013-09-03 15:30:12.389704	5	1	cotegipe
365	Cravolândia	2013-09-03 15:30:12.389704	5	1	cravolandia
366	Crisópolis	2013-09-03 15:30:12.389704	5	1	crisopolis
367	Cristópolis	2013-09-03 15:30:12.389704	5	1	cristopolis
368	Cruz das Almas	2013-09-03 15:30:12.389704	5	1	cruz-das-almas
369	Curaçá	2013-09-03 15:30:12.389704	5	1	curaca
370	Dário Meira	2013-09-03 15:30:12.389704	5	1	dario-meira
371	Dias d`Ávila	2013-09-03 15:30:12.389704	5	1	dias-d-avila
372	Dom Basílio	2013-09-03 15:30:12.389704	5	1	dom-basilio
373	Dom Macedo Costa	2013-09-03 15:30:12.389704	5	1	dom-macedo-costa
374	Elísio Medrado	2013-09-03 15:30:12.389704	5	1	elisio-medrado
375	Encruzilhada	2013-09-03 15:30:12.389704	5	1	encruzilhada
376	Entre Rios	2013-09-03 15:30:12.389704	5	1	entre-rios
377	Érico Cardoso	2013-09-03 15:30:12.389704	5	1	erico-cardoso
378	Esplanada	2013-09-03 15:30:12.389704	5	1	esplanada
379	Euclides da Cunha	2013-09-03 15:30:12.389704	5	1	euclides-da-cunha
380	Eunápolis	2013-09-03 15:30:12.389704	5	1	eunapolis
381	Fátima	2013-09-03 15:30:12.389704	5	1	fatima
382	Feira da Mata	2013-09-03 15:30:12.389704	5	1	feira-da-mata
383	Feira de Santana	2013-09-03 15:30:12.389704	5	1	feira-de-santana
384	Filadélfia	2013-09-03 15:30:12.389704	5	1	filadelfia
385	Firmino Alves	2013-09-03 15:30:12.389704	5	1	firmino-alves
386	Floresta Azul	2013-09-03 15:30:12.389704	5	1	floresta-azul
387	Formosa do Rio Preto	2013-09-03 15:30:12.389704	5	1	formosa-do-rio-preto
388	Gandu	2013-09-03 15:30:12.389704	5	1	gandu
389	Gavião	2013-09-03 15:30:12.389704	5	1	gaviao
390	Gentio do Ouro	2013-09-03 15:30:12.389704	5	1	gentio-do-ouro
391	Glória	2013-09-03 15:30:12.389704	5	1	gloria
392	Gongogi	2013-09-03 15:30:12.389704	5	1	gongogi
393	Governador Mangabeira	2013-09-03 15:30:12.389704	5	1	governador-mangabeira
394	Guajeru	2013-09-03 15:30:12.389704	5	1	guajeru
395	Guanambi	2013-09-03 15:30:12.389704	5	1	guanambi
396	Guaratinga	2013-09-03 15:30:12.389704	5	1	guaratinga
397	Heliópolis	2013-09-03 15:30:12.389704	5	1	heliopolis
398	Iaçu	2013-09-03 15:30:12.389704	5	1	iacu
399	Ibiassucê	2013-09-03 15:30:12.389704	5	1	ibiassuce
400	Ibicaraí	2013-09-03 15:30:12.389704	5	1	ibicarai
401	Ibicoara	2013-09-03 15:30:12.389704	5	1	ibicoara
402	Ibicuí	2013-09-03 15:30:12.389704	5	1	ibicui
403	Ibipeba	2013-09-03 15:30:12.389704	5	1	ibipeba
404	Ibipitanga	2013-09-03 15:30:12.389704	5	1	ibipitanga
405	Ibiquera	2013-09-03 15:30:12.389704	5	1	ibiquera
406	Ibirapitanga	2013-09-03 15:30:12.389704	5	1	ibirapitanga
407	Ibirapuã	2013-09-03 15:30:12.389704	5	1	ibirapua
408	Ibirataia	2013-09-03 15:30:12.389704	5	1	ibirataia
409	Ibitiara	2013-09-03 15:30:12.389704	5	1	ibitiara
410	Ibititá	2013-09-03 15:30:12.389704	5	1	ibitita
411	Ibotirama	2013-09-03 15:30:12.389704	5	1	ibotirama
412	Ichu	2013-09-03 15:30:12.389704	5	1	ichu
413	Igaporã	2013-09-03 15:30:12.389704	5	1	igapora
414	Igrapiúna	2013-09-03 15:30:12.389704	5	1	igrapiuna
415	Iguaí	2013-09-03 15:30:12.389704	5	1	iguai
416	Ilhéus	2013-09-03 15:30:12.389704	5	1	ilheus
417	Inhambupe	2013-09-03 15:30:12.389704	5	1	inhambupe
418	Ipecaetá	2013-09-03 15:30:12.389704	5	1	ipecaeta
419	Ipiaú	2013-09-03 15:30:12.389704	5	1	ipiau
420	Ipirá	2013-09-03 15:30:12.389704	5	1	ipira
421	Ipupiara	2013-09-03 15:30:12.389704	5	1	ipupiara
422	Irajuba	2013-09-03 15:30:12.389704	5	1	irajuba
423	Iramaia	2013-09-03 15:30:12.389704	5	1	iramaia
424	Iraquara	2013-09-03 15:30:12.389704	5	1	iraquara
425	Irará	2013-09-03 15:30:12.389704	5	1	irara
426	Irecê	2013-09-03 15:30:12.389704	5	1	irece
427	Itabela	2013-09-03 15:30:12.389704	5	1	itabela
428	Itaberaba	2013-09-03 15:30:12.389704	5	1	itaberaba
429	Itabuna	2013-09-03 15:30:12.389704	5	1	itabuna
430	Itacaré	2013-09-03 15:30:12.389704	5	1	itacare
431	Itaeté	2013-09-03 15:30:12.389704	5	1	itaete
432	Itagi	2013-09-03 15:30:12.389704	5	1	itagi
433	Itagibá	2013-09-03 15:30:12.389704	5	1	itagiba
434	Itagimirim	2013-09-03 15:30:12.389704	5	1	itagimirim
435	Itaguaçu da Bahia	2013-09-03 15:30:12.389704	5	1	itaguacu-da-bahia
436	Itaju do Colônia	2013-09-03 15:30:12.389704	5	1	itaju-do-colonia
437	Itajuípe	2013-09-03 15:30:12.389704	5	1	itajuipe
438	Itamaraju	2013-09-03 15:30:12.389704	5	1	itamaraju
439	Itamari	2013-09-03 15:30:12.389704	5	1	itamari
440	Itambé	2013-09-03 15:30:12.389704	5	1	itambe
441	Itanagra	2013-09-03 15:30:12.389704	5	1	itanagra
442	Itanhém	2013-09-03 15:30:12.389704	5	1	itanhem
443	Itaparica	2013-09-03 15:30:12.389704	5	1	itaparica
444	Itapé	2013-09-03 15:30:12.389704	5	1	itape
445	Itapebi	2013-09-03 15:30:12.389704	5	1	itapebi
446	Itapetinga	2013-09-03 15:30:12.389704	5	1	itapetinga
447	Itapicuru	2013-09-03 15:30:12.389704	5	1	itapicuru
448	Itapitanga	2013-09-03 15:30:12.389704	5	1	itapitanga
449	Itaquara	2013-09-03 15:30:12.389704	5	1	itaquara
450	Itarantim	2013-09-03 15:30:12.389704	5	1	itarantim
451	Itatim	2013-09-03 15:30:12.389704	5	1	itatim
452	Itiruçu	2013-09-03 15:30:12.389704	5	1	itirucu
453	Itiúba	2013-09-03 15:30:12.389704	5	1	itiuba
454	Itororó	2013-09-03 15:30:12.389704	5	1	itororo
455	Ituaçu	2013-09-03 15:30:12.389704	5	1	ituacu
456	Ituberá	2013-09-03 15:30:12.389704	5	1	itubera
457	Iuiú	2013-09-03 15:30:12.389704	5	1	iuiu
458	Jaborandi	2013-09-03 15:30:12.389704	5	1	jaborandi
459	Jacaraci	2013-09-03 15:30:12.389704	5	1	jacaraci
460	Jacobina	2013-09-03 15:30:12.389704	5	1	jacobina
461	Jaguaquara	2013-09-03 15:30:12.389704	5	1	jaguaquara
462	Jaguarari	2013-09-03 15:30:12.389704	5	1	jaguarari
463	Jaguaripe	2013-09-03 15:30:12.389704	5	1	jaguaripe
464	Jandaíra	2013-09-03 15:30:12.389704	5	1	jandaira
465	Jequié	2013-09-03 15:30:12.389704	5	1	jequie
466	Jeremoabo	2013-09-03 15:30:12.389704	5	1	jeremoabo
467	Jiquiriçá	2013-09-03 15:30:12.389704	5	1	jiquirica
468	Jitaúna	2013-09-03 15:30:12.389704	5	1	jitauna
469	João Dourado	2013-09-03 15:30:12.389704	5	1	joao-dourado
470	Juazeiro	2013-09-03 15:30:12.389704	5	1	juazeiro
471	Jucuruçu	2013-09-03 15:30:12.389704	5	1	jucurucu
472	Jussara	2013-09-03 15:30:12.389704	5	1	jussara
473	Jussari	2013-09-03 15:30:12.389704	5	1	jussari
474	Jussiape	2013-09-03 15:30:12.389704	5	1	jussiape
475	Lafaiete Coutinho	2013-09-03 15:30:12.389704	5	1	lafaiete-coutinho
476	Lagoa Real	2013-09-03 15:30:12.389704	5	1	lagoa-real
477	Laje	2013-09-03 15:30:12.389704	5	1	laje
478	Lajedão	2013-09-03 15:30:12.389704	5	1	lajedao
479	Lajedinho	2013-09-03 15:30:12.389704	5	1	lajedinho
480	Lajedo do Tabocal	2013-09-03 15:30:12.389704	5	1	lajedo-do-tabocal
481	Lamarão	2013-09-03 15:30:12.389704	5	1	lamarao
482	Lapão	2013-09-03 15:30:12.389704	5	1	lapao
483	Lauro de Freitas	2013-09-03 15:30:12.389704	5	1	lauro-de-freitas
484	Lençóis	2013-09-03 15:30:12.389704	5	1	lencois
485	Licínio de Almeida	2013-09-03 15:30:12.389704	5	1	licinio-de-almeida
486	\nLivramento de Nossa Senhora	2013-09-03 15:30:12.389704	5	1	livramento-de-nossa-senhora
487	Luís Eduardo Magalhães	2013-09-03 15:30:12.389704	5	1	luis-eduardo-magalhaes
488	Macajuba	2013-09-03 15:30:12.389704	5	1	macajuba
489	Macarani	2013-09-03 15:30:12.389704	5	1	macarani
490	Macaúbas	2013-09-03 15:30:12.389704	5	1	macaubas
491	Macururé	2013-09-03 15:30:12.389704	5	1	macurure
492	Madre de Deus	2013-09-03 15:30:12.389704	5	1	madre-de-deus
493	Maetinga	2013-09-03 15:30:12.389704	5	1	maetinga
494	Maiquinique	2013-09-03 15:30:12.389704	5	1	maiquinique
495	Mairi	2013-09-03 15:30:12.389704	5	1	mairi
496	Malhada	2013-09-03 15:30:12.389704	5	1	malhada
497	Malhada de Pedras	2013-09-03 15:30:12.389704	5	1	malhada-de-pedras
498	Manoel Vitorino	2013-09-03 15:30:12.389704	5	1	manoel-vitorino
499	Mansidão	2013-09-03 15:30:12.389704	5	1	mansidao
500	Maracás	2013-09-03 15:30:12.389704	5	1	maracas
501	Maragogipe	2013-09-03 15:30:12.389704	5	1	maragogipe
502	Maraú	2013-09-03 15:30:12.389704	5	1	marau
503	Marcionílio Souza	2013-09-03 15:30:12.389704	5	1	marcionilio-souza
504	Mascote	2013-09-03 15:30:12.389704	5	1	mascote
505	Mata de São João	2013-09-03 15:30:12.389704	5	1	mata-de-sao-joao
506	Matina	2013-09-03 15:30:12.389704	5	1	matina
507	Medeiros Neto	2013-09-03 15:30:12.389704	5	1	medeiros-neto
508	Miguel Calmon	2013-09-03 15:30:12.389704	5	1	miguel-calmon
509	Milagres	2013-09-03 15:30:12.389704	5	1	milagres
510	Mirangaba	2013-09-03 15:30:12.389704	5	1	mirangaba
511	Mirante	2013-09-03 15:30:12.389704	5	1	mirante
512	Monte Santo	2013-09-03 15:30:12.389704	5	1	monte-santo
513	Morpará	2013-09-03 15:30:12.389704	5	1	morpara
514	Morro do Chapéu	2013-09-03 15:30:12.389704	5	1	morro-do-chapeu
515	Mortugaba	2013-09-03 15:30:12.389704	5	1	mortugaba
516	Mucugê	2013-09-03 15:30:12.389704	5	1	mucuge
517	Mucuri	2013-09-03 15:30:12.389704	5	1	mucuri
518	Mulungu do Morro	2013-09-03 15:30:12.389704	5	1	mulungu-do-morro
519	Mundo Novo	2013-09-03 15:30:12.389704	5	1	mundo-novo
520	Muniz Ferreira	2013-09-03 15:30:12.389704	5	1	muniz-ferreira
521	Muquém de São Francisco	2013-09-03 15:30:12.389704	5	1	muquem-de-sao-francisco
522	Muritiba	2013-09-03 15:30:12.389704	5	1	muritiba
523	Mutuípe	2013-09-03 15:30:12.389704	5	1	mutuipe
524	Nazaré	2013-09-03 15:30:12.389704	5	1	nazare
525	Nilo Peçanha	2013-09-03 15:30:12.389704	5	1	nilo-pecanha
526	Nordestina	2013-09-03 15:30:12.389704	5	1	nordestina
527	Nova Canaã	2013-09-03 15:30:12.389704	5	1	nova-canaa
528	Nova Fátima	2013-09-03 15:30:12.389704	5	1	nova-fatima
529	Nova Ibiá	2013-09-03 15:30:12.389704	5	1	nova-ibia
530	Nova Itarana	2013-09-03 15:30:12.389704	5	1	nova-itarana
531	Nova Redenção	2013-09-03 15:30:12.389704	5	1	nova-redencao
532	Nova Soure	2013-09-03 15:30:12.389704	5	1	nova-soure
533	Nova Viçosa	2013-09-03 15:30:12.389704	5	1	nova-vicosa
534	Novo Horizonte	2013-09-03 15:30:12.389704	5	1	novo-horizonte
535	Novo Triunfo	2013-09-03 15:30:12.389704	5	1	novo-triunfo
536	Olindina	2013-09-03 15:30:12.389704	5	1	olindina
537	Oliveira dos Brejinhos	2013-09-03 15:30:12.389704	5	1	oliveira-dos-brejinhos
538	Ouriçangas	2013-09-03 15:30:12.389704	5	1	ouricangas
539	Ourolândia	2013-09-03 15:30:12.389704	5	1	ourolandia
540	Palmas de Monte Alto	2013-09-03 15:30:12.389704	5	1	palmas-de-monte-alto
541	Palmeiras	2013-09-03 15:30:12.389704	5	1	palmeiras
542	Paramirim	2013-09-03 15:30:12.389704	5	1	paramirim
543	Paratinga	2013-09-03 15:30:12.389704	5	1	paratinga
544	Paripiranga	2013-09-03 15:30:12.389704	5	1	paripiranga
545	Pau Brasil	2013-09-03 15:30:12.389704	5	1	pau-brasil
546	Paulo Afonso	2013-09-03 15:30:12.389704	5	1	paulo-afonso
547	Pé de Serra	2013-09-03 15:30:12.389704	5	1	pe-de-serra
548	Pedrão	2013-09-03 15:30:12.389704	5	1	pedrao
549	Pedro Alexandre	2013-09-03 15:30:12.389704	5	1	pedro-alexandre
550	Piatã	2013-09-03 15:30:12.389704	5	1	piata
551	Pilão Arcado	2013-09-03 15:30:12.389704	5	1	pilao-arcado
552	Pindaí	2013-09-03 15:30:12.389704	5	1	pindai
553	Pindobaçu	2013-09-03 15:30:12.389704	5	1	pindobacu
554	Pintadas	2013-09-03 15:30:12.389704	5	1	pintadas
555	Piraí do Norte	2013-09-03 15:30:12.389704	5	1	pirai-do-norte
556	Piripá	2013-09-03 15:30:12.389704	5	1	piripa
557	Piritiba	2013-09-03 15:30:12.389704	5	1	piritiba
558	Planaltino	2013-09-03 15:30:12.389704	5	1	planaltino
559	Planalto	2013-09-03 15:30:12.389704	5	1	planalto
560	Poções	2013-09-03 15:30:12.389704	5	1	pocoes
561	Pojuca	2013-09-03 15:30:12.389704	5	1	pojuca
562	Ponto Novo	2013-09-03 15:30:12.389704	5	1	ponto-novo
563	Porto Seguro	2013-09-03 15:30:12.389704	5	1	porto-seguro
564	Potiraguá	2013-09-03 15:30:12.389704	5	1	potiragua
565	Prado	2013-09-03 15:30:12.389704	5	1	prado
566	Presidente Dutra	2013-09-03 15:30:12.389704	5	1	presidente-dutra
567	Presidente Jânio Quadros	2013-09-03 15:30:12.389704	5	1	presidente-janio-quadros
568	Presidente Tancredo Neves	2013-09-03 15:30:12.389704	5	1	presidente-tancredo-neves
569	Queimadas	2013-09-03 15:30:12.389704	5	1	queimadas
570	Quijingue	2013-09-03 15:30:12.389704	5	1	quijingue
571	Quixabeira	2013-09-03 15:30:12.389704	5	1	quixabeira
572	Rafael Jambeiro	2013-09-03 15:30:12.389704	5	1	rafael-jambeiro
573	Remanso	2013-09-03 15:30:12.389704	5	1	remanso
574	Retirolândia	2013-09-03 15:30:12.389704	5	1	retirolandia
575	Riachão das Neves	2013-09-03 15:30:12.389704	5	1	riachao-das-neves
576	Riachão do Jacuípe	2013-09-03 15:30:12.389704	5	1	riachao-do-jacuipe
577	Riacho de Santana	2013-09-03 15:30:12.389704	5	1	riacho-de-santana
578	Ribeira do Amparo	2013-09-03 15:30:12.389704	5	1	ribeira-do-amparo
579	Ribeira do Pombal	2013-09-03 15:30:12.389704	5	1	ribeira-do-pombal
580	Ribeirão do Largo	2013-09-03 15:30:12.389704	5	1	ribeirao-do-largo
581	Rio de Contas	2013-09-03 15:30:12.389704	5	1	rio-de-contas
582	Rio do Antônio	2013-09-03 15:30:12.389704	5	1	rio-do-antonio
583	Rio do Pires	2013-09-03 15:30:12.389704	5	1	rio-do-pires
584	Rio Real	2013-09-03 15:30:12.389704	5	1	rio-real
585	Rodelas	2013-09-03 15:30:12.389704	5	1	rodelas
586	Ruy Barbosa	2013-09-03 15:30:12.389704	5	1	ruy-barbosa
587	Salinas da Margarida	2013-09-03 15:30:12.389704	5	1	salinas-da-margarida
588	Salvador	2013-09-03 15:30:12.389704	5	1	salvador
589	Santa Bárbara	2013-09-03 15:30:12.389704	5	1	santa-barbara
590	Santa Brígida	2013-09-03 15:30:12.389704	5	1	santa-brigida
591	Santa Cruz Cabrália	2013-09-03 15:30:12.389704	5	1	santa-cruz-cabralia
592	Santa Cruz da Vitória	2013-09-03 15:30:12.389704	5	1	santa-cruz-da-vitoria
593	Santa Inês	2013-09-03 15:30:12.389704	5	1	santa-ines
594	Santa Luzia	2013-09-03 15:30:12.389704	5	1	santa-luzia
595	Santa Maria da Vitória	2013-09-03 15:30:12.389704	5	1	santa-maria-da-vitoria
596	Santa Rita de Cássia	2013-09-03 15:30:12.389704	5	1	santa-rita-de-cassia
597	Santa Teresinha	2013-09-03 15:30:12.389704	5	1	santa-teresinha
598	Santaluz	2013-09-03 15:30:12.389704	5	1	santaluz
599	Santana	2013-09-03 15:30:12.389704	5	1	santana
600	Santanópolis	2013-09-03 15:30:12.389704	5	1	santanopolis
601	Santo Amaro	2013-09-03 15:30:12.389704	5	1	santo-amaro
602	Santo Antônio de Jesus	2013-09-03 15:30:12.389704	5	1	santo-antonio-de-jesus
603	Santo Estêvão	2013-09-03 15:30:12.389704	5	1	santo-estevao
604	São Desidério	2013-09-03 15:30:12.389704	5	1	sao-desiderio
605	São Domingos	2013-09-03 15:30:12.389704	5	1	sao-domingos
606	São Felipe	2013-09-03 15:30:12.389704	5	1	sao-felipe
607	São Félix	2013-09-03 15:30:12.389704	5	1	sao-felix
608	São Félix do Coribe	2013-09-03 15:30:12.389704	5	1	sao-felix-do-coribe
609	São Francisco do Conde	2013-09-03 15:30:12.389704	5	1	sao-francisco-do-conde
610	São Gabriel	2013-09-03 15:30:12.389704	5	1	sao-gabriel
611	São Gonçalo dos Campos	2013-09-03 15:30:12.389704	5	1	sao-goncalo-dos-campos
612	São José da Vitória	2013-09-03 15:30:12.389704	5	1	sao-jose-da-vitoria
613	São José do Jacuípe	2013-09-03 15:30:12.389704	5	1	sao-jose-do-jacuipe
614	São Miguel das Matas	2013-09-03 15:30:12.389704	5	1	sao-miguel-das-matas
615	São Sebastião do Passé	2013-09-03 15:30:12.389704	5	1	sao-sebastiao-do-passe
616	Sapeaçu	2013-09-03 15:30:12.389704	5	1	sapeacu
617	Sátiro Dias	2013-09-03 15:30:12.389704	5	1	satiro-dias
618	Saubara	2013-09-03 15:30:12.389704	5	1	saubara
619	Saúde	2013-09-03 15:30:12.389704	5	1	saude
620	Seabra	2013-09-03 15:30:12.389704	5	1	seabra
621	Sebastião Laranjeiras	2013-09-03 15:30:12.389704	5	1	sebastiao-laranjeiras
622	Senhor do Bonfim	2013-09-03 15:30:12.389704	5	1	senhor-do-bonfim
623	Sento Sé	2013-09-03 15:30:12.389704	5	1	sento-se
624	Serra do Ramalho	2013-09-03 15:30:12.389704	5	1	serra-do-ramalho
625	Serra Dourada	2013-09-03 15:30:12.389704	5	1	serra-dourada
626	Serra Preta	2013-09-03 15:30:12.389704	5	1	serra-preta
627	Serrinha	2013-09-03 15:30:12.389704	5	1	serrinha
628	Serrolândia	2013-09-03 15:30:12.389704	5	1	serrolandia
629	Simões Filho	2013-09-03 15:30:12.389704	5	1	simoes-filho
630	Sítio do Mato	2013-09-03 15:30:12.389704	5	1	sitio-do-mato
631	Sítio do Quinto	2013-09-03 15:30:12.389704	5	1	sitio-do-quinto
632	Sobradinho	2013-09-03 15:30:12.389704	5	1	sobradinho
633	Souto Soares	2013-09-03 15:30:12.389704	5	1	souto-soares
634	Tabocas do Brejo Velho	2013-09-03 15:30:12.389704	5	1	tabocas-do-brejo-velho
635	Tanhaçu	2013-09-03 15:30:12.389704	5	1	tanhacu
636	Tanque Novo	2013-09-03 15:30:12.389704	5	1	tanque-novo
637	Tanquinho	2013-09-03 15:30:12.389704	5	1	tanquinho
638	Taperoá	2013-09-03 15:30:12.389704	5	1	taperoa
639	Tapiramutá	2013-09-03 15:30:12.389704	5	1	tapiramuta
640	Teixeira de Freitas	2013-09-03 15:30:12.389704	5	1	teixeira-de-freitas
641	Teodoro Sampaio	2013-09-03 15:30:12.389704	5	1	teodoro-sampaio
642	Teofilândia	2013-09-03 15:30:12.389704	5	1	teofilandia
643	Teolândia	2013-09-03 15:30:12.389704	5	1	teolandia
644	Terra Nova	2013-09-03 15:30:12.389704	5	1	terra-nova
645	Tremedal	2013-09-03 15:30:12.389704	5	1	tremedal
646	Tucano	2013-09-03 15:30:12.389704	5	1	tucano
647	Uauá	2013-09-03 15:30:12.389704	5	1	uaua
648	Ubaíra	2013-09-03 15:30:12.389704	5	1	ubaira
649	Ubaitaba	2013-09-03 15:30:12.389704	5	1	ubaitaba
650	Ubatã	2013-09-03 15:30:12.389704	5	1	ubata
651	Uibaí	2013-09-03 15:30:12.389704	5	1	uibai
652	Umburanas	2013-09-03 15:30:12.389704	5	1	umburanas
654	Urandi	2013-09-03 15:30:12.389704	5	1	urandi
655	Uruçuca	2013-09-03 15:30:12.389704	5	1	urucuca
656	Utinga	2013-09-03 15:30:12.389704	5	1	utinga
657	Valença	2013-09-03 15:30:12.389704	5	1	valenca
658	Valente	2013-09-03 15:30:12.389704	5	1	valente
659	Várzea da Roça	2013-09-03 15:30:12.389704	5	1	varzea-da-roca
660	Várzea do Poço	2013-09-03 15:30:12.389704	5	1	varzea-do-poco
661	Várzea Nova	2013-09-03 15:30:12.389704	5	1	varzea-nova
662	Varzedo	2013-09-03 15:30:12.389704	5	1	varzedo
663	Vera Cruz	2013-09-03 15:30:12.389704	5	1	vera-cruz
664	Vereda	2013-09-03 15:30:12.389704	5	1	vereda
665	Vitória da Conquista	2013-09-03 15:30:12.389704	5	1	vitoria-da-conquista
666	Wagner	2013-09-03 15:30:12.389704	5	1	wagner
667	Wanderley	2013-09-03 15:30:12.389704	5	1	wanderley
668	Wenceslau Guimarães	2013-09-03 15:30:12.389704	5	1	wenceslau-guimaraes
669	Xique-Xique	2013-09-03 15:30:12.389704	5	1	xique-xique
764	Abaiara	2013-09-03 15:30:12.389704	6	1	abaiara
765	Acarape	2013-09-03 15:30:12.389704	6	1	acarape
766	Acaraú	2013-09-03 15:30:12.389704	6	1	acarau
767	Acopiara	2013-09-03 15:30:12.389704	6	1	acopiara
768	Aiuaba	2013-09-03 15:30:12.389704	6	1	aiuaba
769	Alcântaras	2013-09-03 15:30:12.389704	6	1	alcantaras
770	Altaneira	2013-09-03 15:30:12.389704	6	1	altaneira
771	Alto Santo	2013-09-03 15:30:12.389704	6	1	alto-santo
772	Amontada	2013-09-03 15:30:12.389704	6	1	amontada
773	Antonina do Norte	2013-09-03 15:30:12.389704	6	1	antonina-do-norte
774	Apuiarés	2013-09-03 15:30:12.389704	6	1	apuiares
775	Aquiraz	2013-09-03 15:30:12.389704	6	1	aquiraz
776	Aracati	2013-09-03 15:30:12.389704	6	1	aracati
777	Aracoiaba	2013-09-03 15:30:12.389704	6	1	aracoiaba
778	Ararendá	2013-09-03 15:30:12.389704	6	1	ararenda
779	Araripe	2013-09-03 15:30:12.389704	6	1	araripe
780	Aratuba	2013-09-03 15:30:12.389704	6	1	aratuba
781	Arneiroz	2013-09-03 15:30:12.389704	6	1	arneiroz
782	Assaré	2013-09-03 15:30:12.389704	6	1	assare
783	Aurora	2013-09-03 15:30:12.389704	6	1	aurora
784	Baixio	2013-09-03 15:30:12.389704	6	1	baixio
785	Banabuiú	2013-09-03 15:30:12.389704	6	1	banabuiu
786	Barbalha	2013-09-03 15:30:12.389704	6	1	barbalha
787	Barreira	2013-09-03 15:30:12.389704	6	1	barreira
788	Barro	2013-09-03 15:30:12.389704	6	1	barro
789	Barroquinha	2013-09-03 15:30:12.389704	6	1	barroquinha
790	Baturité	2013-09-03 15:30:12.389704	6	1	baturite
791	Beberibe	2013-09-03 15:30:12.389704	6	1	beberibe
792	Bela Cruz	2013-09-03 15:30:12.389704	6	1	bela-cruz
793	Boa Viagem	2013-09-03 15:30:12.389704	6	1	boa-viagem
794	Brejo Santo	2013-09-03 15:30:12.389704	6	1	brejo-santo
795	Camocim	2013-09-03 15:30:12.389704	6	1	camocim
796	Campos Sales	2013-09-03 15:30:12.389704	6	1	campos-sales
797	Canindé	2013-09-03 15:30:12.389704	6	1	caninde
798	Capistrano	2013-09-03 15:30:12.389704	6	1	capistrano
799	Caridade	2013-09-03 15:30:12.389704	6	1	caridade
800	Cariré	2013-09-03 15:30:12.389704	6	1	carire
801	Caririaçu	2013-09-03 15:30:12.389704	6	1	caririacu
802	Cariús	2013-09-03 15:30:12.389704	6	1	carius
803	Carnaubal	2013-09-03 15:30:12.389704	6	1	carnaubal
804	Cascavel	2013-09-03 15:30:12.389704	6	1	cascavel
805	Catarina	2013-09-03 15:30:12.389704	6	1	catarina
806	Catunda	2013-09-03 15:30:12.389704	6	1	catunda
807	Caucaia	2013-09-03 15:30:12.389704	6	1	caucaia
808	Cedro	2013-09-03 15:30:12.389704	6	1	cedro
809	Chaval	2013-09-03 15:30:12.389704	6	1	chaval
810	Choró	2013-09-03 15:30:12.389704	6	1	choro
811	Chorozinho	2013-09-03 15:30:12.389704	6	1	chorozinho
812	Coreaú	2013-09-03 15:30:12.389704	6	1	coreau
813	Crateús	2013-09-03 15:30:12.389704	6	1	crateus
814	Crato	2013-09-03 15:30:12.389704	6	1	crato
815	Croatá	2013-09-03 15:30:12.389704	6	1	croata
816	Cruz	2013-09-03 15:30:12.389704	6	1	cruz
817	Deputado Irapuan Pinheiro	2013-09-03 15:30:12.389704	6	1	deputado-irapuan-pinheiro
818	Ererê	2013-09-03 15:30:12.389704	6	1	erere
819	Eusébio	2013-09-03 15:30:12.389704	6	1	eusebio
820	Farias Brito	2013-09-03 15:30:12.389704	6	1	farias-brito
821	Forquilha	2013-09-03 15:30:12.389704	6	1	forquilha
822	Fortaleza	2013-09-03 15:30:12.389704	6	1	fortaleza
823	Fortim	2013-09-03 15:30:12.389704	6	1	fortim
824	Frecheirinha	2013-09-03 15:30:12.389704	6	1	frecheirinha
825	General Sampaio	2013-09-03 15:30:12.389704	6	1	general-sampaio
826	Graça	2013-09-03 15:30:12.389704	6	1	graca
827	Granja	2013-09-03 15:30:12.389704	6	1	granja
828	Granjeiro	2013-09-03 15:30:12.389704	6	1	granjeiro
829	Groaíras	2013-09-03 15:30:12.389704	6	1	groairas
830	Guaiúba	2013-09-03 15:30:12.389704	6	1	guaiuba
831	Guaraciaba do Norte	2013-09-03 15:30:12.389704	6	1	guaraciaba-do-norte
832	Guaramiranga	2013-09-03 15:30:12.389704	6	1	guaramiranga
833	Hidrolândia	2013-09-03 15:30:12.389704	6	1	hidrolandia
834	Horizonte	2013-09-03 15:30:12.389704	6	1	horizonte
835	Ibaretama	2013-09-03 15:30:12.389704	6	1	ibaretama
836	Ibiapina	2013-09-03 15:30:12.389704	6	1	ibiapina
837	Ibicuitinga	2013-09-03 15:30:12.389704	6	1	ibicuitinga
838	Icapuí	2013-09-03 15:30:12.389704	6	1	icapui
839	Icó	2013-09-03 15:30:12.389704	6	1	ico
840	Iguatu	2013-09-03 15:30:12.389704	6	1	iguatu
841	Independência	2013-09-03 15:30:12.389704	6	1	independencia
842	Ipaporanga	2013-09-03 15:30:12.389704	6	1	ipaporanga
843	Ipaumirim	2013-09-03 15:30:12.389704	6	1	ipaumirim
845	Ipueiras	2013-09-03 15:30:12.389704	6	1	ipueiras
846	Iracema	2013-09-03 15:30:12.389704	6	1	iracema
847	Irauçuba	2013-09-03 15:30:12.389704	6	1	iraucuba
848	Itaiçaba	2013-09-03 15:30:12.389704	6	1	itaicaba
849	Itaitinga	2013-09-03 15:30:12.389704	6	1	itaitinga
850	Itapagé	2013-09-03 15:30:12.389704	6	1	itapage
851	Itapipoca	2013-09-03 15:30:12.389704	6	1	itapipoca
852	Itapiúna	2013-09-03 15:30:12.389704	6	1	itapiuna
853	Itarema	2013-09-03 15:30:12.389704	6	1	itarema
854	Itatira	2013-09-03 15:30:12.389704	6	1	itatira
855	Jaguaretama	2013-09-03 15:30:12.389704	6	1	jaguaretama
856	Jaguaribara	2013-09-03 15:30:12.389704	6	1	jaguaribara
857	Jaguaribe	2013-09-03 15:30:12.389704	6	1	jaguaribe
1511	Uruaçu	2013-09-03 15:30:12.389704	9	1	uruacu
858	Jaguaruana	2013-09-03 15:30:12.389704	6	1	jaguaruana
859	Jardim	2013-09-03 15:30:12.389704	6	1	jardim
860	Jati	2013-09-03 15:30:12.389704	6	1	jati
861	Jijoca de Jericoacoara	2013-09-03 15:30:12.389704	6	1	jijoca-de-jericoacoara
862	Juazeiro do Norte	2013-09-03 15:30:12.389704	6	1	juazeiro-do-norte
863	Jucás	2013-09-03 15:30:12.389704	6	1	jucas
864	Lavras da Mangabeira	2013-09-03 15:30:12.389704	6	1	lavras-da-mangabeira
865	Limoeiro do Norte	2013-09-03 15:30:12.389704	6	1	limoeiro-do-norte
866	Madalena	2013-09-03 15:30:12.389704	6	1	madalena
867	Maracanaú	2013-09-03 15:30:12.389704	6	1	maracanau
868	Maranguape	2013-09-03 15:30:12.389704	6	1	maranguape
869	Marco	2013-09-03 15:30:12.389704	6	1	marco
870	Martinópole	2013-09-03 15:30:12.389704	6	1	martinopole
871	Massapê	2013-09-03 15:30:12.389704	6	1	massape
872	Mauriti	2013-09-03 15:30:12.389704	6	1	mauriti
873	Meruoca	2013-09-03 15:30:12.389704	6	1	meruoca
874	Milagres	2013-09-03 15:30:12.389704	6	1	milagres
875	Milhã	2013-09-03 15:30:12.389704	6	1	milha
876	Miraíma	2013-09-03 15:30:12.389704	6	1	miraima
877	Missão Velha	2013-09-03 15:30:12.389704	6	1	missao-velha
878	Mombaça	2013-09-03 15:30:12.389704	6	1	mombaca
879	Monsenhor Tabosa	2013-09-03 15:30:12.389704	6	1	monsenhor-tabosa
880	Morada Nova	2013-09-03 15:30:12.389704	6	1	morada-nova
881	Moraújo	2013-09-03 15:30:12.389704	6	1	moraujo
882	Morrinhos	2013-09-03 15:30:12.389704	6	1	morrinhos
883	Mucambo	2013-09-03 15:30:12.389704	6	1	mucambo
884	Mulungu	2013-09-03 15:30:12.389704	6	1	mulungu
885	Nova Olinda	2013-09-03 15:30:12.389704	6	1	nova-olinda
886	Nova Russas	2013-09-03 15:30:12.389704	6	1	nova-russas
887	Novo Oriente	2013-09-03 15:30:12.389704	6	1	novo-oriente
888	Ocara	2013-09-03 15:30:12.389704	6	1	ocara
889	Orós	2013-09-03 15:30:12.389704	6	1	oros
890	Pacajus	2013-09-03 15:30:12.389704	6	1	pacajus
891	Pacatuba	2013-09-03 15:30:12.389704	6	1	pacatuba
892	Pacoti	2013-09-03 15:30:12.389704	6	1	pacoti
893	Pacujá	2013-09-03 15:30:12.389704	6	1	pacuja
894	Palhano	2013-09-03 15:30:12.389704	6	1	palhano
895	Palmácia	2013-09-03 15:30:12.389704	6	1	palmacia
896	Paracuru	2013-09-03 15:30:12.389704	6	1	paracuru
897	Paraipaba	2013-09-03 15:30:12.389704	6	1	paraipaba
898	Parambu	2013-09-03 15:30:12.389704	6	1	parambu
899	Paramoti	2013-09-03 15:30:12.389704	6	1	paramoti
900	Pedra Branca	2013-09-03 15:30:12.389704	6	1	pedra-branca
901	Penaforte	2013-09-03 15:30:12.389704	6	1	penaforte
902	Pentecoste	2013-09-03 15:30:12.389704	6	1	pentecoste
903	Pereiro	2013-09-03 15:30:12.389704	6	1	pereiro
904	Pindoretama	2013-09-03 15:30:12.389704	6	1	pindoretama
905	Piquet Carneiro	2013-09-03 15:30:12.389704	6	1	piquet-carneiro
906	Pires Ferreira	2013-09-03 15:30:12.389704	6	1	pires-ferreira
907	Poranga	2013-09-03 15:30:12.389704	6	1	poranga
908	Porteiras	2013-09-03 15:30:12.389704	6	1	porteiras
909	Potengi	2013-09-03 15:30:12.389704	6	1	potengi
910	Potiretama	2013-09-03 15:30:12.389704	6	1	potiretama
911	Quiterianópolis	2013-09-03 15:30:12.389704	6	1	quiterianopolis
912	Quixadá	2013-09-03 15:30:12.389704	6	1	quixada
913	Quixelô	2013-09-03 15:30:12.389704	6	1	quixelo
914	Quixeramobim	2013-09-03 15:30:12.389704	6	1	quixeramobim
915	Quixeré	2013-09-03 15:30:12.389704	6	1	quixere
916	Redenção	2013-09-03 15:30:12.389704	6	1	redencao
917	Reriutaba	2013-09-03 15:30:12.389704	6	1	reriutaba
918	Russas	2013-09-03 15:30:12.389704	6	1	russas
919	Saboeiro	2013-09-03 15:30:12.389704	6	1	saboeiro
920	Salitre	2013-09-03 15:30:12.389704	6	1	salitre
921	Santa Quitéria	2013-09-03 15:30:12.389704	6	1	santa-quiteria
922	Santana do Acaraú	2013-09-03 15:30:12.389704	6	1	santana-do-acarau
923	Santana do Cariri	2013-09-03 15:30:12.389704	6	1	santana-do-cariri
924	São Benedito	2013-09-03 15:30:12.389704	6	1	sao-benedito
925	São Gonçalo do Amarante	2013-09-03 15:30:12.389704	6	1	sao-goncalo-do-amarante
926	São João do Jaguaribe	2013-09-03 15:30:12.389704	6	1	sao-joao-do-jaguaribe
927	São Luís do Curu	2013-09-03 15:30:12.389704	6	1	sao-luis-do-curu
928	Senador Pompeu	2013-09-03 15:30:12.389704	6	1	senador-pompeu
929	Senador Sá	2013-09-03 15:30:12.389704	6	1	senador-sa
930	Sobral	2013-09-03 15:30:12.389704	6	1	sobral
931	Solonópole	2013-09-03 15:30:12.389704	6	1	solonopole
932	Tabuleiro do Norte	2013-09-03 15:30:12.389704	6	1	tabuleiro-do-norte
933	Tamboril	2013-09-03 15:30:12.389704	6	1	tamboril
934	Tarrafas	2013-09-03 15:30:12.389704	6	1	tarrafas
935	Tauá	2013-09-03 15:30:12.389704	6	1	taua
936	Tejuçuoca	2013-09-03 15:30:12.389704	6	1	tejucuoca
937	Tianguá	2013-09-03 15:30:12.389704	6	1	tiangua
938	Trairi	2013-09-03 15:30:12.389704	6	1	trairi
939	Tururu	2013-09-03 15:30:12.389704	6	1	tururu
940	Ubajara	2013-09-03 15:30:12.389704	6	1	ubajara
941	Umari	2013-09-03 15:30:12.389704	6	1	umari
942	Umirim	2013-09-03 15:30:12.389704	6	1	umirim
943	Uruburetama	2013-09-03 15:30:12.389704	6	1	uruburetama
944	Uruoca	2013-09-03 15:30:12.389704	6	1	uruoca
945	Varjota	2013-09-03 15:30:12.389704	6	1	varjota
946	Várzea Alegre	2013-09-03 15:30:12.389704	6	1	varzea-alegre
947	Viçosa do Ceará	2013-09-03 15:30:12.389704	6	1	vicosa-do-ceara
1019	Brasília	2013-09-03 15:30:12.389704	7	1	brasilia
1020	Afonso Cláudio	2013-09-03 15:30:12.389704	8	1	afonso-claudio
1021	Água Doce do Norte	2013-09-03 15:30:12.389704	8	1	agua-doce-do-norte
1022	Águia Branca	2013-09-03 15:30:12.389704	8	1	aguia-branca
1023	Alegre	2013-09-03 15:30:12.389704	8	1	alegre
1024	Alfredo Chaves	2013-09-03 15:30:12.389704	8	1	alfredo-chaves
1025	Alto Rio Novo	2013-09-03 15:30:12.389704	8	1	alto-rio-novo
1026	Anchieta	2013-09-03 15:30:12.389704	8	1	anchieta
1027	Apiacá	2013-09-03 15:30:12.389704	8	1	apiaca
1028	Aracruz	2013-09-03 15:30:12.389704	8	1	aracruz
1029	Atilio Vivacqua	2013-09-03 15:30:12.389704	8	1	atilio-vivacqua
1030	Baixo Guandu	2013-09-03 15:30:12.389704	8	1	baixo-guandu
1031	Barra de São Francisco	2013-09-03 15:30:12.389704	8	1	barra-de-sao-francisco
1032	Boa Esperança	2013-09-03 15:30:12.389704	8	1	boa-esperanca
1033	Bom Jesus do Norte	2013-09-03 15:30:12.389704	8	1	bom-jesus-do-norte
1034	Brejetuba	2013-09-03 15:30:12.389704	8	1	brejetuba
1035	Cachoeiro de Itapemirim	2013-09-03 15:30:12.389704	8	1	cachoeiro-de-itapemirim
1036	Cariacica	2013-09-03 15:30:12.389704	8	1	cariacica
1037	Castelo	2013-09-03 15:30:12.389704	8	1	castelo
1038	Colatina	2013-09-03 15:30:12.389704	8	1	colatina
1039	Conceição da Barra	2013-09-03 15:30:12.389704	8	1	conceicao-da-barra
1040	Conceição do Castelo	2013-09-03 15:30:12.389704	8	1	conceicao-do-castelo
1041	Divino de São Lourenço	2013-09-03 15:30:12.389704	8	1	divino-de-sao-lourenco
1042	Domingos Martins	2013-09-03 15:30:12.389704	8	1	domingos-martins
1043	Dores do Rio Preto	2013-09-03 15:30:12.389704	8	1	dores-do-rio-preto
1044	Ecoporanga	2013-09-03 15:30:12.389704	8	1	ecoporanga
1045	Fundão	2013-09-03 15:30:12.389704	8	1	fundao
1046	Governador Lindenberg	2013-09-03 15:30:12.389704	8	1	governador-lindenberg
1047	Guaçuí	2013-09-03 15:30:12.389704	8	1	guacui
1048	Guarapari	2013-09-03 15:30:12.389704	8	1	guarapari
1049	Ibatiba	2013-09-03 15:30:12.389704	8	1	ibatiba
1050	Ibiraçu	2013-09-03 15:30:12.389704	8	1	ibiracu
1051	Ibitirama	2013-09-03 15:30:12.389704	8	1	ibitirama
1052	Iconha	2013-09-03 15:30:12.389704	8	1	iconha
1053	Irupi	2013-09-03 15:30:12.389704	8	1	irupi
1054	Itaguaçu	2013-09-03 15:30:12.389704	8	1	itaguacu
1055	Itapemirim	2013-09-03 15:30:12.389704	8	1	itapemirim
1056	Itarana	2013-09-03 15:30:12.389704	8	1	itarana
1057	Iúna	2013-09-03 15:30:12.389704	8	1	iuna
1058	Jaguaré	2013-09-03 15:30:12.389704	8	1	jaguare
1059	Jerônimo Monteiro	2013-09-03 15:30:12.389704	8	1	jeronimo-monteiro
1060	João Neiva	2013-09-03 15:30:12.389704	8	1	joao-neiva
1061	Laranja da Terra	2013-09-03 15:30:12.389704	8	1	laranja-da-terra
1062	Linhares	2013-09-03 15:30:12.389704	8	1	linhares
1063	Mantenópolis	2013-09-03 15:30:12.389704	8	1	mantenopolis
1064	Marataízes	2013-09-03 15:30:12.389704	8	1	marataizes
1065	Marechal Floriano	2013-09-03 15:30:12.389704	8	1	marechal-floriano
1066	Marilândia	2013-09-03 15:30:12.389704	8	1	marilandia
1067	Mimoso do Sul	2013-09-03 15:30:12.389704	8	1	mimoso-do-sul
1068	Montanha	2013-09-03 15:30:12.389704	8	1	montanha
1069	Mucurici	2013-09-03 15:30:12.389704	8	1	mucurici
1070	Muniz Freire	2013-09-03 15:30:12.389704	8	1	muniz-freire
1071	Muqui	2013-09-03 15:30:12.389704	8	1	muqui
1072	Nova Venécia	2013-09-03 15:30:12.389704	8	1	nova-venecia
1073	Pancas	2013-09-03 15:30:12.389704	8	1	pancas
1074	Pedro Canário	2013-09-03 15:30:12.389704	8	1	pedro-canario
1075	Pinheiros	2013-09-03 15:30:12.389704	8	1	pinheiros
1076	Piúma	2013-09-03 15:30:12.389704	8	1	piuma
1077	Ponto Belo	2013-09-03 15:30:12.389704	8	1	ponto-belo
1078	Presidente Kennedy	2013-09-03 15:30:12.389704	8	1	presidente-kennedy
1079	Rio Bananal	2013-09-03 15:30:12.389704	8	1	rio-bananal
1080	Rio Novo do Sul	2013-09-03 15:30:12.389704	8	1	rio-novo-do-sul
1081	Santa Leopoldina	2013-09-03 15:30:12.389704	8	1	santa-leopoldina
1082	Santa Maria de Jetibá	2013-09-03 15:30:12.389704	8	1	santa-maria-de-jetiba
1083	Santa Teresa	2013-09-03 15:30:12.389704	8	1	santa-teresa
1084	São Domingos do Norte	2013-09-03 15:30:12.389704	8	1	sao-domingos-do-norte
1085	São Gabriel da Palha	2013-09-03 15:30:12.389704	8	1	sao-gabriel-da-palha
1086	São José do Calçado	2013-09-03 15:30:12.389704	8	1	sao-jose-do-calcado
1087	São Mateus	2013-09-03 15:30:12.389704	8	1	sao-mateus
1088	São Roque do Canaã	2013-09-03 15:30:12.389704	8	1	sao-roque-do-canaa
1089	Serra	2013-09-03 15:30:12.389704	8	1	serra
1090	Sooretama	2013-09-03 15:30:12.389704	8	1	sooretama
1091	Vargem Alta	2013-09-03 15:30:12.389704	8	1	vargem-alta
1092	Venda Nova do Imigrante	2013-09-03 15:30:12.389704	8	1	venda-nova-do-imigrante
1093	Viana	2013-09-03 15:30:12.389704	8	1	viana
1094	Vila Pavão	2013-09-03 15:30:12.389704	8	1	vila-pavao
1095	Vila Valério	2013-09-03 15:30:12.389704	8	1	vila-valerio
1096	Vila Velha	2013-09-03 15:30:12.389704	8	1	vila-velha
1097	Vitória	2013-09-03 15:30:12.389704	8	1	vitoria
1274	Abadia de Goiás	2013-09-03 15:30:12.389704	9	1	abadia-de-goias
1275	Abadiânia	2013-09-03 15:30:12.389704	9	1	abadiania
1276	Acreúna	2013-09-03 15:30:12.389704	9	1	acreuna
1277	Adelândia	2013-09-03 15:30:12.389704	9	1	adelandia
1278	Água Fria de Goiás	2013-09-03 15:30:12.389704	9	1	agua-fria-de-goias
1279	Água Limpa	2013-09-03 15:30:12.389704	9	1	agua-limpa
1280	Águas Lindas de Goiás	2013-09-03 15:30:12.389704	9	1	aguas-lindas-de-goias
1281	Alexânia	2013-09-03 15:30:12.389704	9	1	alexania
1282	Aloândia	2013-09-03 15:30:12.389704	9	1	aloandia
1283	Alto Horizonte	2013-09-03 15:30:12.389704	9	1	alto-horizonte
1284	Alto Paraíso de Goiás	2013-09-03 15:30:12.389704	9	1	alto-paraiso-de-goias
1285	Alvorada do Norte	2013-09-03 15:30:12.389704	9	1	alvorada-do-norte
1286	Amaralina	2013-09-03 15:30:12.389704	9	1	amaralina
1287	Americano do Brasil	2013-09-03 15:30:12.389704	9	1	americano-do-brasil
1288	Amorinópolis	2013-09-03 15:30:12.389704	9	1	amorinopolis
1289	Anápolis	2013-09-03 15:30:12.389704	9	1	anapolis
1290	Anhanguera	2013-09-03 15:30:12.389704	9	1	anhanguera
1291	Anicuns	2013-09-03 15:30:12.389704	9	1	anicuns
1292	Aparecida de Goiânia	2013-09-03 15:30:12.389704	9	1	aparecida-de-goiania
1293	Aparecida do Rio Doce	2013-09-03 15:30:12.389704	9	1	aparecida-do-rio-doce
1294	Aporé	2013-09-03 15:30:12.389704	9	1	apore
1295	Araçu	2013-09-03 15:30:12.389704	9	1	aracu
1296	Aragarças	2013-09-03 15:30:12.389704	9	1	aragarcas
1297	Aragoiânia	2013-09-03 15:30:12.389704	9	1	aragoiania
1298	Araguapaz	2013-09-03 15:30:12.389704	9	1	araguapaz
1299	Arenópolis	2013-09-03 15:30:12.389704	9	1	arenopolis
1300	Aruanã	2013-09-03 15:30:12.389704	9	1	aruana
1301	Aurilândia	2013-09-03 15:30:12.389704	9	1	aurilandia
1302	Avelinópolis	2013-09-03 15:30:12.389704	9	1	avelinopolis
1303	Baliza	2013-09-03 15:30:12.389704	9	1	baliza
1304	Barro Alto	2013-09-03 15:30:12.389704	9	1	barro-alto
1305	Bela Vista de Goiás	2013-09-03 15:30:12.389704	9	1	bela-vista-de-goias
1306	Bom Jardim de Goiás	2013-09-03 15:30:12.389704	9	1	bom-jardim-de-goias
1307	Bom Jesus de Goiás	2013-09-03 15:30:12.389704	9	1	bom-jesus-de-goias
1308	Bonfinópolis	2013-09-03 15:30:12.389704	9	1	bonfinopolis
1309	Bonópolis	2013-09-03 15:30:12.389704	9	1	bonopolis
1310	Brazabrantes	2013-09-03 15:30:12.389704	9	1	brazabrantes
1311	Britânia	2013-09-03 15:30:12.389704	9	1	britania
1312	Buriti Alegre	2013-09-03 15:30:12.389704	9	1	buriti-alegre
1313	Buriti de Goiás	2013-09-03 15:30:12.389704	9	1	buriti-de-goias
1314	Buritinópolis	2013-09-03 15:30:12.389704	9	1	buritinopolis
1315	Cabeceiras	2013-09-03 15:30:12.389704	9	1	cabeceiras
1316	Cachoeira Alta	2013-09-03 15:30:12.389704	9	1	cachoeira-alta
1317	Cachoeira de Goiás	2013-09-03 15:30:12.389704	9	1	cachoeira-de-goias
1318	Cachoeira Dourada	2013-09-03 15:30:12.389704	9	1	cachoeira-dourada
1319	Caçu	2013-09-03 15:30:12.389704	9	1	cacu
1320	Caiapônia	2013-09-03 15:30:12.389704	9	1	caiaponia
1321	Caldas Novas	2013-09-03 15:30:12.389704	9	1	caldas-novas
1322	Caldazinha	2013-09-03 15:30:12.389704	9	1	caldazinha
1323	Campestre de Goiás	2013-09-03 15:30:12.389704	9	1	campestre-de-goias
1324	Campinaçu	2013-09-03 15:30:12.389704	9	1	campinacu
1325	Campinorte	2013-09-03 15:30:12.389704	9	1	campinorte
1326	Campo Alegre de Goiás	2013-09-03 15:30:12.389704	9	1	campo-alegre-de-goias
1327	Campo Limpo de Goiás	2013-09-03 15:30:12.389704	9	1	campo-limpo-de-goias
1328	Campos Belos	2013-09-03 15:30:12.389704	9	1	campos-belos
1329	Campos Verdes	2013-09-03 15:30:12.389704	9	1	campos-verdes
1330	Carmo do Rio Verde	2013-09-03 15:30:12.389704	9	1	carmo-do-rio-verde
1331	Castelândia	2013-09-03 15:30:12.389704	9	1	castelandia
1332	Catalão	2013-09-03 15:30:12.389704	9	1	catalao
1333	Caturaí	2013-09-03 15:30:12.389704	9	1	caturai
1334	Cavalcante	2013-09-03 15:30:12.389704	9	1	cavalcante
1335	Ceres	2013-09-03 15:30:12.389704	9	1	ceres
1336	Cezarina	2013-09-03 15:30:12.389704	9	1	cezarina
1337	Chapadão do Céu	2013-09-03 15:30:12.389704	9	1	chapadao-do-ceu
1338	Cidade Ocidental	2013-09-03 15:30:12.389704	9	1	cidade-ocidental
1339	Cocalzinho de Goiás	2013-09-03 15:30:12.389704	9	1	cocalzinho-de-goias
1340	Colinas do Sul	2013-09-03 15:30:12.389704	9	1	colinas-do-sul
1341	Córrego do Ouro	2013-09-03 15:30:12.389704	9	1	corrego-do-ouro
1342	Corumbá de Goiás	2013-09-03 15:30:12.389704	9	1	corumba-de-goias
1343	Corumbaíba	2013-09-03 15:30:12.389704	9	1	corumbaiba
1344	Cristalina	2013-09-03 15:30:12.389704	9	1	cristalina
1345	Cristianópolis	2013-09-03 15:30:12.389704	9	1	cristianopolis
1346	Crixás	2013-09-03 15:30:12.389704	9	1	crixas
1347	Cromínia	2013-09-03 15:30:12.389704	9	1	crominia
1348	Cumari	2013-09-03 15:30:12.389704	9	1	cumari
1349	Damianópolis	2013-09-03 15:30:12.389704	9	1	damianopolis
1350	Damolândia	2013-09-03 15:30:12.389704	9	1	damolandia
1351	Davinópolis	2013-09-03 15:30:12.389704	9	1	davinopolis
1352	Diorama	2013-09-03 15:30:12.389704	9	1	diorama
1353	Divinópolis de Goiás	2013-09-03 15:30:12.389704	9	1	divinopolis-de-goias
1354	Doverlândia	2013-09-03 15:30:12.389704	9	1	doverlandia
1355	Edealina	2013-09-03 15:30:12.389704	9	1	edealina
1356	Edéia	2013-09-03 15:30:12.389704	9	1	edeia
1357	Estrela do Norte	2013-09-03 15:30:12.389704	9	1	estrela-do-norte
1358	Faina	2013-09-03 15:30:12.389704	9	1	faina
1359	Fazenda Nova	2013-09-03 15:30:12.389704	9	1	fazenda-nova
1360	Firminópolis	2013-09-03 15:30:12.389704	9	1	firminopolis
1361	Flores de Goiás	2013-09-03 15:30:12.389704	9	1	flores-de-goias
1362	Formosa	2013-09-03 15:30:12.389704	9	1	formosa
1363	Formoso	2013-09-03 15:30:12.389704	9	1	formoso
1364	Gameleira de Goiás	2013-09-03 15:30:12.389704	9	1	gameleira-de-goias
1365	Goianápolis	2013-09-03 15:30:12.389704	9	1	goianapolis
1366	Goiandira	2013-09-03 15:30:12.389704	9	1	goiandira
1367	Goianésia	2013-09-03 15:30:12.389704	9	1	goianesia
1368	Goiânia	2013-09-03 15:30:12.389704	9	1	goiania
1369	Goianira	2013-09-03 15:30:12.389704	9	1	goianira
1370	Goiás	2013-09-03 15:30:12.389704	9	1	goias
1371	Goiatuba	2013-09-03 15:30:12.389704	9	1	goiatuba
1372	Gouvelândia	2013-09-03 15:30:12.389704	9	1	gouvelandia
1373	Guapó	2013-09-03 15:30:12.389704	9	1	guapo
1374	Guaraíta	2013-09-03 15:30:12.389704	9	1	guaraita
1375	Guarani de Goiás	2013-09-03 15:30:12.389704	9	1	guarani-de-goias
1376	Guarinos	2013-09-03 15:30:12.389704	9	1	guarinos
1377	Heitoraí	2013-09-03 15:30:12.389704	9	1	heitorai
1378	Hidrolândia	2013-09-03 15:30:12.389704	9	1	hidrolandia
1379	Hidrolina	2013-09-03 15:30:12.389704	9	1	hidrolina
1380	Iaciara	2013-09-03 15:30:12.389704	9	1	iaciara
1381	Inaciolândia	2013-09-03 15:30:12.389704	9	1	inaciolandia
1382	Indiara	2013-09-03 15:30:12.389704	9	1	indiara
1383	Inhumas	2013-09-03 15:30:12.389704	9	1	inhumas
1384	Ipameri	2013-09-03 15:30:12.389704	9	1	ipameri
1385	Ipiranga de Goiás	2013-09-03 15:30:12.389704	9	1	ipiranga-de-goias
1386	Iporá	2013-09-03 15:30:12.389704	9	1	ipora
1387	Israelândia	2013-09-03 15:30:12.389704	9	1	israelandia
1388	Itaberaí	2013-09-03 15:30:12.389704	9	1	itaberai
1389	Itaguari	2013-09-03 15:30:12.389704	9	1	itaguari
1390	Itaguaru	2013-09-03 15:30:12.389704	9	1	itaguaru
1391	Itajá	2013-09-03 15:30:12.389704	9	1	itaja
1392	Itapaci	2013-09-03 15:30:12.389704	9	1	itapaci
1393	Itapirapuã	2013-09-03 15:30:12.389704	9	1	itapirapua
1394	Itapuranga	2013-09-03 15:30:12.389704	9	1	itapuranga
1395	Itarumã	2013-09-03 15:30:12.389704	9	1	itaruma
1396	Itauçu	2013-09-03 15:30:12.389704	9	1	itaucu
1397	Itumbiara	2013-09-03 15:30:12.389704	9	1	itumbiara
1398	Ivolândia	2013-09-03 15:30:12.389704	9	1	ivolandia
1399	Jandaia	2013-09-03 15:30:12.389704	9	1	jandaia
1400	Jaraguá	2013-09-03 15:30:12.389704	9	1	jaragua
1401	Jataí	2013-09-03 15:30:12.389704	9	1	jatai
1402	Jaupaci	2013-09-03 15:30:12.389704	9	1	jaupaci
1403	Jesúpolis	2013-09-03 15:30:12.389704	9	1	jesupolis
1404	Joviânia	2013-09-03 15:30:12.389704	9	1	joviania
1405	Jussara	2013-09-03 15:30:12.389704	9	1	jussara
1406	Lagoa Santa	2013-09-03 15:30:12.389704	9	1	lagoa-santa
1407	Leopoldo de Bulhões	2013-09-03 15:30:12.389704	9	1	leopoldo-de-bulhoes
1408	Luziânia	2013-09-03 15:30:12.389704	9	1	luziania
1409	Mairipotaba	2013-09-03 15:30:12.389704	9	1	mairipotaba
1410	Mambaí	2013-09-03 15:30:12.389704	9	1	mambai
1411	Mara Rosa	2013-09-03 15:30:12.389704	9	1	mara-rosa
1412	Marzagão	2013-09-03 15:30:12.389704	9	1	marzagao
1413	Matrinchã	2013-09-03 15:30:12.389704	9	1	matrincha
1414	Maurilândia	2013-09-03 15:30:12.389704	9	1	maurilandia
1415	Mimoso de Goiás	2013-09-03 15:30:12.389704	9	1	mimoso-de-goias
1416	Minaçu	2013-09-03 15:30:12.389704	9	1	minacu
1417	Mineiros	2013-09-03 15:30:12.389704	9	1	mineiros
1418	Moiporá	2013-09-03 15:30:12.389704	9	1	moipora
1419	Monte Alegre de Goiás	2013-09-03 15:30:12.389704	9	1	monte-alegre-de-goias
1420	Montes Claros de Goiás	2013-09-03 15:30:12.389704	9	1	montes-claros-de-goias
1421	Montividiu	2013-09-03 15:30:12.389704	9	1	montividiu
1422	Montividiu do Norte	2013-09-03 15:30:12.389704	9	1	montividiu-do-norte
1423	Morrinhos	2013-09-03 15:30:12.389704	9	1	morrinhos
1424	Morro Agudo de Goiás	2013-09-03 15:30:12.389704	9	1	morro-agudo-de-goias
1425	Mossâmedes	2013-09-03 15:30:12.389704	9	1	mossamedes
1426	Mozarlândia	2013-09-03 15:30:12.389704	9	1	mozarlandia
1427	Mundo Novo	2013-09-03 15:30:12.389704	9	1	mundo-novo
1428	Mutunópolis	2013-09-03 15:30:12.389704	9	1	mutunopolis
1429	Nazário	2013-09-03 15:30:12.389704	9	1	nazario
1430	Nerópolis	2013-09-03 15:30:12.389704	9	1	neropolis
1431	Niquelândia	2013-09-03 15:30:12.389704	9	1	niquelandia
1432	Nova América	2013-09-03 15:30:12.389704	9	1	nova-america
1433	Nova Aurora	2013-09-03 15:30:12.389704	9	1	nova-aurora
1434	Nova Crixás	2013-09-03 15:30:12.389704	9	1	nova-crixas
1435	Nova Glória	2013-09-03 15:30:12.389704	9	1	nova-gloria
1436	Nova Iguaçu de Goiás	2013-09-03 15:30:12.389704	9	1	nova-iguacu-de-goias
1437	Nova Roma	2013-09-03 15:30:12.389704	9	1	nova-roma
1438	Nova Veneza	2013-09-03 15:30:12.389704	9	1	nova-veneza
1439	Novo Brasil	2013-09-03 15:30:12.389704	9	1	novo-brasil
1440	Novo Gama	2013-09-03 15:30:12.389704	9	1	novo-gama
1441	Novo Planalto	2013-09-03 15:30:12.389704	9	1	novo-planalto
1442	Orizona	2013-09-03 15:30:12.389704	9	1	orizona
1443	Ouro Verde de Goiás	2013-09-03 15:30:12.389704	9	1	ouro-verde-de-goias
1444	Ouvidor	2013-09-03 15:30:12.389704	9	1	ouvidor
1445	Padre Bernardo	2013-09-03 15:30:12.389704	9	1	padre-bernardo
1446	Palestina de Goiás	2013-09-03 15:30:12.389704	9	1	palestina-de-goias
1447	Palmeiras de Goiás	2013-09-03 15:30:12.389704	9	1	palmeiras-de-goias
1448	Palmelo	2013-09-03 15:30:12.389704	9	1	palmelo
1449	Palminópolis	2013-09-03 15:30:12.389704	9	1	palminopolis
1450	Panamá	2013-09-03 15:30:12.389704	9	1	panama
1451	Paranaiguara	2013-09-03 15:30:12.389704	9	1	paranaiguara
1452	Paraúna	2013-09-03 15:30:12.389704	9	1	parauna
1453	Perolândia	2013-09-03 15:30:12.389704	9	1	perolandia
1454	Petrolina de Goiás	2013-09-03 15:30:12.389704	9	1	petrolina-de-goias
1455	Pilar de Goiás	2013-09-03 15:30:12.389704	9	1	pilar-de-goias
1456	Piracanjuba	2013-09-03 15:30:12.389704	9	1	piracanjuba
1457	Piranhas	2013-09-03 15:30:12.389704	9	1	piranhas
1458	Pirenópolis	2013-09-03 15:30:12.389704	9	1	pirenopolis
1459	Pires do Rio	2013-09-03 15:30:12.389704	9	1	pires-do-rio
1460	Planaltina	2013-09-03 15:30:12.389704	9	1	planaltina
1461	Pontalina	2013-09-03 15:30:12.389704	9	1	pontalina
1462	Porangatu	2013-09-03 15:30:12.389704	9	1	porangatu
1463	Porteirão	2013-09-03 15:30:12.389704	9	1	porteirao
1464	Portelândia	2013-09-03 15:30:12.389704	9	1	portelandia
1465	Posse	2013-09-03 15:30:12.389704	9	1	posse
1466	Professor Jamil	2013-09-03 15:30:12.389704	9	1	professor-jamil
1467	Quirinópolis	2013-09-03 15:30:12.389704	9	1	quirinopolis
1468	Rialma	2013-09-03 15:30:12.389704	9	1	rialma
1469	Rianápolis	2013-09-03 15:30:12.389704	9	1	rianapolis
1470	Rio Quente	2013-09-03 15:30:12.389704	9	1	rio-quente
1471	Rio Verde	2013-09-03 15:30:12.389704	9	1	rio-verde
1472	Rubiataba	2013-09-03 15:30:12.389704	9	1	rubiataba
1473	Sanclerlândia	2013-09-03 15:30:12.389704	9	1	sanclerlandia
1474	Santa Bárbara de Goiás	2013-09-03 15:30:12.389704	9	1	santa-barbara-de-goias
1475	Santa Cruz de Goiás	2013-09-03 15:30:12.389704	9	1	santa-cruz-de-goias
1476	Santa Fé de Goiás	2013-09-03 15:30:12.389704	9	1	santa-fe-de-goias
1477	Santa Helena de Goiás	2013-09-03 15:30:12.389704	9	1	santa-helena-de-goias
1478	Santa Isabel	2013-09-03 15:30:12.389704	9	1	santa-isabel
1479	Santa Rita do Araguaia	2013-09-03 15:30:12.389704	9	1	santa-rita-do-araguaia
1480	Santa Rita do Novo Destino	2013-09-03 15:30:12.389704	9	1	santa-rita-do-novo-destino
1481	Santa Rosa de Goiás	2013-09-03 15:30:12.389704	9	1	santa-rosa-de-goias
1482	Santa Tereza de Goiás	2013-09-03 15:30:12.389704	9	1	santa-tereza-de-goias
1483	Santa Terezinha de Goiás	2013-09-03 15:30:12.389704	9	1	santa-terezinha-de-goias
1484	Santo Antônio da Barra	2013-09-03 15:30:12.389704	9	1	santo-antonio-da-barra
1485	Santo Antônio de Goiás	2013-09-03 15:30:12.389704	9	1	santo-antonio-de-goias
1486	Santo Antônio do Descoberto	2013-09-03 15:30:12.389704	9	1	santo-antonio-do-descoberto
1487	São Domingos	2013-09-03 15:30:12.389704	9	1	sao-domingos
1488	São Francisco de Goiás	2013-09-03 15:30:12.389704	9	1	sao-francisco-de-goias
1489	São João d`Aliança	2013-09-03 15:30:12.389704	9	1	sao-joao-d-alianca
1490	São João da Paraúna	2013-09-03 15:30:12.389704	9	1	sao-joao-da-parauna
1491	São Luís de Montes Belos	2013-09-03 15:30:12.389704	9	1	sao-luis-de-montes-belos
1492	São Luíz do Norte	2013-09-03 15:30:12.389704	9	1	sao-luiz-do-norte
1493	São Miguel do Araguaia	2013-09-03 15:30:12.389704	9	1	sao-miguel-do-araguaia
1494	São Miguel do Passa Quatro	2013-09-03 15:30:12.389704	9	1	sao-miguel-do-passa-quatro
1495	São Patrício	2013-09-03 15:30:12.389704	9	1	sao-patricio
1496	São Simão	2013-09-03 15:30:12.389704	9	1	sao-simao
1497	Senador Canedo	2013-09-03 15:30:12.389704	9	1	senador-canedo
1498	Serranópolis	2013-09-03 15:30:12.389704	9	1	serranopolis
1499	Silvânia	2013-09-03 15:30:12.389704	9	1	silvania
1500	Simolândia	2013-09-03 15:30:12.389704	9	1	simolandia
1501	Sítio d`Abadia	2013-09-03 15:30:12.389704	9	1	sitio-d-abadia
1502	Taquaral de Goiás	2013-09-03 15:30:12.389704	9	1	taquaral-de-goias
1503	Teresina de Goiás	2013-09-03 15:30:12.389704	9	1	teresina-de-goias
1504	Terezópolis de Goiás	2013-09-03 15:30:12.389704	9	1	terezopolis-de-goias
1505	Três Ranchos	2013-09-03 15:30:12.389704	9	1	tres-ranchos
1506	Trindade	2013-09-03 15:30:12.389704	9	1	trindade
1507	Trombas	2013-09-03 15:30:12.389704	9	1	trombas
1508	Turvânia	2013-09-03 15:30:12.389704	9	1	turvania
1509	Turvelândia	2013-09-03 15:30:12.389704	9	1	turvelandia
1510	Uirapuru	2013-09-03 15:30:12.389704	9	1	uirapuru
1512	Uruana	2013-09-03 15:30:12.389704	9	1	uruana
1513	Urutaí	2013-09-03 15:30:12.389704	9	1	urutai
1514	Valparaíso de Goiás	2013-09-03 15:30:12.389704	9	1	valparaiso-de-goias
1515	Varjão	2013-09-03 15:30:12.389704	9	1	varjao
1516	Vianópolis	2013-09-03 15:30:12.389704	9	1	vianopolis
1517	Vicentinópolis	2013-09-03 15:30:12.389704	9	1	vicentinopolis
1518	Vila Boa	2013-09-03 15:30:12.389704	9	1	vila-boa
1519	Vila Propício	2013-09-03 15:30:12.389704	9	1	vila-propicio
1529	Açailândia	2013-09-03 15:30:12.389704	10	1	acailandia
1530	Afonso Cunha	2013-09-03 15:30:12.389704	10	1	afonso-cunha
1531	Água Doce do Maranhão	2013-09-03 15:30:12.389704	10	1	agua-doce-do-maranhao
1532	Alcântara	2013-09-03 15:30:12.389704	10	1	alcantara
1533	Aldeias Altas	2013-09-03 15:30:12.389704	10	1	aldeias-altas
1534	Altamira do Maranhão	2013-09-03 15:30:12.389704	10	1	altamira-do-maranhao
1535	Alto Alegre do Maranhão	2013-09-03 15:30:12.389704	10	1	alto-alegre-do-maranhao
1536	Alto Alegre do Pindaré	2013-09-03 15:30:12.389704	10	1	alto-alegre-do-pindare
1537	Alto Parnaíba	2013-09-03 15:30:12.389704	10	1	alto-parnaiba
1538	Amapá do Maranhão	2013-09-03 15:30:12.389704	10	1	amapa-do-maranhao
1539	Amarante do Maranhão	2013-09-03 15:30:12.389704	10	1	amarante-do-maranhao
1540	Anajatuba	2013-09-03 15:30:12.389704	10	1	anajatuba
1541	Anapurus	2013-09-03 15:30:12.389704	10	1	anapurus
1542	Apicum-Açu	2013-09-03 15:30:12.389704	10	1	apicum-acu
1543	Araguanã	2013-09-03 15:30:12.389704	10	1	araguana
1544	Araioses	2013-09-03 15:30:12.389704	10	1	araioses
1545	Arame	2013-09-03 15:30:12.389704	10	1	arame
1546	Arari	2013-09-03 15:30:12.389704	10	1	arari
1547	Axixá	2013-09-03 15:30:12.389704	10	1	axixa
1548	Bacabal	2013-09-03 15:30:12.389704	10	1	bacabal
1549	Bacabeira	2013-09-03 15:30:12.389704	10	1	bacabeira
1550	Bacuri	2013-09-03 15:30:12.389704	10	1	bacuri
1551	Bacurituba	2013-09-03 15:30:12.389704	10	1	bacurituba
1552	Balsas	2013-09-03 15:30:12.389704	10	1	balsas
1553	Barão de Grajaú	2013-09-03 15:30:12.389704	10	1	barao-de-grajau
1554	Barra do Corda	2013-09-03 15:30:12.389704	10	1	barra-do-corda
1555	Barreirinhas	2013-09-03 15:30:12.389704	10	1	barreirinhas
1556	Bela Vista do Maranhão	2013-09-03 15:30:12.389704	10	1	bela-vista-do-maranhao
1557	Belágua	2013-09-03 15:30:12.389704	10	1	belagua
1558	Benedito Leite	2013-09-03 15:30:12.389704	10	1	benedito-leite
1559	Bequimão	2013-09-03 15:30:12.389704	10	1	bequimao
1560	Bernardo do Mearim	2013-09-03 15:30:12.389704	10	1	bernardo-do-mearim
1561	Boa Vista do Gurupi	2013-09-03 15:30:12.389704	10	1	boa-vista-do-gurupi
1562	Bom Jardim	2013-09-03 15:30:12.389704	10	1	bom-jardim
1563	Bom Jesus das Selvas	2013-09-03 15:30:12.389704	10	1	bom-jesus-das-selvas
1564	Bom Lugar	2013-09-03 15:30:12.389704	10	1	bom-lugar
1565	Brejo	2013-09-03 15:30:12.389704	10	1	brejo
1566	Brejo de Areia	2013-09-03 15:30:12.389704	10	1	brejo-de-areia
1567	Buriti	2013-09-03 15:30:12.389704	10	1	buriti
1568	Buriti Bravo	2013-09-03 15:30:12.389704	10	1	buriti-bravo
1569	Buriticupu	2013-09-03 15:30:12.389704	10	1	buriticupu
1570	Buritirana	2013-09-03 15:30:12.389704	10	1	buritirana
1571	Cachoeira Grande	2013-09-03 15:30:12.389704	10	1	cachoeira-grande
1572	Cajapió	2013-09-03 15:30:12.389704	10	1	cajapio
1573	Cajari	2013-09-03 15:30:12.389704	10	1	cajari
1574	Campestre do Maranhão	2013-09-03 15:30:12.389704	10	1	campestre-do-maranhao
1575	Cândido Mendes	2013-09-03 15:30:12.389704	10	1	candido-mendes
1576	Cantanhede	2013-09-03 15:30:12.389704	10	1	cantanhede
1577	Capinzal do Norte	2013-09-03 15:30:12.389704	10	1	capinzal-do-norte
1578	Carolina	2013-09-03 15:30:12.389704	10	1	carolina
1579	Carutapera	2013-09-03 15:30:12.389704	10	1	carutapera
1580	Caxias	2013-09-03 15:30:12.389704	10	1	caxias
1581	Cedral	2013-09-03 15:30:12.389704	10	1	cedral
1582	Central do Maranhão	2013-09-03 15:30:12.389704	10	1	central-do-maranhao
1583	Centro do Guilherme	2013-09-03 15:30:12.389704	10	1	centro-do-guilherme
1584	Centro Novo do Maranhão	2013-09-03 15:30:12.389704	10	1	centro-novo-do-maranhao
1585	Chapadinha	2013-09-03 15:30:12.389704	10	1	chapadinha
1586	Cidelândia	2013-09-03 15:30:12.389704	10	1	cidelandia
1587	Codó	2013-09-03 15:30:12.389704	10	1	codo
1588	Coelho Neto	2013-09-03 15:30:12.389704	10	1	coelho-neto
1589	Colinas	2013-09-03 15:30:12.389704	10	1	colinas
1590	Conceição do Lago-Açu	2013-09-03 15:30:12.389704	10	1	conceicao-do-lago-acu
1591	Coroatá	2013-09-03 15:30:12.389704	10	1	coroata
1592	Cururupu	2013-09-03 15:30:12.389704	10	1	cururupu
1593	Davinópolis	2013-09-03 15:30:12.389704	10	1	davinopolis
1594	Dom Pedro	2013-09-03 15:30:12.389704	10	1	dom-pedro
1595	Duque Bacelar	2013-09-03 15:30:12.389704	10	1	duque-bacelar
1596	Esperantinópolis	2013-09-03 15:30:12.389704	10	1	esperantinopolis
1597	Estreito	2013-09-03 15:30:12.389704	10	1	estreito
1598	Feira Nova do Maranhão	2013-09-03 15:30:12.389704	10	1	feira-nova-do-maranhao
1599	Fernando Falcão	2013-09-03 15:30:12.389704	10	1	fernando-falcao
1600	Formosa da Serra Negra	2013-09-03 15:30:12.389704	10	1	formosa-da-serra-negra
1601	Fortaleza dos Nogueiras	2013-09-03 15:30:12.389704	10	1	fortaleza-dos-nogueiras
1602	Fortuna	2013-09-03 15:30:12.389704	10	1	fortuna
1603	Godofredo Viana	2013-09-03 15:30:12.389704	10	1	godofredo-viana
1604	Gonçalves Dias	2013-09-03 15:30:12.389704	10	1	goncalves-dias
1605	Governador Archer	2013-09-03 15:30:12.389704	10	1	governador-archer
1606	Governador Edison Lobão	2013-09-03 15:30:12.389704	10	1	governador-edison-lobao
1607	Governador Eugênio Barros	2013-09-03 15:30:12.389704	10	1	governador-eugenio-barros
1608	Governador Luiz Rocha	2013-09-03 15:30:12.389704	10	1	governador-luiz-rocha
1609	Governador Newton Bello	2013-09-03 15:30:12.389704	10	1	governador-newton-bello
1610	Governador Nunes Freire	2013-09-03 15:30:12.389704	10	1	governador-nunes-freire
1611	Graça Aranha	2013-09-03 15:30:12.389704	10	1	graca-aranha
1612	Grajaú	2013-09-03 15:30:12.389704	10	1	grajau
1613	Guimarães	2013-09-03 15:30:12.389704	10	1	guimaraes
1614	Humberto de Campos	2013-09-03 15:30:12.389704	10	1	humberto-de-campos
1615	Icatu	2013-09-03 15:30:12.389704	10	1	icatu
1616	Igarapé do Meio	2013-09-03 15:30:12.389704	10	1	igarape-do-meio
1617	Igarapé Grande	2013-09-03 15:30:12.389704	10	1	igarape-grande
1618	Imperatriz	2013-09-03 15:30:12.389704	10	1	imperatriz
1619	Itaipava do Grajaú	2013-09-03 15:30:12.389704	10	1	itaipava-do-grajau
1620	Itapecuru Mirim	2013-09-03 15:30:12.389704	10	1	itapecuru-mirim
1621	Itinga do Maranhão	2013-09-03 15:30:12.389704	10	1	itinga-do-maranhao
1622	Jatobá	2013-09-03 15:30:12.389704	10	1	jatoba
1623	Jenipapo dos Vieiras	2013-09-03 15:30:12.389704	10	1	jenipapo-dos-vieiras
1624	João Lisboa	2013-09-03 15:30:12.389704	10	1	joao-lisboa
1625	Joselândia	2013-09-03 15:30:12.389704	10	1	joselandia
1626	Junco do Maranhão	2013-09-03 15:30:12.389704	10	1	junco-do-maranhao
1627	Lago da Pedra	2013-09-03 15:30:12.389704	10	1	lago-da-pedra
1628	Lago do Junco	2013-09-03 15:30:12.389704	10	1	lago-do-junco
1629	Lago dos Rodrigues	2013-09-03 15:30:12.389704	10	1	lago-dos-rodrigues
1630	Lago Verde	2013-09-03 15:30:12.389704	10	1	lago-verde
1631	Lagoa do Mato	2013-09-03 15:30:12.389704	10	1	lagoa-do-mato
1632	Lagoa Grande do Maranhão	2013-09-03 15:30:12.389704	10	1	lagoa-grande-do-maranhao
1633	Lajeado Novo	2013-09-03 15:30:12.389704	10	1	lajeado-novo
1634	Lima Campos	2013-09-03 15:30:12.389704	10	1	lima-campos
1635	Loreto	2013-09-03 15:30:12.389704	10	1	loreto
1636	Luís Domingues	2013-09-03 15:30:12.389704	10	1	luis-domingues
1637	Magalhães de Almeida	2013-09-03 15:30:12.389704	10	1	magalhaes-de-almeida
1638	Maracaçumé	2013-09-03 15:30:12.389704	10	1	maracacume
1639	Marajá do Sena	2013-09-03 15:30:12.389704	10	1	maraja-do-sena
1640	Maranhãozinho	2013-09-03 15:30:12.389704	10	1	maranhaozinho
1641	Mata Roma	2013-09-03 15:30:12.389704	10	1	mata-roma
1642	Matinha	2013-09-03 15:30:12.389704	10	1	matinha
1643	Matões	2013-09-03 15:30:12.389704	10	1	matoes
1644	Matões do Norte	2013-09-03 15:30:12.389704	10	1	matoes-do-norte
1645	Milagres do Maranhão	2013-09-03 15:30:12.389704	10	1	milagres-do-maranhao
1646	Mirador	2013-09-03 15:30:12.389704	10	1	mirador
1647	Miranda do Norte	2013-09-03 15:30:12.389704	10	1	miranda-do-norte
1648	Mirinzal	2013-09-03 15:30:12.389704	10	1	mirinzal
1649	Monção	2013-09-03 15:30:12.389704	10	1	moncao
1650	Montes Altos	2013-09-03 15:30:12.389704	10	1	montes-altos
1651	Morros	2013-09-03 15:30:12.389704	10	1	morros
1652	Nina Rodrigues	2013-09-03 15:30:12.389704	10	1	nina-rodrigues
1653	Nova Colinas	2013-09-03 15:30:12.389704	10	1	nova-colinas
1654	Nova Iorque	2013-09-03 15:30:12.389704	10	1	nova-iorque
1655	Nova Olinda do Maranhão	2013-09-03 15:30:12.389704	10	1	nova-olinda-do-maranhao
1656	Olho d`Água das Cunhãs	2013-09-03 15:30:12.389704	10	1	olho-d-agua-das-cunhas
1657	Olinda Nova do Maranhão	2013-09-03 15:30:12.389704	10	1	olinda-nova-do-maranhao
1658	Paço do Lumiar	2013-09-03 15:30:12.389704	10	1	paco-do-lumiar
1659	Palmeirândia	2013-09-03 15:30:12.389704	10	1	palmeirandia
1660	Paraibano	2013-09-03 15:30:12.389704	10	1	paraibano
1661	Parnarama	2013-09-03 15:30:12.389704	10	1	parnarama
1662	Passagem Franca	2013-09-03 15:30:12.389704	10	1	passagem-franca
1663	Pastos Bons	2013-09-03 15:30:12.389704	10	1	pastos-bons
1664	Paulino Neves	2013-09-03 15:30:12.389704	10	1	paulino-neves
1665	Paulo Ramos	2013-09-03 15:30:12.389704	10	1	paulo-ramos
1666	Pedreiras	2013-09-03 15:30:12.389704	10	1	pedreiras
1667	Pedro do Rosário	2013-09-03 15:30:12.389704	10	1	pedro-do-rosario
1668	Penalva	2013-09-03 15:30:12.389704	10	1	penalva
1669	Peri Mirim	2013-09-03 15:30:12.389704	10	1	peri-mirim
1670	Peritoró	2013-09-03 15:30:12.389704	10	1	peritoro
1671	Pindaré-Mirim	2013-09-03 15:30:12.389704	10	1	pindare-mirim
1672	Pinheiro	2013-09-03 15:30:12.389704	10	1	pinheiro
1673	Pio XII	2013-09-03 15:30:12.389704	10	1	pio-xii
1674	Pirapemas	2013-09-03 15:30:12.389704	10	1	pirapemas
1675	Poção de Pedras	2013-09-03 15:30:12.389704	10	1	pocao-de-pedras
1676	Porto Franco	2013-09-03 15:30:12.389704	10	1	porto-franco
1677	Porto Rico do Maranhão	2013-09-03 15:30:12.389704	10	1	porto-rico-do-maranhao
1678	Presidente Dutra	2013-09-03 15:30:12.389704	10	1	presidente-dutra
1679	Presidente Juscelino	2013-09-03 15:30:12.389704	10	1	presidente-juscelino
1680	Presidente Médici	2013-09-03 15:30:12.389704	10	1	presidente-medici
1681	Presidente Sarney	2013-09-03 15:30:12.389704	10	1	presidente-sarney
1682	Presidente Vargas	2013-09-03 15:30:12.389704	10	1	presidente-vargas
1683	Primeira Cruz	2013-09-03 15:30:12.389704	10	1	primeira-cruz
1684	Raposa	2013-09-03 15:30:12.389704	10	1	raposa
1685	Riachão	2013-09-03 15:30:12.389704	10	1	riachao
1686	Ribamar Fiquene	2013-09-03 15:30:12.389704	10	1	ribamar-fiquene
1687	Rosário	2013-09-03 15:30:12.389704	10	1	rosario
1688	Sambaíba	2013-09-03 15:30:12.389704	10	1	sambaiba
1689	Santa Filomena do Maranhão	2013-09-03 15:30:12.389704	10	1	santa-filomena-do-maranhao
1690	Santa Helena	2013-09-03 15:30:12.389704	10	1	santa-helena
1691	Santa Inês	2013-09-03 15:30:12.389704	10	1	santa-ines
1692	Santa Luzia	2013-09-03 15:30:12.389704	10	1	santa-luzia
1693	Santa Luzia do Paruá	2013-09-03 15:30:12.389704	10	1	santa-luzia-do-parua
1694	Santa Quitéria do Maranhão	2013-09-03 15:30:12.389704	10	1	santa-quiteria-do-maranhao
1695	Santa Rita	2013-09-03 15:30:12.389704	10	1	santa-rita
1696	Santana do Maranhão	2013-09-03 15:30:12.389704	10	1	santana-do-maranhao
1697	Santo Amaro do Maranhão	2013-09-03 15:30:12.389704	10	1	santo-amaro-do-maranhao
1698	Santo Antônio dos Lopes	2013-09-03 15:30:12.389704	10	1	santo-antonio-dos-lopes
1699	São Benedito do Rio Preto	2013-09-03 15:30:12.389704	10	1	sao-benedito-do-rio-preto
1700	São Bento	2013-09-03 15:30:12.389704	10	1	sao-bento
1701	São Bernardo	2013-09-03 15:30:12.389704	10	1	sao-bernardo
1702	São Domingos do Azeitão	2013-09-03 15:30:12.389704	10	1	sao-domingos-do-azeitao
1703	São Domingos do Maranhão	2013-09-03 15:30:12.389704	10	1	sao-domingos-do-maranhao
1704	São Félix de Balsas	2013-09-03 15:30:12.389704	10	1	sao-felix-de-balsas
1705	São Francisco do Brejão	2013-09-03 15:30:12.389704	10	1	sao-francisco-do-brejao
1706	São Francisco do Maranhão	2013-09-03 15:30:12.389704	10	1	sao-francisco-do-maranhao
1707	São João Batista	2013-09-03 15:30:12.389704	10	1	sao-joao-batista
1708	São João do Carú	2013-09-03 15:30:12.389704	10	1	sao-joao-do-caru
1709	São João do Paraíso	2013-09-03 15:30:12.389704	10	1	sao-joao-do-paraiso
1710	São João do Soter	2013-09-03 15:30:12.389704	10	1	sao-joao-do-soter
1711	São João dos Patos	2013-09-03 15:30:12.389704	10	1	sao-joao-dos-patos
1712	São José de Ribamar	2013-09-03 15:30:12.389704	10	1	sao-jose-de-ribamar
1713	São José dos Basílios	2013-09-03 15:30:12.389704	10	1	sao-jose-dos-basilios
3027	Inhapim	2013-09-03 15:30:12.389704	13	1	inhapim
1714	São Luís	2013-09-03 15:30:12.389704	10	1	sao-luis
1715	São Luís Gonzaga do Maranhão	2013-09-03 15:30:12.389704	10	1	sao-luis-gonzaga-do-maranhao
1716	São Mateus do Maranhão	2013-09-03 15:30:12.389704	10	1	sao-mateus-do-maranhao
1717	São Pedro da Água Branca	2013-09-03 15:30:12.389704	10	1	sao-pedro-da-agua-branca
1718	São Pedro dos Crentes	2013-09-03 15:30:12.389704	10	1	sao-pedro-dos-crentes
1719	São Raimundo das Mangabeiras	2013-09-03 15:30:12.389704	10	1	sao-raimundo-das-mangabeiras
1720	São Raimundo do Doca Bezerra	2013-09-03 15:30:12.389704	10	1	sao-raimundo-do-doca-bezerra
1721	São Roberto	2013-09-03 15:30:12.389704	10	1	sao-roberto
1722	São Vicente Ferrer	2013-09-03 15:30:12.389704	10	1	sao-vicente-ferrer
1723	Satubinha	2013-09-03 15:30:12.389704	10	1	satubinha
1724	Senador Alexandre Costa	2013-09-03 15:30:12.389704	10	1	senador-alexandre-costa
1725	Senador La Rocque	2013-09-03 15:30:12.389704	10	1	senador-la-rocque
1726	Serrano do Maranhão	2013-09-03 15:30:12.389704	10	1	serrano-do-maranhao
1727	Sítio Novo	2013-09-03 15:30:12.389704	10	1	sitio-novo
1728	Sucupira do Norte	2013-09-03 15:30:12.389704	10	1	sucupira-do-norte
1729	Sucupira do Riachão	2013-09-03 15:30:12.389704	10	1	sucupira-do-riachao
1730	Tasso Fragoso	2013-09-03 15:30:12.389704	10	1	tasso-fragoso
1731	Timbiras	2013-09-03 15:30:12.389704	10	1	timbiras
1732	Timon	2013-09-03 15:30:12.389704	10	1	timon
1733	Trizidela do Vale	2013-09-03 15:30:12.389704	10	1	trizidela-do-vale
1734	Tufilândia	2013-09-03 15:30:12.389704	10	1	tufilandia
1735	Tuntum	2013-09-03 15:30:12.389704	10	1	tuntum
1736	Turiaçu	2013-09-03 15:30:12.389704	10	1	turiacu
1737	Turilândia	2013-09-03 15:30:12.389704	10	1	turilandia
1738	Tutóia	2013-09-03 15:30:12.389704	10	1	tutoia
1739	Urbano Santos	2013-09-03 15:30:12.389704	10	1	urbano-santos
1740	Vargem Grande	2013-09-03 15:30:12.389704	10	1	vargem-grande
1741	Viana	2013-09-03 15:30:12.389704	10	1	viana
1742	Vila Nova dos Martírios	2013-09-03 15:30:12.389704	10	1	vila-nova-dos-martirios
1743	Vitória do Mearim	2013-09-03 15:30:12.389704	10	1	vitoria-do-mearim
1744	Vitorino Freire	2013-09-03 15:30:12.389704	10	1	vitorino-freire
1745	Zé Doca	2013-09-03 15:30:12.389704	10	1	ze-doca
2294	Acorizal	2013-09-03 15:30:12.389704	11	1	acorizal
2295	Água Boa	2013-09-03 15:30:12.389704	11	1	agua-boa
2296	Alta Floresta	2013-09-03 15:30:12.389704	11	1	alta-floresta
2297	Alto Araguaia	2013-09-03 15:30:12.389704	11	1	alto-araguaia
2298	Alto Boa Vista	2013-09-03 15:30:12.389704	11	1	alto-boa-vista
2299	Alto Garças	2013-09-03 15:30:12.389704	11	1	alto-garcas
2300	Alto Paraguai	2013-09-03 15:30:12.389704	11	1	alto-paraguai
2301	Alto Taquari	2013-09-03 15:30:12.389704	11	1	alto-taquari
2302	Apiacás	2013-09-03 15:30:12.389704	11	1	apiacas
2303	Araguaiana	2013-09-03 15:30:12.389704	11	1	araguaiana
2304	Araguainha	2013-09-03 15:30:12.389704	11	1	araguainha
2305	Araputanga	2013-09-03 15:30:12.389704	11	1	araputanga
2306	Arenápolis	2013-09-03 15:30:12.389704	11	1	arenapolis
2307	Aripuanã	2013-09-03 15:30:12.389704	11	1	aripuana
2308	Barão de Melgaço	2013-09-03 15:30:12.389704	11	1	barao-de-melgaco
2309	Barra do Bugres	2013-09-03 15:30:12.389704	11	1	barra-do-bugres
2310	Barra do Garças	2013-09-03 15:30:12.389704	11	1	barra-do-garcas
2311	Bom Jesus do Araguaia	2013-09-03 15:30:12.389704	11	1	bom-jesus-do-araguaia
2312	Brasnorte	2013-09-03 15:30:12.389704	11	1	brasnorte
2313	Cáceres	2013-09-03 15:30:12.389704	11	1	caceres
2314	Campinápolis	2013-09-03 15:30:12.389704	11	1	campinapolis
2315	Campo Novo do Parecis	2013-09-03 15:30:12.389704	11	1	campo-novo-do-parecis
2316	Campo Verde	2013-09-03 15:30:12.389704	11	1	campo-verde
2317	Campos de Júlio	2013-09-03 15:30:12.389704	11	1	campos-de-julio
2318	Canabrava do Norte	2013-09-03 15:30:12.389704	11	1	canabrava-do-norte
2319	Canarana	2013-09-03 15:30:12.389704	11	1	canarana
2320	Carlinda	2013-09-03 15:30:12.389704	11	1	carlinda
2321	Castanheira	2013-09-03 15:30:12.389704	11	1	castanheira
2322	Chapada dos Guimarães	2013-09-03 15:30:12.389704	11	1	chapada-dos-guimaraes
2323	Cláudia	2013-09-03 15:30:12.389704	11	1	claudia
2324	Cocalinho	2013-09-03 15:30:12.389704	11	1	cocalinho
2325	Colíder	2013-09-03 15:30:12.389704	11	1	colider
2326	Colniza	2013-09-03 15:30:12.389704	11	1	colniza
2327	Comodoro	2013-09-03 15:30:12.389704	11	1	comodoro
2328	Confresa	2013-09-03 15:30:12.389704	11	1	confresa
2329	Conquista d`Oeste	2013-09-03 15:30:12.389704	11	1	conquista-d-oeste
2330	Cotriguaçu	2013-09-03 15:30:12.389704	11	1	cotriguacu
2331	Cuiabá	2013-09-03 15:30:12.389704	11	1	cuiaba
2332	Curvelândia	2013-09-03 15:30:12.389704	11	1	curvelandia
2333	Curvelândia	2013-09-03 15:30:12.389704	11	1	curvelandia
2334	Denise	2013-09-03 15:30:12.389704	11	1	denise
2335	Diamantino	2013-09-03 15:30:12.389704	11	1	diamantino
2336	Dom Aquino	2013-09-03 15:30:12.389704	11	1	dom-aquino
2337	Feliz Natal	2013-09-03 15:30:12.389704	11	1	feliz-natal
2338	Figueirópolis d`Oeste	2013-09-03 15:30:12.389704	11	1	figueiropolis-d-oeste
2339	Gaúcha do Norte	2013-09-03 15:30:12.389704	11	1	gaucha-do-norte
2340	General Carneiro	2013-09-03 15:30:12.389704	11	1	general-carneiro
2341	Glória d`Oeste	2013-09-03 15:30:12.389704	11	1	gloria-d-oeste
2342	Guarantã do Norte	2013-09-03 15:30:12.389704	11	1	guaranta-do-norte
2343	Guiratinga	2013-09-03 15:30:12.389704	11	1	guiratinga
2344	Indiavaí	2013-09-03 15:30:12.389704	11	1	indiavai
2345	Ipiranga do Norte	2013-09-03 15:30:12.389704	11	1	ipiranga-do-norte
2346	Itanhangá	2013-09-03 15:30:12.389704	11	1	itanhanga
2347	Itaúba	2013-09-03 15:30:12.389704	11	1	itauba
2348	Itiquira	2013-09-03 15:30:12.389704	11	1	itiquira
2349	Jaciara	2013-09-03 15:30:12.389704	11	1	jaciara
2350	Jangada	2013-09-03 15:30:12.389704	11	1	jangada
2351	Jauru	2013-09-03 15:30:12.389704	11	1	jauru
2352	Juara	2013-09-03 15:30:12.389704	11	1	juara
2353	Juína	2013-09-03 15:30:12.389704	11	1	juina
2354	Juruena	2013-09-03 15:30:12.389704	11	1	juruena
2355	Juscimeira	2013-09-03 15:30:12.389704	11	1	juscimeira
2356	Lambari d`Oeste	2013-09-03 15:30:12.389704	11	1	lambari-d-oeste
2357	Lucas do Rio Verde	2013-09-03 15:30:12.389704	11	1	lucas-do-rio-verde
2358	Luciára	2013-09-03 15:30:12.389704	11	1	luciara
2359	Marcelândia	2013-09-03 15:30:12.389704	11	1	marcelandia
2360	Matupá	2013-09-03 15:30:12.389704	11	1	matupa
3028	Inhaúma	2013-09-03 15:30:12.389704	13	1	inhauma
2361	Mirassol d`Oeste	2013-09-03 15:30:12.389704	11	1	mirassol-d-oeste
2362	Nobres	2013-09-03 15:30:12.389704	11	1	nobres
2363	Nortelândia	2013-09-03 15:30:12.389704	11	1	nortelandia
2364	Nossa Senhora do Livramento	2013-09-03 15:30:12.389704	11	1	nossa-senhora-do-livramento
2365	Nova Bandeirantes	2013-09-03 15:30:12.389704	11	1	nova-bandeirantes
2366	Nova Brasilândia	2013-09-03 15:30:12.389704	11	1	nova-brasilandia
2367	Nova Canaã do Norte	2013-09-03 15:30:12.389704	11	1	nova-canaa-do-norte
2368	Nova Guarita	2013-09-03 15:30:12.389704	11	1	nova-guarita
2369	Nova Lacerda	2013-09-03 15:30:12.389704	11	1	nova-lacerda
2370	Nova Marilândia	2013-09-03 15:30:12.389704	11	1	nova-marilandia
2371	Nova Maringá	2013-09-03 15:30:12.389704	11	1	nova-maringa
2372	Nova Monte verde	2013-09-03 15:30:12.389704	11	1	nova-monte-verde
2373	Nova Mutum	2013-09-03 15:30:12.389704	11	1	nova-mutum
2374	Nova Olímpia	2013-09-03 15:30:12.389704	11	1	nova-olimpia
2375	Nova Santa Helena	2013-09-03 15:30:12.389704	11	1	nova-santa-helena
2376	Nova Ubiratã	2013-09-03 15:30:12.389704	11	1	nova-ubirata
2377	Nova Xavantina	2013-09-03 15:30:12.389704	11	1	nova-xavantina
2378	Novo Horizonte do Norte	2013-09-03 15:30:12.389704	11	1	novo-horizonte-do-norte
2379	Novo Mundo	2013-09-03 15:30:12.389704	11	1	novo-mundo
2380	Novo Santo Antônio	2013-09-03 15:30:12.389704	11	1	novo-santo-antonio
2381	Novo São Joaquim	2013-09-03 15:30:12.389704	11	1	novo-sao-joaquim
2382	Paranaíta	2013-09-03 15:30:12.389704	11	1	paranaita
2383	Paranatinga	2013-09-03 15:30:12.389704	11	1	paranatinga
2384	Pedra Preta	2013-09-03 15:30:12.389704	11	1	pedra-preta
2385	Peixoto de Azevedo	2013-09-03 15:30:12.389704	11	1	peixoto-de-azevedo
2386	Planalto da Serra	2013-09-03 15:30:12.389704	11	1	planalto-da-serra
2387	Poconé	2013-09-03 15:30:12.389704	11	1	pocone
2388	Pontal do Araguaia	2013-09-03 15:30:12.389704	11	1	pontal-do-araguaia
2389	Ponte Branca	2013-09-03 15:30:12.389704	11	1	ponte-branca
2390	Pontes e Lacerda	2013-09-03 15:30:12.389704	11	1	pontes-e-lacerda
2391	Porto Alegre do Norte	2013-09-03 15:30:12.389704	11	1	porto-alegre-do-norte
2392	Porto dos Gaúchos	2013-09-03 15:30:12.389704	11	1	porto-dos-gauchos
2393	Porto Esperidião	2013-09-03 15:30:12.389704	11	1	porto-esperidiao
2394	Porto Estrela	2013-09-03 15:30:12.389704	11	1	porto-estrela
2395	Poxoréo	2013-09-03 15:30:12.389704	11	1	poxoreo
2396	Primavera do Leste	2013-09-03 15:30:12.389704	11	1	primavera-do-leste
2397	Querência	2013-09-03 15:30:12.389704	11	1	querencia
2398	Reserva do Cabaçal	2013-09-03 15:30:12.389704	11	1	reserva-do-cabacal
2399	Ribeirão Cascalheira	2013-09-03 15:30:12.389704	11	1	ribeirao-cascalheira
2400	Ribeirãozinho	2013-09-03 15:30:12.389704	11	1	ribeiraozinho
2401	Rio Branco	2013-09-03 15:30:12.389704	11	1	rio-branco
2402	Rondolândia	2013-09-03 15:30:12.389704	11	1	rondolandia
2403	Rondonópolis	2013-09-03 15:30:12.389704	11	1	rondonopolis
2404	Rosário Oeste	2013-09-03 15:30:12.389704	11	1	rosario-oeste
2405	Salto do Céu	2013-09-03 15:30:12.389704	11	1	salto-do-ceu
2406	Santa Carmem	2013-09-03 15:30:12.389704	11	1	santa-carmem
2407	Santa Cruz do Xingu	2013-09-03 15:30:12.389704	11	1	santa-cruz-do-xingu
2408	Santa Rita do Trivelato	2013-09-03 15:30:12.389704	11	1	santa-rita-do-trivelato
2409	Santa Terezinha	2013-09-03 15:30:12.389704	11	1	santa-terezinha
2410	Santo Afonso	2013-09-03 15:30:12.389704	11	1	santo-afonso
2411	Santo Antônio do Leste	2013-09-03 15:30:12.389704	11	1	santo-antonio-do-leste
2412	Santo Antônio do Leverger	2013-09-03 15:30:12.389704	11	1	santo-antonio-do-leverger
2413	São Félix do Araguaia	2013-09-03 15:30:12.389704	11	1	sao-felix-do-araguaia
2414	São José do Povo	2013-09-03 15:30:12.389704	11	1	sao-jose-do-povo
2415	São José do Rio Claro	2013-09-03 15:30:12.389704	11	1	sao-jose-do-rio-claro
2416	São José do Xingu	2013-09-03 15:30:12.389704	11	1	sao-jose-do-xingu
2417	São José dos Quatro Marcos	2013-09-03 15:30:12.389704	11	1	sao-jose-dos-quatro-marcos
2418	São Pedro da Cipa	2013-09-03 15:30:12.389704	11	1	sao-pedro-da-cipa
2419	Sapezal	2013-09-03 15:30:12.389704	11	1	sapezal
2420	Serra Nova Dourada	2013-09-03 15:30:12.389704	11	1	serra-nova-dourada
2421	Sinop	2013-09-03 15:30:12.389704	11	1	sinop
2422	Sorriso	2013-09-03 15:30:12.389704	11	1	sorriso
2423	Tabaporã	2013-09-03 15:30:12.389704	11	1	tabapora
2424	Tangará da Serra	2013-09-03 15:30:12.389704	11	1	tangara-da-serra
2425	Tapurah	2013-09-03 15:30:12.389704	11	1	tapurah
2426	Terra Nova do Norte	2013-09-03 15:30:12.389704	11	1	terra-nova-do-norte
2427	Tesouro	2013-09-03 15:30:12.389704	11	1	tesouro
2428	Torixoréu	2013-09-03 15:30:12.389704	11	1	torixoreu
2429	União do Sul	2013-09-03 15:30:12.389704	11	1	uniao-do-sul
2430	Vale de São Domingos	2013-09-03 15:30:12.389704	11	1	vale-de-sao-domingos
2431	Várzea Grande	2013-09-03 15:30:12.389704	11	1	varzea-grande
2432	Vera	2013-09-03 15:30:12.389704	11	1	vera
2433	Vila Bela da Santíssima Trindade	2013-09-03 15:30:12.389704	11	1	vila-bela-da-santissima-trindade
2434	Vila Rica	2013-09-03 15:30:12.389704	11	1	vila-rica
2549	Água Clara	2013-09-03 15:30:12.389704	12	1	agua-clara
2550	Alcinópolis	2013-09-03 15:30:12.389704	12	1	alcinopolis
2551	Amambaí	2013-09-03 15:30:12.389704	12	1	amambai
2552	Anastácio	2013-09-03 15:30:12.389704	12	1	anastacio
2553	Anaurilândia	2013-09-03 15:30:12.389704	12	1	anaurilandia
2554	Angélica	2013-09-03 15:30:12.389704	12	1	angelica
2555	Antônio João	2013-09-03 15:30:12.389704	12	1	antonio-joao
2556	Aparecida do Taboado	2013-09-03 15:30:12.389704	12	1	aparecida-do-taboado
2557	Aquidauana	2013-09-03 15:30:12.389704	12	1	aquidauana
2558	Aral Moreira	2013-09-03 15:30:12.389704	12	1	aral-moreira
2559	Bandeirantes	2013-09-03 15:30:12.389704	12	1	bandeirantes
2560	Bataguassu	2013-09-03 15:30:12.389704	12	1	bataguassu
2561	Bataiporã	2013-09-03 15:30:12.389704	12	1	bataipora
2562	Bela Vista	2013-09-03 15:30:12.389704	12	1	bela-vista
2563	Bodoquena	2013-09-03 15:30:12.389704	12	1	bodoquena
2564	Bonito	2013-09-03 15:30:12.389704	12	1	bonito
2565	Brasilândia	2013-09-03 15:30:12.389704	12	1	brasilandia
2566	Caarapó	2013-09-03 15:30:12.389704	12	1	caarapo
2567	Camapuã	2013-09-03 15:30:12.389704	12	1	camapua
2568	Campo Grande	2013-09-03 15:30:12.389704	12	1	campo-grande
2569	Caracol	2013-09-03 15:30:12.389704	12	1	caracol
2570	Cassilândia	2013-09-03 15:30:12.389704	12	1	cassilandia
2571	Chapadão do Sul	2013-09-03 15:30:12.389704	12	1	chapadao-do-sul
2572	Corguinho	2013-09-03 15:30:12.389704	12	1	corguinho
2573	Coronel Sapucaia	2013-09-03 15:30:12.389704	12	1	coronel-sapucaia
2574	Corumbá	2013-09-03 15:30:12.389704	12	1	corumba
2575	Costa Rica	2013-09-03 15:30:12.389704	12	1	costa-rica
2576	Coxim	2013-09-03 15:30:12.389704	12	1	coxim
2577	Deodápolis	2013-09-03 15:30:12.389704	12	1	deodapolis
2578	Dois Irmãos do Buriti	2013-09-03 15:30:12.389704	12	1	dois-irmaos-do-buriti
2579	Douradina	2013-09-03 15:30:12.389704	12	1	douradina
2580	Dourados	2013-09-03 15:30:12.389704	12	1	dourados
2581	Eldorado	2013-09-03 15:30:12.389704	12	1	eldorado
2582	Fátima do Sul	2013-09-03 15:30:12.389704	12	1	fatima-do-sul
2583	Figueirão	2013-09-03 15:30:12.389704	12	1	figueirao
2584	Glória de Dourados	2013-09-03 15:30:12.389704	12	1	gloria-de-dourados
2585	Guia Lopes da Laguna	2013-09-03 15:30:12.389704	12	1	guia-lopes-da-laguna
2586	Iguatemi	2013-09-03 15:30:12.389704	12	1	iguatemi
2587	Inocência	2013-09-03 15:30:12.389704	12	1	inocencia
2588	Itaporã	2013-09-03 15:30:12.389704	12	1	itapora
2589	Itaquiraí	2013-09-03 15:30:12.389704	12	1	itaquirai
2590	Ivinhema	2013-09-03 15:30:12.389704	12	1	ivinhema
2591	Japorã	2013-09-03 15:30:12.389704	12	1	japora
2592	Jaraguari	2013-09-03 15:30:12.389704	12	1	jaraguari
2593	Jardim	2013-09-03 15:30:12.389704	12	1	jardim
2594	Jateí	2013-09-03 15:30:12.389704	12	1	jatei
2595	Juti	2013-09-03 15:30:12.389704	12	1	juti
2596	Ladário	2013-09-03 15:30:12.389704	12	1	ladario
2597	Laguna Carapã	2013-09-03 15:30:12.389704	12	1	laguna-carapa
2598	Maracaju	2013-09-03 15:30:12.389704	12	1	maracaju
2599	Miranda	2013-09-03 15:30:12.389704	12	1	miranda
2600	Mundo Novo	2013-09-03 15:30:12.389704	12	1	mundo-novo
2601	Naviraí	2013-09-03 15:30:12.389704	12	1	navirai
2602	Nioaque	2013-09-03 15:30:12.389704	12	1	nioaque
2603	Nova Alvorada do Sul	2013-09-03 15:30:12.389704	12	1	nova-alvorada-do-sul
2604	Nova Andradina	2013-09-03 15:30:12.389704	12	1	nova-andradina
2605	Novo Horizonte do Sul	2013-09-03 15:30:12.389704	12	1	novo-horizonte-do-sul
2606	Paranaíba	2013-09-03 15:30:12.389704	12	1	paranaiba
2607	Paranhos	2013-09-03 15:30:12.389704	12	1	paranhos
2608	Pedro Gomes	2013-09-03 15:30:12.389704	12	1	pedro-gomes
2609	Ponta Porã	2013-09-03 15:30:12.389704	12	1	ponta-pora
2610	Porto Murtinho	2013-09-03 15:30:12.389704	12	1	porto-murtinho
2611	Ribas do Rio Pardo	2013-09-03 15:30:12.389704	12	1	ribas-do-rio-pardo
2612	Rio Brilhante	2013-09-03 15:30:12.389704	12	1	rio-brilhante
2613	Rio Negro	2013-09-03 15:30:12.389704	12	1	rio-negro
2614	Rio Verde de Mato Grosso	2013-09-03 15:30:12.389704	12	1	rio-verde-de-mato-grosso
2615	Rochedo	2013-09-03 15:30:12.389704	12	1	rochedo
2616	Santa Rita do Pardo	2013-09-03 15:30:12.389704	12	1	santa-rita-do-pardo
2617	São Gabriel do Oeste	2013-09-03 15:30:12.389704	12	1	sao-gabriel-do-oeste
2618	Selvíria	2013-09-03 15:30:12.389704	12	1	selviria
2619	Sete Quedas	2013-09-03 15:30:12.389704	12	1	sete-quedas
2620	Sidrolândia	2013-09-03 15:30:12.389704	12	1	sidrolandia
2621	Sonora	2013-09-03 15:30:12.389704	12	1	sonora
2622	Tacuru	2013-09-03 15:30:12.389704	12	1	tacuru
2623	Taquarussu	2013-09-03 15:30:12.389704	12	1	taquarussu
2624	Terenos	2013-09-03 15:30:12.389704	12	1	terenos
2625	Três Lagoas	2013-09-03 15:30:12.389704	12	1	tres-lagoas
2626	Vicentina	2013-09-03 15:30:12.389704	12	1	vicentina
2676	Abadia dos Dourados	2013-09-03 15:30:12.389704	13	1	abadia-dos-dourados
2677	Abaeté	2013-09-03 15:30:12.389704	13	1	abaete
2678	Abre Campo	2013-09-03 15:30:12.389704	13	1	abre-campo
2679	Acaiaca	2013-09-03 15:30:12.389704	13	1	acaiaca
2680	Açucena	2013-09-03 15:30:12.389704	13	1	acucena
2681	Água Boa	2013-09-03 15:30:12.389704	13	1	agua-boa
2682	Água Comprida	2013-09-03 15:30:12.389704	13	1	agua-comprida
2683	Aguanil	2013-09-03 15:30:12.389704	13	1	aguanil
2684	Águas Formosas	2013-09-03 15:30:12.389704	13	1	aguas-formosas
2685	Águas Vermelhas	2013-09-03 15:30:12.389704	13	1	aguas-vermelhas
2686	Aimorés	2013-09-03 15:30:12.389704	13	1	aimores
2687	Aiuruoca	2013-09-03 15:30:12.389704	13	1	aiuruoca
2688	Alagoa	2013-09-03 15:30:12.389704	13	1	alagoa
2689	Albertina	2013-09-03 15:30:12.389704	13	1	albertina
2690	Além Paraíba	2013-09-03 15:30:12.389704	13	1	alem-paraiba
2691	Alfenas	2013-09-03 15:30:12.389704	13	1	alfenas
2692	Alfredo Vasconcelos	2013-09-03 15:30:12.389704	13	1	alfredo-vasconcelos
2693	Almenara	2013-09-03 15:30:12.389704	13	1	almenara
2694	Alpercata	2013-09-03 15:30:12.389704	13	1	alpercata
2695	Alpinópolis	2013-09-03 15:30:12.389704	13	1	alpinopolis
2696	Alterosa	2013-09-03 15:30:12.389704	13	1	alterosa
2697	Alto Caparaó	2013-09-03 15:30:12.389704	13	1	alto-caparao
2698	Alto Jequitibá	2013-09-03 15:30:12.389704	13	1	alto-jequitiba
2699	Alto Rio Doce	2013-09-03 15:30:12.389704	13	1	alto-rio-doce
2700	Alvarenga	2013-09-03 15:30:12.389704	13	1	alvarenga
2701	Alvinópolis	2013-09-03 15:30:12.389704	13	1	alvinopolis
2702	Alvorada de Minas	2013-09-03 15:30:12.389704	13	1	alvorada-de-minas
2703	Amparo do Serra	2013-09-03 15:30:12.389704	13	1	amparo-do-serra
2704	Andradas	2013-09-03 15:30:12.389704	13	1	andradas
2705	Andrelândia	2013-09-03 15:30:12.389704	13	1	andrelandia
2706	Angelândia	2013-09-03 15:30:12.389704	13	1	angelandia
2707	Antônio Carlos	2013-09-03 15:30:12.389704	13	1	antonio-carlos
2708	Antônio Dias	2013-09-03 15:30:12.389704	13	1	antonio-dias
2709	Antônio Prado de Minas	2013-09-03 15:30:12.389704	13	1	antonio-prado-de-minas
2710	Araçaí	2013-09-03 15:30:12.389704	13	1	aracai
2711	Aracitaba	2013-09-03 15:30:12.389704	13	1	aracitaba
2712	Araçuaí	2013-09-03 15:30:12.389704	13	1	aracuai
2713	Araguari	2013-09-03 15:30:12.389704	13	1	araguari
2714	Arantina	2013-09-03 15:30:12.389704	13	1	arantina
2715	Araponga	2013-09-03 15:30:12.389704	13	1	araponga
2716	Araporã	2013-09-03 15:30:12.389704	13	1	arapora
2717	Arapuá	2013-09-03 15:30:12.389704	13	1	arapua
2718	Araújos	2013-09-03 15:30:12.389704	13	1	araujos
2719	Araxá	2013-09-03 15:30:12.389704	13	1	araxa
2720	Arceburgo	2013-09-03 15:30:12.389704	13	1	arceburgo
2721	Arcos	2013-09-03 15:30:12.389704	13	1	arcos
2722	Areado	2013-09-03 15:30:12.389704	13	1	areado
2723	Argirita	2013-09-03 15:30:12.389704	13	1	argirita
2724	Aricanduva	2013-09-03 15:30:12.389704	13	1	aricanduva
2725	Arinos	2013-09-03 15:30:12.389704	13	1	arinos
2726	Astolfo Dutra	2013-09-03 15:30:12.389704	13	1	astolfo-dutra
2727	Ataléia	2013-09-03 15:30:12.389704	13	1	ataleia
2728	Augusto de Lima	2013-09-03 15:30:12.389704	13	1	augusto-de-lima
2729	Baependi	2013-09-03 15:30:12.389704	13	1	baependi
2730	\nBaldim	2013-09-03 15:30:12.389704	13	1	baldim
2731	Bambuí	2013-09-03 15:30:12.389704	13	1	bambui
2732	Bandeira	2013-09-03 15:30:12.389704	13	1	bandeira
2733	Bandeira do Sul	2013-09-03 15:30:12.389704	13	1	bandeira-do-sul
2734	Barão de Cocais	2013-09-03 15:30:12.389704	13	1	barao-de-cocais
2735	Barão de Monte Alto	2013-09-03 15:30:12.389704	13	1	barao-de-monte-alto
2736	Barbacena	2013-09-03 15:30:12.389704	13	1	barbacena
2737	Barra Longa	2013-09-03 15:30:12.389704	13	1	barra-longa
2738	Barroso	2013-09-03 15:30:12.389704	13	1	barroso
2739	Bela Vista de Minas	2013-09-03 15:30:12.389704	13	1	bela-vista-de-minas
2740	Belmiro Braga	2013-09-03 15:30:12.389704	13	1	belmiro-braga
2741	Belo Horizonte	2013-09-03 15:30:12.389704	13	1	belo-horizonte
2742	Belo Oriente	2013-09-03 15:30:12.389704	13	1	belo-oriente
2743	Belo Vale	2013-09-03 15:30:12.389704	13	1	belo-vale
2744	Berilo	2013-09-03 15:30:12.389704	13	1	berilo
2745	Berizal	2013-09-03 15:30:12.389704	13	1	berizal
2746	Bertópolis	2013-09-03 15:30:12.389704	13	1	bertopolis
2747	Betim	2013-09-03 15:30:12.389704	13	1	betim
2748	Bias Fortes	2013-09-03 15:30:12.389704	13	1	bias-fortes
2749	Bicas	2013-09-03 15:30:12.389704	13	1	bicas
2750	Biquinhas	2013-09-03 15:30:12.389704	13	1	biquinhas
2751	Boa Esperança	2013-09-03 15:30:12.389704	13	1	boa-esperanca
2752	Bocaina de Minas	2013-09-03 15:30:12.389704	13	1	bocaina-de-minas
2753	Bocaiúva	2013-09-03 15:30:12.389704	13	1	bocaiuva
2754	Bom Despacho	2013-09-03 15:30:12.389704	13	1	bom-despacho
2755	Bom Jardim de Minas	2013-09-03 15:30:12.389704	13	1	bom-jardim-de-minas
2756	Bom Jesus da Penha	2013-09-03 15:30:12.389704	13	1	bom-jesus-da-penha
2757	Bom Jesus do Amparo	2013-09-03 15:30:12.389704	13	1	bom-jesus-do-amparo
2758	Bom Jesus do Galho	2013-09-03 15:30:12.389704	13	1	bom-jesus-do-galho
2759	Bom Repouso	2013-09-03 15:30:12.389704	13	1	bom-repouso
2760	Bom Sucesso	2013-09-03 15:30:12.389704	13	1	bom-sucesso
2761	Bonfim	2013-09-03 15:30:12.389704	13	1	bonfim
2762	Bonfinópolis de Minas	2013-09-03 15:30:12.389704	13	1	bonfinopolis-de-minas
2763	Bonito de Minas	2013-09-03 15:30:12.389704	13	1	bonito-de-minas
2764	Borda da Mata	2013-09-03 15:30:12.389704	13	1	borda-da-mata
2765	Botelhos	2013-09-03 15:30:12.389704	13	1	botelhos
2766	Botumirim	2013-09-03 15:30:12.389704	13	1	botumirim
2767	Brás Pires	2013-09-03 15:30:12.389704	13	1	bras-pires
2768	Brasilândia de Minas	2013-09-03 15:30:12.389704	13	1	brasilandia-de-minas
2769	Brasília de Minas	2013-09-03 15:30:12.389704	13	1	brasilia-de-minas
2770	Brasópolis	2013-09-03 15:30:12.389704	13	1	brasopolis
2771	Braúnas	2013-09-03 15:30:12.389704	13	1	braunas
2772	Brumadinho	2013-09-03 15:30:12.389704	13	1	brumadinho
2773	Bueno Brandão	2013-09-03 15:30:12.389704	13	1	bueno-brandao
2774	Buenópolis	2013-09-03 15:30:12.389704	13	1	buenopolis
2775	Bugre	2013-09-03 15:30:12.389704	13	1	bugre
2776	Buritis	2013-09-03 15:30:12.389704	13	1	buritis
2777	Buritizeiro	2013-09-03 15:30:12.389704	13	1	buritizeiro
2778	Cabeceira Grande	2013-09-03 15:30:12.389704	13	1	cabeceira-grande
2779	Cabo Verde	2013-09-03 15:30:12.389704	13	1	cabo-verde
2780	Cachoeira da Prata	2013-09-03 15:30:12.389704	13	1	cachoeira-da-prata
2781	Cachoeira de Minas	2013-09-03 15:30:12.389704	13	1	cachoeira-de-minas
2782	Cachoeira de Pajeú	2013-09-03 15:30:12.389704	13	1	cachoeira-de-pajeu
2783	Cachoeira Dourada	2013-09-03 15:30:12.389704	13	1	cachoeira-dourada
2784	Caetanópolis	2013-09-03 15:30:12.389704	13	1	caetanopolis
2785	Caeté	2013-09-03 15:30:12.389704	13	1	caete
2786	Caiana	2013-09-03 15:30:12.389704	13	1	caiana
2787	Cajuri	2013-09-03 15:30:12.389704	13	1	cajuri
2788	Caldas	2013-09-03 15:30:12.389704	13	1	caldas
2789	Camacho	2013-09-03 15:30:12.389704	13	1	camacho
2790	Camanducaia	2013-09-03 15:30:12.389704	13	1	camanducaia
2791	Cambuí	2013-09-03 15:30:12.389704	13	1	cambui
2792	Cambuquira	2013-09-03 15:30:12.389704	13	1	cambuquira
2793	Campanário	2013-09-03 15:30:12.389704	13	1	campanario
2794	Campanha	2013-09-03 15:30:12.389704	13	1	campanha
2795	Campestre	2013-09-03 15:30:12.389704	13	1	campestre
2796	Campina Verde	2013-09-03 15:30:12.389704	13	1	campina-verde
2797	Campo Azul	2013-09-03 15:30:12.389704	13	1	campo-azul
2798	Campo Belo	2013-09-03 15:30:12.389704	13	1	campo-belo
2799	Campo do Meio	2013-09-03 15:30:12.389704	13	1	campo-do-meio
2800	Campo Florido	2013-09-03 15:30:12.389704	13	1	campo-florido
2801	Campos Altos	2013-09-03 15:30:12.389704	13	1	campos-altos
2802	Campos Gerais	2013-09-03 15:30:12.389704	13	1	campos-gerais
2803	Cana Verde	2013-09-03 15:30:12.389704	13	1	cana-verde
2804	Canaã	2013-09-03 15:30:12.389704	13	1	canaa
2805	Canápolis	2013-09-03 15:30:12.389704	13	1	canapolis
2806	Candeias	2013-09-03 15:30:12.389704	13	1	candeias
2807	Cantagalo	2013-09-03 15:30:12.389704	13	1	cantagalo
2808	Caparaó	2013-09-03 15:30:12.389704	13	1	caparao
2809	Capela Nova	2013-09-03 15:30:12.389704	13	1	capela-nova
2810	Capelinha	2013-09-03 15:30:12.389704	13	1	capelinha
2811	Capetinga	2013-09-03 15:30:12.389704	13	1	capetinga
2812	Capim Branco	2013-09-03 15:30:12.389704	13	1	capim-branco
2813	Capinópolis	2013-09-03 15:30:12.389704	13	1	capinopolis
2814	Capitão Andrade	2013-09-03 15:30:12.389704	13	1	capitao-andrade
2815	Capitão Enéas	2013-09-03 15:30:12.389704	13	1	capitao-eneas
2816	Capitólio	2013-09-03 15:30:12.389704	13	1	capitolio
2817	Caputira	2013-09-03 15:30:12.389704	13	1	caputira
2818	Caraí	2013-09-03 15:30:12.389704	13	1	carai
2819	Caranaíba	2013-09-03 15:30:12.389704	13	1	caranaiba
2820	Carandaí	2013-09-03 15:30:12.389704	13	1	carandai
2821	Carangola	2013-09-03 15:30:12.389704	13	1	carangola
2822	Caratinga	2013-09-03 15:30:12.389704	13	1	caratinga
2823	Carbonita	2013-09-03 15:30:12.389704	13	1	carbonita
2824	Careaçu	2013-09-03 15:30:12.389704	13	1	careacu
2825	Carlos Chagas	2013-09-03 15:30:12.389704	13	1	carlos-chagas
2826	Carmésia	2013-09-03 15:30:12.389704	13	1	carmesia
3136	Marilac	2013-09-03 15:30:12.389704	13	1	marilac
2827	Carmo da Cachoeira	2013-09-03 15:30:12.389704	13	1	carmo-da-cachoeira
2828	Carmo da Mata	2013-09-03 15:30:12.389704	13	1	carmo-da-mata
2829	Carmo de Minas	2013-09-03 15:30:12.389704	13	1	carmo-de-minas
2830	Carmo do Cajuru	2013-09-03 15:30:12.389704	13	1	carmo-do-cajuru
2831	Carmo do Paranaíba	2013-09-03 15:30:12.389704	13	1	carmo-do-paranaiba
2832	Carmo do Rio Claro	2013-09-03 15:30:12.389704	13	1	carmo-do-rio-claro
2833	Carmópolis de Minas	2013-09-03 15:30:12.389704	13	1	carmopolis-de-minas
2834	Carneirinho	2013-09-03 15:30:12.389704	13	1	carneirinho
2835	Carrancas	2013-09-03 15:30:12.389704	13	1	carrancas
2836	Carvalhópolis	2013-09-03 15:30:12.389704	13	1	carvalhopolis
2837	Carvalhos	2013-09-03 15:30:12.389704	13	1	carvalhos
2838	Casa Grande	2013-09-03 15:30:12.389704	13	1	casa-grande
2839	Cascalho Rico	2013-09-03 15:30:12.389704	13	1	cascalho-rico
2840	Cássia	2013-09-03 15:30:12.389704	13	1	cassia
2841	Cataguases	2013-09-03 15:30:12.389704	13	1	cataguases
2842	Catas Altas	2013-09-03 15:30:12.389704	13	1	catas-altas
2843	Catas Altas da Noruega	2013-09-03 15:30:12.389704	13	1	catas-altas-da-noruega
2844	Catuji	2013-09-03 15:30:12.389704	13	1	catuji
2845	Catuti	2013-09-03 15:30:12.389704	13	1	catuti
2846	Caxambu	2013-09-03 15:30:12.389704	13	1	caxambu
2847	Cedro do Abaeté	2013-09-03 15:30:12.389704	13	1	cedro-do-abaete
2848	Central de Minas	2013-09-03 15:30:12.389704	13	1	central-de-minas
2849	Centralina	2013-09-03 15:30:12.389704	13	1	centralina
2850	Chácara	2013-09-03 15:30:12.389704	13	1	chacara
2851	Chalé	2013-09-03 15:30:12.389704	13	1	chale
2852	Chapada do Norte	2013-09-03 15:30:12.389704	13	1	chapada-do-norte
2853	Chapada Gaúcha	2013-09-03 15:30:12.389704	13	1	chapada-gaucha
2854	Chiador	2013-09-03 15:30:12.389704	13	1	chiador
2855	Cipotânea	2013-09-03 15:30:12.389704	13	1	cipotanea
2856	Claraval	2013-09-03 15:30:12.389704	13	1	claraval
2857	Claro dos Poções	2013-09-03 15:30:12.389704	13	1	claro-dos-pocoes
2858	Cláudio	2013-09-03 15:30:12.389704	13	1	claudio
2859	Coimbra	2013-09-03 15:30:12.389704	13	1	coimbra
2860	Coluna	2013-09-03 15:30:12.389704	13	1	coluna
2861	Comendador Gomes	2013-09-03 15:30:12.389704	13	1	comendador-gomes
2862	Comercinho	2013-09-03 15:30:12.389704	13	1	comercinho
2863	Conceição da Aparecida	2013-09-03 15:30:12.389704	13	1	conceicao-da-aparecida
2864	Conceição da Barra de Minas	2013-09-03 15:30:12.389704	13	1	conceicao-da-barra-de-minas
2865	Conceição das Alagoas	2013-09-03 15:30:12.389704	13	1	conceicao-das-alagoas
2866	Conceição das Pedras	2013-09-03 15:30:12.389704	13	1	conceicao-das-pedras
2867	Conceição de Ipanema	2013-09-03 15:30:12.389704	13	1	conceicao-de-ipanema
2868	Conceição do Mato Dentro	2013-09-03 15:30:12.389704	13	1	conceicao-do-mato-dentro
2869	Conceição do Pará	2013-09-03 15:30:12.389704	13	1	conceicao-do-para
2870	Conceição do Rio Verde	2013-09-03 15:30:12.389704	13	1	conceicao-do-rio-verde
2871	Conceição dos Ouros	2013-09-03 15:30:12.389704	13	1	conceicao-dos-ouros
2872	Cônego Marinho	2013-09-03 15:30:12.389704	13	1	conego-marinho
2873	Confins	2013-09-03 15:30:12.389704	13	1	confins
2874	Congonhal	2013-09-03 15:30:12.389704	13	1	congonhal
2875	Congonhas	2013-09-03 15:30:12.389704	13	1	congonhas
2876	Congonhas do Norte	2013-09-03 15:30:12.389704	13	1	congonhas-do-norte
2877	Conquista	2013-09-03 15:30:12.389704	13	1	conquista
2878	Conselheiro Lafaiete	2013-09-03 15:30:12.389704	13	1	conselheiro-lafaiete
2879	Conselheiro Pena	2013-09-03 15:30:12.389704	13	1	conselheiro-pena
2880	Consolação	2013-09-03 15:30:12.389704	13	1	consolacao
2881	Contagem	2013-09-03 15:30:12.389704	13	1	contagem
2882	Coqueiral	2013-09-03 15:30:12.389704	13	1	coqueiral
2883	Coração de Jesus	2013-09-03 15:30:12.389704	13	1	coracao-de-jesus
2884	Cordisburgo	2013-09-03 15:30:12.389704	13	1	cordisburgo
2885	Cordislândia	2013-09-03 15:30:12.389704	13	1	cordislandia
2886	Corinto	2013-09-03 15:30:12.389704	13	1	corinto
2887	Coroaci	2013-09-03 15:30:12.389704	13	1	coroaci
2888	Coromandel	2013-09-03 15:30:12.389704	13	1	coromandel
2889	Coronel Fabriciano	2013-09-03 15:30:12.389704	13	1	coronel-fabriciano
2890	Coronel Murta	2013-09-03 15:30:12.389704	13	1	coronel-murta
2891	Coronel Pacheco	2013-09-03 15:30:12.389704	13	1	coronel-pacheco
2892	Coronel Xavier Chaves	2013-09-03 15:30:12.389704	13	1	coronel-xavier-chaves
2893	Córrego Danta	2013-09-03 15:30:12.389704	13	1	corrego-danta
2894	Córrego do Bom Jesus	2013-09-03 15:30:12.389704	13	1	corrego-do-bom-jesus
2895	Córrego Fundo	2013-09-03 15:30:12.389704	13	1	corrego-fundo
2896	Córrego Novo	2013-09-03 15:30:12.389704	13	1	corrego-novo
2897	Couto de Magalhães de Minas	2013-09-03 15:30:12.389704	13	1	couto-de-magalhaes-de-minas
2898	Crisólita	2013-09-03 15:30:12.389704	13	1	crisolita
2899	Cristais	2013-09-03 15:30:12.389704	13	1	cristais
2900	Cristália	2013-09-03 15:30:12.389704	13	1	cristalia
2901	Cristiano Otoni	2013-09-03 15:30:12.389704	13	1	cristiano-otoni
2902	Cristina	2013-09-03 15:30:12.389704	13	1	cristina
2903	Crucilândia	2013-09-03 15:30:12.389704	13	1	crucilandia
2904	Cruzeiro da Fortaleza	2013-09-03 15:30:12.389704	13	1	cruzeiro-da-fortaleza
2905	Cruzília	2013-09-03 15:30:12.389704	13	1	cruzilia
2906	Cuparaque	2013-09-03 15:30:12.389704	13	1	cuparaque
2907	Curral de Dentro	2013-09-03 15:30:12.389704	13	1	curral-de-dentro
2908	Curvelo	2013-09-03 15:30:12.389704	13	1	curvelo
2909	Datas	2013-09-03 15:30:12.389704	13	1	datas
2910	Delfim Moreira	2013-09-03 15:30:12.389704	13	1	delfim-moreira
2911	Delfinópolis	2013-09-03 15:30:12.389704	13	1	delfinopolis
2912	Delta	2013-09-03 15:30:12.389704	13	1	delta
2913	Descoberto	2013-09-03 15:30:12.389704	13	1	descoberto
2914	Desterro de Entre Rios	2013-09-03 15:30:12.389704	13	1	desterro-de-entre-rios
2915	Desterro do Melo	2013-09-03 15:30:12.389704	13	1	desterro-do-melo
2916	Diamantina	2013-09-03 15:30:12.389704	13	1	diamantina
2917	Diogo de Vasconcelos	2013-09-03 15:30:12.389704	13	1	diogo-de-vasconcelos
2918	Dionísio	2013-09-03 15:30:12.389704	13	1	dionisio
2919	Divinésia	2013-09-03 15:30:12.389704	13	1	divinesia
2920	Divino	2013-09-03 15:30:12.389704	13	1	divino
2921	Divino das Laranjeiras	2013-09-03 15:30:12.389704	13	1	divino-das-laranjeiras
2922	Divinolândia de Minas	2013-09-03 15:30:12.389704	13	1	divinolandia-de-minas
2923	Divinópolis	2013-09-03 15:30:12.389704	13	1	divinopolis
2924	Divisa Alegre	2013-09-03 15:30:12.389704	13	1	divisa-alegre
2925	Divisa Nova	2013-09-03 15:30:12.389704	13	1	divisa-nova
2926	Divisópolis	2013-09-03 15:30:12.389704	13	1	divisopolis
2927	Dom Bosco	2013-09-03 15:30:12.389704	13	1	dom-bosco
2928	Dom Cavati	2013-09-03 15:30:12.389704	13	1	dom-cavati
2929	Dom Joaquim	2013-09-03 15:30:12.389704	13	1	dom-joaquim
2930	Dom Silvério	2013-09-03 15:30:12.389704	13	1	dom-silverio
2931	Dom Viçoso	2013-09-03 15:30:12.389704	13	1	dom-vicoso
2932	Dona Eusébia	2013-09-03 15:30:12.389704	13	1	dona-eusebia
2933	Dores de Campos	2013-09-03 15:30:12.389704	13	1	dores-de-campos
2934	Dores de Guanhães	2013-09-03 15:30:12.389704	13	1	dores-de-guanhaes
2935	Dores do Indaiá	2013-09-03 15:30:12.389704	13	1	dores-do-indaia
2936	Dores do Turvo	2013-09-03 15:30:12.389704	13	1	dores-do-turvo
2937	Doresópolis	2013-09-03 15:30:12.389704	13	1	doresopolis
2938	Douradoquara	2013-09-03 15:30:12.389704	13	1	douradoquara
2939	Durandé	2013-09-03 15:30:12.389704	13	1	durande
2940	Elói Mendes	2013-09-03 15:30:12.389704	13	1	eloi-mendes
2941	Engenheiro Caldas	2013-09-03 15:30:12.389704	13	1	engenheiro-caldas
2942	Engenheiro Navarro	2013-09-03 15:30:12.389704	13	1	engenheiro-navarro
2943	Entre Folhas	2013-09-03 15:30:12.389704	13	1	entre-folhas
2944	Entre Rios de Minas	2013-09-03 15:30:12.389704	13	1	entre-rios-de-minas
2945	Ervália	2013-09-03 15:30:12.389704	13	1	ervalia
2946	Esmeraldas	2013-09-03 15:30:12.389704	13	1	esmeraldas
2947	Espera Feliz	2013-09-03 15:30:12.389704	13	1	espera-feliz
2948	Espinosa	2013-09-03 15:30:12.389704	13	1	espinosa
2949	Espírito Santo do Dourado	2013-09-03 15:30:12.389704	13	1	espirito-santo-do-dourado
2950	Estiva	2013-09-03 15:30:12.389704	13	1	estiva
2951	Estrela Dalva	2013-09-03 15:30:12.389704	13	1	estrela-dalva
2952	Estrela do Indaiá	2013-09-03 15:30:12.389704	13	1	estrela-do-indaia
2953	Estrela do Sul	2013-09-03 15:30:12.389704	13	1	estrela-do-sul
2954	Eugenópolis	2013-09-03 15:30:12.389704	13	1	eugenopolis
2955	Ewbank da Câmara	2013-09-03 15:30:12.389704	13	1	ewbank-da-camara
2956	Extrema	2013-09-03 15:30:12.389704	13	1	extrema
2957	Fama	2013-09-03 15:30:12.389704	13	1	fama
2958	Faria Lemos	2013-09-03 15:30:12.389704	13	1	faria-lemos
2959	Felício dos Santos	2013-09-03 15:30:12.389704	13	1	felicio-dos-santos
2960	Felisburgo	2013-09-03 15:30:12.389704	13	1	felisburgo
2961	Felixlândia	2013-09-03 15:30:12.389704	13	1	felixlandia
2962	Fernandes Tourinho	2013-09-03 15:30:12.389704	13	1	fernandes-tourinho
2963	Ferros	2013-09-03 15:30:12.389704	13	1	ferros
2964	Fervedouro	2013-09-03 15:30:12.389704	13	1	fervedouro
2965	Florestal	2013-09-03 15:30:12.389704	13	1	florestal
2966	Formiga	2013-09-03 15:30:12.389704	13	1	formiga
2967	Formoso	2013-09-03 15:30:12.389704	13	1	formoso
2968	Fortaleza de Minas	2013-09-03 15:30:12.389704	13	1	fortaleza-de-minas
2969	Fortuna de Minas	2013-09-03 15:30:12.389704	13	1	fortuna-de-minas
2970	Francisco Badaró	2013-09-03 15:30:12.389704	13	1	francisco-badaro
2971	Francisco Dumont	2013-09-03 15:30:12.389704	13	1	francisco-dumont
2972	Francisco Sá	2013-09-03 15:30:12.389704	13	1	francisco-sa
2973	Franciscópolis	2013-09-03 15:30:12.389704	13	1	franciscopolis
2974	Frei Gaspar	2013-09-03 15:30:12.389704	13	1	frei-gaspar
2975	Frei Inocêncio	2013-09-03 15:30:12.389704	13	1	frei-inocencio
2976	Frei Lagonegro	2013-09-03 15:30:12.389704	13	1	frei-lagonegro
2977	Fronteira	2013-09-03 15:30:12.389704	13	1	fronteira
2978	Fronteira dos Vales	2013-09-03 15:30:12.389704	13	1	fronteira-dos-vales
2979	Fruta de Leite	2013-09-03 15:30:12.389704	13	1	fruta-de-leite
2980	Frutal	2013-09-03 15:30:12.389704	13	1	frutal
2981	Funilândia	2013-09-03 15:30:12.389704	13	1	funilandia
2982	Galiléia	2013-09-03 15:30:12.389704	13	1	galileia
2983	Gameleiras	2013-09-03 15:30:12.389704	13	1	gameleiras
2984	Glaucilândia	2013-09-03 15:30:12.389704	13	1	glaucilandia
2985	Goiabeira	2013-09-03 15:30:12.389704	13	1	goiabeira
2986	Goianá	2013-09-03 15:30:12.389704	13	1	goiana
2987	Gonçalves	2013-09-03 15:30:12.389704	13	1	goncalves
2988	Gonzaga	2013-09-03 15:30:12.389704	13	1	gonzaga
2989	Gouveia	2013-09-03 15:30:12.389704	13	1	gouveia
2990	Governador Valadares	2013-09-03 15:30:12.389704	13	1	governador-valadares
2991	Grão Mogol	2013-09-03 15:30:12.389704	13	1	grao-mogol
2992	Grupiara	2013-09-03 15:30:12.389704	13	1	grupiara
2993	Guanhães	2013-09-03 15:30:12.389704	13	1	guanhaes
2994	Guapé	2013-09-03 15:30:12.389704	13	1	guape
2995	Guaraciaba	2013-09-03 15:30:12.389704	13	1	guaraciaba
2996	Guaraciama	2013-09-03 15:30:12.389704	13	1	guaraciama
2997	Guaranésia	2013-09-03 15:30:12.389704	13	1	guaranesia
2998	Guarani	2013-09-03 15:30:12.389704	13	1	guarani
2999	Guarará	2013-09-03 15:30:12.389704	13	1	guarara
3000	Guarda-Mor	2013-09-03 15:30:12.389704	13	1	guarda-mor
3001	Guaxupé	2013-09-03 15:30:12.389704	13	1	guaxupe
3002	Guidoval	2013-09-03 15:30:12.389704	13	1	guidoval
3003	Guimarânia	2013-09-03 15:30:12.389704	13	1	guimarania
3004	Guiricema	2013-09-03 15:30:12.389704	13	1	guiricema
3005	Gurinhatã	2013-09-03 15:30:12.389704	13	1	gurinhata
3006	Heliodora	2013-09-03 15:30:12.389704	13	1	heliodora
3007	Iapu	2013-09-03 15:30:12.389704	13	1	iapu
3008	Ibertioga	2013-09-03 15:30:12.389704	13	1	ibertioga
3009	Ibiá	2013-09-03 15:30:12.389704	13	1	ibia
3010	Ibiaí	2013-09-03 15:30:12.389704	13	1	ibiai
3011	Ibiracatu	2013-09-03 15:30:12.389704	13	1	ibiracatu
3012	Ibiraci	2013-09-03 15:30:12.389704	13	1	ibiraci
3013	Ibirité	2013-09-03 15:30:12.389704	13	1	ibirite
3014	Ibitiúra de Minas	2013-09-03 15:30:12.389704	13	1	ibitiura-de-minas
3015	Ibituruna	2013-09-03 15:30:12.389704	13	1	ibituruna
3016	Icaraí de Minas	2013-09-03 15:30:12.389704	13	1	icarai-de-minas
3017	Igarapé	2013-09-03 15:30:12.389704	13	1	igarape
3018	Igaratinga	2013-09-03 15:30:12.389704	13	1	igaratinga
3019	Iguatama	2013-09-03 15:30:12.389704	13	1	iguatama
3020	Ijaci	2013-09-03 15:30:12.389704	13	1	ijaci
3021	Ilicínea	2013-09-03 15:30:12.389704	13	1	ilicinea
3022	Imbé de Minas	2013-09-03 15:30:12.389704	13	1	imbe-de-minas
3023	Inconfidentes	2013-09-03 15:30:12.389704	13	1	inconfidentes
3024	Indaiabira	2013-09-03 15:30:12.389704	13	1	indaiabira
3025	Indianópolis	2013-09-03 15:30:12.389704	13	1	indianopolis
3026	Ingaí	2013-09-03 15:30:12.389704	13	1	ingai
3029	Inimutaba	2013-09-03 15:30:12.389704	13	1	inimutaba
3030	Ipaba	2013-09-03 15:30:12.389704	13	1	ipaba
3031	Ipanema	2013-09-03 15:30:12.389704	13	1	ipanema
3032	Ipatinga	2013-09-03 15:30:12.389704	13	1	ipatinga
3033	Ipiaçu	2013-09-03 15:30:12.389704	13	1	ipiacu
3034	Ipuiúna	2013-09-03 15:30:12.389704	13	1	ipuiuna
3035	Iraí de Minas	2013-09-03 15:30:12.389704	13	1	irai-de-minas
3036	Itabira	2013-09-03 15:30:12.389704	13	1	itabira
3037	Itabirinha de Mantena	2013-09-03 15:30:12.389704	13	1	itabirinha-de-mantena
3038	Itabirito	2013-09-03 15:30:12.389704	13	1	itabirito
3039	Itacambira	2013-09-03 15:30:12.389704	13	1	itacambira
3040	Itacarambi	2013-09-03 15:30:12.389704	13	1	itacarambi
3041	Itaguara	2013-09-03 15:30:12.389704	13	1	itaguara
3042	Itaipé	2013-09-03 15:30:12.389704	13	1	itaipe
3043	Itajubá	2013-09-03 15:30:12.389704	13	1	itajuba
3044	Itamarandiba	2013-09-03 15:30:12.389704	13	1	itamarandiba
3045	Itamarati de Minas	2013-09-03 15:30:12.389704	13	1	itamarati-de-minas
3046	Itambacuri	2013-09-03 15:30:12.389704	13	1	itambacuri
3047	Itambé do Mato Dentro	2013-09-03 15:30:12.389704	13	1	itambe-do-mato-dentro
3048	Itamogi	2013-09-03 15:30:12.389704	13	1	itamogi
3049	Itamonte	2013-09-03 15:30:12.389704	13	1	itamonte
3050	Itanhandu	2013-09-03 15:30:12.389704	13	1	itanhandu
3051	Itanhomi	2013-09-03 15:30:12.389704	13	1	itanhomi
3052	Itaobim	2013-09-03 15:30:12.389704	13	1	itaobim
3053	Itapagipe	2013-09-03 15:30:12.389704	13	1	itapagipe
3054	Itapecerica	2013-09-03 15:30:12.389704	13	1	itapecerica
3055	Itapeva	2013-09-03 15:30:12.389704	13	1	itapeva
3056	Itatiaiuçu	2013-09-03 15:30:12.389704	13	1	itatiaiucu
3057	Itaú de Minas	2013-09-03 15:30:12.389704	13	1	itau-de-minas
3058	Itaúna	2013-09-03 15:30:12.389704	13	1	itauna
3059	Itaverava	2013-09-03 15:30:12.389704	13	1	itaverava
3060	Itinga	2013-09-03 15:30:12.389704	13	1	itinga
3061	Itueta	2013-09-03 15:30:12.389704	13	1	itueta
3062	Ituiutaba	2013-09-03 15:30:12.389704	13	1	ituiutaba
3063	Itumirim	2013-09-03 15:30:12.389704	13	1	itumirim
3064	Iturama	2013-09-03 15:30:12.389704	13	1	iturama
3065	Itutinga	2013-09-03 15:30:12.389704	13	1	itutinga
3066	Jaboticatubas	2013-09-03 15:30:12.389704	13	1	jaboticatubas
3067	Jacinto	2013-09-03 15:30:12.389704	13	1	jacinto
3068	Jacuí	2013-09-03 15:30:12.389704	13	1	jacui
3069	Jacutinga	2013-09-03 15:30:12.389704	13	1	jacutinga
3070	Jaguaraçu	2013-09-03 15:30:12.389704	13	1	jaguaracu
3071	Jaíba	2013-09-03 15:30:12.389704	13	1	jaiba
3072	Jampruca	2013-09-03 15:30:12.389704	13	1	jampruca
3073	Janaúba	2013-09-03 15:30:12.389704	13	1	janauba
3074	Januária	2013-09-03 15:30:12.389704	13	1	januaria
3075	Japaraíba	2013-09-03 15:30:12.389704	13	1	japaraiba
3076	Japonvar	2013-09-03 15:30:12.389704	13	1	japonvar
3077	Jeceaba	2013-09-03 15:30:12.389704	13	1	jeceaba
3078	Jenipapo de Minas	2013-09-03 15:30:12.389704	13	1	jenipapo-de-minas
3079	Jequeri	2013-09-03 15:30:12.389704	13	1	jequeri
3080	Jequitaí	2013-09-03 15:30:12.389704	13	1	jequitai
3081	Jequitibá	2013-09-03 15:30:12.389704	13	1	jequitiba
3082	Jequitinhonha	2013-09-03 15:30:12.389704	13	1	jequitinhonha
3083	Jesuânia	2013-09-03 15:30:12.389704	13	1	jesuania
3084	Joaíma	2013-09-03 15:30:12.389704	13	1	joaima
3085	Joanésia	2013-09-03 15:30:12.389704	13	1	joanesia
3086	João Monlevade	2013-09-03 15:30:12.389704	13	1	joao-monlevade
3087	João Pinheiro	2013-09-03 15:30:12.389704	13	1	joao-pinheiro
3088	Joaquim Felício	2013-09-03 15:30:12.389704	13	1	joaquim-felicio
3089	Jordânia	2013-09-03 15:30:12.389704	13	1	jordania
3090	José Gonçalves de Minas	2013-09-03 15:30:12.389704	13	1	jose-goncalves-de-minas
3091	José Raydan	2013-09-03 15:30:12.389704	13	1	jose-raydan
3092	Josenópolis	2013-09-03 15:30:12.389704	13	1	josenopolis
3093	Juatuba	2013-09-03 15:30:12.389704	13	1	juatuba
3094	Juiz de Fora	2013-09-03 15:30:12.389704	13	1	juiz-de-fora
3095	Juramento	2013-09-03 15:30:12.389704	13	1	juramento
3096	Juruaia	2013-09-03 15:30:12.389704	13	1	juruaia
3097	Juvenília	2013-09-03 15:30:12.389704	13	1	juvenilia
3098	Ladainha	2013-09-03 15:30:12.389704	13	1	ladainha
3099	Lagamar	2013-09-03 15:30:12.389704	13	1	lagamar
3100	Lagoa da Prata	2013-09-03 15:30:12.389704	13	1	lagoa-da-prata
3101	Lagoa dos Patos	2013-09-03 15:30:12.389704	13	1	lagoa-dos-patos
3102	Lagoa Dourada	2013-09-03 15:30:12.389704	13	1	lagoa-dourada
3103	Lagoa Formosa	2013-09-03 15:30:12.389704	13	1	lagoa-formosa
3104	Lagoa Grande	2013-09-03 15:30:12.389704	13	1	lagoa-grande
3105	Lagoa Santa	2013-09-03 15:30:12.389704	13	1	lagoa-santa
3106	Lajinha	2013-09-03 15:30:12.389704	13	1	lajinha
3107	Lambari	2013-09-03 15:30:12.389704	13	1	lambari
3108	Lamim	2013-09-03 15:30:12.389704	13	1	lamim
3109	Laranjal	2013-09-03 15:30:12.389704	13	1	laranjal
3110	Lassance	2013-09-03 15:30:12.389704	13	1	lassance
3111	Lavras	2013-09-03 15:30:12.389704	13	1	lavras
3112	Leandro Ferreira	2013-09-03 15:30:12.389704	13	1	leandro-ferreira
3113	Leme do Prado	2013-09-03 15:30:12.389704	13	1	leme-do-prado
3114	Leopoldina	2013-09-03 15:30:12.389704	13	1	leopoldina
3115	Liberdade	2013-09-03 15:30:12.389704	13	1	liberdade
3116	Lima Duarte	2013-09-03 15:30:12.389704	13	1	lima-duarte
3117	Limeira do Oeste	2013-09-03 15:30:12.389704	13	1	limeira-do-oeste
3118	Lontra	2013-09-03 15:30:12.389704	13	1	lontra
3119	Luisburgo	2013-09-03 15:30:12.389704	13	1	luisburgo
3120	Luislândia	2013-09-03 15:30:12.389704	13	1	luislandia
3121	Luminárias	2013-09-03 15:30:12.389704	13	1	luminarias
3122	Luz	2013-09-03 15:30:12.389704	13	1	luz
3123	Machacalis	2013-09-03 15:30:12.389704	13	1	machacalis
3124	Machado	2013-09-03 15:30:12.389704	13	1	machado
3125	Madre de Deus de Minas	2013-09-03 15:30:12.389704	13	1	madre-de-deus-de-minas
3126	Malacacheta	2013-09-03 15:30:12.389704	13	1	malacacheta
3127	Mamonas	2013-09-03 15:30:12.389704	13	1	mamonas
3128	Manga	2013-09-03 15:30:12.389704	13	1	manga
3129	Manhuaçu	2013-09-03 15:30:12.389704	13	1	manhuacu
3130	Manhumirim	2013-09-03 15:30:12.389704	13	1	manhumirim
3131	Mantena	2013-09-03 15:30:12.389704	13	1	mantena
3132	Mar de Espanha	2013-09-03 15:30:12.389704	13	1	mar-de-espanha
3133	Maravilhas	2013-09-03 15:30:12.389704	13	1	maravilhas
3134	Maria da Fé	2013-09-03 15:30:12.389704	13	1	maria-da-fe
3135	Mariana	2013-09-03 15:30:12.389704	13	1	mariana
3137	Mário Campos	2013-09-03 15:30:12.389704	13	1	mario-campos
3138	Maripá de Minas	2013-09-03 15:30:12.389704	13	1	maripa-de-minas
3139	Marliéria	2013-09-03 15:30:12.389704	13	1	marlieria
3140	Marmelópolis	2013-09-03 15:30:12.389704	13	1	marmelopolis
3141	Martinho Campos	2013-09-03 15:30:12.389704	13	1	martinho-campos
3142	Martins Soares	2013-09-03 15:30:12.389704	13	1	martins-soares
3143	Mata Verde	2013-09-03 15:30:12.389704	13	1	mata-verde
3144	Materlândia	2013-09-03 15:30:12.389704	13	1	materlandia
3145	Mateus Leme	2013-09-03 15:30:12.389704	13	1	mateus-leme
3146	Mathias Lobato	2013-09-03 15:30:12.389704	13	1	mathias-lobato
3147	Matias Barbosa	2013-09-03 15:30:12.389704	13	1	matias-barbosa
3148	Matias Cardoso	2013-09-03 15:30:12.389704	13	1	matias-cardoso
3149	Matipó	2013-09-03 15:30:12.389704	13	1	matipo
3150	Mato Verde	2013-09-03 15:30:12.389704	13	1	mato-verde
3151	Matozinhos	2013-09-03 15:30:12.389704	13	1	matozinhos
3152	Matutina	2013-09-03 15:30:12.389704	13	1	matutina
3153	Medeiros	2013-09-03 15:30:12.389704	13	1	medeiros
3154	Medina	2013-09-03 15:30:12.389704	13	1	medina
3155	Mendes Pimentel	2013-09-03 15:30:12.389704	13	1	mendes-pimentel
3156	Mercês	2013-09-03 15:30:12.389704	13	1	merces
3157	Mesquita	2013-09-03 15:30:12.389704	13	1	mesquita
3158	Minas Novas	2013-09-03 15:30:12.389704	13	1	minas-novas
3159	Minduri	2013-09-03 15:30:12.389704	13	1	minduri
3160	Mirabela	2013-09-03 15:30:12.389704	13	1	mirabela
3161	Miradouro	2013-09-03 15:30:12.389704	13	1	miradouro
3162	Miraí	2013-09-03 15:30:12.389704	13	1	mirai
3163	Miravânia	2013-09-03 15:30:12.389704	13	1	miravania
3164	Moeda	2013-09-03 15:30:12.389704	13	1	moeda
3165	Moema	2013-09-03 15:30:12.389704	13	1	moema
3166	Monjolos	2013-09-03 15:30:12.389704	13	1	monjolos
3167	Monsenhor Paulo	2013-09-03 15:30:12.389704	13	1	monsenhor-paulo
3168	Montalvânia	2013-09-03 15:30:12.389704	13	1	montalvania
3169	Monte Alegre de Minas	2013-09-03 15:30:12.389704	13	1	monte-alegre-de-minas
3170	Monte Azul	2013-09-03 15:30:12.389704	13	1	monte-azul
3171	Monte Belo	2013-09-03 15:30:12.389704	13	1	monte-belo
3172	Monte Carmelo	2013-09-03 15:30:12.389704	13	1	monte-carmelo
3173	Monte Formoso	2013-09-03 15:30:12.389704	13	1	monte-formoso
3174	Monte Santo de Minas	2013-09-03 15:30:12.389704	13	1	monte-santo-de-minas
3175	Monte Sião	2013-09-03 15:30:12.389704	13	1	monte-siao
3176	Montes Claros	2013-09-03 15:30:12.389704	13	1	montes-claros
3177	Montezuma	2013-09-03 15:30:12.389704	13	1	montezuma
3178	Morada Nova de Minas	2013-09-03 15:30:12.389704	13	1	morada-nova-de-minas
3179	Morro da Garça	2013-09-03 15:30:12.389704	13	1	morro-da-garca
3180	Morro do Pilar	2013-09-03 15:30:12.389704	13	1	morro-do-pilar
3181	Munhoz	2013-09-03 15:30:12.389704	13	1	munhoz
3182	Muriaé	2013-09-03 15:30:12.389704	13	1	muriae
3183	Mutum	2013-09-03 15:30:12.389704	13	1	mutum
3184	Muzambinho	2013-09-03 15:30:12.389704	13	1	muzambinho
3185	Nacip Raydan	2013-09-03 15:30:12.389704	13	1	nacip-raydan
3186	Nanuque	2013-09-03 15:30:12.389704	13	1	nanuque
3187	Naque	2013-09-03 15:30:12.389704	13	1	naque
3188	Natalândia	2013-09-03 15:30:12.389704	13	1	natalandia
3189	Natércia	2013-09-03 15:30:12.389704	13	1	natercia
3190	Nazareno	2013-09-03 15:30:12.389704	13	1	nazareno
3191	Nepomuceno	2013-09-03 15:30:12.389704	13	1	nepomuceno
3192	Ninheira	2013-09-03 15:30:12.389704	13	1	ninheira
3193	Nova Belém	2013-09-03 15:30:12.389704	13	1	nova-belem
3194	Nova Era	2013-09-03 15:30:12.389704	13	1	nova-era
3195	Nova Lima	2013-09-03 15:30:12.389704	13	1	nova-lima
3196	Nova Módica	2013-09-03 15:30:12.389704	13	1	nova-modica
3197	Nova Ponte	2013-09-03 15:30:12.389704	13	1	nova-ponte
3198	Nova Porteirinha	2013-09-03 15:30:12.389704	13	1	nova-porteirinha
3199	Nova Resende	2013-09-03 15:30:12.389704	13	1	nova-resende
3200	Nova Serrana	2013-09-03 15:30:12.389704	13	1	nova-serrana
3201	Nova União	2013-09-03 15:30:12.389704	13	1	nova-uniao
3202	Novo Cruzeiro	2013-09-03 15:30:12.389704	13	1	novo-cruzeiro
3203	Novo Oriente de Minas	2013-09-03 15:30:12.389704	13	1	novo-oriente-de-minas
3204	Novorizonte	2013-09-03 15:30:12.389704	13	1	novorizonte
3205	Olaria	2013-09-03 15:30:12.389704	13	1	olaria
3206	Olhos-d`Água	2013-09-03 15:30:12.389704	13	1	olhos-d-agua
3207	Olímpio Noronha	2013-09-03 15:30:12.389704	13	1	olimpio-noronha
3208	Oliveira	2013-09-03 15:30:12.389704	13	1	oliveira
3209	Oliveira Fortes	2013-09-03 15:30:12.389704	13	1	oliveira-fortes
3210	Onça de Pitangui	2013-09-03 15:30:12.389704	13	1	onca-de-pitangui
3211	Oratórios	2013-09-03 15:30:12.389704	13	1	oratorios
3212	Orizânia	2013-09-03 15:30:12.389704	13	1	orizania
3213	Ouro Branco	2013-09-03 15:30:12.389704	13	1	ouro-branco
3214	Ouro Fino	2013-09-03 15:30:12.389704	13	1	ouro-fino
3215	Ouro Preto	2013-09-03 15:30:12.389704	13	1	ouro-preto
3216	Ouro Verde de Minas	2013-09-03 15:30:12.389704	13	1	ouro-verde-de-minas
3217	Padre Carvalho	2013-09-03 15:30:12.389704	13	1	padre-carvalho
3218	Padre Paraíso	2013-09-03 15:30:12.389704	13	1	padre-paraiso
3219	Pai Pedro	2013-09-03 15:30:12.389704	13	1	pai-pedro
3220	Paineiras	2013-09-03 15:30:12.389704	13	1	paineiras
3221	Pains	2013-09-03 15:30:12.389704	13	1	pains
3222	Paiva	2013-09-03 15:30:12.389704	13	1	paiva
3223	Palma	2013-09-03 15:30:12.389704	13	1	palma
3224	Palmópolis	2013-09-03 15:30:12.389704	13	1	palmopolis
3225	Papagaios	2013-09-03 15:30:12.389704	13	1	papagaios
3226	Pará de Minas	2013-09-03 15:30:12.389704	13	1	para-de-minas
3227	Paracatu	2013-09-03 15:30:12.389704	13	1	paracatu
3228	Paraguaçu	2013-09-03 15:30:12.389704	13	1	paraguacu
3229	Paraisópolis	2013-09-03 15:30:12.389704	13	1	paraisopolis
3230	Paraopeba	2013-09-03 15:30:12.389704	13	1	paraopeba
3231	Passa Quatro	2013-09-03 15:30:12.389704	13	1	passa-quatro
3232	Passa Tempo	2013-09-03 15:30:12.389704	13	1	passa-tempo
3233	Passabém	2013-09-03 15:30:12.389704	13	1	passabem
3234	Passa-Vinte	2013-09-03 15:30:12.389704	13	1	passa-vinte
3235	Passos	2013-09-03 15:30:12.389704	13	1	passos
3236	Patis	2013-09-03 15:30:12.389704	13	1	patis
3237	Patos de Minas	2013-09-03 15:30:12.389704	13	1	patos-de-minas
3238	Patrocínio	2013-09-03 15:30:12.389704	13	1	patrocinio
3239	Patrocínio do Muriaé	2013-09-03 15:30:12.389704	13	1	patrocinio-do-muriae
4755	Calumbi	2013-09-03 15:30:12.389704	17	1	calumbi
3240	Paula Cândido	2013-09-03 15:30:12.389704	13	1	paula-candido
3241	Paulistas	2013-09-03 15:30:12.389704	13	1	paulistas
3242	Pavão	2013-09-03 15:30:12.389704	13	1	pavao
3243	Peçanha	2013-09-03 15:30:12.389704	13	1	pecanha
3244	Pedra Azul	2013-09-03 15:30:12.389704	13	1	pedra-azul
3245	Pedra Bonita	2013-09-03 15:30:12.389704	13	1	pedra-bonita
3246	Pedra do Anta	2013-09-03 15:30:12.389704	13	1	pedra-do-anta
3247	Pedra do Indaiá	2013-09-03 15:30:12.389704	13	1	pedra-do-indaia
3248	Pedra Dourada	2013-09-03 15:30:12.389704	13	1	pedra-dourada
3249	Pedralva	2013-09-03 15:30:12.389704	13	1	pedralva
3250	Pedras de Maria da Cruz	2013-09-03 15:30:12.389704	13	1	pedras-de-maria-da-cruz
3251	Pedrinópolis	2013-09-03 15:30:12.389704	13	1	pedrinopolis
3252	Pedro Leopoldo	2013-09-03 15:30:12.389704	13	1	pedro-leopoldo
3253	Pedro Teixeira	2013-09-03 15:30:12.389704	13	1	pedro-teixeira
3254	Pequeri	2013-09-03 15:30:12.389704	13	1	pequeri
3255	Pequi	2013-09-03 15:30:12.389704	13	1	pequi
3256	Perdigão	2013-09-03 15:30:12.389704	13	1	perdigao
3257	Perdizes	2013-09-03 15:30:12.389704	13	1	perdizes
3258	Perdões	2013-09-03 15:30:12.389704	13	1	perdoes
3259	Periquito	2013-09-03 15:30:12.389704	13	1	periquito
3260	Pescador	2013-09-03 15:30:12.389704	13	1	pescador
3261	Piau	2013-09-03 15:30:12.389704	13	1	piau
3262	Piedade de Caratinga	2013-09-03 15:30:12.389704	13	1	piedade-de-caratinga
3263	Piedade de Ponte Nova	2013-09-03 15:30:12.389704	13	1	piedade-de-ponte-nova
3264	Piedade do Rio Grande	2013-09-03 15:30:12.389704	13	1	piedade-do-rio-grande
3265	Piedade dos Gerais	2013-09-03 15:30:12.389704	13	1	piedade-dos-gerais
3266	Pimenta	2013-09-03 15:30:12.389704	13	1	pimenta
3267	Pingo-d`Água	2013-09-03 15:30:12.389704	13	1	pingo-d-agua
3268	Pintópolis	2013-09-03 15:30:12.389704	13	1	pintopolis
3269	Piracema	2013-09-03 15:30:12.389704	13	1	piracema
3270	Pirajuba	2013-09-03 15:30:12.389704	13	1	pirajuba
3271	Piranga	2013-09-03 15:30:12.389704	13	1	piranga
3272	Piranguçu	2013-09-03 15:30:12.389704	13	1	pirangucu
3273	Piranguinho	2013-09-03 15:30:12.389704	13	1	piranguinho
3274	Pirapetinga	2013-09-03 15:30:12.389704	13	1	pirapetinga
3275	Pirapora	2013-09-03 15:30:12.389704	13	1	pirapora
3276	Piraúba	2013-09-03 15:30:12.389704	13	1	pirauba
3277	Pitangui	2013-09-03 15:30:12.389704	13	1	pitangui
3278	Piumhi	2013-09-03 15:30:12.389704	13	1	piumhi
3279	Planura	2013-09-03 15:30:12.389704	13	1	planura
3280	Poço Fundo	2013-09-03 15:30:12.389704	13	1	poco-fundo
3281	Poços de Caldas	2013-09-03 15:30:12.389704	13	1	pocos-de-caldas
3282	Pocrane	2013-09-03 15:30:12.389704	13	1	pocrane
3283	Pompéu	2013-09-03 15:30:12.389704	13	1	pompeu
3284	Ponte Nova	2013-09-03 15:30:12.389704	13	1	ponte-nova
3285	Ponto Chique	2013-09-03 15:30:12.389704	13	1	ponto-chique
3286	Ponto dos Volantes	2013-09-03 15:30:12.389704	13	1	ponto-dos-volantes
3287	Porteirinha	2013-09-03 15:30:12.389704	13	1	porteirinha
3288	Porto Firme	2013-09-03 15:30:12.389704	13	1	porto-firme
3289	Poté	2013-09-03 15:30:12.389704	13	1	pote
3290	Pouso Alegre	2013-09-03 15:30:12.389704	13	1	pouso-alegre
3291	Pouso Alto	2013-09-03 15:30:12.389704	13	1	pouso-alto
3292	Prados	2013-09-03 15:30:12.389704	13	1	prados
3293	Prata	2013-09-03 15:30:12.389704	13	1	prata
3294	Pratápolis	2013-09-03 15:30:12.389704	13	1	pratapolis
3295	Pratinha	2013-09-03 15:30:12.389704	13	1	pratinha
3296	Presidente Bernardes	2013-09-03 15:30:12.389704	13	1	presidente-bernardes
3297	Presidente Juscelino	2013-09-03 15:30:12.389704	13	1	presidente-juscelino
3298	Presidente Kubitschek	2013-09-03 15:30:12.389704	13	1	presidente-kubitschek
3299	Presidente Olegário	2013-09-03 15:30:12.389704	13	1	presidente-olegario
3300	Prudente de Morais	2013-09-03 15:30:12.389704	13	1	prudente-de-morais
3301	Quartel Geral	2013-09-03 15:30:12.389704	13	1	quartel-geral
3302	Queluzito	2013-09-03 15:30:12.389704	13	1	queluzito
3303	Raposos	2013-09-03 15:30:12.389704	13	1	raposos
3304	Raul Soares	2013-09-03 15:30:12.389704	13	1	raul-soares
3305	Recreio	2013-09-03 15:30:12.389704	13	1	recreio
3306	Reduto	2013-09-03 15:30:12.389704	13	1	reduto
3307	Resende Costa	2013-09-03 15:30:12.389704	13	1	resende-costa
3308	Resplendor	2013-09-03 15:30:12.389704	13	1	resplendor
3309	Ressaquinha	2013-09-03 15:30:12.389704	13	1	ressaquinha
3310	Riachinho	2013-09-03 15:30:12.389704	13	1	riachinho
3311	Riacho dos Machados	2013-09-03 15:30:12.389704	13	1	riacho-dos-machados
3312	Ribeirão das Neves	2013-09-03 15:30:12.389704	13	1	ribeirao-das-neves
3313	Ribeirão Vermelho	2013-09-03 15:30:12.389704	13	1	ribeirao-vermelho
3314	Rio Acima	2013-09-03 15:30:12.389704	13	1	rio-acima
3315	Rio Casca	2013-09-03 15:30:12.389704	13	1	rio-casca
3316	Rio do Prado	2013-09-03 15:30:12.389704	13	1	rio-do-prado
3317	Rio Doce	2013-09-03 15:30:12.389704	13	1	rio-doce
3318	Rio Espera	2013-09-03 15:30:12.389704	13	1	rio-espera
3319	Rio Manso	2013-09-03 15:30:12.389704	13	1	rio-manso
3320	Rio Novo	2013-09-03 15:30:12.389704	13	1	rio-novo
3321	Rio Paranaíba	2013-09-03 15:30:12.389704	13	1	rio-paranaiba
3322	Rio Pardo de Minas	2013-09-03 15:30:12.389704	13	1	rio-pardo-de-minas
3323	Rio Piracicaba	2013-09-03 15:30:12.389704	13	1	rio-piracicaba
3324	Rio Pomba	2013-09-03 15:30:12.389704	13	1	rio-pomba
3325	Rio Preto	2013-09-03 15:30:12.389704	13	1	rio-preto
3326	Rio Vermelho	2013-09-03 15:30:12.389704	13	1	rio-vermelho
3327	Ritápolis	2013-09-03 15:30:12.389704	13	1	ritapolis
3328	Rochedo de Minas	2013-09-03 15:30:12.389704	13	1	rochedo-de-minas
3329	Rodeiro	2013-09-03 15:30:12.389704	13	1	rodeiro
3330	Romaria	2013-09-03 15:30:12.389704	13	1	romaria
3331	Rosário da Limeira	2013-09-03 15:30:12.389704	13	1	rosario-da-limeira
3332	Rubelita	2013-09-03 15:30:12.389704	13	1	rubelita
3333	Rubim	2013-09-03 15:30:12.389704	13	1	rubim
3334	Sabará	2013-09-03 15:30:12.389704	13	1	sabara
3335	Sabinópolis	2013-09-03 15:30:12.389704	13	1	sabinopolis
3336	Sacramento	2013-09-03 15:30:12.389704	13	1	sacramento
3337	Salinas	2013-09-03 15:30:12.389704	13	1	salinas
3338	Salto da Divisa	2013-09-03 15:30:12.389704	13	1	salto-da-divisa
3339	Santa Bárbara	2013-09-03 15:30:12.389704	13	1	santa-barbara
3340	Santa Bárbara do Leste	2013-09-03 15:30:12.389704	13	1	santa-barbara-do-leste
3341	Santa Bárbara do Monte Verde	2013-09-03 15:30:12.389704	13	1	santa-barbara-do-monte-verde
3342	Santa Bárbara do Tugúrio	2013-09-03 15:30:12.389704	13	1	santa-barbara-do-tugurio
3343	Santa Cruz de Minas	2013-09-03 15:30:12.389704	13	1	santa-cruz-de-minas
3344	Santa Cruz de Salinas	2013-09-03 15:30:12.389704	13	1	santa-cruz-de-salinas
3345	Santa Cruz do Escalvado	2013-09-03 15:30:12.389704	13	1	santa-cruz-do-escalvado
3346	Santa Efigênia de Minas	2013-09-03 15:30:12.389704	13	1	santa-efigenia-de-minas
3347	Santa Fé de Minas	2013-09-03 15:30:12.389704	13	1	santa-fe-de-minas
3348	Santa Helena de Minas	2013-09-03 15:30:12.389704	13	1	santa-helena-de-minas
3349	Santa Juliana	2013-09-03 15:30:12.389704	13	1	santa-juliana
3350	Santa Luzia	2013-09-03 15:30:12.389704	13	1	santa-luzia
3351	Santa Margarida	2013-09-03 15:30:12.389704	13	1	santa-margarida
3352	Santa Maria de Itabira	2013-09-03 15:30:12.389704	13	1	santa-maria-de-itabira
3353	Santa Maria do Salto	2013-09-03 15:30:12.389704	13	1	santa-maria-do-salto
3354	Santa Maria do Suaçuí	2013-09-03 15:30:12.389704	13	1	santa-maria-do-suacui
3355	Santa Rita de Caldas	2013-09-03 15:30:12.389704	13	1	santa-rita-de-caldas
3356	Santa Rita de Ibitipoca	2013-09-03 15:30:12.389704	13	1	santa-rita-de-ibitipoca
3357	Santa Rita de Jacutinga	2013-09-03 15:30:12.389704	13	1	santa-rita-de-jacutinga
3358	Santa Rita de Minas	2013-09-03 15:30:12.389704	13	1	santa-rita-de-minas
3359	Santa Rita do Itueto	2013-09-03 15:30:12.389704	13	1	santa-rita-do-itueto
3360	Santa Rita do Sapucaí	2013-09-03 15:30:12.389704	13	1	santa-rita-do-sapucai
3361	Santa Rosa da Serra	2013-09-03 15:30:12.389704	13	1	santa-rosa-da-serra
3362	Santa Vitória	2013-09-03 15:30:12.389704	13	1	santa-vitoria
3363	Santana da Vargem	2013-09-03 15:30:12.389704	13	1	santana-da-vargem
3364	Santana de Cataguases	2013-09-03 15:30:12.389704	13	1	santana-de-cataguases
3365	Santana de Pirapama	2013-09-03 15:30:12.389704	13	1	santana-de-pirapama
3366	Santana do Deserto	2013-09-03 15:30:12.389704	13	1	santana-do-deserto
3367	Santana do Garambéu	2013-09-03 15:30:12.389704	13	1	santana-do-garambeu
3368	Santana do Jacaré	2013-09-03 15:30:12.389704	13	1	santana-do-jacare
3369	Santana do Manhuaçu	2013-09-03 15:30:12.389704	13	1	santana-do-manhuacu
3370	Santana do Paraíso	2013-09-03 15:30:12.389704	13	1	santana-do-paraiso
3371	Santana do Riacho	2013-09-03 15:30:12.389704	13	1	santana-do-riacho
3372	Santana dos Montes	2013-09-03 15:30:12.389704	13	1	santana-dos-montes
3373	Santo Antônio do Amparo	2013-09-03 15:30:12.389704	13	1	santo-antonio-do-amparo
3374	Santo Antônio do Aventureiro	2013-09-03 15:30:12.389704	13	1	santo-antonio-do-aventureiro
3375	Santo Antônio do Grama	2013-09-03 15:30:12.389704	13	1	santo-antonio-do-grama
3376	Santo Antônio do Itambé	2013-09-03 15:30:12.389704	13	1	santo-antonio-do-itambe
3377	Santo Antônio do Jacinto	2013-09-03 15:30:12.389704	13	1	santo-antonio-do-jacinto
3378	Santo Antônio do Monte	2013-09-03 15:30:12.389704	13	1	santo-antonio-do-monte
3379	Santo Antônio do Retiro	2013-09-03 15:30:12.389704	13	1	santo-antonio-do-retiro
3380	Santo Antônio do Rio Abaixo	2013-09-03 15:30:12.389704	13	1	santo-antonio-do-rio-abaixo
3381	Santo Hipólito	2013-09-03 15:30:12.389704	13	1	santo-hipolito
3382	Santos Dumont	2013-09-03 15:30:12.389704	13	1	santos-dumont
3383	São Bento Abade	2013-09-03 15:30:12.389704	13	1	sao-bento-abade
3384	São Brás do Suaçuí	2013-09-03 15:30:12.389704	13	1	sao-bras-do-suacui
3385	São Domingos das Dores	2013-09-03 15:30:12.389704	13	1	sao-domingos-das-dores
3386	São Domingos do Prata	2013-09-03 15:30:12.389704	13	1	sao-domingos-do-prata
3387	São Félix de Minas	2013-09-03 15:30:12.389704	13	1	sao-felix-de-minas
3388	São Francisco	2013-09-03 15:30:12.389704	13	1	sao-francisco
3389	São Francisco de Paula	2013-09-03 15:30:12.389704	13	1	sao-francisco-de-paula
3390	São Francisco de Sales	2013-09-03 15:30:12.389704	13	1	sao-francisco-de-sales
3391	São Francisco do Glória	2013-09-03 15:30:12.389704	13	1	sao-francisco-do-gloria
3392	São Geraldo	2013-09-03 15:30:12.389704	13	1	sao-geraldo
3393	São Geraldo da Piedade	2013-09-03 15:30:12.389704	13	1	sao-geraldo-da-piedade
3394	São Geraldo do Baixio	2013-09-03 15:30:12.389704	13	1	sao-geraldo-do-baixio
3395	São Gonçalo do Abaeté	2013-09-03 15:30:12.389704	13	1	sao-goncalo-do-abaete
3396	São Gonçalo do Pará	2013-09-03 15:30:12.389704	13	1	sao-goncalo-do-para
3397	São Gonçalo do Rio Abaixo	2013-09-03 15:30:12.389704	13	1	sao-goncalo-do-rio-abaixo
3398	São Gonçalo do Rio Preto	2013-09-03 15:30:12.389704	13	1	sao-goncalo-do-rio-preto
3399	São Gonçalo do Sapucaí	2013-09-03 15:30:12.389704	13	1	sao-goncalo-do-sapucai
3400	São Gotardo	2013-09-03 15:30:12.389704	13	1	sao-gotardo
3401	São João Batista do Glória	2013-09-03 15:30:12.389704	13	1	sao-joao-batista-do-gloria
3402	São João da Lagoa	2013-09-03 15:30:12.389704	13	1	sao-joao-da-lagoa
3403	São João da Mata	2013-09-03 15:30:12.389704	13	1	sao-joao-da-mata
3404	São João da Ponte	2013-09-03 15:30:12.389704	13	1	sao-joao-da-ponte
3405	São João das Missões	2013-09-03 15:30:12.389704	13	1	sao-joao-das-missoes
3406	São João del Rei	2013-09-03 15:30:12.389704	13	1	sao-joao-del-rei
3407	São João do Manhuaçu	2013-09-03 15:30:12.389704	13	1	sao-joao-do-manhuacu
3408	São João do Manteninha	2013-09-03 15:30:12.389704	13	1	sao-joao-do-manteninha
3409	São João do Oriente	2013-09-03 15:30:12.389704	13	1	sao-joao-do-oriente
3410	São João do Pacuí	2013-09-03 15:30:12.389704	13	1	sao-joao-do-pacui
3411	São João do Paraíso	2013-09-03 15:30:12.389704	13	1	sao-joao-do-paraiso
3412	São João Evangelista	2013-09-03 15:30:12.389704	13	1	sao-joao-evangelista
3413	São João Nepomuceno	2013-09-03 15:30:12.389704	13	1	sao-joao-nepomuceno
3414	São Joaquim de Bicas	2013-09-03 15:30:12.389704	13	1	sao-joaquim-de-bicas
3415	São José da Barra	2013-09-03 15:30:12.389704	13	1	sao-jose-da-barra
3416	São José da Lapa	2013-09-03 15:30:12.389704	13	1	sao-jose-da-lapa
3417	São José da Safira	2013-09-03 15:30:12.389704	13	1	sao-jose-da-safira
3418	São José da Varginha	2013-09-03 15:30:12.389704	13	1	sao-jose-da-varginha
3419	São José do Alegre	2013-09-03 15:30:12.389704	13	1	sao-jose-do-alegre
3420	São José do Divino	2013-09-03 15:30:12.389704	13	1	sao-jose-do-divino
3421	São José do Goiabal	2013-09-03 15:30:12.389704	13	1	sao-jose-do-goiabal
3422	São José do Jacuri	2013-09-03 15:30:12.389704	13	1	sao-jose-do-jacuri
3423	São José do Mantimento	2013-09-03 15:30:12.389704	13	1	sao-jose-do-mantimento
3424	São Lourenço	2013-09-03 15:30:12.389704	13	1	sao-lourenco
3425	São Miguel do Anta	2013-09-03 15:30:12.389704	13	1	sao-miguel-do-anta
3426	São Pedro da União	2013-09-03 15:30:12.389704	13	1	sao-pedro-da-uniao
3427	São Pedro do Suaçuí	2013-09-03 15:30:12.389704	13	1	sao-pedro-do-suacui
3428	São Pedro dos Ferros	2013-09-03 15:30:12.389704	13	1	sao-pedro-dos-ferros
3429	São Romão	2013-09-03 15:30:12.389704	13	1	sao-romao
3430	São Roque de Minas	2013-09-03 15:30:12.389704	13	1	sao-roque-de-minas
3431	São Sebastião da Bela Vista	2013-09-03 15:30:12.389704	13	1	sao-sebastiao-da-bela-vista
3432	São Sebastião da Vargem Alegre	2013-09-03 15:30:12.389704	13	1	sao-sebastiao-da-vargem-alegre
3433	São Sebastião do Anta	2013-09-03 15:30:12.389704	13	1	sao-sebastiao-do-anta
3434	São Sebastião do Maranhão	2013-09-03 15:30:12.389704	13	1	sao-sebastiao-do-maranhao
3435	São Sebastião do Oeste	2013-09-03 15:30:12.389704	13	1	sao-sebastiao-do-oeste
3436	São Sebastião do Paraíso	2013-09-03 15:30:12.389704	13	1	sao-sebastiao-do-paraiso
3437	São Sebastião do Rio Preto	2013-09-03 15:30:12.389704	13	1	sao-sebastiao-do-rio-preto
3438	São Sebastião do Rio Verde	2013-09-03 15:30:12.389704	13	1	sao-sebastiao-do-rio-verde
3439	São Thomé das Letras	2013-09-03 15:30:12.389704	13	1	sao-thome-das-letras
3440	São Tiago	2013-09-03 15:30:12.389704	13	1	sao-tiago
3441	São Tomás de Aquino	2013-09-03 15:30:12.389704	13	1	sao-tomas-de-aquino
3442	São Vicente de Minas	2013-09-03 15:30:12.389704	13	1	sao-vicente-de-minas
3443	Sapucaí-Mirim	2013-09-03 15:30:12.389704	13	1	sapucai-mirim
3444	Sardoá	2013-09-03 15:30:12.389704	13	1	sardoa
3445	Sarzedo	2013-09-03 15:30:12.389704	13	1	sarzedo
3446	Sem-Peixe	2013-09-03 15:30:12.389704	13	1	sem-peixe
3447	Senador Amaral	2013-09-03 15:30:12.389704	13	1	senador-amaral
3448	Senador Cortes	2013-09-03 15:30:12.389704	13	1	senador-cortes
3449	Senador Firmino	2013-09-03 15:30:12.389704	13	1	senador-firmino
3450	Senador José Bento	2013-09-03 15:30:12.389704	13	1	senador-jose-bento
3451	Senador Modestino Gonçalves	2013-09-03 15:30:12.389704	13	1	senador-modestino-goncalves
3452	Senhora de Oliveira	2013-09-03 15:30:12.389704	13	1	senhora-de-oliveira
3453	Senhora do Porto	2013-09-03 15:30:12.389704	13	1	senhora-do-porto
3454	Senhora dos Remédios	2013-09-03 15:30:12.389704	13	1	senhora-dos-remedios
3455	Sericita	2013-09-03 15:30:12.389704	13	1	sericita
3456	Seritinga	2013-09-03 15:30:12.389704	13	1	seritinga
3457	Serra Azul de Minas	2013-09-03 15:30:12.389704	13	1	serra-azul-de-minas
3458	Serra da Saudade	2013-09-03 15:30:12.389704	13	1	serra-da-saudade
3459	Serra do Salitre	2013-09-03 15:30:12.389704	13	1	serra-do-salitre
3460	Serra dos Aimorés	2013-09-03 15:30:12.389704	13	1	serra-dos-aimores
3461	Serrania	2013-09-03 15:30:12.389704	13	1	serrania
3462	Serranópolis de Minas	2013-09-03 15:30:12.389704	13	1	serranopolis-de-minas
3463	Serranos	2013-09-03 15:30:12.389704	13	1	serranos
3464	Serro	2013-09-03 15:30:12.389704	13	1	serro
3465	Sete Lagoas	2013-09-03 15:30:12.389704	13	1	sete-lagoas
3466	Setubinha	2013-09-03 15:30:12.389704	13	1	setubinha
3467	Silveirânia	2013-09-03 15:30:12.389704	13	1	silveirania
3468	Silvianópolis	2013-09-03 15:30:12.389704	13	1	silvianopolis
3469	Simão Pereira	2013-09-03 15:30:12.389704	13	1	simao-pereira
3470	Simonésia	2013-09-03 15:30:12.389704	13	1	simonesia
3471	Sobrália	2013-09-03 15:30:12.389704	13	1	sobralia
3472	Soledade de Minas	2013-09-03 15:30:12.389704	13	1	soledade-de-minas
3473	Tabuleiro	2013-09-03 15:30:12.389704	13	1	tabuleiro
3474	Taiobeiras	2013-09-03 15:30:12.389704	13	1	taiobeiras
3475	Taparuba	2013-09-03 15:30:12.389704	13	1	taparuba
3476	Tapira	2013-09-03 15:30:12.389704	13	1	tapira
3477	Tapiraí	2013-09-03 15:30:12.389704	13	1	tapirai
3478	Taquaraçu de Minas	2013-09-03 15:30:12.389704	13	1	taquaracu-de-minas
3479	Tarumirim	2013-09-03 15:30:12.389704	13	1	tarumirim
3480	Teixeiras	2013-09-03 15:30:12.389704	13	1	teixeiras
3481	Teófilo Otoni	2013-09-03 15:30:12.389704	13	1	teofilo-otoni
3482	Timóteo	2013-09-03 15:30:12.389704	13	1	timoteo
3483	Tiradentes	2013-09-03 15:30:12.389704	13	1	tiradentes
3484	Tiros	2013-09-03 15:30:12.389704	13	1	tiros
3485	Tocantins	2013-09-03 15:30:12.389704	13	1	tocantins
3486	Tocos do Moji	2013-09-03 15:30:12.389704	13	1	tocos-do-moji
3487	Toledo	2013-09-03 15:30:12.389704	13	1	toledo
3488	Tombos	2013-09-03 15:30:12.389704	13	1	tombos
3489	Três Corações	2013-09-03 15:30:12.389704	13	1	tres-coracoes
3490	Três Marias	2013-09-03 15:30:12.389704	13	1	tres-marias
3491	Três Pontas	2013-09-03 15:30:12.389704	13	1	tres-pontas
3492	Tumiritinga	2013-09-03 15:30:12.389704	13	1	tumiritinga
3493	Tupaciguara	2013-09-03 15:30:12.389704	13	1	tupaciguara
3494	Turmalina	2013-09-03 15:30:12.389704	13	1	turmalina
3495	Turvolândia	2013-09-03 15:30:12.389704	13	1	turvolandia
3496	Ubá	2013-09-03 15:30:12.389704	13	1	uba
3497	Ubaí	2013-09-03 15:30:12.389704	13	1	ubai
3498	Ubaporanga	2013-09-03 15:30:12.389704	13	1	ubaporanga
3499	Uberaba	2013-09-03 15:30:12.389704	13	1	uberaba
3500	Uberlândia	2013-09-03 15:30:12.389704	13	1	uberlandia
3501	Umburatiba	2013-09-03 15:30:12.389704	13	1	umburatiba
3502	Unaí	2013-09-03 15:30:12.389704	13	1	unai
3503	União de Minas	2013-09-03 15:30:12.389704	13	1	uniao-de-minas
3504	Uruana de Minas	2013-09-03 15:30:12.389704	13	1	uruana-de-minas
3505	Urucânia	2013-09-03 15:30:12.389704	13	1	urucania
3506	Urucuia	2013-09-03 15:30:12.389704	13	1	urucuia
3507	Vargem Alegre	2013-09-03 15:30:12.389704	13	1	vargem-alegre
3508	Vargem Bonita	2013-09-03 15:30:12.389704	13	1	vargem-bonita
3509	Vargem Grande do Rio Pardo	2013-09-03 15:30:12.389704	13	1	vargem-grande-do-rio-pardo
3510	Varginha	2013-09-03 15:30:12.389704	13	1	varginha
3511	Varjão de Minas	2013-09-03 15:30:12.389704	13	1	varjao-de-minas
3512	Várzea da Palma	2013-09-03 15:30:12.389704	13	1	varzea-da-palma
3513	Varzelândia	2013-09-03 15:30:12.389704	13	1	varzelandia
3514	Vazante	2013-09-03 15:30:12.389704	13	1	vazante
3515	Verdelândia	2013-09-03 15:30:12.389704	13	1	verdelandia
3516	Veredinha	2013-09-03 15:30:12.389704	13	1	veredinha
3517	Veríssimo	2013-09-03 15:30:12.389704	13	1	verissimo
3518	Vermelho Novo	2013-09-03 15:30:12.389704	13	1	vermelho-novo
3519	Vespasiano	2013-09-03 15:30:12.389704	13	1	vespasiano
3520	Viçosa	2013-09-03 15:30:12.389704	13	1	vicosa
3521	Vieiras	2013-09-03 15:30:12.389704	13	1	vieiras
3522	Virgem da Lapa	2013-09-03 15:30:12.389704	13	1	virgem-da-lapa
3523	Virgínia	2013-09-03 15:30:12.389704	13	1	virginia
3524	Virginópolis	2013-09-03 15:30:12.389704	13	1	virginopolis
3525	Virgolândia	2013-09-03 15:30:12.389704	13	1	virgolandia
3526	Visconde do Rio Branco	2013-09-03 15:30:12.389704	13	1	visconde-do-rio-branco
3527	Volta Grande	2013-09-03 15:30:12.389704	13	1	volta-grande
3528	Wenceslau Braz	2013-09-03 15:30:12.389704	13	1	wenceslau-braz
3699	Abaetetuba	2013-09-03 15:30:12.389704	14	1	abaetetuba
3700	Abel Figueiredo	2013-09-03 15:30:12.389704	14	1	abel-figueiredo
3701	Acará	2013-09-03 15:30:12.389704	14	1	acara
3702	Afuá	2013-09-03 15:30:12.389704	14	1	afua
3703	Água Azul do Norte	2013-09-03 15:30:12.389704	14	1	agua-azul-do-norte
3704	Alenquer	2013-09-03 15:30:12.389704	14	1	alenquer
3705	Almeirim	2013-09-03 15:30:12.389704	14	1	almeirim
3706	Altamira	2013-09-03 15:30:12.389704	14	1	altamira
3707	Anajás	2013-09-03 15:30:12.389704	14	1	anajas
3708	Ananindeua	2013-09-03 15:30:12.389704	14	1	ananindeua
3709	Anapu	2013-09-03 15:30:12.389704	14	1	anapu
3710	Augusto Corrêa	2013-09-03 15:30:12.389704	14	1	augusto-correa
3711	Aurora do Pará	2013-09-03 15:30:12.389704	14	1	aurora-do-para
3712	Aveiro	2013-09-03 15:30:12.389704	14	1	aveiro
3713	Bagre	2013-09-03 15:30:12.389704	14	1	bagre
3714	Baião	2013-09-03 15:30:12.389704	14	1	baiao
3715	Bannach	2013-09-03 15:30:12.389704	14	1	bannach
3716	Barcarena	2013-09-03 15:30:12.389704	14	1	barcarena
3717	Belém	2013-09-03 15:30:12.389704	14	1	belem
3718	Belterra	2013-09-03 15:30:12.389704	14	1	belterra
3719	Benevides	2013-09-03 15:30:12.389704	14	1	benevides
3720	Bom Jesus do Tocantins	2013-09-03 15:30:12.389704	14	1	bom-jesus-do-tocantins
3721	Bonito	2013-09-03 15:30:12.389704	14	1	bonito
3722	Bragança	2013-09-03 15:30:12.389704	14	1	braganca
3723	Brasil Novo	2013-09-03 15:30:12.389704	14	1	brasil-novo
3724	Brejo Grande do Araguaia	2013-09-03 15:30:12.389704	14	1	brejo-grande-do-araguaia
3725	Breu Branco	2013-09-03 15:30:12.389704	14	1	breu-branco
3726	Breves	2013-09-03 15:30:12.389704	14	1	breves
3727	Bujaru	2013-09-03 15:30:12.389704	14	1	bujaru
3728	Cachoeira do Arari	2013-09-03 15:30:12.389704	14	1	cachoeira-do-arari
3729	Cachoeira do Piriá	2013-09-03 15:30:12.389704	14	1	cachoeira-do-piria
3730	Cametá	2013-09-03 15:30:12.389704	14	1	cameta
3731	Canaã dos Carajás	2013-09-03 15:30:12.389704	14	1	canaa-dos-carajas
3732	Capanema	2013-09-03 15:30:12.389704	14	1	capanema
3733	Capitão Poço	2013-09-03 15:30:12.389704	14	1	capitao-poco
3734	Castanhal	2013-09-03 15:30:12.389704	14	1	castanhal
3735	Chaves	2013-09-03 15:30:12.389704	14	1	chaves
3736	Colares	2013-09-03 15:30:12.389704	14	1	colares
3737	Conceição do Araguaia	2013-09-03 15:30:12.389704	14	1	conceicao-do-araguaia
3738	Concórdia do Pará	2013-09-03 15:30:12.389704	14	1	concordia-do-para
3739	Cumaru do Norte	2013-09-03 15:30:12.389704	14	1	cumaru-do-norte
3740	Curionópolis	2013-09-03 15:30:12.389704	14	1	curionopolis
3741	Curralinho	2013-09-03 15:30:12.389704	14	1	curralinho
3742	Curuá	2013-09-03 15:30:12.389704	14	1	curua
3743	Curuçá	2013-09-03 15:30:12.389704	14	1	curuca
3744	Dom Eliseu	2013-09-03 15:30:12.389704	14	1	dom-eliseu
3745	Eldorado dos Carajás	2013-09-03 15:30:12.389704	14	1	eldorado-dos-carajas
3746	Faro	2013-09-03 15:30:12.389704	14	1	faro
3747	Floresta do Araguaia	2013-09-03 15:30:12.389704	14	1	floresta-do-araguaia
3748	Garrafão do Norte	2013-09-03 15:30:12.389704	14	1	garrafao-do-norte
3749	Goianésia do Pará	2013-09-03 15:30:12.389704	14	1	goianesia-do-para
3750	Gurupá	2013-09-03 15:30:12.389704	14	1	gurupa
3751	Igarapé-Açu	2013-09-03 15:30:12.389704	14	1	igarape-acu
3752	Igarapé-Miri	2013-09-03 15:30:12.389704	14	1	igarape-miri
3753	Inhangapi	2013-09-03 15:30:12.389704	14	1	inhangapi
3754	Ipixuna do Pará	2013-09-03 15:30:12.389704	14	1	ipixuna-do-para
3755	Irituia	2013-09-03 15:30:12.389704	14	1	irituia
3756	Itaituba	2013-09-03 15:30:12.389704	14	1	itaituba
3757	Itupiranga	2013-09-03 15:30:12.389704	14	1	itupiranga
3758	Jacareacanga	2013-09-03 15:30:12.389704	14	1	jacareacanga
3759	Jacundá	2013-09-03 15:30:12.389704	14	1	jacunda
3760	Juruti	2013-09-03 15:30:12.389704	14	1	juruti
3761	Limoeiro do Ajuru	2013-09-03 15:30:12.389704	14	1	limoeiro-do-ajuru
3762	Mãe do Rio	2013-09-03 15:30:12.389704	14	1	mae-do-rio
3763	Magalhães Barata	2013-09-03 15:30:12.389704	14	1	magalhaes-barata
3764	Marabá	2013-09-03 15:30:12.389704	14	1	maraba
3765	Maracanã	2013-09-03 15:30:12.389704	14	1	maracana
3766	Marapanim	2013-09-03 15:30:12.389704	14	1	marapanim
3767	Marituba	2013-09-03 15:30:12.389704	14	1	marituba
3768	Medicilândia	2013-09-03 15:30:12.389704	14	1	medicilandia
3769	Melgaço	2013-09-03 15:30:12.389704	14	1	melgaco
3770	Mocajuba	2013-09-03 15:30:12.389704	14	1	mocajuba
3771	Moju	2013-09-03 15:30:12.389704	14	1	moju
3772	Monte Alegre	2013-09-03 15:30:12.389704	14	1	monte-alegre
3773	Muaná	2013-09-03 15:30:12.389704	14	1	muana
3774	Nova Esperança do Piriá	2013-09-03 15:30:12.389704	14	1	nova-esperanca-do-piria
3775	Nova Ipixuna	2013-09-03 15:30:12.389704	14	1	nova-ipixuna
3776	Nova Timboteua	2013-09-03 15:30:12.389704	14	1	nova-timboteua
3777	Novo Progresso	2013-09-03 15:30:12.389704	14	1	novo-progresso
3778	Novo Repartimento	2013-09-03 15:30:12.389704	14	1	novo-repartimento
3779	Óbidos	2013-09-03 15:30:12.389704	14	1	obidos
3780	Oeiras do Pará	2013-09-03 15:30:12.389704	14	1	oeiras-do-para
3781	Oriximiná	2013-09-03 15:30:12.389704	14	1	oriximina
3782	Ourém	2013-09-03 15:30:12.389704	14	1	ourem
3783	Ourilândia do Norte	2013-09-03 15:30:12.389704	14	1	ourilandia-do-norte
3784	Pacajá	2013-09-03 15:30:12.389704	14	1	pacaja
3785	Palestina do Pará	2013-09-03 15:30:12.389704	14	1	palestina-do-para
3786	Paragominas	2013-09-03 15:30:12.389704	14	1	paragominas
3787	Parauapebas	2013-09-03 15:30:12.389704	14	1	parauapebas
3788	Pau d`Arco	2013-09-03 15:30:12.389704	14	1	pau-d-arco
3789	Peixe-Boi	2013-09-03 15:30:12.389704	14	1	peixe-boi
3790	Piçarra	2013-09-03 15:30:12.389704	14	1	picarra
3791	Placas	2013-09-03 15:30:12.389704	14	1	placas
3792	Ponta de Pedras	2013-09-03 15:30:12.389704	14	1	ponta-de-pedras
3793	Portel	2013-09-03 15:30:12.389704	14	1	portel
3794	Porto de Moz	2013-09-03 15:30:12.389704	14	1	porto-de-moz
3795	Prainha	2013-09-03 15:30:12.389704	14	1	prainha
3796	Primavera	2013-09-03 15:30:12.389704	14	1	primavera
3797	Quatipuru	2013-09-03 15:30:12.389704	14	1	quatipuru
3798	Redenção	2013-09-03 15:30:12.389704	14	1	redencao
3799	Rio Maria	2013-09-03 15:30:12.389704	14	1	rio-maria
3800	Rondon do Pará	2013-09-03 15:30:12.389704	14	1	rondon-do-para
3801	Rurópolis	2013-09-03 15:30:12.389704	14	1	ruropolis
3802	Salinópolis	2013-09-03 15:30:12.389704	14	1	salinopolis
3803	Salvaterra	2013-09-03 15:30:12.389704	14	1	salvaterra
3804	Santa Bárbara do Pará	2013-09-03 15:30:12.389704	14	1	santa-barbara-do-para
3805	Santa Cruz do Arari	2013-09-03 15:30:12.389704	14	1	santa-cruz-do-arari
3806	Santa Isabel do Pará	2013-09-03 15:30:12.389704	14	1	santa-isabel-do-para
3807	Santa Luzia do Pará	2013-09-03 15:30:12.389704	14	1	santa-luzia-do-para
3808	Santa Maria das Barreiras	2013-09-03 15:30:12.389704	14	1	santa-maria-das-barreiras
3809	Santa Maria do Pará	2013-09-03 15:30:12.389704	14	1	santa-maria-do-para
3810	Santana do Araguaia	2013-09-03 15:30:12.389704	14	1	santana-do-araguaia
3811	Santarém	2013-09-03 15:30:12.389704	14	1	santarem
3812	Santarém Novo	2013-09-03 15:30:12.389704	14	1	santarem-novo
3813	Santo Antônio do Tauá	2013-09-03 15:30:12.389704	14	1	santo-antonio-do-taua
3814	São Caetano de Odivelas	2013-09-03 15:30:12.389704	14	1	sao-caetano-de-odivelas
3815	São Domingos do Araguaia	2013-09-03 15:30:12.389704	14	1	sao-domingos-do-araguaia
3816	São Domingos do Capim	2013-09-03 15:30:12.389704	14	1	sao-domingos-do-capim
3817	São Félix do Xingu	2013-09-03 15:30:12.389704	14	1	sao-felix-do-xingu
3818	São Francisco do Pará	2013-09-03 15:30:12.389704	14	1	sao-francisco-do-para
3819	São Geraldo do Araguaia	2013-09-03 15:30:12.389704	14	1	sao-geraldo-do-araguaia
3820	São João da Ponta	2013-09-03 15:30:12.389704	14	1	sao-joao-da-ponta
3821	São João de Pirabas	2013-09-03 15:30:12.389704	14	1	sao-joao-de-pirabas
3822	São João do Araguaia	2013-09-03 15:30:12.389704	14	1	sao-joao-do-araguaia
3823	São Miguel do Guamá	2013-09-03 15:30:12.389704	14	1	sao-miguel-do-guama
3824	São Sebastião da Boa Vista	2013-09-03 15:30:12.389704	14	1	sao-sebastiao-da-boa-vista
3825	Sapucaia	2013-09-03 15:30:12.389704	14	1	sapucaia
3826	Senador José Porfírio	2013-09-03 15:30:12.389704	14	1	senador-jose-porfirio
3827	Soure	2013-09-03 15:30:12.389704	14	1	soure
3828	Tailândia	2013-09-03 15:30:12.389704	14	1	tailandia
3829	Terra Alta	2013-09-03 15:30:12.389704	14	1	terra-alta
3830	Terra Santa	2013-09-03 15:30:12.389704	14	1	terra-santa
3831	Tomé-Açu	2013-09-03 15:30:12.389704	14	1	tome-acu
3832	Tracuateua	2013-09-03 15:30:12.389704	14	1	tracuateua
3833	Trairão	2013-09-03 15:30:12.389704	14	1	trairao
3834	Tucumã	2013-09-03 15:30:12.389704	14	1	tucuma
3835	Tucuruí	2013-09-03 15:30:12.389704	14	1	tucurui
3836	Ulianópolis	2013-09-03 15:30:12.389704	14	1	ulianopolis
3837	Uruará	2013-09-03 15:30:12.389704	14	1	uruara
3838	Vigia	2013-09-03 15:30:12.389704	14	1	vigia
3839	Viseu	2013-09-03 15:30:12.389704	14	1	viseu
3840	Vitória do Xingu	2013-09-03 15:30:12.389704	14	1	vitoria-do-xingu
3841	Xinguara	2013-09-03 15:30:12.389704	14	1	xinguara
3954	Água Branca	2013-09-03 15:30:12.389704	15	1	agua-branca
3955	Aguiar	2013-09-03 15:30:12.389704	15	1	aguiar
3956	Alagoa Grande	2013-09-03 15:30:12.389704	15	1	alagoa-grande
3957	Alagoa Nova	2013-09-03 15:30:12.389704	15	1	alagoa-nova
3958	Alagoinha	2013-09-03 15:30:12.389704	15	1	alagoinha
3959	Alcantil	2013-09-03 15:30:12.389704	15	1	alcantil
3960	Algodão de Jandaíra	2013-09-03 15:30:12.389704	15	1	algodao-de-jandaira
3961	Alhandra	2013-09-03 15:30:12.389704	15	1	alhandra
3962	Amparo	2013-09-03 15:30:12.389704	15	1	amparo
3963	Aparecida	2013-09-03 15:30:12.389704	15	1	aparecida
3964	Araçagi	2013-09-03 15:30:12.389704	15	1	aracagi
3965	Arara	2013-09-03 15:30:12.389704	15	1	arara
3966	Araruna	2013-09-03 15:30:12.389704	15	1	araruna
3967	Areia	2013-09-03 15:30:12.389704	15	1	areia
3968	Areia de Baraúnas	2013-09-03 15:30:12.389704	15	1	areia-de-baraunas
3969	Areial	2013-09-03 15:30:12.389704	15	1	areial
3970	Aroeiras	2013-09-03 15:30:12.389704	15	1	aroeiras
3971	Assunção	2013-09-03 15:30:12.389704	15	1	assuncao
3972	Baía da Traição	2013-09-03 15:30:12.389704	15	1	baia-da-traicao
3973	Bananeiras	2013-09-03 15:30:12.389704	15	1	bananeiras
3974	Baraúna	2013-09-03 15:30:12.389704	15	1	barauna
3975	Barra de Santa Rosa	2013-09-03 15:30:12.389704	15	1	barra-de-santa-rosa
3976	Barra de Santana	2013-09-03 15:30:12.389704	15	1	barra-de-santana
3977	Barra de São Miguel	2013-09-03 15:30:12.389704	15	1	barra-de-sao-miguel
3978	Bayeux	2013-09-03 15:30:12.389704	15	1	bayeux
3979	Belém	2013-09-03 15:30:12.389704	15	1	belem
3980	Belém do Brejo do Cruz	2013-09-03 15:30:12.389704	15	1	belem-do-brejo-do-cruz
3981	Bernardino Batista	2013-09-03 15:30:12.389704	15	1	bernardino-batista
3982	Boa Ventura	2013-09-03 15:30:12.389704	15	1	boa-ventura
3983	Boa Vista	2013-09-03 15:30:12.389704	15	1	boa-vista
3984	Bom Jesus	2013-09-03 15:30:12.389704	15	1	bom-jesus
3985	Bom Sucesso	2013-09-03 15:30:12.389704	15	1	bom-sucesso
3986	Bonito de Santa Fé	2013-09-03 15:30:12.389704	15	1	bonito-de-santa-fe
3987	Boqueirão	2013-09-03 15:30:12.389704	15	1	boqueirao
3988	Borborema	2013-09-03 15:30:12.389704	15	1	borborema
3989	Brejo do Cruz	2013-09-03 15:30:12.389704	15	1	brejo-do-cruz
3990	Brejo dos Santos	2013-09-03 15:30:12.389704	15	1	brejo-dos-santos
3991	Caaporã	2013-09-03 15:30:12.389704	15	1	caapora
3992	Cabaceiras	2013-09-03 15:30:12.389704	15	1	cabaceiras
3993	Cabedelo	2013-09-03 15:30:12.389704	15	1	cabedelo
3994	Cachoeira dos Índios	2013-09-03 15:30:12.389704	15	1	cachoeira-dos-indios
3995	Cacimba de Areia	2013-09-03 15:30:12.389704	15	1	cacimba-de-areia
3996	Cacimba de Dentro	2013-09-03 15:30:12.389704	15	1	cacimba-de-dentro
3997	Cacimbas	2013-09-03 15:30:12.389704	15	1	cacimbas
3998	Caiçara	2013-09-03 15:30:12.389704	15	1	caicara
3999	Cajazeiras	2013-09-03 15:30:12.389704	15	1	cajazeiras
4000	Cajazeirinhas	2013-09-03 15:30:12.389704	15	1	cajazeirinhas
4001	Caldas Brandão	2013-09-03 15:30:12.389704	15	1	caldas-brandao
4002	Camalaú	2013-09-03 15:30:12.389704	15	1	camalau
4003	Campina Grande	2013-09-03 15:30:12.389704	15	1	campina-grande
4004	Campo de Santana	2013-09-03 15:30:12.389704	15	1	campo-de-santana
4005	Capim	2013-09-03 15:30:12.389704	15	1	capim
4006	Caraúbas	2013-09-03 15:30:12.389704	15	1	caraubas
4007	Carrapateira	2013-09-03 15:30:12.389704	15	1	carrapateira
4008	Casserengue	2013-09-03 15:30:12.389704	15	1	casserengue
4009	Catingueira	2013-09-03 15:30:12.389704	15	1	catingueira
4010	Catolé do Rocha	2013-09-03 15:30:12.389704	15	1	catole-do-rocha
4011	Caturité	2013-09-03 15:30:12.389704	15	1	caturite
4012	Conceição	2013-09-03 15:30:12.389704	15	1	conceicao
4013	Condado	2013-09-03 15:30:12.389704	15	1	condado
4014	Conde	2013-09-03 15:30:12.389704	15	1	conde
4015	Congo	2013-09-03 15:30:12.389704	15	1	congo
4016	Coremas	2013-09-03 15:30:12.389704	15	1	coremas
4017	Coxixola	2013-09-03 15:30:12.389704	15	1	coxixola
4018	Cruz do Espírito Santo	2013-09-03 15:30:12.389704	15	1	cruz-do-espirito-santo
4019	Cubati	2013-09-03 15:30:12.389704	15	1	cubati
4020	Cuité	2013-09-03 15:30:12.389704	15	1	cuite
4021	Cuité de Mamanguape	2013-09-03 15:30:12.389704	15	1	cuite-de-mamanguape
4022	Cuitegi	2013-09-03 15:30:12.389704	15	1	cuitegi
4023	Curral de Cima	2013-09-03 15:30:12.389704	15	1	curral-de-cima
4024	Curral Velho	2013-09-03 15:30:12.389704	15	1	curral-velho
4025	Damião	2013-09-03 15:30:12.389704	15	1	damiao
4026	Desterro	2013-09-03 15:30:12.389704	15	1	desterro
4027	Diamante	2013-09-03 15:30:12.389704	15	1	diamante
4028	Dona Inês	2013-09-03 15:30:12.389704	15	1	dona-ines
4029	Duas Estradas	2013-09-03 15:30:12.389704	15	1	duas-estradas
4030	Emas	2013-09-03 15:30:12.389704	15	1	emas
4031	Esperança	2013-09-03 15:30:12.389704	15	1	esperanca
4032	Fagundes	2013-09-03 15:30:12.389704	15	1	fagundes
4033	Frei Martinho	2013-09-03 15:30:12.389704	15	1	frei-martinho
4034	Gado Bravo	2013-09-03 15:30:12.389704	15	1	gado-bravo
4035	Guarabira	2013-09-03 15:30:12.389704	15	1	guarabira
4036	Gurinhém	2013-09-03 15:30:12.389704	15	1	gurinhem
4037	Gurjão	2013-09-03 15:30:12.389704	15	1	gurjao
4038	Ibiara	2013-09-03 15:30:12.389704	15	1	ibiara
4039	Igaracy	2013-09-03 15:30:12.389704	15	1	igaracy
4040	Imaculada	2013-09-03 15:30:12.389704	15	1	imaculada
4041	Ingá	2013-09-03 15:30:12.389704	15	1	inga
4042	Itabaiana	2013-09-03 15:30:12.389704	15	1	itabaiana
4043	Itaporanga	2013-09-03 15:30:12.389704	15	1	itaporanga
4044	Itapororoca	2013-09-03 15:30:12.389704	15	1	itapororoca
4045	Itatuba	2013-09-03 15:30:12.389704	15	1	itatuba
4046	Jacaraú	2013-09-03 15:30:12.389704	15	1	jacarau
4047	Jericó	2013-09-03 15:30:12.389704	15	1	jerico
4048	João Pessoa	2013-09-03 15:30:12.389704	15	1	joao-pessoa
4049	Juarez Távora	2013-09-03 15:30:12.389704	15	1	juarez-tavora
4050	Juazeirinho	2013-09-03 15:30:12.389704	15	1	juazeirinho
4051	Junco do Seridó	2013-09-03 15:30:12.389704	15	1	junco-do-serido
4052	Juripiranga	2013-09-03 15:30:12.389704	15	1	juripiranga
4053	Juru	2013-09-03 15:30:12.389704	15	1	juru
4054	Lagoa	2013-09-03 15:30:12.389704	15	1	lagoa
4055	Lagoa de Dentro	2013-09-03 15:30:12.389704	15	1	lagoa-de-dentro
4056	Lagoa Seca	2013-09-03 15:30:12.389704	15	1	lagoa-seca
4057	Lastro	2013-09-03 15:30:12.389704	15	1	lastro
4058	Livramento	2013-09-03 15:30:12.389704	15	1	livramento
4059	Logradouro	2013-09-03 15:30:12.389704	15	1	logradouro
4060	Lucena	2013-09-03 15:30:12.389704	15	1	lucena
4061	Mãe d`Água	2013-09-03 15:30:12.389704	15	1	mae-d-agua
4062	Malta	2013-09-03 15:30:12.389704	15	1	malta
4063	Mamanguape	2013-09-03 15:30:12.389704	15	1	mamanguape
4064	Manaíra	2013-09-03 15:30:12.389704	15	1	manaira
4065	Marcação	2013-09-03 15:30:12.389704	15	1	marcacao
4066	Mari	2013-09-03 15:30:12.389704	15	1	mari
4067	Marizópolis	2013-09-03 15:30:12.389704	15	1	marizopolis
4068	Massaranduba	2013-09-03 15:30:12.389704	15	1	massaranduba
4069	Mataraca	2013-09-03 15:30:12.389704	15	1	mataraca
4070	Matinhas	2013-09-03 15:30:12.389704	15	1	matinhas
4071	Mato Grosso	2013-09-03 15:30:12.389704	15	1	mato-grosso
4072	Maturéia	2013-09-03 15:30:12.389704	15	1	matureia
4073	Mogeiro	2013-09-03 15:30:12.389704	15	1	mogeiro
4074	Montadas	2013-09-03 15:30:12.389704	15	1	montadas
4075	Monte Horebe	2013-09-03 15:30:12.389704	15	1	monte-horebe
4076	Monteiro	2013-09-03 15:30:12.389704	15	1	monteiro
4077	Mulungu	2013-09-03 15:30:12.389704	15	1	mulungu
4078	Natuba	2013-09-03 15:30:12.389704	15	1	natuba
4079	Nazarezinho	2013-09-03 15:30:12.389704	15	1	nazarezinho
4080	Nova Floresta	2013-09-03 15:30:12.389704	15	1	nova-floresta
4081	Nova Olinda	2013-09-03 15:30:12.389704	15	1	nova-olinda
4082	Nova Palmeira	2013-09-03 15:30:12.389704	15	1	nova-palmeira
4083	Olho d`Água	2013-09-03 15:30:12.389704	15	1	olho-d-agua
4084	Olivedos	2013-09-03 15:30:12.389704	15	1	olivedos
4085	Ouro Velho	2013-09-03 15:30:12.389704	15	1	ouro-velho
4086	Parari	2013-09-03 15:30:12.389704	15	1	parari
4087	Passagem	2013-09-03 15:30:12.389704	15	1	passagem
4088	Patos	2013-09-03 15:30:12.389704	15	1	patos
4089	Paulista	2013-09-03 15:30:12.389704	15	1	paulista
4090	Pedra Branca	2013-09-03 15:30:12.389704	15	1	pedra-branca
4091	Pedra Lavrada	2013-09-03 15:30:12.389704	15	1	pedra-lavrada
4092	Pedras de Fogo	2013-09-03 15:30:12.389704	15	1	pedras-de-fogo
4093	Pedro Régis	2013-09-03 15:30:12.389704	15	1	pedro-regis
4094	Piancó	2013-09-03 15:30:12.389704	15	1	pianco
4095	Picuí	2013-09-03 15:30:12.389704	15	1	picui
4096	Pilar	2013-09-03 15:30:12.389704	15	1	pilar
4097	Pilões	2013-09-03 15:30:12.389704	15	1	piloes
4098	Pilõezinhos	2013-09-03 15:30:12.389704	15	1	piloezinhos
4099	Pirpirituba	2013-09-03 15:30:12.389704	15	1	pirpirituba
4100	Pitimbu	2013-09-03 15:30:12.389704	15	1	pitimbu
4101	Pocinhos	2013-09-03 15:30:12.389704	15	1	pocinhos
4102	Poço Dantas	2013-09-03 15:30:12.389704	15	1	poco-dantas
4103	Poço de José de Moura	2013-09-03 15:30:12.389704	15	1	poco-de-jose-de-moura
4104	Pombal	2013-09-03 15:30:12.389704	15	1	pombal
4105	Prata	2013-09-03 15:30:12.389704	15	1	prata
4106	Princesa Isabel	2013-09-03 15:30:12.389704	15	1	princesa-isabel
4107	Puxinanã	2013-09-03 15:30:12.389704	15	1	puxinana
4108	Queimadas	2013-09-03 15:30:12.389704	15	1	queimadas
4109	Quixabá	2013-09-03 15:30:12.389704	15	1	quixaba
4110	Remígio	2013-09-03 15:30:12.389704	15	1	remigio
4111	Riachão	2013-09-03 15:30:12.389704	15	1	riachao
4112	Riachão do Bacamarte	2013-09-03 15:30:12.389704	15	1	riachao-do-bacamarte
4113	Riachão do Poço	2013-09-03 15:30:12.389704	15	1	riachao-do-poco
4114	Riacho de Santo Antônio	2013-09-03 15:30:12.389704	15	1	riacho-de-santo-antonio
4115	Riacho dos Cavalos	2013-09-03 15:30:12.389704	15	1	riacho-dos-cavalos
4116	Rio Tinto	2013-09-03 15:30:12.389704	15	1	rio-tinto
4117	Salgadinho	2013-09-03 15:30:12.389704	15	1	salgadinho
4118	Salgado de São Félix	2013-09-03 15:30:12.389704	15	1	salgado-de-sao-felix
4119	Santa Cecília	2013-09-03 15:30:12.389704	15	1	santa-cecilia
4120	Santa Cruz	2013-09-03 15:30:12.389704	15	1	santa-cruz
4121	Santa Helena	2013-09-03 15:30:12.389704	15	1	santa-helena
4122	Santa Inês	2013-09-03 15:30:12.389704	15	1	santa-ines
4123	Santa Luzia	2013-09-03 15:30:12.389704	15	1	santa-luzia
4124	Santa Rita	2013-09-03 15:30:12.389704	15	1	santa-rita
4125	Santa Teresinha	2013-09-03 15:30:12.389704	15	1	santa-teresinha
4126	Santana de Mangueira	2013-09-03 15:30:12.389704	15	1	santana-de-mangueira
4127	Santana dos Garrotes	2013-09-03 15:30:12.389704	15	1	santana-dos-garrotes
4128	Santarém	2013-09-03 15:30:12.389704	15	1	santarem
4129	Santo André	2013-09-03 15:30:12.389704	15	1	santo-andre
4130	São Bentinho	2013-09-03 15:30:12.389704	15	1	sao-bentinho
4131	São Bento	2013-09-03 15:30:12.389704	15	1	sao-bento
4132	São Domingos de Pombal	2013-09-03 15:30:12.389704	15	1	sao-domingos-de-pombal
4133	São Domingos do Cariri	2013-09-03 15:30:12.389704	15	1	sao-domingos-do-cariri
4134	São Francisco	2013-09-03 15:30:12.389704	15	1	sao-francisco
4135	São João do Cariri	2013-09-03 15:30:12.389704	15	1	sao-joao-do-cariri
4136	São João do Rio do Peixe	2013-09-03 15:30:12.389704	15	1	sao-joao-do-rio-do-peixe
4137	São João do Tigre	2013-09-03 15:30:12.389704	15	1	sao-joao-do-tigre
4138	São José da Lagoa Tapada	2013-09-03 15:30:12.389704	15	1	sao-jose-da-lagoa-tapada
4139	São José de Caiana	2013-09-03 15:30:12.389704	15	1	sao-jose-de-caiana
4140	São José de Espinharas	2013-09-03 15:30:12.389704	15	1	sao-jose-de-espinharas
4141	São José de Piranhas	2013-09-03 15:30:12.389704	15	1	sao-jose-de-piranhas
4142	São José de Princesa	2013-09-03 15:30:12.389704	15	1	sao-jose-de-princesa
4143	São José do Bonfim	2013-09-03 15:30:12.389704	15	1	sao-jose-do-bonfim
4144	São José do Brejo do Cruz	2013-09-03 15:30:12.389704	15	1	sao-jose-do-brejo-do-cruz
4145	São José do Sabugi	2013-09-03 15:30:12.389704	15	1	sao-jose-do-sabugi
4146	São José dos Cordeiros	2013-09-03 15:30:12.389704	15	1	sao-jose-dos-cordeiros
4147	São José dos Ramos	2013-09-03 15:30:12.389704	15	1	sao-jose-dos-ramos
4148	São Mamede	2013-09-03 15:30:12.389704	15	1	sao-mamede
4149	São Miguel de Taipu	2013-09-03 15:30:12.389704	15	1	sao-miguel-de-taipu
4150	São Sebastião de Lagoa de Roça	2013-09-03 15:30:12.389704	15	1	sao-sebastiao-de-lagoa-de-roca
4151	São Sebastião do Umbuzeiro	2013-09-03 15:30:12.389704	15	1	sao-sebastiao-do-umbuzeiro
4152	Sapé	2013-09-03 15:30:12.389704	15	1	sape
4153	Seridó	2013-09-03 15:30:12.389704	15	1	serido
4154	Serra Branca	2013-09-03 15:30:12.389704	15	1	serra-branca
4155	Serra da Raiz	2013-09-03 15:30:12.389704	15	1	serra-da-raiz
4156	Serra Grande	2013-09-03 15:30:12.389704	15	1	serra-grande
4157	Serra Redonda	2013-09-03 15:30:12.389704	15	1	serra-redonda
4158	Serraria	2013-09-03 15:30:12.389704	15	1	serraria
4159	Sertãozinho	2013-09-03 15:30:12.389704	15	1	sertaozinho
4160	Sobrado	2013-09-03 15:30:12.389704	15	1	sobrado
4161	Solânea	2013-09-03 15:30:12.389704	15	1	solanea
4162	Soledade	2013-09-03 15:30:12.389704	15	1	soledade
4163	Sossêgo	2013-09-03 15:30:12.389704	15	1	sossego
4164	Sousa	2013-09-03 15:30:12.389704	15	1	sousa
4165	Sumé	2013-09-03 15:30:12.389704	15	1	sume
4166	Taperoá	2013-09-03 15:30:12.389704	15	1	taperoa
4167	Tavares	2013-09-03 15:30:12.389704	15	1	tavares
4168	Teixeira	2013-09-03 15:30:12.389704	15	1	teixeira
4169	Tenório	2013-09-03 15:30:12.389704	15	1	tenorio
4170	Triunfo	2013-09-03 15:30:12.389704	15	1	triunfo
4171	Uiraúna	2013-09-03 15:30:12.389704	15	1	uirauna
4172	Umbuzeiro	2013-09-03 15:30:12.389704	15	1	umbuzeiro
4173	Várzea	2013-09-03 15:30:12.389704	15	1	varzea
4174	Vieirópolis	2013-09-03 15:30:12.389704	15	1	vieiropolis
4175	Vista Serrana	2013-09-03 15:30:12.389704	15	1	vista-serrana
4176	Zabelê	2013-09-03 15:30:12.389704	15	1	zabele
4209	Abatiá	2013-09-03 15:30:12.389704	16	1	abatia
4210	Adrianópolis	2013-09-03 15:30:12.389704	16	1	adrianopolis
4211	Agudos do Sul	2013-09-03 15:30:12.389704	16	1	agudos-do-sul
4212	Almirante Tamandaré	2013-09-03 15:30:12.389704	16	1	almirante-tamandare
4213	Altamira do Paraná	2013-09-03 15:30:12.389704	16	1	altamira-do-parana
4214	Alto Paraíso	2013-09-03 15:30:12.389704	16	1	alto-paraiso
4215	Alto Paraná	2013-09-03 15:30:12.389704	16	1	alto-parana
4216	Alto Piquiri	2013-09-03 15:30:12.389704	16	1	alto-piquiri
4217	Altônia	2013-09-03 15:30:12.389704	16	1	altonia
4218	Alvorada do Sul	2013-09-03 15:30:12.389704	16	1	alvorada-do-sul
4219	Amaporã	2013-09-03 15:30:12.389704	16	1	amapora
4220	Ampére	2013-09-03 15:30:12.389704	16	1	ampere
4221	Anahy	2013-09-03 15:30:12.389704	16	1	anahy
4222	Andirá	2013-09-03 15:30:12.389704	16	1	andira
4223	Ângulo	2013-09-03 15:30:12.389704	16	1	angulo
4224	Antonina	2013-09-03 15:30:12.389704	16	1	antonina
4225	Antônio Olinto	2013-09-03 15:30:12.389704	16	1	antonio-olinto
4226	Apucarana	2013-09-03 15:30:12.389704	16	1	apucarana
4227	Arapongas	2013-09-03 15:30:12.389704	16	1	arapongas
4228	Arapoti	2013-09-03 15:30:12.389704	16	1	arapoti
4229	Arapuã	2013-09-03 15:30:12.389704	16	1	arapua
4230	Araruna	2013-09-03 15:30:12.389704	16	1	araruna
4231	Araucária	2013-09-03 15:30:12.389704	16	1	araucaria
4232	Ariranha do Ivaí	2013-09-03 15:30:12.389704	16	1	ariranha-do-ivai
4233	Assaí	2013-09-03 15:30:12.389704	16	1	assai
4234	Assis Chateaubriand	2013-09-03 15:30:12.389704	16	1	assis-chateaubriand
4235	Astorga	2013-09-03 15:30:12.389704	16	1	astorga
4236	Atalaia	2013-09-03 15:30:12.389704	16	1	atalaia
4237	Balsa Nova	2013-09-03 15:30:12.389704	16	1	balsa-nova
4238	Bandeirantes	2013-09-03 15:30:12.389704	16	1	bandeirantes
4239	Barbosa Ferraz	2013-09-03 15:30:12.389704	16	1	barbosa-ferraz
4240	Barra do Jacaré	2013-09-03 15:30:12.389704	16	1	barra-do-jacare
4241	Barracão	2013-09-03 15:30:12.389704	16	1	barracao
4242	Bela Vista da Caroba	2013-09-03 15:30:12.389704	16	1	bela-vista-da-caroba
4243	Bela Vista do Paraíso	2013-09-03 15:30:12.389704	16	1	bela-vista-do-paraiso
4244	Bituruna	2013-09-03 15:30:12.389704	16	1	bituruna
4245	Boa Esperança	2013-09-03 15:30:12.389704	16	1	boa-esperanca
4246	Boa Esperança do Iguaçu	2013-09-03 15:30:12.389704	16	1	boa-esperanca-do-iguacu
4247	Boa Ventura de São Roque	2013-09-03 15:30:12.389704	16	1	boa-ventura-de-sao-roque
4248	Boa Vista da Aparecida	2013-09-03 15:30:12.389704	16	1	boa-vista-da-aparecida
4249	Bocaiúva do Sul	2013-09-03 15:30:12.389704	16	1	bocaiuva-do-sul
4250	Bom Jesus do Sul	2013-09-03 15:30:12.389704	16	1	bom-jesus-do-sul
4251	Bom Sucesso	2013-09-03 15:30:12.389704	16	1	bom-sucesso
4252	Bom Sucesso do Sul	2013-09-03 15:30:12.389704	16	1	bom-sucesso-do-sul
4253	Borrazópolis	2013-09-03 15:30:12.389704	16	1	borrazopolis
4254	Braganey	2013-09-03 15:30:12.389704	16	1	braganey
4255	Brasilândia do Sul	2013-09-03 15:30:12.389704	16	1	brasilandia-do-sul
4256	Cafeara	2013-09-03 15:30:12.389704	16	1	cafeara
4257	Cafelândia	2013-09-03 15:30:12.389704	16	1	cafelandia
4258	Cafezal do Sul	2013-09-03 15:30:12.389704	16	1	cafezal-do-sul
4259	Califórnia	2013-09-03 15:30:12.389704	16	1	california
4260	Cambará	2013-09-03 15:30:12.389704	16	1	cambara
4261	Cambé	2013-09-03 15:30:12.389704	16	1	cambe
4262	Cambira	2013-09-03 15:30:12.389704	16	1	cambira
4263	Campina da Lagoa	2013-09-03 15:30:12.389704	16	1	campina-da-lagoa
4264	Campina do Simão	2013-09-03 15:30:12.389704	16	1	campina-do-simao
4265	Campina Grande do Sul	2013-09-03 15:30:12.389704	16	1	campina-grande-do-sul
4266	Campo Bonito	2013-09-03 15:30:12.389704	16	1	campo-bonito
4267	Campo do Tenente	2013-09-03 15:30:12.389704	16	1	campo-do-tenente
4268	Campo Largo	2013-09-03 15:30:12.389704	16	1	campo-largo
4269	Campo Magro	2013-09-03 15:30:12.389704	16	1	campo-magro
4270	Campo Mourão	2013-09-03 15:30:12.389704	16	1	campo-mourao
4271	Cândido de Abreu	2013-09-03 15:30:12.389704	16	1	candido-de-abreu
4272	Candói	2013-09-03 15:30:12.389704	16	1	candoi
4273	Cantagalo	2013-09-03 15:30:12.389704	16	1	cantagalo
4274	Capanema	2013-09-03 15:30:12.389704	16	1	capanema
4275	Capitão Leônidas Marques	2013-09-03 15:30:12.389704	16	1	capitao-leonidas-marques
4276	Carambeí	2013-09-03 15:30:12.389704	16	1	carambei
4277	Carlópolis	2013-09-03 15:30:12.389704	16	1	carlopolis
4278	Cascavel	2013-09-03 15:30:12.389704	16	1	cascavel
4279	Castro	2013-09-03 15:30:12.389704	16	1	castro
4280	Catanduvas	2013-09-03 15:30:12.389704	16	1	catanduvas
4281	Centenário do Sul	2013-09-03 15:30:12.389704	16	1	centenario-do-sul
4282	Cerro Azul	2013-09-03 15:30:12.389704	16	1	cerro-azul
4283	Céu Azul	2013-09-03 15:30:12.389704	16	1	ceu-azul
4284	Chopinzinho	2013-09-03 15:30:12.389704	16	1	chopinzinho
4285	Cianorte	2013-09-03 15:30:12.389704	16	1	cianorte
4286	Cidade Gaúcha	2013-09-03 15:30:12.389704	16	1	cidade-gaucha
4287	Clevelândia	2013-09-03 15:30:12.389704	16	1	clevelandia
4288	Colombo	2013-09-03 15:30:12.389704	16	1	colombo
4289	Colorado	2013-09-03 15:30:12.389704	16	1	colorado
4290	Congonhinhas	2013-09-03 15:30:12.389704	16	1	congonhinhas
4291	Conselheiro Mairinck	2013-09-03 15:30:12.389704	16	1	conselheiro-mairinck
4292	Contenda	2013-09-03 15:30:12.389704	16	1	contenda
4293	Corbélia	2013-09-03 15:30:12.389704	16	1	corbelia
4294	Cornélio Procópio	2013-09-03 15:30:12.389704	16	1	cornelio-procopio
4295	Coronel Domingos Soares	2013-09-03 15:30:12.389704	16	1	coronel-domingos-soares
4296	Coronel Vivida	2013-09-03 15:30:12.389704	16	1	coronel-vivida
4297	Corumbataí do Sul	2013-09-03 15:30:12.389704	16	1	corumbatai-do-sul
4298	Cruz Machado	2013-09-03 15:30:12.389704	16	1	cruz-machado
4299	Cruzeiro do Iguaçu	2013-09-03 15:30:12.389704	16	1	cruzeiro-do-iguacu
4300	Cruzeiro do Oeste	2013-09-03 15:30:12.389704	16	1	cruzeiro-do-oeste
4301	Cruzeiro do Sul	2013-09-03 15:30:12.389704	16	1	cruzeiro-do-sul
4302	Cruzmaltina	2013-09-03 15:30:12.389704	16	1	cruzmaltina
4303	Curitiba	2013-09-03 15:30:12.389704	16	1	curitiba
4304	Curiúva	2013-09-03 15:30:12.389704	16	1	curiuva
4305	Diamante d`Oeste	2013-09-03 15:30:12.389704	16	1	diamante-d-oeste
4306	Diamante do Norte	2013-09-03 15:30:12.389704	16	1	diamante-do-norte
4307	Diamante do Sul	2013-09-03 15:30:12.389704	16	1	diamante-do-sul
4308	Dois Vizinhos	2013-09-03 15:30:12.389704	16	1	dois-vizinhos
4309	Douradina	2013-09-03 15:30:12.389704	16	1	douradina
4310	Doutor Camargo	2013-09-03 15:30:12.389704	16	1	doutor-camargo
4311	Doutor Ulysses	2013-09-03 15:30:12.389704	16	1	doutor-ulysses
4312	Enéas Marques	2013-09-03 15:30:12.389704	16	1	eneas-marques
4313	Engenheiro Beltrão	2013-09-03 15:30:12.389704	16	1	engenheiro-beltrao
4314	Entre Rios do Oeste	2013-09-03 15:30:12.389704	16	1	entre-rios-do-oeste
4315	Esperança Nova	2013-09-03 15:30:12.389704	16	1	esperanca-nova
4316	Espigão Alto do Iguaçu	2013-09-03 15:30:12.389704	16	1	espigao-alto-do-iguacu
4317	Farol	2013-09-03 15:30:12.389704	16	1	farol
4318	Faxinal	2013-09-03 15:30:12.389704	16	1	faxinal
4319	Fazenda Rio Grande	2013-09-03 15:30:12.389704	16	1	fazenda-rio-grande
4320	Fênix	2013-09-03 15:30:12.389704	16	1	fenix
4321	Fernandes Pinheiro	2013-09-03 15:30:12.389704	16	1	fernandes-pinheiro
4322	Figueira	2013-09-03 15:30:12.389704	16	1	figueira
4323	Flor da Serra do Sul	2013-09-03 15:30:12.389704	16	1	flor-da-serra-do-sul
4324	Floraí	2013-09-03 15:30:12.389704	16	1	florai
4325	Floresta	2013-09-03 15:30:12.389704	16	1	floresta
4326	Florestópolis	2013-09-03 15:30:12.389704	16	1	florestopolis
4327	Flórida	2013-09-03 15:30:12.389704	16	1	florida
4328	Formosa do Oeste	2013-09-03 15:30:12.389704	16	1	formosa-do-oeste
4329	Foz do Iguaçu	2013-09-03 15:30:12.389704	16	1	foz-do-iguacu
4330	Foz do Jordão	2013-09-03 15:30:12.389704	16	1	foz-do-jordao
4331	Francisco Alves	2013-09-03 15:30:12.389704	16	1	francisco-alves
4332	Francisco Beltrão	2013-09-03 15:30:12.389704	16	1	francisco-beltrao
4333	General Carneiro	2013-09-03 15:30:12.389704	16	1	general-carneiro
4334	Godoy Moreira	2013-09-03 15:30:12.389704	16	1	godoy-moreira
4335	Goioerê	2013-09-03 15:30:12.389704	16	1	goioere
4336	Goioxim	2013-09-03 15:30:12.389704	16	1	goioxim
4337	Grandes Rios	2013-09-03 15:30:12.389704	16	1	grandes-rios
4338	Guaíra	2013-09-03 15:30:12.389704	16	1	guaira
4339	Guairaçá	2013-09-03 15:30:12.389704	16	1	guairaca
4340	Guamiranga	2013-09-03 15:30:12.389704	16	1	guamiranga
4341	Guapirama	2013-09-03 15:30:12.389704	16	1	guapirama
4342	Guaporema	2013-09-03 15:30:12.389704	16	1	guaporema
4343	Guaraci	2013-09-03 15:30:12.389704	16	1	guaraci
4344	Guaraniaçu	2013-09-03 15:30:12.389704	16	1	guaraniacu
4345	Guarapuava	2013-09-03 15:30:12.389704	16	1	guarapuava
4346	Guaraqueçaba	2013-09-03 15:30:12.389704	16	1	guaraquecaba
4347	Guaratuba	2013-09-03 15:30:12.389704	16	1	guaratuba
4348	Honório Serpa	2013-09-03 15:30:12.389704	16	1	honorio-serpa
4349	Ibaiti	2013-09-03 15:30:12.389704	16	1	ibaiti
4350	Ibema	2013-09-03 15:30:12.389704	16	1	ibema
4351	Ibiporã	2013-09-03 15:30:12.389704	16	1	ibipora
4352	Icaraíma	2013-09-03 15:30:12.389704	16	1	icaraima
4353	Iguaraçu	2013-09-03 15:30:12.389704	16	1	iguaracu
4354	Iguatu	2013-09-03 15:30:12.389704	16	1	iguatu
4355	Imbaú	2013-09-03 15:30:12.389704	16	1	imbau
4356	Imbituva	2013-09-03 15:30:12.389704	16	1	imbituva
4357	Inácio Martins	2013-09-03 15:30:12.389704	16	1	inacio-martins
4358	Inajá	2013-09-03 15:30:12.389704	16	1	inaja
4359	Indianópolis	2013-09-03 15:30:12.389704	16	1	indianopolis
4360	Ipiranga	2013-09-03 15:30:12.389704	16	1	ipiranga
4361	Iporã	2013-09-03 15:30:12.389704	16	1	ipora
4362	Iracema do Oeste	2013-09-03 15:30:12.389704	16	1	iracema-do-oeste
4363	Irati	2013-09-03 15:30:12.389704	16	1	irati
4364	Iretama	2013-09-03 15:30:12.389704	16	1	iretama
4365	Itaguajé	2013-09-03 15:30:12.389704	16	1	itaguaje
4366	Itaipulândia	2013-09-03 15:30:12.389704	16	1	itaipulandia
4367	Itambaracá	2013-09-03 15:30:12.389704	16	1	itambaraca
4368	Itambé	2013-09-03 15:30:12.389704	16	1	itambe
4369	Itapejara d`Oeste	2013-09-03 15:30:12.389704	16	1	itapejara-d-oeste
4370	Itaperuçu	2013-09-03 15:30:12.389704	16	1	itaperucu
4371	Itaúna do Sul	2013-09-03 15:30:12.389704	16	1	itauna-do-sul
4372	Ivaí	2013-09-03 15:30:12.389704	16	1	ivai
4373	Ivaiporã	2013-09-03 15:30:12.389704	16	1	ivaipora
4374	Ivaté	2013-09-03 15:30:12.389704	16	1	ivate
4375	Ivatuba	2013-09-03 15:30:12.389704	16	1	ivatuba
4376	Jaboti	2013-09-03 15:30:12.389704	16	1	jaboti
4377	Jacarezinho	2013-09-03 15:30:12.389704	16	1	jacarezinho
4378	Jaguapitã	2013-09-03 15:30:12.389704	16	1	jaguapita
4379	Jaguariaíva	2013-09-03 15:30:12.389704	16	1	jaguariaiva
4380	Jandaia do Sul	2013-09-03 15:30:12.389704	16	1	jandaia-do-sul
4381	Janiópolis	2013-09-03 15:30:12.389704	16	1	janiopolis
4382	Japira	2013-09-03 15:30:12.389704	16	1	japira
4383	Japurá	2013-09-03 15:30:12.389704	16	1	japura
4384	Jardim Alegre	2013-09-03 15:30:12.389704	16	1	jardim-alegre
4385	Jardim Olinda	2013-09-03 15:30:12.389704	16	1	jardim-olinda
4386	Jataizinho	2013-09-03 15:30:12.389704	16	1	jataizinho
4387	Jesuítas	2013-09-03 15:30:12.389704	16	1	jesuitas
4388	Joaquim Távora	2013-09-03 15:30:12.389704	16	1	joaquim-tavora
4389	Jundiaí do Sul	2013-09-03 15:30:12.389704	16	1	jundiai-do-sul
4390	Juranda	2013-09-03 15:30:12.389704	16	1	juranda
4391	Jussara	2013-09-03 15:30:12.389704	16	1	jussara
4392	Kaloré	2013-09-03 15:30:12.389704	16	1	kalore
4393	Lapa	2013-09-03 15:30:12.389704	16	1	lapa
4394	Laranjal	2013-09-03 15:30:12.389704	16	1	laranjal
4395	Laranjeiras do Sul	2013-09-03 15:30:12.389704	16	1	laranjeiras-do-sul
4396	Leópolis	2013-09-03 15:30:12.389704	16	1	leopolis
4397	Lidianópolis	2013-09-03 15:30:12.389704	16	1	lidianopolis
4398	Lindoeste	2013-09-03 15:30:12.389704	16	1	lindoeste
4399	Loanda	2013-09-03 15:30:12.389704	16	1	loanda
4400	Lobato	2013-09-03 15:30:12.389704	16	1	lobato
4401	Londrina	2013-09-03 15:30:12.389704	16	1	londrina
4402	Luiziana	2013-09-03 15:30:12.389704	16	1	luiziana
4403	Lunardelli	2013-09-03 15:30:12.389704	16	1	lunardelli
4404	Lupionópolis	2013-09-03 15:30:12.389704	16	1	lupionopolis
4405	Mallet	2013-09-03 15:30:12.389704	16	1	mallet
4406	Mamborê	2013-09-03 15:30:12.389704	16	1	mambore
4407	Mandaguaçu	2013-09-03 15:30:12.389704	16	1	mandaguacu
4408	Mandaguari	2013-09-03 15:30:12.389704	16	1	mandaguari
4409	Mandirituba	2013-09-03 15:30:12.389704	16	1	mandirituba
4410	Manfrinópolis	2013-09-03 15:30:12.389704	16	1	manfrinopolis
4411	Mangueirinha	2013-09-03 15:30:12.389704	16	1	mangueirinha
4412	Manoel Ribas	2013-09-03 15:30:12.389704	16	1	manoel-ribas
4413	Marechal Cândido Rondon	2013-09-03 15:30:12.389704	16	1	marechal-candido-rondon
4414	Maria Helena	2013-09-03 15:30:12.389704	16	1	maria-helena
4415	Marialva	2013-09-03 15:30:12.389704	16	1	marialva
4416	Marilândia do Sul	2013-09-03 15:30:12.389704	16	1	marilandia-do-sul
4417	Marilena	2013-09-03 15:30:12.389704	16	1	marilena
4418	Mariluz	2013-09-03 15:30:12.389704	16	1	mariluz
4419	Maringá	2013-09-03 15:30:12.389704	16	1	maringa
4420	Mariópolis	2013-09-03 15:30:12.389704	16	1	mariopolis
4421	Maripá	2013-09-03 15:30:12.389704	16	1	maripa
4422	Marmeleiro	2013-09-03 15:30:12.389704	16	1	marmeleiro
4423	Marquinho	2013-09-03 15:30:12.389704	16	1	marquinho
4424	Marumbi	2013-09-03 15:30:12.389704	16	1	marumbi
4425	Matelândia	2013-09-03 15:30:12.389704	16	1	matelandia
4426	Matinhos	2013-09-03 15:30:12.389704	16	1	matinhos
4427	Mato Rico	2013-09-03 15:30:12.389704	16	1	mato-rico
4428	Mauá da Serra	2013-09-03 15:30:12.389704	16	1	maua-da-serra
4429	Medianeira	2013-09-03 15:30:12.389704	16	1	medianeira
4430	Mercedes	2013-09-03 15:30:12.389704	16	1	mercedes
4431	Mirador	2013-09-03 15:30:12.389704	16	1	mirador
4432	Miraselva	2013-09-03 15:30:12.389704	16	1	miraselva
4433	Missal	2013-09-03 15:30:12.389704	16	1	missal
4434	Moreira Sales	2013-09-03 15:30:12.389704	16	1	moreira-sales
4435	Morretes	2013-09-03 15:30:12.389704	16	1	morretes
4436	Munhoz de Melo	2013-09-03 15:30:12.389704	16	1	munhoz-de-melo
4437	Nossa Senhora das Graças	2013-09-03 15:30:12.389704	16	1	nossa-senhora-das-gracas
4438	Nova Aliança do Ivaí	2013-09-03 15:30:12.389704	16	1	nova-alianca-do-ivai
4439	Nova América da Colina	2013-09-03 15:30:12.389704	16	1	nova-america-da-colina
4440	Nova Aurora	2013-09-03 15:30:12.389704	16	1	nova-aurora
4441	Nova Cantu	2013-09-03 15:30:12.389704	16	1	nova-cantu
4442	Nova Esperança	2013-09-03 15:30:12.389704	16	1	nova-esperanca
4443	Nova Esperança do Sudoeste	2013-09-03 15:30:12.389704	16	1	nova-esperanca-do-sudoeste
4444	Nova Fátima	2013-09-03 15:30:12.389704	16	1	nova-fatima
4445	Nova Laranjeiras	2013-09-03 15:30:12.389704	16	1	nova-laranjeiras
4446	Nova Londrina	2013-09-03 15:30:12.389704	16	1	nova-londrina
4447	Nova Olímpia	2013-09-03 15:30:12.389704	16	1	nova-olimpia
4448	Nova Prata do Iguaçu	2013-09-03 15:30:12.389704	16	1	nova-prata-do-iguacu
4449	Nova Santa Bárbara	2013-09-03 15:30:12.389704	16	1	nova-santa-barbara
4450	Nova Santa Rosa	2013-09-03 15:30:12.389704	16	1	nova-santa-rosa
4451	Nova Tebas	2013-09-03 15:30:12.389704	16	1	nova-tebas
4452	Novo Itacolomi	2013-09-03 15:30:12.389704	16	1	novo-itacolomi
4453	Ortigueira	2013-09-03 15:30:12.389704	16	1	ortigueira
4454	Ourizona	2013-09-03 15:30:12.389704	16	1	ourizona
4455	Ouro Verde do Oeste	2013-09-03 15:30:12.389704	16	1	ouro-verde-do-oeste
4456	Paiçandu	2013-09-03 15:30:12.389704	16	1	paicandu
4457	Palmas	2013-09-03 15:30:12.389704	16	1	palmas
4458	Palmeira	2013-09-03 15:30:12.389704	16	1	palmeira
4459	Palmital	2013-09-03 15:30:12.389704	16	1	palmital
4460	Palotina	2013-09-03 15:30:12.389704	16	1	palotina
4461	Paraíso do Norte	2013-09-03 15:30:12.389704	16	1	paraiso-do-norte
4462	Paranacity	2013-09-03 15:30:12.389704	16	1	paranacity
4463	Paranaguá	2013-09-03 15:30:12.389704	16	1	paranagua
4464	Paranapoema	2013-09-03 15:30:12.389704	16	1	paranapoema
4465	Paranavaí	2013-09-03 15:30:12.389704	16	1	paranavai
4466	Pato Bragado	2013-09-03 15:30:12.389704	16	1	pato-bragado
4467	Pato Branco	2013-09-03 15:30:12.389704	16	1	pato-branco
4468	Paula Freitas	2013-09-03 15:30:12.389704	16	1	paula-freitas
4469	Paulo Frontin	2013-09-03 15:30:12.389704	16	1	paulo-frontin
4470	Peabiru	2013-09-03 15:30:12.389704	16	1	peabiru
4471	Perobal	2013-09-03 15:30:12.389704	16	1	perobal
4472	Pérola	2013-09-03 15:30:12.389704	16	1	perola
4473	Pérola d`Oeste	2013-09-03 15:30:12.389704	16	1	perola-d-oeste
4474	Piên	2013-09-03 15:30:12.389704	16	1	pien
4475	Pinhais	2013-09-03 15:30:12.389704	16	1	pinhais
4476	Pinhal de São Bento	2013-09-03 15:30:12.389704	16	1	pinhal-de-sao-bento
4477	Pinhalão	2013-09-03 15:30:12.389704	16	1	pinhalao
4478	Pinhão	2013-09-03 15:30:12.389704	16	1	pinhao
4479	Piraí do Sul	2013-09-03 15:30:12.389704	16	1	pirai-do-sul
4480	Piraquara	2013-09-03 15:30:12.389704	16	1	piraquara
4481	Pitanga	2013-09-03 15:30:12.389704	16	1	pitanga
4482	Pitangueiras	2013-09-03 15:30:12.389704	16	1	pitangueiras
4483	Planaltina do Paraná	2013-09-03 15:30:12.389704	16	1	planaltina-do-parana
4484	Planalto	2013-09-03 15:30:12.389704	16	1	planalto
4485	Ponta Grossa	2013-09-03 15:30:12.389704	16	1	ponta-grossa
4486	Pontal do Paraná	2013-09-03 15:30:12.389704	16	1	pontal-do-parana
4487	Porecatu	2013-09-03 15:30:12.389704	16	1	porecatu
4488	Porto Amazonas	2013-09-03 15:30:12.389704	16	1	porto-amazonas
4489	Porto Barreiro	2013-09-03 15:30:12.389704	16	1	porto-barreiro
4490	Porto Rico	2013-09-03 15:30:12.389704	16	1	porto-rico
4491	Porto Vitória	2013-09-03 15:30:12.389704	16	1	porto-vitoria
4492	Prado Ferreira	2013-09-03 15:30:12.389704	16	1	prado-ferreira
4493	Pranchita	2013-09-03 15:30:12.389704	16	1	pranchita
4494	Presidente Castelo Branco	2013-09-03 15:30:12.389704	16	1	presidente-castelo-branco
4495	Primeiro de Maio	2013-09-03 15:30:12.389704	16	1	primeiro-de-maio
4496	Prudentópolis	2013-09-03 15:30:12.389704	16	1	prudentopolis
4497	Quarto Centenário	2013-09-03 15:30:12.389704	16	1	quarto-centenario
4498	Quatiguá	2013-09-03 15:30:12.389704	16	1	quatigua
4499	Quatro Barras	2013-09-03 15:30:12.389704	16	1	quatro-barras
4500	Quatro Pontes	2013-09-03 15:30:12.389704	16	1	quatro-pontes
4501	Quedas do Iguaçu	2013-09-03 15:30:12.389704	16	1	quedas-do-iguacu
4502	Querência do Norte	2013-09-03 15:30:12.389704	16	1	querencia-do-norte
4503	Quinta do Sol	2013-09-03 15:30:12.389704	16	1	quinta-do-sol
4504	Quitandinha	2013-09-03 15:30:12.389704	16	1	quitandinha
4505	Ramilândia	2013-09-03 15:30:12.389704	16	1	ramilandia
4506	Rancho Alegre	2013-09-03 15:30:12.389704	16	1	rancho-alegre
4507	Rancho Alegre d`Oeste	2013-09-03 15:30:12.389704	16	1	rancho-alegre-d-oeste
4508	Realeza	2013-09-03 15:30:12.389704	16	1	realeza
4509	Rebouças	2013-09-03 15:30:12.389704	16	1	reboucas
4510	Renascença	2013-09-03 15:30:12.389704	16	1	renascenca
4511	Reserva	2013-09-03 15:30:12.389704	16	1	reserva
4512	Reserva do Iguaçu	2013-09-03 15:30:12.389704	16	1	reserva-do-iguacu
4513	Ribeirão Claro	2013-09-03 15:30:12.389704	16	1	ribeirao-claro
4514	Ribeirão do Pinhal	2013-09-03 15:30:12.389704	16	1	ribeirao-do-pinhal
4515	Rio Azul	2013-09-03 15:30:12.389704	16	1	rio-azul
4516	Rio Bom	2013-09-03 15:30:12.389704	16	1	rio-bom
4517	Rio Bonito do Iguaçu	2013-09-03 15:30:12.389704	16	1	rio-bonito-do-iguacu
4518	Rio Branco do Ivaí	2013-09-03 15:30:12.389704	16	1	rio-branco-do-ivai
4519	Rio Branco do Sul	2013-09-03 15:30:12.389704	16	1	rio-branco-do-sul
4520	Rio Negro	2013-09-03 15:30:12.389704	16	1	rio-negro
4521	Rolândia	2013-09-03 15:30:12.389704	16	1	rolandia
4522	Roncador	2013-09-03 15:30:12.389704	16	1	roncador
4523	Rondon	2013-09-03 15:30:12.389704	16	1	rondon
4524	Rosário do Ivaí	2013-09-03 15:30:12.389704	16	1	rosario-do-ivai
4525	Sabáudia	2013-09-03 15:30:12.389704	16	1	sabaudia
4526	Salgado Filho	2013-09-03 15:30:12.389704	16	1	salgado-filho
4527	Salto do Itararé	2013-09-03 15:30:12.389704	16	1	salto-do-itarare
4528	Salto do Lontra	2013-09-03 15:30:12.389704	16	1	salto-do-lontra
4529	Santa Amélia	2013-09-03 15:30:12.389704	16	1	santa-amelia
4530	Santa Cecília do Pavão	2013-09-03 15:30:12.389704	16	1	santa-cecilia-do-pavao
4531	Santa Cruz de Monte Castelo	2013-09-03 15:30:12.389704	16	1	santa-cruz-de-monte-castelo
4532	Santa Fé	2013-09-03 15:30:12.389704	16	1	santa-fe
4533	Santa Helena	2013-09-03 15:30:12.389704	16	1	santa-helena
4534	Santa Inês	2013-09-03 15:30:12.389704	16	1	santa-ines
4535	Santa Isabel do Ivaí	2013-09-03 15:30:12.389704	16	1	santa-isabel-do-ivai
4536	Santa Izabel do Oeste	2013-09-03 15:30:12.389704	16	1	santa-izabel-do-oeste
4537	Santa Lúcia	2013-09-03 15:30:12.389704	16	1	santa-lucia
4538	Santa Maria do Oeste	2013-09-03 15:30:12.389704	16	1	santa-maria-do-oeste
4539	Santa Mariana	2013-09-03 15:30:12.389704	16	1	santa-mariana
4540	Santa Mônica	2013-09-03 15:30:12.389704	16	1	santa-monica
4541	Santa Tereza do Oeste	2013-09-03 15:30:12.389704	16	1	santa-tereza-do-oeste
4542	Santa Terezinha de Itaipu	2013-09-03 15:30:12.389704	16	1	santa-terezinha-de-itaipu
4543	Santana do Itararé	2013-09-03 15:30:12.389704	16	1	santana-do-itarare
4544	Santo Antônio da Platina	2013-09-03 15:30:12.389704	16	1	santo-antonio-da-platina
4545	Santo Antônio do Caiuá	2013-09-03 15:30:12.389704	16	1	santo-antonio-do-caiua
4546	Santo Antônio do Paraíso	2013-09-03 15:30:12.389704	16	1	santo-antonio-do-paraiso
4547	Santo Antônio do Sudoeste	2013-09-03 15:30:12.389704	16	1	santo-antonio-do-sudoeste
4548	Santo Inácio	2013-09-03 15:30:12.389704	16	1	santo-inacio
4549	São Carlos do Ivaí	2013-09-03 15:30:12.389704	16	1	sao-carlos-do-ivai
4550	São Jerônimo da Serra	2013-09-03 15:30:12.389704	16	1	sao-jeronimo-da-serra
4551	São João	2013-09-03 15:30:12.389704	16	1	sao-joao
4552	São João do Caiuá	2013-09-03 15:30:12.389704	16	1	sao-joao-do-caiua
4553	São João do Ivaí	2013-09-03 15:30:12.389704	16	1	sao-joao-do-ivai
4554	São João do Triunfo	2013-09-03 15:30:12.389704	16	1	sao-joao-do-triunfo
4555	São Jorge d`Oeste	2013-09-03 15:30:12.389704	16	1	sao-jorge-d-oeste
4556	São Jorge do Ivaí	2013-09-03 15:30:12.389704	16	1	sao-jorge-do-ivai
4557	São Jorge do Patrocínio	2013-09-03 15:30:12.389704	16	1	sao-jorge-do-patrocinio
4558	São José da Boa Vista	2013-09-03 15:30:12.389704	16	1	sao-jose-da-boa-vista
4559	São José\ndas Palmeiras	2013-09-03 15:30:12.389704	16	1	sao-jose-das-palmeiras
4560	São José dos Pinhais	2013-09-03 15:30:12.389704	16	1	sao-jose-dos-pinhais
4561	São Manoel do Paraná	2013-09-03 15:30:12.389704	16	1	sao-manoel-do-parana
4562	São Mateus do Sul	2013-09-03 15:30:12.389704	16	1	sao-mateus-do-sul
4563	São Miguel do Iguaçu	2013-09-03 15:30:12.389704	16	1	sao-miguel-do-iguacu
4564	São Pedro do Iguaçu	2013-09-03 15:30:12.389704	16	1	sao-pedro-do-iguacu
4565	São Pedro do Ivaí	2013-09-03 15:30:12.389704	16	1	sao-pedro-do-ivai
4566	São Pedro do Paraná	2013-09-03 15:30:12.389704	16	1	sao-pedro-do-parana
4567	São Sebastião da Amoreira	2013-09-03 15:30:12.389704	16	1	sao-sebastiao-da-amoreira
4568	São Tomé	2013-09-03 15:30:12.389704	16	1	sao-tome
4569	Sapopema	2013-09-03 15:30:12.389704	16	1	sapopema
4570	Sarandi	2013-09-03 15:30:12.389704	16	1	sarandi
4571	Saudade do Iguaçu	2013-09-03 15:30:12.389704	16	1	saudade-do-iguacu
4572	Sengés	2013-09-03 15:30:12.389704	16	1	senges
4573	Serranópolis do Iguaçu	2013-09-03 15:30:12.389704	16	1	serranopolis-do-iguacu
4574	Sertaneja	2013-09-03 15:30:12.389704	16	1	sertaneja
4575	Sertanópolis	2013-09-03 15:30:12.389704	16	1	sertanopolis
4576	Siqueira Campos	2013-09-03 15:30:12.389704	16	1	siqueira-campos
4577	Sulina	2013-09-03 15:30:12.389704	16	1	sulina
4578	Tamarana	2013-09-03 15:30:12.389704	16	1	tamarana
4579	Tamboara	2013-09-03 15:30:12.389704	16	1	tamboara
4580	Tapejara	2013-09-03 15:30:12.389704	16	1	tapejara
4581	Tapira	2013-09-03 15:30:12.389704	16	1	tapira
4582	Teixeira Soares	2013-09-03 15:30:12.389704	16	1	teixeira-soares
4583	Telêmaco Borba	2013-09-03 15:30:12.389704	16	1	telemaco-borba
4584	Terra Boa	2013-09-03 15:30:12.389704	16	1	terra-boa
4585	Terra Rica	2013-09-03 15:30:12.389704	16	1	terra-rica
4586	Terra Roxa	2013-09-03 15:30:12.389704	16	1	terra-roxa
4587	Tibagi	2013-09-03 15:30:12.389704	16	1	tibagi
4588	Tijucas do Sul	2013-09-03 15:30:12.389704	16	1	tijucas-do-sul
4589	Toledo	2013-09-03 15:30:12.389704	16	1	toledo
4590	Tomazina	2013-09-03 15:30:12.389704	16	1	tomazina
4591	Três Barras do Paraná	2013-09-03 15:30:12.389704	16	1	tres-barras-do-parana
4592	Tunas do Paraná	2013-09-03 15:30:12.389704	16	1	tunas-do-parana
4593	Tuneiras do Oeste	2013-09-03 15:30:12.389704	16	1	tuneiras-do-oeste
4594	Tupãssi	2013-09-03 15:30:12.389704	16	1	tupassi
4595	Turvo	2013-09-03 15:30:12.389704	16	1	turvo
4596	Ubiratã	2013-09-03 15:30:12.389704	16	1	ubirata
4597	Umuarama	2013-09-03 15:30:12.389704	16	1	umuarama
4598	União da Vitória	2013-09-03 15:30:12.389704	16	1	uniao-da-vitoria
4599	Uniflor	2013-09-03 15:30:12.389704	16	1	uniflor
4600	Uraí	2013-09-03 15:30:12.389704	16	1	urai
4601	Ventania	2013-09-03 15:30:12.389704	16	1	ventania
4602	Vera Cruz do Oeste	2013-09-03 15:30:12.389704	16	1	vera-cruz-do-oeste
4603	Verê	2013-09-03 15:30:12.389704	16	1	vere
4604	Virmond	2013-09-03 15:30:12.389704	16	1	virmond
4605	Vitorino	2013-09-03 15:30:12.389704	16	1	vitorino
4606	Wenceslau Braz	2013-09-03 15:30:12.389704	16	1	wenceslau-braz
4607	Xambrê	2013-09-03 15:30:12.389704	16	1	xambre
4720	Abreu e Lima	2013-09-03 15:30:12.389704	17	1	abreu-e-lima
4721	Afogados da Ingazeira	2013-09-03 15:30:12.389704	17	1	afogados-da-ingazeira
4722	Afrânio	2013-09-03 15:30:12.389704	17	1	afranio
4723	Agrestina	2013-09-03 15:30:12.389704	17	1	agrestina
4724	Água Preta	2013-09-03 15:30:12.389704	17	1	agua-preta
4725	Águas Belas	2013-09-03 15:30:12.389704	17	1	aguas-belas
4726	Alagoinha	2013-09-03 15:30:12.389704	17	1	alagoinha
4727	Aliança	2013-09-03 15:30:12.389704	17	1	alianca
4728	Altinho	2013-09-03 15:30:12.389704	17	1	altinho
4729	Amaraji	2013-09-03 15:30:12.389704	17	1	amaraji
4730	Angelim	2013-09-03 15:30:12.389704	17	1	angelim
4731	Araçoiaba	2013-09-03 15:30:12.389704	17	1	aracoiaba
4732	Araripina	2013-09-03 15:30:12.389704	17	1	araripina
4733	Arcoverde	2013-09-03 15:30:12.389704	17	1	arcoverde
4734	Barra de Guabiraba	2013-09-03 15:30:12.389704	17	1	barra-de-guabiraba
4735	Barreiros	2013-09-03 15:30:12.389704	17	1	barreiros
4736	Belém de Maria	2013-09-03 15:30:12.389704	17	1	belem-de-maria
4737	Belém de São Francisco	2013-09-03 15:30:12.389704	17	1	belem-de-sao-francisco
4738	Belo Jardim	2013-09-03 15:30:12.389704	17	1	belo-jardim
4739	Betânia	2013-09-03 15:30:12.389704	17	1	betania
4740	Bezerros	2013-09-03 15:30:12.389704	17	1	bezerros
4741	Bodocó	2013-09-03 15:30:12.389704	17	1	bodoco
4742	Bom Conselho	2013-09-03 15:30:12.389704	17	1	bom-conselho
4743	Bom Jardim	2013-09-03 15:30:12.389704	17	1	bom-jardim
4744	Bonito	2013-09-03 15:30:12.389704	17	1	bonito
4745	Brejão	2013-09-03 15:30:12.389704	17	1	brejao
4746	Brejinho	2013-09-03 15:30:12.389704	17	1	brejinho
4747	Brejo da Madre de Deus	2013-09-03 15:30:12.389704	17	1	brejo-da-madre-de-deus
4748	Buenos Aires	2013-09-03 15:30:12.389704	17	1	buenos-aires
4749	Buíque	2013-09-03 15:30:12.389704	17	1	buique
4750	Cabo de Santo Agostinho	2013-09-03 15:30:12.389704	17	1	cabo-de-santo-agostinho
4751	Cabrobó	2013-09-03 15:30:12.389704	17	1	cabrobo
4752	Cachoeirinha	2013-09-03 15:30:12.389704	17	1	cachoeirinha
4753	Caetés	2013-09-03 15:30:12.389704	17	1	caetes
4754	Calçado	2013-09-03 15:30:12.389704	17	1	calcado
4756	Camaragibe	2013-09-03 15:30:12.389704	17	1	camaragibe
4757	Camocim de São Félix	2013-09-03 15:30:12.389704	17	1	camocim-de-sao-felix
4758	Camutanga	2013-09-03 15:30:12.389704	17	1	camutanga
4759	Canhotinho	2013-09-03 15:30:12.389704	17	1	canhotinho
4760	Capoeiras	2013-09-03 15:30:12.389704	17	1	capoeiras
4761	Carnaíba	2013-09-03 15:30:12.389704	17	1	carnaiba
4762	Carnaubeira da Penha	2013-09-03 15:30:12.389704	17	1	carnaubeira-da-penha
4763	Carpina	2013-09-03 15:30:12.389704	17	1	carpina
4764	Caruaru	2013-09-03 15:30:12.389704	17	1	caruaru
4765	Casinhas	2013-09-03 15:30:12.389704	17	1	casinhas
4766	Catende	2013-09-03 15:30:12.389704	17	1	catende
4767	Cedro	2013-09-03 15:30:12.389704	17	1	cedro
4768	Chã de Alegria	2013-09-03 15:30:12.389704	17	1	cha-de-alegria
4769	Chã Grande	2013-09-03 15:30:12.389704	17	1	cha-grande
4770	Condado	2013-09-03 15:30:12.389704	17	1	condado
4771	Correntes	2013-09-03 15:30:12.389704	17	1	correntes
4772	Cortês	2013-09-03 15:30:12.389704	17	1	cortes
4773	Cumaru	2013-09-03 15:30:12.389704	17	1	cumaru
4774	Cupira	2013-09-03 15:30:12.389704	17	1	cupira
4775	Custódia	2013-09-03 15:30:12.389704	17	1	custodia
4776	Dormentes	2013-09-03 15:30:12.389704	17	1	dormentes
4777	Escada	2013-09-03 15:30:12.389704	17	1	escada
4778	Exu	2013-09-03 15:30:12.389704	17	1	exu
4779	Feira Nova	2013-09-03 15:30:12.389704	17	1	feira-nova
4780	Fernando de Noronha	2013-09-03 15:30:12.389704	17	1	fernando-de-noronha
4781	Ferreiros	2013-09-03 15:30:12.389704	17	1	ferreiros
4782	Flores	2013-09-03 15:30:12.389704	17	1	flores
4783	Floresta	2013-09-03 15:30:12.389704	17	1	floresta
4784	Frei Miguelinho	2013-09-03 15:30:12.389704	17	1	frei-miguelinho
4785	Gameleira	2013-09-03 15:30:12.389704	17	1	gameleira
4786	Garanhuns	2013-09-03 15:30:12.389704	17	1	garanhuns
4787	Glória do Goitá	2013-09-03 15:30:12.389704	17	1	gloria-do-goita
4788	Goiana	2013-09-03 15:30:12.389704	17	1	goiana
4789	Granito	2013-09-03 15:30:12.389704	17	1	granito
4790	Gravatá	2013-09-03 15:30:12.389704	17	1	gravata
4791	Iati	2013-09-03 15:30:12.389704	17	1	iati
4792	Ibimirim	2013-09-03 15:30:12.389704	17	1	ibimirim
4793	Ibirajuba	2013-09-03 15:30:12.389704	17	1	ibirajuba
4794	Igarassu	2013-09-03 15:30:12.389704	17	1	igarassu
4795	Iguaraci	2013-09-03 15:30:12.389704	17	1	iguaraci
4796	Ilha de Itamaracá	2013-09-03 15:30:12.389704	17	1	ilha-de-itamaraca
4797	Inajá	2013-09-03 15:30:12.389704	17	1	inaja
4798	Ingazeira	2013-09-03 15:30:12.389704	17	1	ingazeira
4799	Ipojuca	2013-09-03 15:30:12.389704	17	1	ipojuca
4800	Ipubi	2013-09-03 15:30:12.389704	17	1	ipubi
4801	Itacuruba	2013-09-03 15:30:12.389704	17	1	itacuruba
4802	Itaíba	2013-09-03 15:30:12.389704	17	1	itaiba
4803	Itambé	2013-09-03 15:30:12.389704	17	1	itambe
4804	Itapetim	2013-09-03 15:30:12.389704	17	1	itapetim
4805	Itapissuma	2013-09-03 15:30:12.389704	17	1	itapissuma
4806	Itaquitinga	2013-09-03 15:30:12.389704	17	1	itaquitinga
4807	Jaboatão dos Guararapes	2013-09-03 15:30:12.389704	17	1	jaboatao-dos-guararapes
4808	Jaqueira	2013-09-03 15:30:12.389704	17	1	jaqueira
4809	Jataúba	2013-09-03 15:30:12.389704	17	1	jatauba
4810	Jatobá	2013-09-03 15:30:12.389704	17	1	jatoba
4811	João Alfredo	2013-09-03 15:30:12.389704	17	1	joao-alfredo
4812	Joaquim Nabuco	2013-09-03 15:30:12.389704	17	1	joaquim-nabuco
4813	Jucati	2013-09-03 15:30:12.389704	17	1	jucati
4814	Jupi	2013-09-03 15:30:12.389704	17	1	jupi
4815	Jurema	2013-09-03 15:30:12.389704	17	1	jurema
4816	Lagoa do Carro	2013-09-03 15:30:12.389704	17	1	lagoa-do-carro
4817	Lagoa do Itaenga	2013-09-03 15:30:12.389704	17	1	lagoa-do-itaenga
4818	Lagoa do Ouro	2013-09-03 15:30:12.389704	17	1	lagoa-do-ouro
4819	Lagoa dos Gatos	2013-09-03 15:30:12.389704	17	1	lagoa-dos-gatos
4820	Lagoa Grande	2013-09-03 15:30:12.389704	17	1	lagoa-grande
4821	Lajedo	2013-09-03 15:30:12.389704	17	1	lajedo
4822	Limoeiro	2013-09-03 15:30:12.389704	17	1	limoeiro
4823	Macaparana	2013-09-03 15:30:12.389704	17	1	macaparana
4824	Machados	2013-09-03 15:30:12.389704	17	1	machados
4825	Manari	2013-09-03 15:30:12.389704	17	1	manari
4826	Maraial	2013-09-03 15:30:12.389704	17	1	maraial
4827	Mirandiba	2013-09-03 15:30:12.389704	17	1	mirandiba
4828	Moreilândia	2013-09-03 15:30:12.389704	17	1	moreilandia
4829	Moreno	2013-09-03 15:30:12.389704	17	1	moreno
4830	Nazaré da Mata	2013-09-03 15:30:12.389704	17	1	nazare-da-mata
4831	Olinda	2013-09-03 15:30:12.389704	17	1	olinda
4832	Orobó	2013-09-03 15:30:12.389704	17	1	orobo
4833	Orocó	2013-09-03 15:30:12.389704	17	1	oroco
4834	Ouricuri	2013-09-03 15:30:12.389704	17	1	ouricuri
4835	Palmares	2013-09-03 15:30:12.389704	17	1	palmares
4836	Palmeirina	2013-09-03 15:30:12.389704	17	1	palmeirina
4837	Panelas	2013-09-03 15:30:12.389704	17	1	panelas
4838	Paranatama	2013-09-03 15:30:12.389704	17	1	paranatama
4839	Parnamirim	2013-09-03 15:30:12.389704	17	1	parnamirim
4840	Passira	2013-09-03 15:30:12.389704	17	1	passira
4841	Paudalho	2013-09-03 15:30:12.389704	17	1	paudalho
4842	Paulista	2013-09-03 15:30:12.389704	17	1	paulista
4843	Pedra	2013-09-03 15:30:12.389704	17	1	pedra
4844	Pesqueira	2013-09-03 15:30:12.389704	17	1	pesqueira
4845	Petrolândia	2013-09-03 15:30:12.389704	17	1	petrolandia
4846	Petrolina	2013-09-03 15:30:12.389704	17	1	petrolina
4847	Poção	2013-09-03 15:30:12.389704	17	1	pocao
4848	Pombos	2013-09-03 15:30:12.389704	17	1	pombos
4849	Primavera	2013-09-03 15:30:12.389704	17	1	primavera
4850	Quipapá	2013-09-03 15:30:12.389704	17	1	quipapa
4851	Quixaba	2013-09-03 15:30:12.389704	17	1	quixaba
4852	Recife	2013-09-03 15:30:12.389704	17	1	recife
4853	Riacho das Almas	2013-09-03 15:30:12.389704	17	1	riacho-das-almas
4854	Ribeirão	2013-09-03 15:30:12.389704	17	1	ribeirao
4855	Rio Formoso	2013-09-03 15:30:12.389704	17	1	rio-formoso
4856	Sairé	2013-09-03 15:30:12.389704	17	1	saire
4857	Salgadinho	2013-09-03 15:30:12.389704	17	1	salgadinho
4858	Salgueiro	2013-09-03 15:30:12.389704	17	1	salgueiro
4859	Saloá	2013-09-03 15:30:12.389704	17	1	saloa
4860	Sanharó	2013-09-03 15:30:12.389704	17	1	sanharo
4861	Santa Cruz	2013-09-03 15:30:12.389704	17	1	santa-cruz
4862	Santa Cruz da Baixa Verde	2013-09-03 15:30:12.389704	17	1	santa-cruz-da-baixa-verde
4863	Santa Cruz do Capibaribe	2013-09-03 15:30:12.389704	17	1	santa-cruz-do-capibaribe
4864	Santa Filomena	2013-09-03 15:30:12.389704	17	1	santa-filomena
4865	Santa Maria da Boa Vista	2013-09-03 15:30:12.389704	17	1	santa-maria-da-boa-vista
4866	Santa Maria do Cambucá	2013-09-03 15:30:12.389704	17	1	santa-maria-do-cambuca
4867	Santa Terezinha	2013-09-03 15:30:12.389704	17	1	santa-terezinha
4868	São Benedito do Sul	2013-09-03 15:30:12.389704	17	1	sao-benedito-do-sul
4869	São Bento do Una	2013-09-03 15:30:12.389704	17	1	sao-bento-do-una
4870	São Caitano	2013-09-03 15:30:12.389704	17	1	sao-caitano
4871	São João	2013-09-03 15:30:12.389704	17	1	sao-joao
4872	São Joaquim do Monte	2013-09-03 15:30:12.389704	17	1	sao-joaquim-do-monte
4873	São José da Coroa Grande	2013-09-03 15:30:12.389704	17	1	sao-jose-da-coroa-grande
4874	São José do Belmonte	2013-09-03 15:30:12.389704	17	1	sao-jose-do-belmonte
4875	São José do Egito	2013-09-03 15:30:12.389704	17	1	sao-jose-do-egito
4876	São Lourenço da Mata	2013-09-03 15:30:12.389704	17	1	sao-lourenco-da-mata
4877	São Vicente Ferrer	2013-09-03 15:30:12.389704	17	1	sao-vicente-ferrer
4878	Serra Talhada	2013-09-03 15:30:12.389704	17	1	serra-talhada
4879	Serrita	2013-09-03 15:30:12.389704	17	1	serrita
4880	Sertânia	2013-09-03 15:30:12.389704	17	1	sertania
4881	Sirinhaém	2013-09-03 15:30:12.389704	17	1	sirinhaem
4882	Solidão	2013-09-03 15:30:12.389704	17	1	solidao
4883	Surubim	2013-09-03 15:30:12.389704	17	1	surubim
4884	Tabira	2013-09-03 15:30:12.389704	17	1	tabira
4885	Tacaimbó	2013-09-03 15:30:12.389704	17	1	tacaimbo
4886	Tacaratu	2013-09-03 15:30:12.389704	17	1	tacaratu
4887	Tamandaré	2013-09-03 15:30:12.389704	17	1	tamandare
4888	Taquaritinga do Norte	2013-09-03 15:30:12.389704	17	1	taquaritinga-do-norte
4889	Terezinha	2013-09-03 15:30:12.389704	17	1	terezinha
4890	Terra Nova	2013-09-03 15:30:12.389704	17	1	terra-nova
4891	Timbaúba	2013-09-03 15:30:12.389704	17	1	timbauba
4892	Toritama	2013-09-03 15:30:12.389704	17	1	toritama
4893	Tracunhaém	2013-09-03 15:30:12.389704	17	1	tracunhaem
4894	Trindade	2013-09-03 15:30:12.389704	17	1	trindade
4895	Triunfo	2013-09-03 15:30:12.389704	17	1	triunfo
4896	Tupanatinga	2013-09-03 15:30:12.389704	17	1	tupanatinga
4897	Tuparetama	2013-09-03 15:30:12.389704	17	1	tuparetama
4898	Venturosa	2013-09-03 15:30:12.389704	17	1	venturosa
4899	Verdejante	2013-09-03 15:30:12.389704	17	1	verdejante
4900	Vertente do Lério	2013-09-03 15:30:12.389704	17	1	vertente-do-lerio
4901	Vertentes	2013-09-03 15:30:12.389704	17	1	vertentes
4902	Vicência	2013-09-03 15:30:12.389704	17	1	vicencia
4903	Vitória de Santo Antão	2013-09-03 15:30:12.389704	17	1	vitoria-de-santo-antao
4904	Xexéu	2013-09-03 15:30:12.389704	17	1	xexeu
4975	Acauã	2013-09-03 15:30:12.389704	18	1	acaua
4976	Agricolândia	2013-09-03 15:30:12.389704	18	1	agricolandia
4977	Água Branca	2013-09-03 15:30:12.389704	18	1	agua-branca
4978	Alagoinha do Piauí	2013-09-03 15:30:12.389704	18	1	alagoinha-do-piaui
4979	Alegrete do Piauí	2013-09-03 15:30:12.389704	18	1	alegrete-do-piaui
4980	Alto Longá	2013-09-03 15:30:12.389704	18	1	alto-longa
4981	Altos	2013-09-03 15:30:12.389704	18	1	altos
4982	Alvorada do Gurguéia	2013-09-03 15:30:12.389704	18	1	alvorada-do-gurgueia
4983	Amarante	2013-09-03 15:30:12.389704	18	1	amarante
4984	Angical do Piauí	2013-09-03 15:30:12.389704	18	1	angical-do-piaui
4985	Anísio de Abreu	2013-09-03 15:30:12.389704	18	1	anisio-de-abreu
4986	Antônio Almeida	2013-09-03 15:30:12.389704	18	1	antonio-almeida
4987	Aroazes	2013-09-03 15:30:12.389704	18	1	aroazes
4988	Aroeiras do Itaim	2013-09-03 15:30:12.389704	18	1	aroeiras-do-itaim
4989	Arraial	2013-09-03 15:30:12.389704	18	1	arraial
4990	Assunção do Piauí	2013-09-03 15:30:12.389704	18	1	assuncao-do-piaui
4991	Avelino Lopes	2013-09-03 15:30:12.389704	18	1	avelino-lopes
4992	Baixa Grande do Ribeiro	2013-09-03 15:30:12.389704	18	1	baixa-grande-do-ribeiro
4993	Barra d`Alcântara	2013-09-03 15:30:12.389704	18	1	barra-d-alcantara
4994	Barras	2013-09-03 15:30:12.389704	18	1	barras
4995	Barreiras do Piauí	2013-09-03 15:30:12.389704	18	1	barreiras-do-piaui
4996	Barro Duro	2013-09-03 15:30:12.389704	18	1	barro-duro
4997	Batalha	2013-09-03 15:30:12.389704	18	1	batalha
4998	Bela Vista do Piauí	2013-09-03 15:30:12.389704	18	1	bela-vista-do-piaui
4999	Belém do Piauí	2013-09-03 15:30:12.389704	18	1	belem-do-piaui
5000	Beneditinos	2013-09-03 15:30:12.389704	18	1	beneditinos
5001	Bertolínia	2013-09-03 15:30:12.389704	18	1	bertolinia
5002	Betânia do Piauí	2013-09-03 15:30:12.389704	18	1	betania-do-piaui
5003	Boa Hora	2013-09-03 15:30:12.389704	18	1	boa-hora
5004	Bocaina	2013-09-03 15:30:12.389704	18	1	bocaina
5005	Bom Jesus	2013-09-03 15:30:12.389704	18	1	bom-jesus
5006	Bom Princípio do Piauí	2013-09-03 15:30:12.389704	18	1	bom-principio-do-piaui
5007	Bonfim do Piauí	2013-09-03 15:30:12.389704	18	1	bonfim-do-piaui
5008	Boqueirão do Piauí	2013-09-03 15:30:12.389704	18	1	boqueirao-do-piaui
5009	Brasileira	2013-09-03 15:30:12.389704	18	1	brasileira
5010	Brejo do Piauí	2013-09-03 15:30:12.389704	18	1	brejo-do-piaui
5011	Buriti dos Lopes	2013-09-03 15:30:12.389704	18	1	buriti-dos-lopes
5012	Buriti dos Montes	2013-09-03 15:30:12.389704	18	1	buriti-dos-montes
5013	Cabeceiras do Piauí	2013-09-03 15:30:12.389704	18	1	cabeceiras-do-piaui
5014	Cajazeiras do Piauí	2013-09-03 15:30:12.389704	18	1	cajazeiras-do-piaui
5015	Cajueiro da Praia	2013-09-03 15:30:12.389704	18	1	cajueiro-da-praia
5016	Caldeirão Grande do Piauí	2013-09-03 15:30:12.389704	18	1	caldeirao-grande-do-piaui
5017	Campinas do Piauí	2013-09-03 15:30:12.389704	18	1	campinas-do-piaui
5018	Campo Alegre do Fidalgo	2013-09-03 15:30:12.389704	18	1	campo-alegre-do-fidalgo
5019	Campo Grande do Piauí	2013-09-03 15:30:12.389704	18	1	campo-grande-do-piaui
5020	Campo Largo do Piauí	2013-09-03 15:30:12.389704	18	1	campo-largo-do-piaui
5021	Campo Maior	2013-09-03 15:30:12.389704	18	1	campo-maior
5022	Canavieira	2013-09-03 15:30:12.389704	18	1	canavieira
5023	Canto do Buriti	2013-09-03 15:30:12.389704	18	1	canto-do-buriti
5024	Capitão de Campos	2013-09-03 15:30:12.389704	18	1	capitao-de-campos
5025	Capitão Gervásio Oliveira	2013-09-03 15:30:12.389704	18	1	capitao-gervasio-oliveira
5026	Caracol	2013-09-03 15:30:12.389704	18	1	caracol
5027	Caraúbas do Piauí	2013-09-03 15:30:12.389704	18	1	caraubas-do-piaui
5028	Caridade do Piauí	2013-09-03 15:30:12.389704	18	1	caridade-do-piaui
5029	Castelo do Piauí	2013-09-03 15:30:12.389704	18	1	castelo-do-piaui
5030	Caxingó	2013-09-03 15:30:12.389704	18	1	caxingo
5031	Cocal	2013-09-03 15:30:12.389704	18	1	cocal
5032	Cocal de Telha	2013-09-03 15:30:12.389704	18	1	cocal-de-telha
5033	Cocal dos Alves	2013-09-03 15:30:12.389704	18	1	cocal-dos-alves
5034	Coivaras	2013-09-03 15:30:12.389704	18	1	coivaras
5035	Colônia do Gurguéia	2013-09-03 15:30:12.389704	18	1	colonia-do-gurgueia
5036	Colônia do Piauí	2013-09-03 15:30:12.389704	18	1	colonia-do-piaui
5037	Conceição do Canindé	2013-09-03 15:30:12.389704	18	1	conceicao-do-caninde
5038	Coronel José Dias	2013-09-03 15:30:12.389704	18	1	coronel-jose-dias
5039	Corrente	2013-09-03 15:30:12.389704	18	1	corrente
5040	Cristalândia do Piauí	2013-09-03 15:30:12.389704	18	1	cristalandia-do-piaui
5041	Cristino Castro	2013-09-03 15:30:12.389704	18	1	cristino-castro
5042	Curimatá	2013-09-03 15:30:12.389704	18	1	curimata
5043	Currais	2013-09-03 15:30:12.389704	18	1	currais
5044	Curral Novo do Piauí	2013-09-03 15:30:12.389704	18	1	curral-novo-do-piaui
5045	Curralinhos	2013-09-03 15:30:12.389704	18	1	curralinhos
5046	Demerval Lobão	2013-09-03 15:30:12.389704	18	1	demerval-lobao
5047	Dirceu Arcoverde	2013-09-03 15:30:12.389704	18	1	dirceu-arcoverde
5048	Dom Expedito Lopes	2013-09-03 15:30:12.389704	18	1	dom-expedito-lopes
5049	Dom Inocêncio	2013-09-03 15:30:12.389704	18	1	dom-inocencio
5050	Domingos Mourão	2013-09-03 15:30:12.389704	18	1	domingos-mourao
5051	Elesbão Veloso	2013-09-03 15:30:12.389704	18	1	elesbao-veloso
5052	Eliseu Martins	2013-09-03 15:30:12.389704	18	1	eliseu-martins
5053	Esperantina	2013-09-03 15:30:12.389704	18	1	esperantina
5054	Fartura do Piauí	2013-09-03 15:30:12.389704	18	1	fartura-do-piaui
5055	Flores do Piauí	2013-09-03 15:30:12.389704	18	1	flores-do-piaui
5056	Floresta do Piauí	2013-09-03 15:30:12.389704	18	1	floresta-do-piaui
5057	Floriano	2013-09-03 15:30:12.389704	18	1	floriano
5058	Francinópolis	2013-09-03 15:30:12.389704	18	1	francinopolis
5059	Francisco Ayres	2013-09-03 15:30:12.389704	18	1	francisco-ayres
5060	Francisco Macedo	2013-09-03 15:30:12.389704	18	1	francisco-macedo
5061	Francisco Santos	2013-09-03 15:30:12.389704	18	1	francisco-santos
5062	Fronteiras	2013-09-03 15:30:12.389704	18	1	fronteiras
5063	Geminiano	2013-09-03 15:30:12.389704	18	1	geminiano
5064	Gilbués	2013-09-03 15:30:12.389704	18	1	gilbues
5065	Guadalupe	2013-09-03 15:30:12.389704	18	1	guadalupe
5066	Guaribas	2013-09-03 15:30:12.389704	18	1	guaribas
5067	Hugo Napoleão	2013-09-03 15:30:12.389704	18	1	hugo-napoleao
5068	Ilha Grande	2013-09-03 15:30:12.389704	18	1	ilha-grande
5069	Inhuma	2013-09-03 15:30:12.389704	18	1	inhuma
5070	Ipiranga do Piauí	2013-09-03 15:30:12.389704	18	1	ipiranga-do-piaui
5071	Isaías Coelho	2013-09-03 15:30:12.389704	18	1	isaias-coelho
5072	Itainópolis	2013-09-03 15:30:12.389704	18	1	itainopolis
5073	Itaueira	2013-09-03 15:30:12.389704	18	1	itaueira
5074	Jacobina do Piauí	2013-09-03 15:30:12.389704	18	1	jacobina-do-piaui
5075	Jaicós	2013-09-03 15:30:12.389704	18	1	jaicos
5076	Jardim do Mulato	2013-09-03 15:30:12.389704	18	1	jardim-do-mulato
5077	Jatobá do Piauí	2013-09-03 15:30:12.389704	18	1	jatoba-do-piaui
5078	Jerumenha	2013-09-03 15:30:12.389704	18	1	jerumenha
5079	João Costa	2013-09-03 15:30:12.389704	18	1	joao-costa
5080	Joaquim Pires	2013-09-03 15:30:12.389704	18	1	joaquim-pires
5081	Joca Marques	2013-09-03 15:30:12.389704	18	1	joca-marques
5082	José de Freitas	2013-09-03 15:30:12.389704	18	1	jose-de-freitas
5083	Juazeiro do Piauí	2013-09-03 15:30:12.389704	18	1	juazeiro-do-piaui
5084	Júlio Borges	2013-09-03 15:30:12.389704	18	1	julio-borges
5085	Jurema	2013-09-03 15:30:12.389704	18	1	jurema
5086	Lagoa Alegre	2013-09-03 15:30:12.389704	18	1	lagoa-alegre
5087	Lagoa de São Francisco	2013-09-03 15:30:12.389704	18	1	lagoa-de-sao-francisco
5088	Lagoa do Barro do Piauí	2013-09-03 15:30:12.389704	18	1	lagoa-do-barro-do-piaui
5089	Lagoa do Piauí	2013-09-03 15:30:12.389704	18	1	lagoa-do-piaui
5090	Lagoa do Sítio	2013-09-03 15:30:12.389704	18	1	lagoa-do-sitio
5091	Lagoinha do Piauí	2013-09-03 15:30:12.389704	18	1	lagoinha-do-piaui
5092	Landri Sales	2013-09-03 15:30:12.389704	18	1	landri-sales
5093	Luís Correia	2013-09-03 15:30:12.389704	18	1	luis-correia
5094	Luzilândia	2013-09-03 15:30:12.389704	18	1	luzilandia
5095	Madeiro	2013-09-03 15:30:12.389704	18	1	madeiro
5096	Manoel Emídio	2013-09-03 15:30:12.389704	18	1	manoel-emidio
5097	Marcolândia	2013-09-03 15:30:12.389704	18	1	marcolandia
5098	Marcos Parente	2013-09-03 15:30:12.389704	18	1	marcos-parente
5099	Massapê do Piauí	2013-09-03 15:30:12.389704	18	1	massape-do-piaui
5100	Matias Olímpio	2013-09-03 15:30:12.389704	18	1	matias-olimpio
5101	Miguel Alves	2013-09-03 15:30:12.389704	18	1	miguel-alves
5102	Miguel Leão	2013-09-03 15:30:12.389704	18	1	miguel-leao
5103	Milton Brandão	2013-09-03 15:30:12.389704	18	1	milton-brandao
5104	Monsenhor Gil	2013-09-03 15:30:12.389704	18	1	monsenhor-gil
5105	Monsenhor Hipólito	2013-09-03 15:30:12.389704	18	1	monsenhor-hipolito
5106	Monte Alegre do Piauí	2013-09-03 15:30:12.389704	18	1	monte-alegre-do-piaui
5107	Morro Cabeça no Tempo	2013-09-03 15:30:12.389704	18	1	morro-cabeca-no-tempo
5108	Morro do Chapéu do Piauí	2013-09-03 15:30:12.389704	18	1	morro-do-chapeu-do-piaui
5109	Murici dos Portelas	2013-09-03 15:30:12.389704	18	1	murici-dos-portelas
5110	Nazaré do Piauí	2013-09-03 15:30:12.389704	18	1	nazare-do-piaui
5111	Nossa Senhora de Nazaré	2013-09-03 15:30:12.389704	18	1	nossa-senhora-de-nazare
5112	Nossa Senhora dos Remédios	2013-09-03 15:30:12.389704	18	1	nossa-senhora-dos-remedios
5113	Nova Santa Rita	2013-09-03 15:30:12.389704	18	1	nova-santa-rita
5114	Novo Oriente do Piauí	2013-09-03 15:30:12.389704	18	1	novo-oriente-do-piaui
5115	Novo Santo Antônio	2013-09-03 15:30:12.389704	18	1	novo-santo-antonio
5116	Oeiras	2013-09-03 15:30:12.389704	18	1	oeiras
5117	Olho d`Água do Piauí	2013-09-03 15:30:12.389704	18	1	olho-d-agua-do-piaui
5118	Padre Marcos	2013-09-03 15:30:12.389704	18	1	padre-marcos
5119	Paes Landim	2013-09-03 15:30:12.389704	18	1	paes-landim
5120	Pajeú do Piauí	2013-09-03 15:30:12.389704	18	1	pajeu-do-piaui
5121	Palmeira do Piauí	2013-09-03 15:30:12.389704	18	1	palmeira-do-piaui
5122	Palmeirais	2013-09-03 15:30:12.389704	18	1	palmeirais
5123	Paquetá	2013-09-03 15:30:12.389704	18	1	paqueta
5124	Parnaguá	2013-09-03 15:30:12.389704	18	1	parnagua
5125	Parnaíba	2013-09-03 15:30:12.389704	18	1	parnaiba
5126	Passagem Franca do Piauí	2013-09-03 15:30:12.389704	18	1	passagem-franca-do-piaui
5127	Patos do Piauí	2013-09-03 15:30:12.389704	18	1	patos-do-piaui
5128	Pau d`Arco do Piauí	2013-09-03 15:30:12.389704	18	1	pau-d-arco-do-piaui
5129	Paulistana	2013-09-03 15:30:12.389704	18	1	paulistana
5130	Pavussu	2013-09-03 15:30:12.389704	18	1	pavussu
5131	Pedro II	2013-09-03 15:30:12.389704	18	1	pedro-ii
5132	Pedro Laurentino	2013-09-03 15:30:12.389704	18	1	pedro-laurentino
5133	Picos	2013-09-03 15:30:12.389704	18	1	picos
5134	Pimenteiras	2013-09-03 15:30:12.389704	18	1	pimenteiras
5135	Pio IX	2013-09-03 15:30:12.389704	18	1	pio-ix
5136	Piracuruca	2013-09-03 15:30:12.389704	18	1	piracuruca
5137	Piripiri	2013-09-03 15:30:12.389704	18	1	piripiri
5138	Porto	2013-09-03 15:30:12.389704	18	1	porto
5139	Porto Alegre do Piauí	2013-09-03 15:30:12.389704	18	1	porto-alegre-do-piaui
5140	Prata do Piauí	2013-09-03 15:30:12.389704	18	1	prata-do-piaui
5141	Queimada Nova	2013-09-03 15:30:12.389704	18	1	queimada-nova
5142	Redenção do Gurguéia	2013-09-03 15:30:12.389704	18	1	redencao-do-gurgueia
5143	Regeneração	2013-09-03 15:30:12.389704	18	1	regeneracao
5144	Riacho Frio	2013-09-03 15:30:12.389704	18	1	riacho-frio
5145	Ribeira do Piauí	2013-09-03 15:30:12.389704	18	1	ribeira-do-piaui
5146	Ribeiro Gonçalves	2013-09-03 15:30:12.389704	18	1	ribeiro-goncalves
5147	Rio Grande do Piauí	2013-09-03 15:30:12.389704	18	1	rio-grande-do-piaui
5148	Santa Cruz do Piauí	2013-09-03 15:30:12.389704	18	1	santa-cruz-do-piaui
5149	Santa Cruz dos Milagres	2013-09-03 15:30:12.389704	18	1	santa-cruz-dos-milagres
5150	Santa Filomena	2013-09-03 15:30:12.389704	18	1	santa-filomena
5151	Santa Luz	2013-09-03 15:30:12.389704	18	1	santa-luz
5152	Santa Rosa do Piauí	2013-09-03 15:30:12.389704	18	1	santa-rosa-do-piaui
5153	Santana do Piauí	2013-09-03 15:30:12.389704	18	1	santana-do-piaui
5154	Santo Antônio de Lisboa	2013-09-03 15:30:12.389704	18	1	santo-antonio-de-lisboa
5155	Santo Antônio dos Milagres	2013-09-03 15:30:12.389704	18	1	santo-antonio-dos-milagres
5156	Santo Inácio do Piauí	2013-09-03 15:30:12.389704	18	1	santo-inacio-do-piaui
5157	São Braz do Piauí	2013-09-03 15:30:12.389704	18	1	sao-braz-do-piaui
5158	São Félix do Piauí	2013-09-03 15:30:12.389704	18	1	sao-felix-do-piaui
5159	São Francisco de Assis do Piauí	2013-09-03 15:30:12.389704	18	1	sao-francisco-de-assis-do-piaui
5160	São Francisco do Piauí	2013-09-03 15:30:12.389704	18	1	sao-francisco-do-piaui
5161	São Gonçalo do Gurguéia	2013-09-03 15:30:12.389704	18	1	sao-goncalo-do-gurgueia
5162	São Gonçalo do Piauí	2013-09-03 15:30:12.389704	18	1	sao-goncalo-do-piaui
5163	São João da Canabrava	2013-09-03 15:30:12.389704	18	1	sao-joao-da-canabrava
5164	São João da Fronteira	2013-09-03 15:30:12.389704	18	1	sao-joao-da-fronteira
5165	São João da Serra	2013-09-03 15:30:12.389704	18	1	sao-joao-da-serra
5166	São João da Varjota	2013-09-03 15:30:12.389704	18	1	sao-joao-da-varjota
5167	São João do Arraial	2013-09-03 15:30:12.389704	18	1	sao-joao-do-arraial
5168	São João do Piauí	2013-09-03 15:30:12.389704	18	1	sao-joao-do-piaui
5169	São José do Divino	2013-09-03 15:30:12.389704	18	1	sao-jose-do-divino
5170	São José do Peixe	2013-09-03 15:30:12.389704	18	1	sao-jose-do-peixe
5171	São José do Piauí	2013-09-03 15:30:12.389704	18	1	sao-jose-do-piaui
5172	São Julião	2013-09-03 15:30:12.389704	18	1	sao-juliao
5173	São Lourenço do Piauí	2013-09-03 15:30:12.389704	18	1	sao-lourenco-do-piaui
5174	São Luis do Piauí	2013-09-03 15:30:12.389704	18	1	sao-luis-do-piaui
5175	São Miguel da Baixa Grande	2013-09-03 15:30:12.389704	18	1	sao-miguel-da-baixa-grande
5176	São Miguel do Fidalgo	2013-09-03 15:30:12.389704	18	1	sao-miguel-do-fidalgo
5177	São Miguel do Tapuio	2013-09-03 15:30:12.389704	18	1	sao-miguel-do-tapuio
5178	São Pedro do Piauí	2013-09-03 15:30:12.389704	18	1	sao-pedro-do-piaui
5179	São Raimundo Nonato	2013-09-03 15:30:12.389704	18	1	sao-raimundo-nonato
5180	Sebastião Barros	2013-09-03 15:30:12.389704	18	1	sebastiao-barros
5181	Sebastião Leal	2013-09-03 15:30:12.389704	18	1	sebastiao-leal
5182	Sigefredo Pacheco	2013-09-03 15:30:12.389704	18	1	sigefredo-pacheco
5183	Simões	2013-09-03 15:30:12.389704	18	1	simoes
5184	Simplício Mendes	2013-09-03 15:30:12.389704	18	1	simplicio-mendes
5185	Socorro do Piauí	2013-09-03 15:30:12.389704	18	1	socorro-do-piaui
5186	Sussuapara	2013-09-03 15:30:12.389704	18	1	sussuapara
5187	Tamboril do Piauí	2013-09-03 15:30:12.389704	18	1	tamboril-do-piaui
5188	Tanque do Piauí	2013-09-03 15:30:12.389704	18	1	tanque-do-piaui
5189	Teresina	2013-09-03 15:30:12.389704	18	1	teresina
5190	União	2013-09-03 15:30:12.389704	18	1	uniao
5191	Uruçuí	2013-09-03 15:30:12.389704	18	1	urucui
5192	Valença do Piauí	2013-09-03 15:30:12.389704	18	1	valenca-do-piaui
5193	Várzea Branca	2013-09-03 15:30:12.389704	18	1	varzea-branca
5194	Várzea Grande	2013-09-03 15:30:12.389704	18	1	varzea-grande
5195	Vera Mendes	2013-09-03 15:30:12.389704	18	1	vera-mendes
5196	Vila Nova do Piauí	2013-09-03 15:30:12.389704	18	1	vila-nova-do-piaui
5197	Wall Ferraz	2013-09-03 15:30:12.389704	18	1	wall-ferraz
5230	Angra dos Reis	2013-09-03 15:30:12.389704	19	1	angra-dos-reis
5231	Aperibé	2013-09-03 15:30:12.389704	19	1	aperibe
5232	Araruama	2013-09-03 15:30:12.389704	19	1	araruama
5233	Areal	2013-09-03 15:30:12.389704	19	1	areal
5234	Armação dos Búzios	2013-09-03 15:30:12.389704	19	1	armacao-dos-buzios
5235	Arraial do Cabo	2013-09-03 15:30:12.389704	19	1	arraial-do-cabo
5236	Barra do Piraí	2013-09-03 15:30:12.389704	19	1	barra-do-pirai
5237	Barra Mansa	2013-09-03 15:30:12.389704	19	1	barra-mansa
5238	Belford Roxo	2013-09-03 15:30:12.389704	19	1	belford-roxo
5239	Bom Jardim	2013-09-03 15:30:12.389704	19	1	bom-jardim
5240	Bom Jesus do Itabapoana	2013-09-03 15:30:12.389704	19	1	bom-jesus-do-itabapoana
5241	Cabo Frio	2013-09-03 15:30:12.389704	19	1	cabo-frio
5242	Cachoeiras de Macacu	2013-09-03 15:30:12.389704	19	1	cachoeiras-de-macacu
5243	Cambuci	2013-09-03 15:30:12.389704	19	1	cambuci
5244	Campos dos Goytacazes	2013-09-03 15:30:12.389704	19	1	campos-dos-goytacazes
5245	Cantagalo	2013-09-03 15:30:12.389704	19	1	cantagalo
5246	Carapebus	2013-09-03 15:30:12.389704	19	1	carapebus
5247	Cardoso Moreira	2013-09-03 15:30:12.389704	19	1	cardoso-moreira
5248	Carmo	2013-09-03 15:30:12.389704	19	1	carmo
5249	Casimiro de Abreu	2013-09-03 15:30:12.389704	19	1	casimiro-de-abreu
5250	Comendador Levy Gasparian	2013-09-03 15:30:12.389704	19	1	comendador-levy-gasparian
5251	Conceição de Macabu	2013-09-03 15:30:12.389704	19	1	conceicao-de-macabu
5252	Cordeiro	2013-09-03 15:30:12.389704	19	1	cordeiro
5253	Duas Barras	2013-09-03 15:30:12.389704	19	1	duas-barras
5254	Duque de Caxias	2013-09-03 15:30:12.389704	19	1	duque-de-caxias
5255	Engenheiro Paulo de Frontin	2013-09-03 15:30:12.389704	19	1	engenheiro-paulo-de-frontin
5256	Guapimirim	2013-09-03 15:30:12.389704	19	1	guapimirim
5257	Iguaba Grande	2013-09-03 15:30:12.389704	19	1	iguaba-grande
5258	Itaboraí	2013-09-03 15:30:12.389704	19	1	itaborai
5259	Itaguaí	2013-09-03 15:30:12.389704	19	1	itaguai
5260	Italva	2013-09-03 15:30:12.389704	19	1	italva
5261	Itaocara	2013-09-03 15:30:12.389704	19	1	itaocara
5262	Itaperuna	2013-09-03 15:30:12.389704	19	1	itaperuna
5263	Itatiaia	2013-09-03 15:30:12.389704	19	1	itatiaia
5264	Japeri	2013-09-03 15:30:12.389704	19	1	japeri
5265	Laje do Muriaé	2013-09-03 15:30:12.389704	19	1	laje-do-muriae
5266	Macaé	2013-09-03 15:30:12.389704	19	1	macae
5267	Macuco	2013-09-03 15:30:12.389704	19	1	macuco
5268	Magé	2013-09-03 15:30:12.389704	19	1	mage
5269	Mangaratiba	2013-09-03 15:30:12.389704	19	1	mangaratiba
5270	Maricá	2013-09-03 15:30:12.389704	19	1	marica
5271	Mendes	2013-09-03 15:30:12.389704	19	1	mendes
5272	Mesquita	2013-09-03 15:30:12.389704	19	1	mesquita
5273	Miguel Pereira	2013-09-03 15:30:12.389704	19	1	miguel-pereira
5274	Miracema	2013-09-03 15:30:12.389704	19	1	miracema
5275	Natividade	2013-09-03 15:30:12.389704	19	1	natividade
5276	Nilópolis	2013-09-03 15:30:12.389704	19	1	nilopolis
5277	Niterói	2013-09-03 15:30:12.389704	19	1	niteroi
5278	Nova Friburgo	2013-09-03 15:30:12.389704	19	1	nova-friburgo
5279	Nova Iguaçu	2013-09-03 15:30:12.389704	19	1	nova-iguacu
5280	Paracambi	2013-09-03 15:30:12.389704	19	1	paracambi
5281	Paraíba do Sul	2013-09-03 15:30:12.389704	19	1	paraiba-do-sul
5282	Parati	2013-09-03 15:30:12.389704	19	1	parati
5283	Paty do Alferes	2013-09-03 15:30:12.389704	19	1	paty-do-alferes
5284	Petrópolis	2013-09-03 15:30:12.389704	19	1	petropolis
5285	Pinheiral	2013-09-03 15:30:12.389704	19	1	pinheiral
5286	Piraí	2013-09-03 15:30:12.389704	19	1	pirai
5287	Porciúncula	2013-09-03 15:30:12.389704	19	1	porciuncula
5288	Porto Real	2013-09-03 15:30:12.389704	19	1	porto-real
5289	Quatis	2013-09-03 15:30:12.389704	19	1	quatis
5290	Queimados	2013-09-03 15:30:12.389704	19	1	queimados
5291	Quissamã	2013-09-03 15:30:12.389704	19	1	quissama
5292	Resende	2013-09-03 15:30:12.389704	19	1	resende
5293	Rio Bonito	2013-09-03 15:30:12.389704	19	1	rio-bonito
5294	Rio Claro	2013-09-03 15:30:12.389704	19	1	rio-claro
5295	Rio das Flores	2013-09-03 15:30:12.389704	19	1	rio-das-flores
5296	Rio das Ostras	2013-09-03 15:30:12.389704	19	1	rio-das-ostras
5297	Rio de Janeiro	2013-09-03 15:30:12.389704	19	1	rio-de-janeiro
5298	Santa Maria Madalena	2013-09-03 15:30:12.389704	19	1	santa-maria-madalena
5299	Santo Antônio de Pádua	2013-09-03 15:30:12.389704	19	1	santo-antonio-de-padua
5300	São Fidélis	2013-09-03 15:30:12.389704	19	1	sao-fidelis
5301	São Francisco de Itabapoana	2013-09-03 15:30:12.389704	19	1	sao-francisco-de-itabapoana
5302	São Gonçalo	2013-09-03 15:30:12.389704	19	1	sao-goncalo
5303	São João da Barra	2013-09-03 15:30:12.389704	19	1	sao-joao-da-barra
5304	São João de Meriti	2013-09-03 15:30:12.389704	19	1	sao-joao-de-meriti
5305	São José de Ubá	2013-09-03 15:30:12.389704	19	1	sao-jose-de-uba
5306	São José do Vale do Rio Pret	2013-09-03 15:30:12.389704	19	1	sao-jose-do-vale-do-rio-pret
5307	São Pedro da Aldeia	2013-09-03 15:30:12.389704	19	1	sao-pedro-da-aldeia
5308	São Sebastião do Alto	2013-09-03 15:30:12.389704	19	1	sao-sebastiao-do-alto
5309	Sapucaia	2013-09-03 15:30:12.389704	19	1	sapucaia
5310	Saquarema	2013-09-03 15:30:12.389704	19	1	saquarema
5311	Seropédica	2013-09-03 15:30:12.389704	19	1	seropedica
5312	Silva Jardim	2013-09-03 15:30:12.389704	19	1	silva-jardim
5313	Sumidouro	2013-09-03 15:30:12.389704	19	1	sumidouro
5314	Tanguá	2013-09-03 15:30:12.389704	19	1	tangua
5315	Teresópolis	2013-09-03 15:30:12.389704	19	1	teresopolis
5316	Trajano de Morais	2013-09-03 15:30:12.389704	19	1	trajano-de-morais
5317	Três Rios	2013-09-03 15:30:12.389704	19	1	tres-rios
5318	Valença	2013-09-03 15:30:12.389704	19	1	valenca
5319	Varre-Sai	2013-09-03 15:30:12.389704	19	1	varre-sai
5320	Vassouras	2013-09-03 15:30:12.389704	19	1	vassouras
5321	Volta Redonda	2013-09-03 15:30:12.389704	19	1	volta-redonda
5357	Acari	2013-09-03 15:30:12.389704	20	1	acari
5358	Açu	2013-09-03 15:30:12.389704	20	1	acu
5359	Afonso Bezerra	2013-09-03 15:30:12.389704	20	1	afonso-bezerra
5360	Água Nova	2013-09-03 15:30:12.389704	20	1	agua-nova
5361	Alexandria	2013-09-03 15:30:12.389704	20	1	alexandria
5362	Almino Afonso	2013-09-03 15:30:12.389704	20	1	almino-afonso
5363	Alto do Rodrigues	2013-09-03 15:30:12.389704	20	1	alto-do-rodrigues
5364	Angicos	2013-09-03 15:30:12.389704	20	1	angicos
5365	Antônio Martins	2013-09-03 15:30:12.389704	20	1	antonio-martins
5366	Apodi	2013-09-03 15:30:12.389704	20	1	apodi
5367	Areia Branca	2013-09-03 15:30:12.389704	20	1	areia-branca
5368	Arês	2013-09-03 15:30:12.389704	20	1	ares
5369	Augusto Severo	2013-09-03 15:30:12.389704	20	1	augusto-severo
5370	Baía Formosa	2013-09-03 15:30:12.389704	20	1	baia-formosa
5371	Baraúna	2013-09-03 15:30:12.389704	20	1	barauna
5372	Barcelona	2013-09-03 15:30:12.389704	20	1	barcelona
5373	Bento Fernandes	2013-09-03 15:30:12.389704	20	1	bento-fernandes
5374	Bodó	2013-09-03 15:30:12.389704	20	1	bodo
5375	Bom Jesus	2013-09-03 15:30:12.389704	20	1	bom-jesus
5376	Brejinho	2013-09-03 15:30:12.389704	20	1	brejinho
5377	Caiçara do Norte	2013-09-03 15:30:12.389704	20	1	caicara-do-norte
5378	Caiçara do Rio do Vento	2013-09-03 15:30:12.389704	20	1	caicara-do-rio-do-vento
5379	Caicó	2013-09-03 15:30:12.389704	20	1	caico
5380	Campo Redondo	2013-09-03 15:30:12.389704	20	1	campo-redondo
5381	Canguaretama	2013-09-03 15:30:12.389704	20	1	canguaretama
5382	Caraúbas	2013-09-03 15:30:12.389704	20	1	caraubas
5383	Carnaúba dos Dantas	2013-09-03 15:30:12.389704	20	1	carnauba-dos-dantas
5384	Carnaubais	2013-09-03 15:30:12.389704	20	1	carnaubais
5385	Ceará-Mirim	2013-09-03 15:30:12.389704	20	1	ceara-mirim
5386	Cerro Corá	2013-09-03 15:30:12.389704	20	1	cerro-cora
5387	Coronel Ezequiel	2013-09-03 15:30:12.389704	20	1	coronel-ezequiel
5388	Coronel João Pessoa	2013-09-03 15:30:12.389704	20	1	coronel-joao-pessoa
5389	Cruzeta	2013-09-03 15:30:12.389704	20	1	cruzeta
5390	Currais Novos	2013-09-03 15:30:12.389704	20	1	currais-novos
5391	Doutor Severiano	2013-09-03 15:30:12.389704	20	1	doutor-severiano
5392	Encanto	2013-09-03 15:30:12.389704	20	1	encanto
5393	Equador	2013-09-03 15:30:12.389704	20	1	equador
5394	Espírito Santo	2013-09-03 15:30:12.389704	20	1	espirito-santo
5395	Extremoz	2013-09-03 15:30:12.389704	20	1	extremoz
5396	Felipe Guerra	2013-09-03 15:30:12.389704	20	1	felipe-guerra
5397	Fernando Pedroza	2013-09-03 15:30:12.389704	20	1	fernando-pedroza
5398	Florânia	2013-09-03 15:30:12.389704	20	1	florania
5399	Francisco Dantas	2013-09-03 15:30:12.389704	20	1	francisco-dantas
5400	Frutuoso Gomes	2013-09-03 15:30:12.389704	20	1	frutuoso-gomes
5401	Galinhos	2013-09-03 15:30:12.389704	20	1	galinhos
5402	Goianinha	2013-09-03 15:30:12.389704	20	1	goianinha
5403	Governador Dix-Sept Rosado	2013-09-03 15:30:12.389704	20	1	governador-dix-sept-rosado
5404	Grossos	2013-09-03 15:30:12.389704	20	1	grossos
5405	Guamaré	2013-09-03 15:30:12.389704	20	1	guamare
5406	Ielmo Marinho	2013-09-03 15:30:12.389704	20	1	ielmo-marinho
5407	Ipanguaçu	2013-09-03 15:30:12.389704	20	1	ipanguacu
5408	Ipueira	2013-09-03 15:30:12.389704	20	1	ipueira
5409	Itajá	2013-09-03 15:30:12.389704	20	1	itaja
5410	Itaú	2013-09-03 15:30:12.389704	20	1	itau
5411	Jaçanã	2013-09-03 15:30:12.389704	20	1	jacana
5412	Jandaíra	2013-09-03 15:30:12.389704	20	1	jandaira
5413	Janduís	2013-09-03 15:30:12.389704	20	1	janduis
5414	Januário Cicco	2013-09-03 15:30:12.389704	20	1	januario-cicco
5415	Japi	2013-09-03 15:30:12.389704	20	1	japi
5416	Jardim de Angicos	2013-09-03 15:30:12.389704	20	1	jardim-de-angicos
5417	Jardim de Piranhas	2013-09-03 15:30:12.389704	20	1	jardim-de-piranhas
5418	Jardim do Seridó	2013-09-03 15:30:12.389704	20	1	jardim-do-serido
5419	João Câmara	2013-09-03 15:30:12.389704	20	1	joao-camara
5420	João Dias	2013-09-03 15:30:12.389704	20	1	joao-dias
5421	José da Penha	2013-09-03 15:30:12.389704	20	1	jose-da-penha
5422	Jucurutu	2013-09-03 15:30:12.389704	20	1	jucurutu
5423	Jundiá	2013-09-03 15:30:12.389704	20	1	jundia
5424	Lagoa d`Anta	2013-09-03 15:30:12.389704	20	1	lagoa-d-anta
5425	Lagoa de Pedras	2013-09-03 15:30:12.389704	20	1	lagoa-de-pedras
5426	Lagoa de Velhos	2013-09-03 15:30:12.389704	20	1	lagoa-de-velhos
5427	Lagoa Nova	2013-09-03 15:30:12.389704	20	1	lagoa-nova
5428	Lagoa Salgada	2013-09-03 15:30:12.389704	20	1	lagoa-salgada
5429	Lajes	2013-09-03 15:30:12.389704	20	1	lajes
5430	Lajes Pintadas	2013-09-03 15:30:12.389704	20	1	lajes-pintadas
5431	Lucrécia	2013-09-03 15:30:12.389704	20	1	lucrecia
5432	Luís Gomes	2013-09-03 15:30:12.389704	20	1	luis-gomes
5433	Macaíba	2013-09-03 15:30:12.389704	20	1	macaiba
5434	Macau	2013-09-03 15:30:12.389704	20	1	macau
5435	Major Sales	2013-09-03 15:30:12.389704	20	1	major-sales
5436	Marcelino Vieira	2013-09-03 15:30:12.389704	20	1	marcelino-vieira
5437	Martins	2013-09-03 15:30:12.389704	20	1	martins
5438	Maxaranguape	2013-09-03 15:30:12.389704	20	1	maxaranguape
5439	Messias Targino	2013-09-03 15:30:12.389704	20	1	messias-targino
5440	Montanhas	2013-09-03 15:30:12.389704	20	1	montanhas
5441	Monte Alegre	2013-09-03 15:30:12.389704	20	1	monte-alegre
5442	Monte das Gameleiras	2013-09-03 15:30:12.389704	20	1	monte-das-gameleiras
5443	Mossoró	2013-09-03 15:30:12.389704	20	1	mossoro
5444	Natal	2013-09-03 15:30:12.389704	20	1	natal
5445	Nísia Floresta	2013-09-03 15:30:12.389704	20	1	nisia-floresta
5446	Nova Cruz	2013-09-03 15:30:12.389704	20	1	nova-cruz
5659	Boa Vista do Sul	2013-09-03 15:30:12.389704	21	1	boa-vista-do-sul
5447	Olho-d`Água do Borges	2013-09-03 15:30:12.389704	20	1	olho-d-agua-do-borges
5448	Ouro Branco	2013-09-03 15:30:12.389704	20	1	ouro-branco
5449	Paraná	2013-09-03 15:30:12.389704	20	1	parana
5450	Paraú	2013-09-03 15:30:12.389704	20	1	parau
5451	Parazinho	2013-09-03 15:30:12.389704	20	1	parazinho
5452	Parelhas	2013-09-03 15:30:12.389704	20	1	parelhas
5453	Parnamirim	2013-09-03 15:30:12.389704	20	1	parnamirim
5454	Passa e Fica	2013-09-03 15:30:12.389704	20	1	passa-e-fica
5455	Passagem	2013-09-03 15:30:12.389704	20	1	passagem
5456	Patu	2013-09-03 15:30:12.389704	20	1	patu
5457	Pau dos Ferros	2013-09-03 15:30:12.389704	20	1	pau-dos-ferros
5458	Pedra Grande	2013-09-03 15:30:12.389704	20	1	pedra-grande
5459	Pedra Preta	2013-09-03 15:30:12.389704	20	1	pedra-preta
5460	Pedro Avelino	2013-09-03 15:30:12.389704	20	1	pedro-avelino
5461	Pedro Velho	2013-09-03 15:30:12.389704	20	1	pedro-velho
5462	Pendências	2013-09-03 15:30:12.389704	20	1	pendencias
5463	Pilões	2013-09-03 15:30:12.389704	20	1	piloes
5464	Poço Branco	2013-09-03 15:30:12.389704	20	1	poco-branco
5465	Portalegre	2013-09-03 15:30:12.389704	20	1	portalegre
5466	Porto do Mangue	2013-09-03 15:30:12.389704	20	1	porto-do-mangue
5467	Presidente Juscelino	2013-09-03 15:30:12.389704	20	1	presidente-juscelino
5468	Pureza	2013-09-03 15:30:12.389704	20	1	pureza
5469	Rafael Fernandes	2013-09-03 15:30:12.389704	20	1	rafael-fernandes
5470	Rafael Godeiro	2013-09-03 15:30:12.389704	20	1	rafael-godeiro
5471	Riacho da Cruz	2013-09-03 15:30:12.389704	20	1	riacho-da-cruz
5472	Riacho de Santana	2013-09-03 15:30:12.389704	20	1	riacho-de-santana
5473	Riachuelo	2013-09-03 15:30:12.389704	20	1	riachuelo
5474	Rio do Fogo	2013-09-03 15:30:12.389704	20	1	rio-do-fogo
5475	Rodolfo Fernandes	2013-09-03 15:30:12.389704	20	1	rodolfo-fernandes
5476	Ruy Barbosa	2013-09-03 15:30:12.389704	20	1	ruy-barbosa
5477	Santa Cruz	2013-09-03 15:30:12.389704	20	1	santa-cruz
5478	Santa Maria	2013-09-03 15:30:12.389704	20	1	santa-maria
5479	Santana do Matos	2013-09-03 15:30:12.389704	20	1	santana-do-matos
5480	Santana do Seridó	2013-09-03 15:30:12.389704	20	1	santana-do-serido
5481	Santo Antônio	2013-09-03 15:30:12.389704	20	1	santo-antonio
5482	São Bento do Norte	2013-09-03 15:30:12.389704	20	1	sao-bento-do-norte
5483	São Bento do Trairí	2013-09-03 15:30:12.389704	20	1	sao-bento-do-trairi
5484	São Fernando	2013-09-03 15:30:12.389704	20	1	sao-fernando
5485	São Francisco do Oeste	2013-09-03 15:30:12.389704	20	1	sao-francisco-do-oeste
5486	São Gonçalo do Amarante	2013-09-03 15:30:12.389704	20	1	sao-goncalo-do-amarante
5487	São João do Sabugi	2013-09-03 15:30:12.389704	20	1	sao-joao-do-sabugi
5488	São José de Mipibu	2013-09-03 15:30:12.389704	20	1	sao-jose-de-mipibu
5489	São José do Campestre	2013-09-03 15:30:12.389704	20	1	sao-jose-do-campestre
5490	São José do Seridó	2013-09-03 15:30:12.389704	20	1	sao-jose-do-serido
5491	São Miguel	2013-09-03 15:30:12.389704	20	1	sao-miguel
5492	São Miguel do Gostoso	2013-09-03 15:30:12.389704	20	1	sao-miguel-do-gostoso
5493	São Paulo do Potengi	2013-09-03 15:30:12.389704	20	1	sao-paulo-do-potengi
5494	São Pedro	2013-09-03 15:30:12.389704	20	1	sao-pedro
5495	São Rafael	2013-09-03 15:30:12.389704	20	1	sao-rafael
5496	São Tomé	2013-09-03 15:30:12.389704	20	1	sao-tome
5497	São Vicente	2013-09-03 15:30:12.389704	20	1	sao-vicente
5498	Senador Elói de Souza	2013-09-03 15:30:12.389704	20	1	senador-eloi-de-souza
5499	Senador Georgino Avelino	2013-09-03 15:30:12.389704	20	1	senador-georgino-avelino
5500	Serra de São Bento	2013-09-03 15:30:12.389704	20	1	serra-de-sao-bento
5501	Serra do Mel	2013-09-03 15:30:12.389704	20	1	serra-do-mel
5502	Serra Negra do Norte	2013-09-03 15:30:12.389704	20	1	serra-negra-do-norte
5503	Serrinha	2013-09-03 15:30:12.389704	20	1	serrinha
5504	Serrinha dos Pintos	2013-09-03 15:30:12.389704	20	1	serrinha-dos-pintos
5505	Severiano Melo	2013-09-03 15:30:12.389704	20	1	severiano-melo
5506	Sítio Novo	2013-09-03 15:30:12.389704	20	1	sitio-novo
5507	Taboleiro Grande	2013-09-03 15:30:12.389704	20	1	taboleiro-grande
5508	Taipu	2013-09-03 15:30:12.389704	20	1	taipu
5509	Tangará	2013-09-03 15:30:12.389704	20	1	tangara
5510	Tenente Ananias	2013-09-03 15:30:12.389704	20	1	tenente-ananias
5511	Tenente Laurentino Cruz	2013-09-03 15:30:12.389704	20	1	tenente-laurentino-cruz
5512	Tibau	2013-09-03 15:30:12.389704	20	1	tibau
5513	Tibau do Sul	2013-09-03 15:30:12.389704	20	1	tibau-do-sul
5514	Timbaúba dos Batistas	2013-09-03 15:30:12.389704	20	1	timbauba-dos-batistas
5515	Touros	2013-09-03 15:30:12.389704	20	1	touros
5516	Triunfo Potiguar	2013-09-03 15:30:12.389704	20	1	triunfo-potiguar
5517	Umarizal	2013-09-03 15:30:12.389704	20	1	umarizal
5518	Upanema	2013-09-03 15:30:12.389704	20	1	upanema
5519	Várzea	2013-09-03 15:30:12.389704	20	1	varzea
5520	Venha-Ver	2013-09-03 15:30:12.389704	20	1	venha-ver
5521	Vera Cruz	2013-09-03 15:30:12.389704	20	1	vera-cruz
5522	Viçosa	2013-09-03 15:30:12.389704	20	1	vicosa
5523	Vila Flor	2013-09-03 15:30:12.389704	20	1	vila-flor
5612	Aceguá	2013-09-03 15:30:12.389704	21	1	acegua
5613	Água Santa	2013-09-03 15:30:12.389704	21	1	agua-santa
5614	Agudo	2013-09-03 15:30:12.389704	21	1	agudo
5615	Ajuricaba	2013-09-03 15:30:12.389704	21	1	ajuricaba
5616	Alecrim	2013-09-03 15:30:12.389704	21	1	alecrim
5617	Alegrete	2013-09-03 15:30:12.389704	21	1	alegrete
5618	Alegria	2013-09-03 15:30:12.389704	21	1	alegria
5619	Almirante Tamandaré do Sul	2013-09-03 15:30:12.389704	21	1	almirante-tamandare-do-sul
5620	Alpestre	2013-09-03 15:30:12.389704	21	1	alpestre
5621	Alto Alegre	2013-09-03 15:30:12.389704	21	1	alto-alegre
5622	Alto Feliz	2013-09-03 15:30:12.389704	21	1	alto-feliz
5623	Alvorada	2013-09-03 15:30:12.389704	21	1	alvorada
5624	Amaral Ferrador	2013-09-03 15:30:12.389704	21	1	amaral-ferrador
5625	Ametista do Sul	2013-09-03 15:30:12.389704	21	1	ametista-do-sul
5626	André da Rocha	2013-09-03 15:30:12.389704	21	1	andre-da-rocha
5627	Anta Gorda	2013-09-03 15:30:12.389704	21	1	anta-gorda
5628	Antônio Prado	2013-09-03 15:30:12.389704	21	1	antonio-prado
5629	Arambaré	2013-09-03 15:30:12.389704	21	1	arambare
5630	Araricá	2013-09-03 15:30:12.389704	21	1	ararica
5631	Aratiba	2013-09-03 15:30:12.389704	21	1	aratiba
5632	Arroio do Meio	2013-09-03 15:30:12.389704	21	1	arroio-do-meio
5633	Arroio do Padre	2013-09-03 15:30:12.389704	21	1	arroio-do-padre
5634	Arroio do Sal	2013-09-03 15:30:12.389704	21	1	arroio-do-sal
5635	Arroio do Tigre	2013-09-03 15:30:12.389704	21	1	arroio-do-tigre
5636	Arroio dos Ratos	2013-09-03 15:30:12.389704	21	1	arroio-dos-ratos
5637	Arroio Grande	2013-09-03 15:30:12.389704	21	1	arroio-grande
5638	Arvorezinha	2013-09-03 15:30:12.389704	21	1	arvorezinha
5639	Augusto Pestana	2013-09-03 15:30:12.389704	21	1	augusto-pestana
5640	Áurea	2013-09-03 15:30:12.389704	21	1	aurea
5641	Bagé	2013-09-03 15:30:12.389704	21	1	bage
5642	Balneário Pinhal	2013-09-03 15:30:12.389704	21	1	balneario-pinhal
5643	Barão	2013-09-03 15:30:12.389704	21	1	barao
5644	Barão de Cotegipe	2013-09-03 15:30:12.389704	21	1	barao-de-cotegipe
5645	Barão do Triunfo	2013-09-03 15:30:12.389704	21	1	barao-do-triunfo
5646	Barra do Guarita	2013-09-03 15:30:12.389704	21	1	barra-do-guarita
5647	Barra do Quaraí	2013-09-03 15:30:12.389704	21	1	barra-do-quarai
5648	Barra do Ribeiro	2013-09-03 15:30:12.389704	21	1	barra-do-ribeiro
5649	Barra do Rio Azul	2013-09-03 15:30:12.389704	21	1	barra-do-rio-azul
5650	Barra Funda	2013-09-03 15:30:12.389704	21	1	barra-funda
5651	Barracão	2013-09-03 15:30:12.389704	21	1	barracao
5652	Barros Cassal	2013-09-03 15:30:12.389704	21	1	barros-cassal
5653	Benjamin Constant do Sul	2013-09-03 15:30:12.389704	21	1	benjamin-constant-do-sul
5654	Bento Gonçalves	2013-09-03 15:30:12.389704	21	1	bento-goncalves
5655	Boa Vista das Missões	2013-09-03 15:30:12.389704	21	1	boa-vista-das-missoes
5656	Boa Vista do Buricá	2013-09-03 15:30:12.389704	21	1	boa-vista-do-burica
5657	Boa Vista do Cadeado	2013-09-03 15:30:12.389704	21	1	boa-vista-do-cadeado
5658	Boa Vista do Incra	2013-09-03 15:30:12.389704	21	1	boa-vista-do-incra
5660	Bom Jesus	2013-09-03 15:30:12.389704	21	1	bom-jesus
5661	Bom Princípio	2013-09-03 15:30:12.389704	21	1	bom-principio
5662	Bom Progresso	2013-09-03 15:30:12.389704	21	1	bom-progresso
5663	Bom Retiro do Sul	2013-09-03 15:30:12.389704	21	1	bom-retiro-do-sul
5664	Boqueirão do Leão	2013-09-03 15:30:12.389704	21	1	boqueirao-do-leao
5665	Bossoroca	2013-09-03 15:30:12.389704	21	1	bossoroca
5666	Bozano	2013-09-03 15:30:12.389704	21	1	bozano
5667	Braga	2013-09-03 15:30:12.389704	21	1	braga
5668	Brochier	2013-09-03 15:30:12.389704	21	1	brochier
5669	Butiá	2013-09-03 15:30:12.389704	21	1	butia
5670	Caçapava do Sul	2013-09-03 15:30:12.389704	21	1	cacapava-do-sul
5671	Cacequi	2013-09-03 15:30:12.389704	21	1	cacequi
5672	Cachoeira do Sul	2013-09-03 15:30:12.389704	21	1	cachoeira-do-sul
5673	Cachoeirinha	2013-09-03 15:30:12.389704	21	1	cachoeirinha
5674	Cacique Doble	2013-09-03 15:30:12.389704	21	1	cacique-doble
5675	Caibaté	2013-09-03 15:30:12.389704	21	1	caibate
5676	Caiçara	2013-09-03 15:30:12.389704	21	1	caicara
5677	Camaquã	2013-09-03 15:30:12.389704	21	1	camaqua
5678	Camargo	2013-09-03 15:30:12.389704	21	1	camargo
5679	Cambará do Sul	2013-09-03 15:30:12.389704	21	1	cambara-do-sul
5680	Campestre da Serra	2013-09-03 15:30:12.389704	21	1	campestre-da-serra
5681	Campina das Missões	2013-09-03 15:30:12.389704	21	1	campina-das-missoes
5682	Campinas do Sul	2013-09-03 15:30:12.389704	21	1	campinas-do-sul
5683	Campo Bom	2013-09-03 15:30:12.389704	21	1	campo-bom
5684	Campo Novo	2013-09-03 15:30:12.389704	21	1	campo-novo
5685	Campos Borges	2013-09-03 15:30:12.389704	21	1	campos-borges
5686	Candelária	2013-09-03 15:30:12.389704	21	1	candelaria
5687	Cândido Godói	2013-09-03 15:30:12.389704	21	1	candido-godoi
5688	Candiota	2013-09-03 15:30:12.389704	21	1	candiota
5689	Canela	2013-09-03 15:30:12.389704	21	1	canela
5690	Canguçu	2013-09-03 15:30:12.389704	21	1	cangucu
5691	Canoas	2013-09-03 15:30:12.389704	21	1	canoas
5692	Canudos do Vale	2013-09-03 15:30:12.389704	21	1	canudos-do-vale
5693	Capão Bonito do Sul	2013-09-03 15:30:12.389704	21	1	capao-bonito-do-sul
5694	Capão da Canoa	2013-09-03 15:30:12.389704	21	1	capao-da-canoa
5695	Capão do Cipó	2013-09-03 15:30:12.389704	21	1	capao-do-cipo
5696	Capão do Leão	2013-09-03 15:30:12.389704	21	1	capao-do-leao
5697	Capela de Santana	2013-09-03 15:30:12.389704	21	1	capela-de-santana
5698	Capitão	2013-09-03 15:30:12.389704	21	1	capitao
5699	Capivari do Sul	2013-09-03 15:30:12.389704	21	1	capivari-do-sul
5700	Caraá	2013-09-03 15:30:12.389704	21	1	caraa
5701	Carazinho	2013-09-03 15:30:12.389704	21	1	carazinho
5702	Carlos Barbosa	2013-09-03 15:30:12.389704	21	1	carlos-barbosa
5703	Carlos Gomes	2013-09-03 15:30:12.389704	21	1	carlos-gomes
5704	Casca	2013-09-03 15:30:12.389704	21	1	casca
5705	Caseiros	2013-09-03 15:30:12.389704	21	1	caseiros
5706	Catuípe	2013-09-03 15:30:12.389704	21	1	catuipe
5707	Caxias do Sul	2013-09-03 15:30:12.389704	21	1	caxias-do-sul
5708	Centenário	2013-09-03 15:30:12.389704	21	1	centenario
5709	Cerrito	2013-09-03 15:30:12.389704	21	1	cerrito
5710	Cerro Branco	2013-09-03 15:30:12.389704	21	1	cerro-branco
5711	Cerro Grande	2013-09-03 15:30:12.389704	21	1	cerro-grande
5712	Cerro Grande do Sul	2013-09-03 15:30:12.389704	21	1	cerro-grande-do-sul
5713	Cerro Largo	2013-09-03 15:30:12.389704	21	1	cerro-largo
5714	Chapada	2013-09-03 15:30:12.389704	21	1	chapada
5715	Charqueadas	2013-09-03 15:30:12.389704	21	1	charqueadas
5716	Charrua	2013-09-03 15:30:12.389704	21	1	charrua
5717	Chiapeta	2013-09-03 15:30:12.389704	21	1	chiapeta
5718	Chuí	2013-09-03 15:30:12.389704	21	1	chui
5719	Chuvisca	2013-09-03 15:30:12.389704	21	1	chuvisca
5720	Cidreira	2013-09-03 15:30:12.389704	21	1	cidreira
5721	Ciríaco	2013-09-03 15:30:12.389704	21	1	ciriaco
5722	Colinas	2013-09-03 15:30:12.389704	21	1	colinas
5723	Colorado	2013-09-03 15:30:12.389704	21	1	colorado
5724	Condor	2013-09-03 15:30:12.389704	21	1	condor
5725	Constantina	2013-09-03 15:30:12.389704	21	1	constantina
5726	Coqueiro Baixo	2013-09-03 15:30:12.389704	21	1	coqueiro-baixo
5727	Coqueiros do Sul	2013-09-03 15:30:12.389704	21	1	coqueiros-do-sul
5728	Coronel Barros	2013-09-03 15:30:12.389704	21	1	coronel-barros
5729	Coronel Bicaco	2013-09-03 15:30:12.389704	21	1	coronel-bicaco
5730	Coronel Pilar	2013-09-03 15:30:12.389704	21	1	coronel-pilar
5731	Cotiporã	2013-09-03 15:30:12.389704	21	1	cotipora
5732	Coxilha	2013-09-03 15:30:12.389704	21	1	coxilha
5733	Crissiumal	2013-09-03 15:30:12.389704	21	1	crissiumal
5734	Cristal	2013-09-03 15:30:12.389704	21	1	cristal
5735	Cristal do Sul	2013-09-03 15:30:12.389704	21	1	cristal-do-sul
5736	Cruz Alta	2013-09-03 15:30:12.389704	21	1	cruz-alta
5737	Cruzaltense	2013-09-03 15:30:12.389704	21	1	cruzaltense
5738	Cruzeiro do Sul	2013-09-03 15:30:12.389704	21	1	cruzeiro-do-sul
5739	David Canabarro	2013-09-03 15:30:12.389704	21	1	david-canabarro
5740	Derrubadas	2013-09-03 15:30:12.389704	21	1	derrubadas
5741	Dezesseis de Novembro	2013-09-03 15:30:12.389704	21	1	dezesseis-de-novembro
5742	Dilermando de Aguiar	2013-09-03 15:30:12.389704	21	1	dilermando-de-aguiar
5743	Dois Irmãos	2013-09-03 15:30:12.389704	21	1	dois-irmaos
5744	Dois Irmãos das Missões	2013-09-03 15:30:12.389704	21	1	dois-irmaos-das-missoes
5745	Dois Lajeados	2013-09-03 15:30:12.389704	21	1	dois-lajeados
5746	Dom Feliciano	2013-09-03 15:30:12.389704	21	1	dom-feliciano
5747	Dom Pedrito	2013-09-03 15:30:12.389704	21	1	dom-pedrito
5748	Dom Pedro de Alcântara	2013-09-03 15:30:12.389704	21	1	dom-pedro-de-alcantara
5749	Dona Francisca	2013-09-03 15:30:12.389704	21	1	dona-francisca
5750	Doutor Maurício Cardoso	2013-09-03 15:30:12.389704	21	1	doutor-mauricio-cardoso
5751	Doutor Ricardo	2013-09-03 15:30:12.389704	21	1	doutor-ricardo
5752	Eldorado do Sul	2013-09-03 15:30:12.389704	21	1	eldorado-do-sul
5753	Encantado	2013-09-03 15:30:12.389704	21	1	encantado
5754	Encruzilhada do Sul	2013-09-03 15:30:12.389704	21	1	encruzilhada-do-sul
5755	Engenho Velho	2013-09-03 15:30:12.389704	21	1	engenho-velho
5756	Entre Rios do Sul	2013-09-03 15:30:12.389704	21	1	entre-rios-do-sul
5757	Entre-Ijuís	2013-09-03 15:30:12.389704	21	1	entre-ijuis
5758	Erebango	2013-09-03 15:30:12.389704	21	1	erebango
5759	Erechim	2013-09-03 15:30:12.389704	21	1	erechim
5760	Ernestina	2013-09-03 15:30:12.389704	21	1	ernestina
5761	Erval Grande	2013-09-03 15:30:12.389704	21	1	erval-grande
5762	Erval Seco	2013-09-03 15:30:12.389704	21	1	erval-seco
5763	Esmeralda	2013-09-03 15:30:12.389704	21	1	esmeralda
5764	Esperança do Sul	2013-09-03 15:30:12.389704	21	1	esperanca-do-sul
5765	Espumoso	2013-09-03 15:30:12.389704	21	1	espumoso
5766	Estação	2013-09-03 15:30:12.389704	21	1	estacao
5767	Estância Velha	2013-09-03 15:30:12.389704	21	1	estancia-velha
5768	Esteio	2013-09-03 15:30:12.389704	21	1	esteio
5769	Estrela	2013-09-03 15:30:12.389704	21	1	estrela
5770	Estrela Velha	2013-09-03 15:30:12.389704	21	1	estrela-velha
5771	Eugênio de Castro	2013-09-03 15:30:12.389704	21	1	eugenio-de-castro
5772	Fagundes Varela	2013-09-03 15:30:12.389704	21	1	fagundes-varela
5773	Farroupilha	2013-09-03 15:30:12.389704	21	1	farroupilha
5774	Faxinal do Soturno	2013-09-03 15:30:12.389704	21	1	faxinal-do-soturno
5775	Faxinalzinho	2013-09-03 15:30:12.389704	21	1	faxinalzinho
5776	Fazenda Vilanova	2013-09-03 15:30:12.389704	21	1	fazenda-vilanova
5777	Feliz	2013-09-03 15:30:12.389704	21	1	feliz
5778	Flores da Cunha	2013-09-03 15:30:12.389704	21	1	flores-da-cunha
5779	Floriano Peixoto	2013-09-03 15:30:12.389704	21	1	floriano-peixoto
5780	Fontoura Xavier	2013-09-03 15:30:12.389704	21	1	fontoura-xavier
5781	Formigueiro	2013-09-03 15:30:12.389704	21	1	formigueiro
5782	Forquetinha	2013-09-03 15:30:12.389704	21	1	forquetinha
5783	Fortaleza dos Valos	2013-09-03 15:30:12.389704	21	1	fortaleza-dos-valos
5784	Frederico Westphalen	2013-09-03 15:30:12.389704	21	1	frederico-westphalen
5785	Garibaldi	2013-09-03 15:30:12.389704	21	1	garibaldi
5786	Garruchos	2013-09-03 15:30:12.389704	21	1	garruchos
5787	Gaurama	2013-09-03 15:30:12.389704	21	1	gaurama
5788	General Câmara	2013-09-03 15:30:12.389704	21	1	general-camara
5789	Gentil	2013-09-03 15:30:12.389704	21	1	gentil
5790	Getúlio Vargas	2013-09-03 15:30:12.389704	21	1	getulio-vargas
5791	Giruá	2013-09-03 15:30:12.389704	21	1	girua
5792	Glorinha	2013-09-03 15:30:12.389704	21	1	glorinha
5793	Gramado	2013-09-03 15:30:12.389704	21	1	gramado
5794	Gramado dos Loureiros	2013-09-03 15:30:12.389704	21	1	gramado-dos-loureiros
5795	Gramado Xavier	2013-09-03 15:30:12.389704	21	1	gramado-xavier
5796	Gravataí	2013-09-03 15:30:12.389704	21	1	gravatai
5797	Guabiju	2013-09-03 15:30:12.389704	21	1	guabiju
5798	Guaíba	2013-09-03 15:30:12.389704	21	1	guaiba
5799	Guaporé	2013-09-03 15:30:12.389704	21	1	guapore
5800	Guarani das Missões	2013-09-03 15:30:12.389704	21	1	guarani-das-missoes
5801	Harmonia	2013-09-03 15:30:12.389704	21	1	harmonia
5802	Herval	2013-09-03 15:30:12.389704	21	1	herval
5803	Herveiras	2013-09-03 15:30:12.389704	21	1	herveiras
5804	Horizontina	2013-09-03 15:30:12.389704	21	1	horizontina
5805	Hulha Negra	2013-09-03 15:30:12.389704	21	1	hulha-negra
5806	Humaitá	2013-09-03 15:30:12.389704	21	1	humaita
5807	Ibarama	2013-09-03 15:30:12.389704	21	1	ibarama
5808	Ibiaçá	2013-09-03 15:30:12.389704	21	1	ibiaca
5809	Ibiraiaras	2013-09-03 15:30:12.389704	21	1	ibiraiaras
5810	Ibirapuitã	2013-09-03 15:30:12.389704	21	1	ibirapuita
5811	Ibirubá	2013-09-03 15:30:12.389704	21	1	ibiruba
5812	Igrejinha	2013-09-03 15:30:12.389704	21	1	igrejinha
5813	Ijuí	2013-09-03 15:30:12.389704	21	1	ijui
5814	Ilópolis	2013-09-03 15:30:12.389704	21	1	ilopolis
5815	Imbé	2013-09-03 15:30:12.389704	21	1	imbe
5816	Imigrante	2013-09-03 15:30:12.389704	21	1	imigrante
5817	Independência	2013-09-03 15:30:12.389704	21	1	independencia
5818	Inhacorá	2013-09-03 15:30:12.389704	21	1	inhacora
5819	Ipê	2013-09-03 15:30:12.389704	21	1	ipe
5820	Ipiranga do Sul	2013-09-03 15:30:12.389704	21	1	ipiranga-do-sul
5821	Iraí	2013-09-03 15:30:12.389704	21	1	irai
5822	Itaara	2013-09-03 15:30:12.389704	21	1	itaara
5823	Itacurubi	2013-09-03 15:30:12.389704	21	1	itacurubi
5824	Itapuca	2013-09-03 15:30:12.389704	21	1	itapuca
5825	Itaqui	2013-09-03 15:30:12.389704	21	1	itaqui
5826	Itati	2013-09-03 15:30:12.389704	21	1	itati
5827	Itatiba do Sul	2013-09-03 15:30:12.389704	21	1	itatiba-do-sul
5828	Ivorá	2013-09-03 15:30:12.389704	21	1	ivora
5829	Ivoti	2013-09-03 15:30:12.389704	21	1	ivoti
5830	Jaboticaba	2013-09-03 15:30:12.389704	21	1	jaboticaba
5831	Jacuizinho	2013-09-03 15:30:12.389704	21	1	jacuizinho
5832	Jacutinga	2013-09-03 15:30:12.389704	21	1	jacutinga
5833	Jaguarão	2013-09-03 15:30:12.389704	21	1	jaguarao
5834	Jaguari	2013-09-03 15:30:12.389704	21	1	jaguari
5835	Jaquirana	2013-09-03 15:30:12.389704	21	1	jaquirana
5836	Jari	2013-09-03 15:30:12.389704	21	1	jari
5837	Jóia	2013-09-03 15:30:12.389704	21	1	joia
5838	Júlio de Castilhos	2013-09-03 15:30:12.389704	21	1	julio-de-castilhos
5839	Lagoa Bonita do Sul	2013-09-03 15:30:12.389704	21	1	lagoa-bonita-do-sul
5840	Lagoa dos Três Cantos	2013-09-03 15:30:12.389704	21	1	lagoa-dos-tres-cantos
5841	Lagoa Vermelha	2013-09-03 15:30:12.389704	21	1	lagoa-vermelha
5842	Lagoão	2013-09-03 15:30:12.389704	21	1	lagoao
5843	Lajeado	2013-09-03 15:30:12.389704	21	1	lajeado
5844	Lajeado do Bugre	2013-09-03 15:30:12.389704	21	1	lajeado-do-bugre
5845	Lavras do Sul	2013-09-03 15:30:12.389704	21	1	lavras-do-sul
5846	Liberato Salzano	2013-09-03 15:30:12.389704	21	1	liberato-salzano
5847	Lindolfo Collor	2013-09-03 15:30:12.389704	21	1	lindolfo-collor
5848	Linha Nova	2013-09-03 15:30:12.389704	21	1	linha-nova
5849	Maçambara	2013-09-03 15:30:12.389704	21	1	macambara
5850	Machadinho	2013-09-03 15:30:12.389704	21	1	machadinho
5851	Mampituba	2013-09-03 15:30:12.389704	21	1	mampituba
5852	Manoel Viana	2013-09-03 15:30:12.389704	21	1	manoel-viana
5853	Maquiné	2013-09-03 15:30:12.389704	21	1	maquine
5854	Maratá	2013-09-03 15:30:12.389704	21	1	marata
5855	Marau	2013-09-03 15:30:12.389704	21	1	marau
5856	Marcelino Ramos	2013-09-03 15:30:12.389704	21	1	marcelino-ramos
5857	Mariana Pimentel	2013-09-03 15:30:12.389704	21	1	mariana-pimentel
5858	Mariano Moro	2013-09-03 15:30:12.389704	21	1	mariano-moro
5859	Marques de Souza	2013-09-03 15:30:12.389704	21	1	marques-de-souza
5860	Mata	2013-09-03 15:30:12.389704	21	1	mata
5861	Mato Castelhano	2013-09-03 15:30:12.389704	21	1	mato-castelhano
5862	Mato Leitão	2013-09-03 15:30:12.389704	21	1	mato-leitao
5863	Mato Queimado	2013-09-03 15:30:12.389704	21	1	mato-queimado
5864	Maximiliano de Almeida	2013-09-03 15:30:12.389704	21	1	maximiliano-de-almeida
5865	Minas do Leão	2013-09-03 15:30:12.389704	21	1	minas-do-leao
5866	Miraguaí	2013-09-03 15:30:12.389704	21	1	miraguai
5867	Montauri	2013-09-03 15:30:12.389704	21	1	montauri
5868	Monte Alegre dos Campos	2013-09-03 15:30:12.389704	21	1	monte-alegre-dos-campos
5869	Monte Belo do Sul	2013-09-03 15:30:12.389704	21	1	monte-belo-do-sul
5870	Montenegro	2013-09-03 15:30:12.389704	21	1	montenegro
5871	Mormaço	2013-09-03 15:30:12.389704	21	1	mormaco
5872	Morrinhos do Sul	2013-09-03 15:30:12.389704	21	1	morrinhos-do-sul
5873	Morro Redondo	2013-09-03 15:30:12.389704	21	1	morro-redondo
5874	Morro Reuter	2013-09-03 15:30:12.389704	21	1	morro-reuter
5875	Mostardas	2013-09-03 15:30:12.389704	21	1	mostardas
5876	Muçum	2013-09-03 15:30:12.389704	21	1	mucum
5877	Muitos Capões	2013-09-03 15:30:12.389704	21	1	muitos-capoes
5878	Muliterno	2013-09-03 15:30:12.389704	21	1	muliterno
5879	Não-Me-Toque	2013-09-03 15:30:12.389704	21	1	nao-me-toque
5880	Nicolau Vergueiro	2013-09-03 15:30:12.389704	21	1	nicolau-vergueiro
5881	Nonoai	2013-09-03 15:30:12.389704	21	1	nonoai
5882	Nova Alvorada	2013-09-03 15:30:12.389704	21	1	nova-alvorada
5883	Nova Araçá	2013-09-03 15:30:12.389704	21	1	nova-araca
5884	Nova Bassano	2013-09-03 15:30:12.389704	21	1	nova-bassano
5885	Nova Boa Vista	2013-09-03 15:30:12.389704	21	1	nova-boa-vista
5886	Nova Bréscia	2013-09-03 15:30:12.389704	21	1	nova-brescia
5887	Nova Candelária	2013-09-03 15:30:12.389704	21	1	nova-candelaria
5888	Nova Esperança do Sul	2013-09-03 15:30:12.389704	21	1	nova-esperanca-do-sul
5889	Nova Hartz	2013-09-03 15:30:12.389704	21	1	nova-hartz
5890	Nova Pádua	2013-09-03 15:30:12.389704	21	1	nova-padua
5891	Nova Palma	2013-09-03 15:30:12.389704	21	1	nova-palma
5892	Nova Petrópolis	2013-09-03 15:30:12.389704	21	1	nova-petropolis
5893	Nova Prata	2013-09-03 15:30:12.389704	21	1	nova-prata
5894	Nova Ramada	2013-09-03 15:30:12.389704	21	1	nova-ramada
5895	Nova Roma do Sul	2013-09-03 15:30:12.389704	21	1	nova-roma-do-sul
5896	Nova Santa Rita	2013-09-03 15:30:12.389704	21	1	nova-santa-rita
5897	Novo Barreiro	2013-09-03 15:30:12.389704	21	1	novo-barreiro
5898	Novo Cabrais	2013-09-03 15:30:12.389704	21	1	novo-cabrais
5899	Novo Hamburgo	2013-09-03 15:30:12.389704	21	1	novo-hamburgo
5900	Novo Machado	2013-09-03 15:30:12.389704	21	1	novo-machado
5901	Novo Tiradentes	2013-09-03 15:30:12.389704	21	1	novo-tiradentes
5902	Novo Xingu	2013-09-03 15:30:12.389704	21	1	novo-xingu
5903	Osório	2013-09-03 15:30:12.389704	21	1	osorio
5904	Paim Filho	2013-09-03 15:30:12.389704	21	1	paim-filho
5905	Palmares do Sul	2013-09-03 15:30:12.389704	21	1	palmares-do-sul
5906	Palmeira das Missões	2013-09-03 15:30:12.389704	21	1	palmeira-das-missoes
5907	Palmitinho	2013-09-03 15:30:12.389704	21	1	palmitinho
5908	Panambi	2013-09-03 15:30:12.389704	21	1	panambi
5909	Pantano Grande	2013-09-03 15:30:12.389704	21	1	pantano-grande
5910	Paraí	2013-09-03 15:30:12.389704	21	1	parai
5911	Paraíso do Sul	2013-09-03 15:30:12.389704	21	1	paraiso-do-sul
5912	Pareci Novo	2013-09-03 15:30:12.389704	21	1	pareci-novo
5913	Parobé	2013-09-03 15:30:12.389704	21	1	parobe
5914	Passa Sete	2013-09-03 15:30:12.389704	21	1	passa-sete
5915	Passo do Sobrado	2013-09-03 15:30:12.389704	21	1	passo-do-sobrado
5916	Passo Fundo	2013-09-03 15:30:12.389704	21	1	passo-fundo
5917	Paulo Bento	2013-09-03 15:30:12.389704	21	1	paulo-bento
5918	Paverama	2013-09-03 15:30:12.389704	21	1	paverama
5919	Pedras Altas	2013-09-03 15:30:12.389704	21	1	pedras-altas
5920	Pedro Osório	2013-09-03 15:30:12.389704	21	1	pedro-osorio
5921	Pejuçara	2013-09-03 15:30:12.389704	21	1	pejucara
5922	Pelotas	2013-09-03 15:30:12.389704	21	1	pelotas
5923	Picada Café	2013-09-03 15:30:12.389704	21	1	picada-cafe
5924	Pinhal	2013-09-03 15:30:12.389704	21	1	pinhal
5925	Pinhal da Serra	2013-09-03 15:30:12.389704	21	1	pinhal-da-serra
5926	Pinhal Grande	2013-09-03 15:30:12.389704	21	1	pinhal-grande
5927	Pinheirinho do Vale	2013-09-03 15:30:12.389704	21	1	pinheirinho-do-vale
5928	Pinheiro Machado	2013-09-03 15:30:12.389704	21	1	pinheiro-machado
5929	Pirapó	2013-09-03 15:30:12.389704	21	1	pirapo
5930	Piratini	2013-09-03 15:30:12.389704	21	1	piratini
5931	Planalto	2013-09-03 15:30:12.389704	21	1	planalto
5932	Poço das Antas	2013-09-03 15:30:12.389704	21	1	poco-das-antas
5933	Pontão	2013-09-03 15:30:12.389704	21	1	pontao
5934	Ponte Preta	2013-09-03 15:30:12.389704	21	1	ponte-preta
5935	Portão	2013-09-03 15:30:12.389704	21	1	portao
5936	Porto Alegre	2013-09-03 15:30:12.389704	21	1	porto-alegre
5937	Porto Lucena	2013-09-03 15:30:12.389704	21	1	porto-lucena
5938	Porto Mauá	2013-09-03 15:30:12.389704	21	1	porto-maua
5939	Porto Vera Cruz	2013-09-03 15:30:12.389704	21	1	porto-vera-cruz
5940	Porto Xavier	2013-09-03 15:30:12.389704	21	1	porto-xavier
5941	Pouso Novo	2013-09-03 15:30:12.389704	21	1	pouso-novo
5942	Presidente Lucena	2013-09-03 15:30:12.389704	21	1	presidente-lucena
5943	Progresso	2013-09-03 15:30:12.389704	21	1	progresso
5944	Protásio Alves	2013-09-03 15:30:12.389704	21	1	protasio-alves
5945	Putinga	2013-09-03 15:30:12.389704	21	1	putinga
5946	Quaraí	2013-09-03 15:30:12.389704	21	1	quarai
5947	Quatro Irmãos	2013-09-03 15:30:12.389704	21	1	quatro-irmaos
5948	Quevedos	2013-09-03 15:30:12.389704	21	1	quevedos
5949	Quinze de Novembro	2013-09-03 15:30:12.389704	21	1	quinze-de-novembro
5950	Redentora	2013-09-03 15:30:12.389704	21	1	redentora
5951	Relvado	2013-09-03 15:30:12.389704	21	1	relvado
5952	Restinga Seca	2013-09-03 15:30:12.389704	21	1	restinga-seca
5953	Rio dos Índios	2013-09-03 15:30:12.389704	21	1	rio-dos-indios
5954	Rio Grande	2013-09-03 15:30:12.389704	21	1	rio-grande
5955	Rio Pardo	2013-09-03 15:30:12.389704	21	1	rio-pardo
5956	Riozinho	2013-09-03 15:30:12.389704	21	1	riozinho
5957	Roca Sales	2013-09-03 15:30:12.389704	21	1	roca-sales
5958	Rodeio Bonito	2013-09-03 15:30:12.389704	21	1	rodeio-bonito
5959	Rolador	2013-09-03 15:30:12.389704	21	1	rolador
5960	Rolante	2013-09-03 15:30:12.389704	21	1	rolante
5961	Ronda Alta	2013-09-03 15:30:12.389704	21	1	ronda-alta
5962	Rondinha	2013-09-03 15:30:12.389704	21	1	rondinha
5963	Roque Gonzales	2013-09-03 15:30:12.389704	21	1	roque-gonzales
5964	Rosário do Sul	2013-09-03 15:30:12.389704	21	1	rosario-do-sul
5965	Sagrada Família	2013-09-03 15:30:12.389704	21	1	sagrada-familia
5966	Saldanha Marinho	2013-09-03 15:30:12.389704	21	1	saldanha-marinho
5967	Salto do Jacuí	2013-09-03 15:30:12.389704	21	1	salto-do-jacui
5968	Salvador das Missões	2013-09-03 15:30:12.389704	21	1	salvador-das-missoes
5969	Salvador do Sul	2013-09-03 15:30:12.389704	21	1	salvador-do-sul
5970	Sananduva	2013-09-03 15:30:12.389704	21	1	sananduva
5971	Santa Bárbara do Sul	2013-09-03 15:30:12.389704	21	1	santa-barbara-do-sul
5972	Santa Cecília do Sul	2013-09-03 15:30:12.389704	21	1	santa-cecilia-do-sul
5973	Santa Clara do Sul	2013-09-03 15:30:12.389704	21	1	santa-clara-do-sul
5974	Santa Cruz do Sul	2013-09-03 15:30:12.389704	21	1	santa-cruz-do-sul
5975	Santa Margarida do Sul	2013-09-03 15:30:12.389704	21	1	santa-margarida-do-sul
5976	Santa Maria	2013-09-03 15:30:12.389704	21	1	santa-maria
5977	Santa Maria do Herval	2013-09-03 15:30:12.389704	21	1	santa-maria-do-herval
5978	Santa Rosa	2013-09-03 15:30:12.389704	21	1	santa-rosa
5979	Santa Tereza	2013-09-03 15:30:12.389704	21	1	santa-tereza
5980	Santa Vitória do Palmar	2013-09-03 15:30:12.389704	21	1	santa-vitoria-do-palmar
5981	Santana da Boa Vista	2013-09-03 15:30:12.389704	21	1	santana-da-boa-vista
5982	Santana do Livramento	2013-09-03 15:30:12.389704	21	1	santana-do-livramento
5983	Santiago	2013-09-03 15:30:12.389704	21	1	santiago
5984	Santo Ângelo	2013-09-03 15:30:12.389704	21	1	santo-angelo
5985	Santo Antônio da Patrulha	2013-09-03 15:30:12.389704	21	1	santo-antonio-da-patrulha
5986	Santo Antônio das Missões	2013-09-03 15:30:12.389704	21	1	santo-antonio-das-missoes
5987	Santo Antônio do Palma	2013-09-03 15:30:12.389704	21	1	santo-antonio-do-palma
5988	Santo Antônio do Planalto	2013-09-03 15:30:12.389704	21	1	santo-antonio-do-planalto
5989	Santo Augusto	2013-09-03 15:30:12.389704	21	1	santo-augusto
5990	Santo Cristo	2013-09-03 15:30:12.389704	21	1	santo-cristo
5991	Santo Expedito do Sul	2013-09-03 15:30:12.389704	21	1	santo-expedito-do-sul
5992	São Borja	2013-09-03 15:30:12.389704	21	1	sao-borja
5993	São Domingos do Sul	2013-09-03 15:30:12.389704	21	1	sao-domingos-do-sul
5994	São Francisco de Assis	2013-09-03 15:30:12.389704	21	1	sao-francisco-de-assis
5995	São Francisco de Paula	2013-09-03 15:30:12.389704	21	1	sao-francisco-de-paula
5996	São Gabriel	2013-09-03 15:30:12.389704	21	1	sao-gabriel
5997	São Jerônimo	2013-09-03 15:30:12.389704	21	1	sao-jeronimo
5998	São João da Urtiga	2013-09-03 15:30:12.389704	21	1	sao-joao-da-urtiga
5999	São João do Polêsine	2013-09-03 15:30:12.389704	21	1	sao-joao-do-polesine
6000	São Jorge	2013-09-03 15:30:12.389704	21	1	sao-jorge
6001	São José das Missões	2013-09-03 15:30:12.389704	21	1	sao-jose-das-missoes
6002	São José do Herval	2013-09-03 15:30:12.389704	21	1	sao-jose-do-herval
6003	São José do Hortêncio	2013-09-03 15:30:12.389704	21	1	sao-jose-do-hortencio
6004	São José do Inhacorá	2013-09-03 15:30:12.389704	21	1	sao-jose-do-inhacora
6005	São José do Norte	2013-09-03 15:30:12.389704	21	1	sao-jose-do-norte
6006	São José do Ouro	2013-09-03 15:30:12.389704	21	1	sao-jose-do-ouro
6007	São José do Sul	2013-09-03 15:30:12.389704	21	1	sao-jose-do-sul
6008	São José dos Ausentes	2013-09-03 15:30:12.389704	21	1	sao-jose-dos-ausentes
6009	São Leopoldo	2013-09-03 15:30:12.389704	21	1	sao-leopoldo
6010	São Lourenço do Sul	2013-09-03 15:30:12.389704	21	1	sao-lourenco-do-sul
6011	São Luiz Gonzaga	2013-09-03 15:30:12.389704	21	1	sao-luiz-gonzaga
6012	São Marcos	2013-09-03 15:30:12.389704	21	1	sao-marcos
6013	São Martinho	2013-09-03 15:30:12.389704	21	1	sao-martinho
6014	São Martinho da Serra	2013-09-03 15:30:12.389704	21	1	sao-martinho-da-serra
6015	São Miguel das Missões	2013-09-03 15:30:12.389704	21	1	sao-miguel-das-missoes
6016	São Nicolau	2013-09-03 15:30:12.389704	21	1	sao-nicolau
6017	São Paulo das Missões	2013-09-03 15:30:12.389704	21	1	sao-paulo-das-missoes
6018	São Pedro da Serra	2013-09-03 15:30:12.389704	21	1	sao-pedro-da-serra
6019	São Pedro das Missões	2013-09-03 15:30:12.389704	21	1	sao-pedro-das-missoes
6020	São\nPedro do Butiá	2013-09-03 15:30:12.389704	21	1	sao-pedro-do-butia
6021	São Pedro do Sul	2013-09-03 15:30:12.389704	21	1	sao-pedro-do-sul
6022	São Sebastião do Caí	2013-09-03 15:30:12.389704	21	1	sao-sebastiao-do-cai
6023	São Sepé	2013-09-03 15:30:12.389704	21	1	sao-sepe
6024	São Valentim	2013-09-03 15:30:12.389704	21	1	sao-valentim
6025	São Valentim do Sul	2013-09-03 15:30:12.389704	21	1	sao-valentim-do-sul
6026	São Valério do Sul	2013-09-03 15:30:12.389704	21	1	sao-valerio-do-sul
6027	São Vendelino	2013-09-03 15:30:12.389704	21	1	sao-vendelino
6028	São Vicente do Sul	2013-09-03 15:30:12.389704	21	1	sao-vicente-do-sul
6029	Sapiranga	2013-09-03 15:30:12.389704	21	1	sapiranga
6030	Sapucaia do Sul	2013-09-03 15:30:12.389704	21	1	sapucaia-do-sul
6031	Sarandi	2013-09-03 15:30:12.389704	21	1	sarandi
6032	Seberi	2013-09-03 15:30:12.389704	21	1	seberi
6033	Sede Nova	2013-09-03 15:30:12.389704	21	1	sede-nova
6034	Segredo	2013-09-03 15:30:12.389704	21	1	segredo
6035	Selbach	2013-09-03 15:30:12.389704	21	1	selbach
6036	Senador Salgado Filho	2013-09-03 15:30:12.389704	21	1	senador-salgado-filho
6037	Sentinela do Sul	2013-09-03 15:30:12.389704	21	1	sentinela-do-sul
6038	Serafina Corrêa	2013-09-03 15:30:12.389704	21	1	serafina-correa
6039	Sério	2013-09-03 15:30:12.389704	21	1	serio
6040	Sertão	2013-09-03 15:30:12.389704	21	1	sertao
6041	Sertão Santana	2013-09-03 15:30:12.389704	21	1	sertao-santana
6042	Sete de Setembro	2013-09-03 15:30:12.389704	21	1	sete-de-setembro
6043	Severiano de Almeida	2013-09-03 15:30:12.389704	21	1	severiano-de-almeida
6044	Silveira Martins	2013-09-03 15:30:12.389704	21	1	silveira-martins
6045	Sinimbu	2013-09-03 15:30:12.389704	21	1	sinimbu
6046	Sobradinho	2013-09-03 15:30:12.389704	21	1	sobradinho
6047	Soledade	2013-09-03 15:30:12.389704	21	1	soledade
6048	Tabaí	2013-09-03 15:30:12.389704	21	1	tabai
6049	Tapejara	2013-09-03 15:30:12.389704	21	1	tapejara
6050	Tapera	2013-09-03 15:30:12.389704	21	1	tapera
6051	Tapes	2013-09-03 15:30:12.389704	21	1	tapes
6052	Taquara	2013-09-03 15:30:12.389704	21	1	taquara
6053	Taquari	2013-09-03 15:30:12.389704	21	1	taquari
6054	Taquaruçu do Sul	2013-09-03 15:30:12.389704	21	1	taquarucu-do-sul
6055	Tavares	2013-09-03 15:30:12.389704	21	1	tavares
6056	Tenente Portela	2013-09-03 15:30:12.389704	21	1	tenente-portela
6057	Terra de Areia	2013-09-03 15:30:12.389704	21	1	terra-de-areia
6058	Teutônia	2013-09-03 15:30:12.389704	21	1	teutonia
6059	Tio Hugo	2013-09-03 15:30:12.389704	21	1	tio-hugo
6060	Tiradentes do Sul	2013-09-03 15:30:12.389704	21	1	tiradentes-do-sul
6061	Toropi	2013-09-03 15:30:12.389704	21	1	toropi
6062	Torres	2013-09-03 15:30:12.389704	21	1	torres
6063	Tramandaí	2013-09-03 15:30:12.389704	21	1	tramandai
6064	Travesseiro	2013-09-03 15:30:12.389704	21	1	travesseiro
6065	Três Arroios	2013-09-03 15:30:12.389704	21	1	tres-arroios
6066	Três Cachoeiras	2013-09-03 15:30:12.389704	21	1	tres-cachoeiras
6067	Três Coroas	2013-09-03 15:30:12.389704	21	1	tres-coroas
6068	Três de Maio	2013-09-03 15:30:12.389704	21	1	tres-de-maio
6069	Três Forquilhas	2013-09-03 15:30:12.389704	21	1	tres-forquilhas
6070	Três Palmeiras	2013-09-03 15:30:12.389704	21	1	tres-palmeiras
6071	Três Passos	2013-09-03 15:30:12.389704	21	1	tres-passos
6072	Trindade do Sul	2013-09-03 15:30:12.389704	21	1	trindade-do-sul
6073	Triunfo	2013-09-03 15:30:12.389704	21	1	triunfo
6074	Tucunduva	2013-09-03 15:30:12.389704	21	1	tucunduva
6075	Tunas	2013-09-03 15:30:12.389704	21	1	tunas
6076	Tupanci do Sul	2013-09-03 15:30:12.389704	21	1	tupanci-do-sul
6077	Tupanciretã	2013-09-03 15:30:12.389704	21	1	tupancireta
6078	Tupandi	2013-09-03 15:30:12.389704	21	1	tupandi
6079	Tuparendi	2013-09-03 15:30:12.389704	21	1	tuparendi
6080	Turuçu	2013-09-03 15:30:12.389704	21	1	turucu
6081	Ubiretama	2013-09-03 15:30:12.389704	21	1	ubiretama
6082	União da Serra	2013-09-03 15:30:12.389704	21	1	uniao-da-serra
6083	Unistalda	2013-09-03 15:30:12.389704	21	1	unistalda
6084	Uruguaiana	2013-09-03 15:30:12.389704	21	1	uruguaiana
6085	Vacaria	2013-09-03 15:30:12.389704	21	1	vacaria
6086	Vale do Sol	2013-09-03 15:30:12.389704	21	1	vale-do-sol
6087	Vale Real	2013-09-03 15:30:12.389704	21	1	vale-real
6088	Vale Verde	2013-09-03 15:30:12.389704	21	1	vale-verde
6089	Vanini	2013-09-03 15:30:12.389704	21	1	vanini
6090	Venâncio Aires	2013-09-03 15:30:12.389704	21	1	venancio-aires
6091	Vera Cruz	2013-09-03 15:30:12.389704	21	1	vera-cruz
6092	Veranópolis	2013-09-03 15:30:12.389704	21	1	veranopolis
6093	Vespasiano Correa	2013-09-03 15:30:12.389704	21	1	vespasiano-correa
6094	Viadutos	2013-09-03 15:30:12.389704	21	1	viadutos
6095	Viamão	2013-09-03 15:30:12.389704	21	1	viamao
6096	Vicente Dutra	2013-09-03 15:30:12.389704	21	1	vicente-dutra
6097	Victor Graeff	2013-09-03 15:30:12.389704	21	1	victor-graeff
6098	Vila Flores	2013-09-03 15:30:12.389704	21	1	vila-flores
6099	Vila Lângaro	2013-09-03 15:30:12.389704	21	1	vila-langaro
6100	Vila Maria	2013-09-03 15:30:12.389704	21	1	vila-maria
6101	Vila Nova do Sul	2013-09-03 15:30:12.389704	21	1	vila-nova-do-sul
6102	Vista Alegre	2013-09-03 15:30:12.389704	21	1	vista-alegre
6103	Vista Alegre do Prata	2013-09-03 15:30:12.389704	21	1	vista-alegre-do-prata
6104	Vista Gaúcha	2013-09-03 15:30:12.389704	21	1	vista-gaucha
6105	Vitória das Missões	2013-09-03 15:30:12.389704	21	1	vitoria-das-missoes
6106	Westfália	2013-09-03 15:30:12.389704	21	1	westfalia
6107	Xangri-lá	2013-09-03 15:30:12.389704	21	1	xangri-la
6123	Alta Floresta d`Oeste	2013-09-03 15:30:12.389704	22	1	alta-floresta-d-oeste
6124	Alto Alegre dos Parecis	2013-09-03 15:30:12.389704	22	1	alto-alegre-dos-parecis
6125	Alto Paraíso	2013-09-03 15:30:12.389704	22	1	alto-paraiso
6126	Alvorada d`Oeste	2013-09-03 15:30:12.389704	22	1	alvorada-d-oeste
6127	Ariquemes	2013-09-03 15:30:12.389704	22	1	ariquemes
6128	Buritis	2013-09-03 15:30:12.389704	22	1	buritis
6129	Cabixi	2013-09-03 15:30:12.389704	22	1	cabixi
6130	Cacaulândia	2013-09-03 15:30:12.389704	22	1	cacaulandia
6131	Cacoal	2013-09-03 15:30:12.389704	22	1	cacoal
6132	Campo Novo de Rondônia	2013-09-03 15:30:12.389704	22	1	campo-novo-de-rondonia
6133	Candeias do Jamari	2013-09-03 15:30:12.389704	22	1	candeias-do-jamari
6134	Castanheiras	2013-09-03 15:30:12.389704	22	1	castanheiras
6135	Cerejeiras	2013-09-03 15:30:12.389704	22	1	cerejeiras
6136	Chupinguaia	2013-09-03 15:30:12.389704	22	1	chupinguaia
6137	Colorado do Oeste	2013-09-03 15:30:12.389704	22	1	colorado-do-oeste
6138	Corumbiara	2013-09-03 15:30:12.389704	22	1	corumbiara
6139	Costa Marques	2013-09-03 15:30:12.389704	22	1	costa-marques
6140	Cujubim	2013-09-03 15:30:12.389704	22	1	cujubim
6141	Espigão d`Oeste	2013-09-03 15:30:12.389704	22	1	espigao-d-oeste
6142	Governador Jorge Teixeira	2013-09-03 15:30:12.389704	22	1	governador-jorge-teixeira
6143	Guajará-Mirim	2013-09-03 15:30:12.389704	22	1	guajara-mirim
6144	Itapuã do Oeste	2013-09-03 15:30:12.389704	22	1	itapua-do-oeste
6145	Jaru	2013-09-03 15:30:12.389704	22	1	jaru
6146	Ji-Paraná	2013-09-03 15:30:12.389704	22	1	ji-parana
6147	Machadinho d`Oeste	2013-09-03 15:30:12.389704	22	1	machadinho-d-oeste
6148	Ministro Andreazza	2013-09-03 15:30:12.389704	22	1	ministro-andreazza
6149	Mirante da Serra	2013-09-03 15:30:12.389704	22	1	mirante-da-serra
6150	Monte Negro	2013-09-03 15:30:12.389704	22	1	monte-negro
6151	Nova Brasilândia d`Oeste	2013-09-03 15:30:12.389704	22	1	nova-brasilandia-d-oeste
6152	Nova Mamoré	2013-09-03 15:30:12.389704	22	1	nova-mamore
6153	Nova União	2013-09-03 15:30:12.389704	22	1	nova-uniao
6154	Novo Horizonte do Oeste	2013-09-03 15:30:12.389704	22	1	novo-horizonte-do-oeste
6155	Ouro Preto do Oeste	2013-09-03 15:30:12.389704	22	1	ouro-preto-do-oeste
6156	Parecis	2013-09-03 15:30:12.389704	22	1	parecis
6157	Pimenta Bueno	2013-09-03 15:30:12.389704	22	1	pimenta-bueno
6158	Pimenteiras do Oeste	2013-09-03 15:30:12.389704	22	1	pimenteiras-do-oeste
6159	Porto Velho	2013-09-03 15:30:12.389704	22	1	porto-velho
6160	Presidente Médici	2013-09-03 15:30:12.389704	22	1	presidente-medici
6161	Primavera de Rondônia	2013-09-03 15:30:12.389704	22	1	primavera-de-rondonia
6162	Rio Crespo	2013-09-03 15:30:12.389704	22	1	rio-crespo
6163	Rolim de Moura	2013-09-03 15:30:12.389704	22	1	rolim-de-moura
6164	Santa Luzia d`Oeste	2013-09-03 15:30:12.389704	22	1	santa-luzia-d-oeste
6165	São Felipe d`Oeste	2013-09-03 15:30:12.389704	22	1	sao-felipe-d-oeste
6166	São Francisco do Guaporé	2013-09-03 15:30:12.389704	22	1	sao-francisco-do-guapore
6167	São Miguel do Guaporé	2013-09-03 15:30:12.389704	22	1	sao-miguel-do-guapore
6168	Seringueiras	2013-09-03 15:30:12.389704	22	1	seringueiras
6169	Teixeirópolis	2013-09-03 15:30:12.389704	22	1	teixeiropolis
6170	Theobroma	2013-09-03 15:30:12.389704	22	1	theobroma
6171	Urupá	2013-09-03 15:30:12.389704	22	1	urupa
6172	Vale do Anari	2013-09-03 15:30:12.389704	22	1	vale-do-anari
6173	Vale do Paraíso	2013-09-03 15:30:12.389704	22	1	vale-do-paraiso
6174	Vilhena	2013-09-03 15:30:12.389704	22	1	vilhena
6186	Alto Alegre	2013-09-03 15:30:12.389704	23	1	alto-alegre
6187	Amajari	2013-09-03 15:30:12.389704	23	1	amajari
6188	Boa Vista	2013-09-03 15:30:12.389704	23	1	boa-vista
6189	Bonfim	2013-09-03 15:30:12.389704	23	1	bonfim
6190	Cantá	2013-09-03 15:30:12.389704	23	1	canta
6191	Caracaraí	2013-09-03 15:30:12.389704	23	1	caracarai
6192	Caroebe	2013-09-03 15:30:12.389704	23	1	caroebe
6193	Iracema	2013-09-03 15:30:12.389704	23	1	iracema
6194	Mucajaí	2013-09-03 15:30:12.389704	23	1	mucajai
6195	Normandia	2013-09-03 15:30:12.389704	23	1	normandia
6196	Pacaraima	2013-09-03 15:30:12.389704	23	1	pacaraima
6197	Rorainópolis	2013-09-03 15:30:12.389704	23	1	rorainopolis
6198	São João da Baliza	2013-09-03 15:30:12.389704	23	1	sao-joao-da-baliza
6199	São Luiz	2013-09-03 15:30:12.389704	23	1	sao-luiz
6200	Uiramutã	2013-09-03 15:30:12.389704	23	1	uiramuta
6201	Abdon Batista	2013-09-03 15:30:12.389704	24	1	abdon-batista
6202	Abelardo Luz	2013-09-03 15:30:12.389704	24	1	abelardo-luz
6203	Agrolândia	2013-09-03 15:30:12.389704	24	1	agrolandia
6204	Agronômica	2013-09-03 15:30:12.389704	24	1	agronomica
6205	Água Doce	2013-09-03 15:30:12.389704	24	1	agua-doce
6206	Águas de Chapecó	2013-09-03 15:30:12.389704	24	1	aguas-de-chapeco
6207	Águas Frias	2013-09-03 15:30:12.389704	24	1	aguas-frias
6208	Águas Mornas	2013-09-03 15:30:12.389704	24	1	aguas-mornas
6209	Alfredo Wagner	2013-09-03 15:30:12.389704	24	1	alfredo-wagner
6210	Alto Bela Vista	2013-09-03 15:30:12.389704	24	1	alto-bela-vista
6211	Anchieta	2013-09-03 15:30:12.389704	24	1	anchieta
6212	Angelina	2013-09-03 15:30:12.389704	24	1	angelina
6213	Anita Garibaldi	2013-09-03 15:30:12.389704	24	1	anita-garibaldi
6214	Anitápolis	2013-09-03 15:30:12.389704	24	1	anitapolis
6215	Antônio Carlos	2013-09-03 15:30:12.389704	24	1	antonio-carlos
6216	Apiúna	2013-09-03 15:30:12.389704	24	1	apiuna
6217	Arabutã	2013-09-03 15:30:12.389704	24	1	arabuta
6218	Araquari	2013-09-03 15:30:12.389704	24	1	araquari
6219	Araranguá	2013-09-03 15:30:12.389704	24	1	ararangua
6220	Armazém	2013-09-03 15:30:12.389704	24	1	armazem
6221	Arroio Trinta	2013-09-03 15:30:12.389704	24	1	arroio-trinta
6222	Arvoredo	2013-09-03 15:30:12.389704	24	1	arvoredo
6223	Ascurra	2013-09-03 15:30:12.389704	24	1	ascurra
6224	Atalanta	2013-09-03 15:30:12.389704	24	1	atalanta
6225	Aurora	2013-09-03 15:30:12.389704	24	1	aurora
6226	Balneário Arroio do Silva	2013-09-03 15:30:12.389704	24	1	balneario-arroio-do-silva
6227	Balneário Barra do Sul	2013-09-03 15:30:12.389704	24	1	balneario-barra-do-sul
6228	Balneário Camboriú	2013-09-03 15:30:12.389704	24	1	balneario-camboriu
6229	Balneário Gaivota	2013-09-03 15:30:12.389704	24	1	balneario-gaivota
6230	Bandeirante	2013-09-03 15:30:12.389704	24	1	bandeirante
6231	Barra Bonita	2013-09-03 15:30:12.389704	24	1	barra-bonita
6232	Barra Velha	2013-09-03 15:30:12.389704	24	1	barra-velha
6233	Bela Vista do Toldo	2013-09-03 15:30:12.389704	24	1	bela-vista-do-toldo
6234	Belmonte	2013-09-03 15:30:12.389704	24	1	belmonte
6235	Benedito Novo	2013-09-03 15:30:12.389704	24	1	benedito-novo
6236	Biguaçu	2013-09-03 15:30:12.389704	24	1	biguacu
6237	Blumenau	2013-09-03 15:30:12.389704	24	1	blumenau
6238	Bocaina do Sul	2013-09-03 15:30:12.389704	24	1	bocaina-do-sul
6239	Bom Jardim da Serra	2013-09-03 15:30:12.389704	24	1	bom-jardim-da-serra
6240	Bom Jesus	2013-09-03 15:30:12.389704	24	1	bom-jesus
6241	Bom Jesus do Oeste	2013-09-03 15:30:12.389704	24	1	bom-jesus-do-oeste
6242	Bom Retiro	2013-09-03 15:30:12.389704	24	1	bom-retiro
6243	Bombinhas	2013-09-03 15:30:12.389704	24	1	bombinhas
6244	Botuverá	2013-09-03 15:30:12.389704	24	1	botuvera
6245	Braço do Norte	2013-09-03 15:30:12.389704	24	1	braco-do-norte
6246	Braço do Trombudo	2013-09-03 15:30:12.389704	24	1	braco-do-trombudo
6247	Brunópolis	2013-09-03 15:30:12.389704	24	1	brunopolis
6248	Brusque	2013-09-03 15:30:12.389704	24	1	brusque
6249	Caçador	2013-09-03 15:30:12.389704	24	1	cacador
6250	Caibi	2013-09-03 15:30:12.389704	24	1	caibi
6251	Calmon	2013-09-03 15:30:12.389704	24	1	calmon
6252	Camboriú	2013-09-03 15:30:12.389704	24	1	camboriu
6253	Campo Alegre	2013-09-03 15:30:12.389704	24	1	campo-alegre
6254	Campo Belo do Sul	2013-09-03 15:30:12.389704	24	1	campo-belo-do-sul
6255	Campo Erê	2013-09-03 15:30:12.389704	24	1	campo-ere
6256	Campos Novos	2013-09-03 15:30:12.389704	24	1	campos-novos
6257	Canelinha	2013-09-03 15:30:12.389704	24	1	canelinha
6258	Canoinhas	2013-09-03 15:30:12.389704	24	1	canoinhas
6259	Capão Alto	2013-09-03 15:30:12.389704	24	1	capao-alto
6260	Capinzal	2013-09-03 15:30:12.389704	24	1	capinzal
6261	Capivari de Baixo	2013-09-03 15:30:12.389704	24	1	capivari-de-baixo
6262	Catanduvas	2013-09-03 15:30:12.389704	24	1	catanduvas
6263	Caxambu do Sul	2013-09-03 15:30:12.389704	24	1	caxambu-do-sul
6264	Celso Ramos	2013-09-03 15:30:12.389704	24	1	celso-ramos
6265	Cerro Negro	2013-09-03 15:30:12.389704	24	1	cerro-negro
6266	Chapadão do Lageado	2013-09-03 15:30:12.389704	24	1	chapadao-do-lageado
6267	Chapecó	2013-09-03 15:30:12.389704	24	1	chapeco
6268	Cocal do Sul	2013-09-03 15:30:12.389704	24	1	cocal-do-sul
6269	Concórdia	2013-09-03 15:30:12.389704	24	1	concordia
6270	Cordilheira Alta	2013-09-03 15:30:12.389704	24	1	cordilheira-alta
6271	Coronel Freitas	2013-09-03 15:30:12.389704	24	1	coronel-freitas
6272	Coronel Martins	2013-09-03 15:30:12.389704	24	1	coronel-martins
6273	Correia Pinto	2013-09-03 15:30:12.389704	24	1	correia-pinto
6274	Corupá	2013-09-03 15:30:12.389704	24	1	corupa
6275	Criciúma	2013-09-03 15:30:12.389704	24	1	criciuma
6276	Cunha Porã	2013-09-03 15:30:12.389704	24	1	cunha-pora
6277	Cunhataí	2013-09-03 15:30:12.389704	24	1	cunhatai
6278	Curitibanos	2013-09-03 15:30:12.389704	24	1	curitibanos
6279	Descanso	2013-09-03 15:30:12.389704	24	1	descanso
6280	Dionísio Cerqueira	2013-09-03 15:30:12.389704	24	1	dionisio-cerqueira
6281	Dona Emma	2013-09-03 15:30:12.389704	24	1	dona-emma
6282	Doutor Pedrinho	2013-09-03 15:30:12.389704	24	1	doutor-pedrinho
6283	Entre Rios	2013-09-03 15:30:12.389704	24	1	entre-rios
6284	Ermo	2013-09-03 15:30:12.389704	24	1	ermo
6285	Erval Velho	2013-09-03 15:30:12.389704	24	1	erval-velho
6286	Faxinal dos Guedes	2013-09-03 15:30:12.389704	24	1	faxinal-dos-guedes
6287	Flor do Sertão	2013-09-03 15:30:12.389704	24	1	flor-do-sertao
6288	Florianópolis	2013-09-03 15:30:12.389704	24	1	florianopolis
6289	Formosa do Sul	2013-09-03 15:30:12.389704	24	1	formosa-do-sul
6290	Forquilhinha	2013-09-03 15:30:12.389704	24	1	forquilhinha
6291	Fraiburgo	2013-09-03 15:30:12.389704	24	1	fraiburgo
6292	Frei Rogério	2013-09-03 15:30:12.389704	24	1	frei-rogerio
6293	Galvão	2013-09-03 15:30:12.389704	24	1	galvao
6294	Garopaba	2013-09-03 15:30:12.389704	24	1	garopaba
6295	Garuva	2013-09-03 15:30:12.389704	24	1	garuva
6296	Gaspar	2013-09-03 15:30:12.389704	24	1	gaspar
6297	Governador Celso Ramos	2013-09-03 15:30:12.389704	24	1	governador-celso-ramos
6298	Grão Pará	2013-09-03 15:30:12.389704	24	1	grao-para
6299	Gravatal	2013-09-03 15:30:12.389704	24	1	gravatal
6300	Guabiruba	2013-09-03 15:30:12.389704	24	1	guabiruba
6301	Guaraciaba	2013-09-03 15:30:12.389704	24	1	guaraciaba
6302	Guaramirim	2013-09-03 15:30:12.389704	24	1	guaramirim
6303	Guarujá do Sul	2013-09-03 15:30:12.389704	24	1	guaruja-do-sul
6304	Guatambú	2013-09-03 15:30:12.389704	24	1	guatambu
6305	Herval d`Oeste	2013-09-03 15:30:12.389704	24	1	herval-d-oeste
6306	Ibiam	2013-09-03 15:30:12.389704	24	1	ibiam
6307	Ibicaré	2013-09-03 15:30:12.389704	24	1	ibicare
6308	Ibirama	2013-09-03 15:30:12.389704	24	1	ibirama
6309	Içara	2013-09-03 15:30:12.389704	24	1	icara
6310	Ilhota	2013-09-03 15:30:12.389704	24	1	ilhota
6311	Imaruí	2013-09-03 15:30:12.389704	24	1	imarui
6312	Imbituba	2013-09-03 15:30:12.389704	24	1	imbituba
6313	Imbuia	2013-09-03 15:30:12.389704	24	1	imbuia
6314	Indaial	2013-09-03 15:30:12.389704	24	1	indaial
6315	Iomerê	2013-09-03 15:30:12.389704	24	1	iomere
6316	Ipira	2013-09-03 15:30:12.389704	24	1	ipira
6317	Iporã do Oeste	2013-09-03 15:30:12.389704	24	1	ipora-do-oeste
6318	Ipuaçu	2013-09-03 15:30:12.389704	24	1	ipuacu
6319	Ipumirim	2013-09-03 15:30:12.389704	24	1	ipumirim
6320	Iraceminha	2013-09-03 15:30:12.389704	24	1	iraceminha
6321	Irani	2013-09-03 15:30:12.389704	24	1	irani
6322	Irati	2013-09-03 15:30:12.389704	24	1	irati
6323	Irineópolis	2013-09-03 15:30:12.389704	24	1	irineopolis
6324	Itá	2013-09-03 15:30:12.389704	24	1	ita
6325	Itaiópolis	2013-09-03 15:30:12.389704	24	1	itaiopolis
6326	Itajaí	2013-09-03 15:30:12.389704	24	1	itajai
6327	Itapema	2013-09-03 15:30:12.389704	24	1	itapema
6328	Itapiranga	2013-09-03 15:30:12.389704	24	1	itapiranga
6329	Itapoá	2013-09-03 15:30:12.389704	24	1	itapoa
6330	Ituporanga	2013-09-03 15:30:12.389704	24	1	ituporanga
6331	Jaborá	2013-09-03 15:30:12.389704	24	1	jabora
6332	Jacinto Machado	2013-09-03 15:30:12.389704	24	1	jacinto-machado
6333	Jaguaruna	2013-09-03 15:30:12.389704	24	1	jaguaruna
6334	Jaraguá do Sul	2013-09-03 15:30:12.389704	24	1	jaragua-do-sul
6335	Jardinópolis	2013-09-03 15:30:12.389704	24	1	jardinopolis
6336	Joaçaba	2013-09-03 15:30:12.389704	24	1	joacaba
6337	Joinville	2013-09-03 15:30:12.389704	24	1	joinville
6338	José Boiteux	2013-09-03 15:30:12.389704	24	1	jose-boiteux
6339	Jupiá	2013-09-03 15:30:12.389704	24	1	jupia
6340	Lacerdópolis	2013-09-03 15:30:12.389704	24	1	lacerdopolis
6341	Lages	2013-09-03 15:30:12.389704	24	1	lages
6342	Laguna	2013-09-03 15:30:12.389704	24	1	laguna
6343	Lajeado Grande	2013-09-03 15:30:12.389704	24	1	lajeado-grande
6344	Laurentino	2013-09-03 15:30:12.389704	24	1	laurentino
6345	Lauro Muller	2013-09-03 15:30:12.389704	24	1	lauro-muller
6346	Lebon Régis	2013-09-03 15:30:12.389704	24	1	lebon-regis
6347	Leoberto Leal	2013-09-03 15:30:12.389704	24	1	leoberto-leal
6348	Lindóia do Sul	2013-09-03 15:30:12.389704	24	1	lindoia-do-sul
6349	Lontras	2013-09-03 15:30:12.389704	24	1	lontras
6350	Luiz Alves	2013-09-03 15:30:12.389704	24	1	luiz-alves
6351	Luzerna	2013-09-03 15:30:12.389704	24	1	luzerna
6352	Macieira	2013-09-03 15:30:12.389704	24	1	macieira
6353	Mafra	2013-09-03 15:30:12.389704	24	1	mafra
6354	Major Gercino	2013-09-03 15:30:12.389704	24	1	major-gercino
6355	Major Vieira	2013-09-03 15:30:12.389704	24	1	major-vieira
6356	Maracajá	2013-09-03 15:30:12.389704	24	1	maracaja
6357	Maravilha	2013-09-03 15:30:12.389704	24	1	maravilha
6358	Marema	2013-09-03 15:30:12.389704	24	1	marema
6359	Massaranduba	2013-09-03 15:30:12.389704	24	1	massaranduba
6360	Matos Costa	2013-09-03 15:30:12.389704	24	1	matos-costa
6361	Meleiro	2013-09-03 15:30:12.389704	24	1	meleiro
6362	Mirim Doce	2013-09-03 15:30:12.389704	24	1	mirim-doce
6363	Modelo	2013-09-03 15:30:12.389704	24	1	modelo
6364	Mondaí	2013-09-03 15:30:12.389704	24	1	mondai
6365	Monte Carlo	2013-09-03 15:30:12.389704	24	1	monte-carlo
6366	Monte Castelo	2013-09-03 15:30:12.389704	24	1	monte-castelo
6367	Morro da Fumaça	2013-09-03 15:30:12.389704	24	1	morro-da-fumaca
6368	Morro Grande	2013-09-03 15:30:12.389704	24	1	morro-grande
6369	Navegantes	2013-09-03 15:30:12.389704	24	1	navegantes
6370	Nova Erechim	2013-09-03 15:30:12.389704	24	1	nova-erechim
6371	Nova Itaberaba	2013-09-03 15:30:12.389704	24	1	nova-itaberaba
6372	Nova Trento	2013-09-03 15:30:12.389704	24	1	nova-trento
6373	Nova Veneza	2013-09-03 15:30:12.389704	24	1	nova-veneza
6374	Novo Horizonte	2013-09-03 15:30:12.389704	24	1	novo-horizonte
6375	Orleans	2013-09-03 15:30:12.389704	24	1	orleans
6376	Otacílio Costa	2013-09-03 15:30:12.389704	24	1	otacilio-costa
6377	Ouro	2013-09-03 15:30:12.389704	24	1	ouro
6378	Ouro Verde	2013-09-03 15:30:12.389704	24	1	ouro-verde
6379	Paial	2013-09-03 15:30:12.389704	24	1	paial
6380	Painel	2013-09-03 15:30:12.389704	24	1	painel
6381	Palhoça	2013-09-03 15:30:12.389704	24	1	palhoca
6382	Palma Sola	2013-09-03 15:30:12.389704	24	1	palma-sola
6383	Palmeira	2013-09-03 15:30:12.389704	24	1	palmeira
6384	Palmitos	2013-09-03 15:30:12.389704	24	1	palmitos
6385	Papanduva	2013-09-03 15:30:12.389704	24	1	papanduva
6386	Paraíso	2013-09-03 15:30:12.389704	24	1	paraiso
6387	Passo de Torres	2013-09-03 15:30:12.389704	24	1	passo-de-torres
6388	Passos Maia	2013-09-03 15:30:12.389704	24	1	passos-maia
6389	Paulo Lopes	2013-09-03 15:30:12.389704	24	1	paulo-lopes
6390	Pedras Grandes	2013-09-03 15:30:12.389704	24	1	pedras-grandes
6391	Penha	2013-09-03 15:30:12.389704	24	1	penha
6392	Peritiba	2013-09-03 15:30:12.389704	24	1	peritiba
6393	Petrolândia	2013-09-03 15:30:12.389704	24	1	petrolandia
6394	Piçarras	2013-09-03 15:30:12.389704	24	1	picarras
6395	Pinhalzinho	2013-09-03 15:30:12.389704	24	1	pinhalzinho
6396	Pinheiro Preto	2013-09-03 15:30:12.389704	24	1	pinheiro-preto
6397	Piratuba	2013-09-03 15:30:12.389704	24	1	piratuba
6398	Planalto Alegre	2013-09-03 15:30:12.389704	24	1	planalto-alegre
6399	Pomerode	2013-09-03 15:30:12.389704	24	1	pomerode
6400	Ponte Alta	2013-09-03 15:30:12.389704	24	1	ponte-alta
6401	Ponte Alta do Norte	2013-09-03 15:30:12.389704	24	1	ponte-alta-do-norte
6402	Ponte Serrada	2013-09-03 15:30:12.389704	24	1	ponte-serrada
6403	Porto Belo	2013-09-03 15:30:12.389704	24	1	porto-belo
6404	Porto União	2013-09-03 15:30:12.389704	24	1	porto-uniao
6405	Pouso Redondo	2013-09-03 15:30:12.389704	24	1	pouso-redondo
6406	Praia Grande	2013-09-03 15:30:12.389704	24	1	praia-grande
6407	Presidente Castelo Branco	2013-09-03 15:30:12.389704	24	1	presidente-castelo-branco
6408	Presidente Getúlio	2013-09-03 15:30:12.389704	24	1	presidente-getulio
6409	Presidente Nereu	2013-09-03 15:30:12.389704	24	1	presidente-nereu
6410	Princesa	2013-09-03 15:30:12.389704	24	1	princesa
6411	Quilombo	2013-09-03 15:30:12.389704	24	1	quilombo
6412	Rancho Queimado	2013-09-03 15:30:12.389704	24	1	rancho-queimado
6413	Rio das Antas	2013-09-03 15:30:12.389704	24	1	rio-das-antas
6414	Rio do Campo	2013-09-03 15:30:12.389704	24	1	rio-do-campo
6415	Rio do Oeste	2013-09-03 15:30:12.389704	24	1	rio-do-oeste
6416	Rio do Sul	2013-09-03 15:30:12.389704	24	1	rio-do-sul
6417	Rio dos Cedros	2013-09-03 15:30:12.389704	24	1	rio-dos-cedros
6418	Rio Fortuna	2013-09-03 15:30:12.389704	24	1	rio-fortuna
6419	Rio Negrinho	2013-09-03 15:30:12.389704	24	1	rio-negrinho
6420	Rio Rufino	2013-09-03 15:30:12.389704	24	1	rio-rufino
6421	Riqueza	2013-09-03 15:30:12.389704	24	1	riqueza
6422	Rodeio	2013-09-03 15:30:12.389704	24	1	rodeio
6423	Romelândia	2013-09-03 15:30:12.389704	24	1	romelandia
6424	Salete	2013-09-03 15:30:12.389704	24	1	salete
6425	Saltinho	2013-09-03 15:30:12.389704	24	1	saltinho
6426	Salto Veloso	2013-09-03 15:30:12.389704	24	1	salto-veloso
6427	Sangão	2013-09-03 15:30:12.389704	24	1	sangao
6428	Santa Cecília	2013-09-03 15:30:12.389704	24	1	santa-cecilia
6429	Santa Helena	2013-09-03 15:30:12.389704	24	1	santa-helena
6430	Santa Rosa de Lima	2013-09-03 15:30:12.389704	24	1	santa-rosa-de-lima
6431	Santa Rosa do Sul	2013-09-03 15:30:12.389704	24	1	santa-rosa-do-sul
6432	Santa Terezinha	2013-09-03 15:30:12.389704	24	1	santa-terezinha
6433	Santa Terezinha do Progresso	2013-09-03 15:30:12.389704	24	1	santa-terezinha-do-progresso
6434	Santiago do Sul	2013-09-03 15:30:12.389704	24	1	santiago-do-sul
6435	Santo Amaro da Imperatriz	2013-09-03 15:30:12.389704	24	1	santo-amaro-da-imperatriz
6436	São Bento do Sul	2013-09-03 15:30:12.389704	24	1	sao-bento-do-sul
6437	São Bernardino	2013-09-03 15:30:12.389704	24	1	sao-bernardino
6438	São Bonifácio	2013-09-03 15:30:12.389704	24	1	sao-bonifacio
6439	São Carlos	2013-09-03 15:30:12.389704	24	1	sao-carlos
6440	São Cristovão do Sul	2013-09-03 15:30:12.389704	24	1	sao-cristovao-do-sul
6441	São Domingos	2013-09-03 15:30:12.389704	24	1	sao-domingos
6785	Tomar do Geru	2013-09-03 15:30:12.389704	26	1	tomar-do-geru
6442	São Francisco do Sul	2013-09-03 15:30:12.389704	24	1	sao-francisco-do-sul
6443	São João Batista	2013-09-03 15:30:12.389704	24	1	sao-joao-batista
6444	São João do Itaperiú	2013-09-03 15:30:12.389704	24	1	sao-joao-do-itaperiu
6445	São João do Oeste	2013-09-03 15:30:12.389704	24	1	sao-joao-do-oeste
6446	São João do Sul	2013-09-03 15:30:12.389704	24	1	sao-joao-do-sul
6447	São Joaquim	2013-09-03 15:30:12.389704	24	1	sao-joaquim
6448	São José	2013-09-03 15:30:12.389704	24	1	sao-jose
6449	São José do Cedro	2013-09-03 15:30:12.389704	24	1	sao-jose-do-cedro
6450	São José do Cerrito	2013-09-03 15:30:12.389704	24	1	sao-jose-do-cerrito
6451	São Lourenço do Oeste	2013-09-03 15:30:12.389704	24	1	sao-lourenco-do-oeste
6452	São Ludgero	2013-09-03 15:30:12.389704	24	1	sao-ludgero
6453	São Martinho	2013-09-03 15:30:12.389704	24	1	sao-martinho
6454	São Miguel da Boa Vista	2013-09-03 15:30:12.389704	24	1	sao-miguel-da-boa-vista
6455	São Miguel do Oeste	2013-09-03 15:30:12.389704	24	1	sao-miguel-do-oeste
6456	São Pedro de Alcântara	2013-09-03 15:30:12.389704	24	1	sao-pedro-de-alcantara
6457	Saudades	2013-09-03 15:30:12.389704	24	1	saudades
6458	Schroeder	2013-09-03 15:30:12.389704	24	1	schroeder
6459	Seara	2013-09-03 15:30:12.389704	24	1	seara
6460	Serra Alta	2013-09-03 15:30:12.389704	24	1	serra-alta
6461	Siderópolis	2013-09-03 15:30:12.389704	24	1	sideropolis
6462	Sombrio	2013-09-03 15:30:12.389704	24	1	sombrio
6463	Sul Brasil	2013-09-03 15:30:12.389704	24	1	sul-brasil
6464	Taió	2013-09-03 15:30:12.389704	24	1	taio
6465	Tangará	2013-09-03 15:30:12.389704	24	1	tangara
6466	Tigrinhos	2013-09-03 15:30:12.389704	24	1	tigrinhos
6467	Tijucas	2013-09-03 15:30:12.389704	24	1	tijucas
6468	Timbé do Sul	2013-09-03 15:30:12.389704	24	1	timbe-do-sul
6469	Timbó	2013-09-03 15:30:12.389704	24	1	timbo
6470	Timbó Grande	2013-09-03 15:30:12.389704	24	1	timbo-grande
6471	Três Barras	2013-09-03 15:30:12.389704	24	1	tres-barras
6472	Treviso	2013-09-03 15:30:12.389704	24	1	treviso
6473	Treze de Maio	2013-09-03 15:30:12.389704	24	1	treze-de-maio
6474	Treze Tílias	2013-09-03 15:30:12.389704	24	1	treze-tilias
6475	Trombudo Central	2013-09-03 15:30:12.389704	24	1	trombudo-central
6476	Tubarão	2013-09-03 15:30:12.389704	24	1	tubarao
6477	Tunápolis	2013-09-03 15:30:12.389704	24	1	tunapolis
6478	Turvo	2013-09-03 15:30:12.389704	24	1	turvo
6479	União do Oeste	2013-09-03 15:30:12.389704	24	1	uniao-do-oeste
6480	Urubici	2013-09-03 15:30:12.389704	24	1	urubici
6481	Urupema	2013-09-03 15:30:12.389704	24	1	urupema
6482	Urussanga	2013-09-03 15:30:12.389704	24	1	urussanga
6483	Vargeão	2013-09-03 15:30:12.389704	24	1	vargeao
6484	Vargem	2013-09-03 15:30:12.389704	24	1	vargem
6485	Vargem Bonita	2013-09-03 15:30:12.389704	24	1	vargem-bonita
6486	Vidal Ramos	2013-09-03 15:30:12.389704	24	1	vidal-ramos
6487	Videira	2013-09-03 15:30:12.389704	24	1	videira
6488	Vitor Meireles	2013-09-03 15:30:12.389704	24	1	vitor-meireles
6489	Witmarsum	2013-09-03 15:30:12.389704	24	1	witmarsum
6490	Xanxerê	2013-09-03 15:30:12.389704	24	1	xanxere
6491	Xavantina	2013-09-03 15:30:12.389704	24	1	xavantina
6492	Xaxim	2013-09-03 15:30:12.389704	24	1	xaxim
6493	Zortéa	2013-09-03 15:30:12.389704	24	1	zortea
6712	Amparo de São Francisco	2013-09-03 15:30:12.389704	26	1	amparo-de-sao-francisco
6713	Aquidabã	2013-09-03 15:30:12.389704	26	1	aquidaba
6714	Aracaju	2013-09-03 15:30:12.389704	26	1	aracaju
6715	Arauá	2013-09-03 15:30:12.389704	26	1	araua
6716	Areia Branca	2013-09-03 15:30:12.389704	26	1	areia-branca
6717	Barra dos Coqueiros	2013-09-03 15:30:12.389704	26	1	barra-dos-coqueiros
6718	Boquim	2013-09-03 15:30:12.389704	26	1	boquim
6719	Brejo Grande	2013-09-03 15:30:12.389704	26	1	brejo-grande
6720	Campo do Brito	2013-09-03 15:30:12.389704	26	1	campo-do-brito
6721	Canhoba	2013-09-03 15:30:12.389704	26	1	canhoba
6722	Canindé de São Francisco	2013-09-03 15:30:12.389704	26	1	caninde-de-sao-francisco
6723	Capela	2013-09-03 15:30:12.389704	26	1	capela
6724	Carira	2013-09-03 15:30:12.389704	26	1	carira
6725	Carmópolis	2013-09-03 15:30:12.389704	26	1	carmopolis
6726	Cedro de São João	2013-09-03 15:30:12.389704	26	1	cedro-de-sao-joao
6727	Cristinápolis	2013-09-03 15:30:12.389704	26	1	cristinapolis
6728	Cumbe	2013-09-03 15:30:12.389704	26	1	cumbe
6729	Divina Pastora	2013-09-03 15:30:12.389704	26	1	divina-pastora
6730	Estância	2013-09-03 15:30:12.389704	26	1	estancia
6731	Feira Nova	2013-09-03 15:30:12.389704	26	1	feira-nova
6732	Frei Paulo	2013-09-03 15:30:12.389704	26	1	frei-paulo
6733	Gararu	2013-09-03 15:30:12.389704	26	1	gararu
6734	General Maynard	2013-09-03 15:30:12.389704	26	1	general-maynard
6735	Gracho Cardoso	2013-09-03 15:30:12.389704	26	1	gracho-cardoso
6736	Ilha das Flores	2013-09-03 15:30:12.389704	26	1	ilha-das-flores
6737	Indiaroba	2013-09-03 15:30:12.389704	26	1	indiaroba
6738	Itabaiana	2013-09-03 15:30:12.389704	26	1	itabaiana
6739	Itabaianinha	2013-09-03 15:30:12.389704	26	1	itabaianinha
6740	Itabi	2013-09-03 15:30:12.389704	26	1	itabi
6741	Itaporanga d`Ajuda	2013-09-03 15:30:12.389704	26	1	itaporanga-d-ajuda
6742	Japaratuba	2013-09-03 15:30:12.389704	26	1	japaratuba
6743	Japoatã	2013-09-03 15:30:12.389704	26	1	japoata
6744	Lagarto	2013-09-03 15:30:12.389704	26	1	lagarto
6745	Laranjeiras	2013-09-03 15:30:12.389704	26	1	laranjeiras
6746	Macambira	2013-09-03 15:30:12.389704	26	1	macambira
6747	Malhada dos Bois	2013-09-03 15:30:12.389704	26	1	malhada-dos-bois
6748	Malhador	2013-09-03 15:30:12.389704	26	1	malhador
6749	Maruim	2013-09-03 15:30:12.389704	26	1	maruim
6750	Moita Bonita	2013-09-03 15:30:12.389704	26	1	moita-bonita
6751	Monte Alegre de Sergipe	2013-09-03 15:30:12.389704	26	1	monte-alegre-de-sergipe
6752	Muribeca	2013-09-03 15:30:12.389704	26	1	muribeca
6753	Neópolis	2013-09-03 15:30:12.389704	26	1	neopolis
6754	Nossa Senhora Aparecida	2013-09-03 15:30:12.389704	26	1	nossa-senhora-aparecida
6755	Nossa Senhora da Glória	2013-09-03 15:30:12.389704	26	1	nossa-senhora-da-gloria
6756	Nossa Senhora das Dores	2013-09-03 15:30:12.389704	26	1	nossa-senhora-das-dores
6757	Nossa Senhora de Lourdes	2013-09-03 15:30:12.389704	26	1	nossa-senhora-de-lourdes
6758	Nossa Senhora do Socorro	2013-09-03 15:30:12.389704	26	1	nossa-senhora-do-socorro
6759	Pacatuba	2013-09-03 15:30:12.389704	26	1	pacatuba
6760	Pedra Mole	2013-09-03 15:30:12.389704	26	1	pedra-mole
6761	Pedrinhas	2013-09-03 15:30:12.389704	26	1	pedrinhas
6762	Pinhão	2013-09-03 15:30:12.389704	26	1	pinhao
6763	Pirambu	2013-09-03 15:30:12.389704	26	1	pirambu
6764	Poço Redondo	2013-09-03 15:30:12.389704	26	1	poco-redondo
6765	Poço Verde	2013-09-03 15:30:12.389704	26	1	poco-verde
6766	Porto da Folha	2013-09-03 15:30:12.389704	26	1	porto-da-folha
6767	Propriá	2013-09-03 15:30:12.389704	26	1	propria
6768	Riachão do Dantas	2013-09-03 15:30:12.389704	26	1	riachao-do-dantas
6769	Riachuelo	2013-09-03 15:30:12.389704	26	1	riachuelo
6770	Ribeirópolis	2013-09-03 15:30:12.389704	26	1	ribeiropolis
6771	Rosário do Catete	2013-09-03 15:30:12.389704	26	1	rosario-do-catete
6772	Salgado	2013-09-03 15:30:12.389704	26	1	salgado
6773	Santa Luzia do Itanhy	2013-09-03 15:30:12.389704	26	1	santa-luzia-do-itanhy
6774	Santa Rosa de Lima	2013-09-03 15:30:12.389704	26	1	santa-rosa-de-lima
6775	Santana do São Francisco	2013-09-03 15:30:12.389704	26	1	santana-do-sao-francisco
6776	Santo Amaro das Brotas	2013-09-03 15:30:12.389704	26	1	santo-amaro-das-brotas
6777	São Cristóvão	2013-09-03 15:30:12.389704	26	1	sao-cristovao
6778	São Domingos	2013-09-03 15:30:12.389704	26	1	sao-domingos
6779	São Francisco	2013-09-03 15:30:12.389704	26	1	sao-francisco
6780	São Miguel do Aleixo	2013-09-03 15:30:12.389704	26	1	sao-miguel-do-aleixo
6781	Simão Dias	2013-09-03 15:30:12.389704	26	1	simao-dias
6782	Siriri	2013-09-03 15:30:12.389704	26	1	siriri
6783	Telha	2013-09-03 15:30:12.389704	26	1	telha
6784	Tobias Barreto	2013-09-03 15:30:12.389704	26	1	tobias-barreto
6786	Umbaúba	2013-09-03 15:30:12.389704	26	1	umbauba
8116	Adamantina	2013-09-03 15:30:12.389704	25	1	adamantina
8117	Adolfo	2013-09-03 15:30:12.389704	25	1	adolfo
8118	Aguaí	2013-09-03 15:30:12.389704	25	1	aguai
8119	Águas da Prata	2013-09-03 15:30:12.389704	25	1	aguas-da-prata
8120	Águas de Lindóia	2013-09-03 15:30:12.389704	25	1	aguas-de-lindoia
8121	Águas de Santa Bárbara	2013-09-03 15:30:12.389704	25	1	aguas-de-santa-barbara
8122	Águas de São Pedro	2013-09-03 15:30:12.389704	25	1	aguas-de-sao-pedro
8123	Agudos	2013-09-03 15:30:12.389704	25	1	agudos
8124	Alambari	2013-09-03 15:30:12.389704	25	1	alambari
8125	Alfredo Marcondes	2013-09-03 15:30:12.389704	25	1	alfredo-marcondes
8126	Altair	2013-09-03 15:30:12.389704	25	1	altair
8127	Altinópolis	2013-09-03 15:30:12.389704	25	1	altinopolis
8128	Alto Alegre	2013-09-03 15:30:12.389704	25	1	alto-alegre
8129	Alumínio	2013-09-03 15:30:12.389704	25	1	aluminio
8130	Álvares Florence	2013-09-03 15:30:12.389704	25	1	alvares-florence
8131	Álvares Machado	2013-09-03 15:30:12.389704	25	1	alvares-machado
8132	Álvaro de Carvalho	2013-09-03 15:30:12.389704	25	1	alvaro-de-carvalho
8133	Alvinlândia	2013-09-03 15:30:12.389704	25	1	alvinlandia
8134	Americana	2013-09-03 15:30:12.389704	25	1	americana
8135	Américo Brasiliense	2013-09-03 15:30:12.389704	25	1	americo-brasiliense
8136	Américo de Campos	2013-09-03 15:30:12.389704	25	1	americo-de-campos
8137	Amparo	2013-09-03 15:30:12.389704	25	1	amparo
8138	Analândia	2013-09-03 15:30:12.389704	25	1	analandia
8139	Andradina	2013-09-03 15:30:12.389704	25	1	andradina
8140	Angatuba	2013-09-03 15:30:12.389704	25	1	angatuba
8141	Anhembi	2013-09-03 15:30:12.389704	25	1	anhembi
8142	Anhumas	2013-09-03 15:30:12.389704	25	1	anhumas
8143	Aparecida	2013-09-03 15:30:12.389704	25	1	aparecida
8144	Aparecida d`Oeste	2013-09-03 15:30:12.389704	25	1	aparecida-d-oeste
8145	Apiaí	2013-09-03 15:30:12.389704	25	1	apiai
8146	Araçariguama	2013-09-03 15:30:12.389704	25	1	aracariguama
8147	Araçatuba	2013-09-03 15:30:12.389704	25	1	aracatuba
8148	Araçoiaba da Serra	2013-09-03 15:30:12.389704	25	1	aracoiaba-da-serra
8149	Aramina	2013-09-03 15:30:12.389704	25	1	aramina
8150	Arandu	2013-09-03 15:30:12.389704	25	1	arandu
8151	Arapeí	2013-09-03 15:30:12.389704	25	1	arapei
8152	Araraquara	2013-09-03 15:30:12.389704	25	1	araraquara
8153	Araras	2013-09-03 15:30:12.389704	25	1	araras
8154	Arco-Íris	2013-09-03 15:30:12.389704	25	1	arco-iris
8155	Arealva	2013-09-03 15:30:12.389704	25	1	arealva
8156	Areias	2013-09-03 15:30:12.389704	25	1	areias
8157	Areiópolis	2013-09-03 15:30:12.389704	25	1	areiopolis
8158	Ariranha	2013-09-03 15:30:12.389704	25	1	ariranha
8159	Artur Nogueira	2013-09-03 15:30:12.389704	25	1	artur-nogueira
8160	Arujá	2013-09-03 15:30:12.389704	25	1	aruja
8161	Aspásia	2013-09-03 15:30:12.389704	25	1	aspasia
8162	Assis	2013-09-03 15:30:12.389704	25	1	assis
8163	Atibaia	2013-09-03 15:30:12.389704	25	1	atibaia
8164	Auriflama	2013-09-03 15:30:12.389704	25	1	auriflama
8165	Avaí	2013-09-03 15:30:12.389704	25	1	avai
8166	Avanhandava	2013-09-03 15:30:12.389704	25	1	avanhandava
8167	Avaré	2013-09-03 15:30:12.389704	25	1	avare
8168	Bady Bassitt	2013-09-03 15:30:12.389704	25	1	bady-bassitt
8169	Balbinos	2013-09-03 15:30:12.389704	25	1	balbinos
8170	Bálsamo	2013-09-03 15:30:12.389704	25	1	balsamo
8171	Bananal	2013-09-03 15:30:12.389704	25	1	bananal
8172	Barão de Antonina	2013-09-03 15:30:12.389704	25	1	barao-de-antonina
8173	Barbosa	2013-09-03 15:30:12.389704	25	1	barbosa
8174	Bariri	2013-09-03 15:30:12.389704	25	1	bariri
8175	Barra Bonita	2013-09-03 15:30:12.389704	25	1	barra-bonita
8176	Barra do Chapéu	2013-09-03 15:30:12.389704	25	1	barra-do-chapeu
8177	Barra do Turvo	2013-09-03 15:30:12.389704	25	1	barra-do-turvo
8178	Barretos	2013-09-03 15:30:12.389704	25	1	barretos
8179	Barrinha	2013-09-03 15:30:12.389704	25	1	barrinha
8180	Barueri	2013-09-03 15:30:12.389704	25	1	barueri
8181	Bastos	2013-09-03 15:30:12.389704	25	1	bastos
8182	Batatais	2013-09-03 15:30:12.389704	25	1	batatais
8183	Bauru	2013-09-03 15:30:12.389704	25	1	bauru
8184	Bebedouro	2013-09-03 15:30:12.389704	25	1	bebedouro
8185	Bento de Abreu	2013-09-03 15:30:12.389704	25	1	bento-de-abreu
8186	Bernardino de Campos	2013-09-03 15:30:12.389704	25	1	bernardino-de-campos
8187	Bertioga	2013-09-03 15:30:12.389704	25	1	bertioga
8188	Bilac	2013-09-03 15:30:12.389704	25	1	bilac
8189	Birigui	2013-09-03 15:30:12.389704	25	1	birigui
8190	Biritiba-Mirim	2013-09-03 15:30:12.389704	25	1	biritiba-mirim
8191	Boa Esperança do Sul	2013-09-03 15:30:12.389704	25	1	boa-esperanca-do-sul
8192	Bocaina	2013-09-03 15:30:12.389704	25	1	bocaina
8193	Bofete	2013-09-03 15:30:12.389704	25	1	bofete
8194	Boituva	2013-09-03 15:30:12.389704	25	1	boituva
8195	Bom Jesus dos Perdões	2013-09-03 15:30:12.389704	25	1	bom-jesus-dos-perdoes
8196	Bom Sucesso de Itararé	2013-09-03 15:30:12.389704	25	1	bom-sucesso-de-itarare
8197	Borá	2013-09-03 15:30:12.389704	25	1	bora
8198	Boracéia	2013-09-03 15:30:12.389704	25	1	boraceia
8199	Borborema	2013-09-03 15:30:12.389704	25	1	borborema
8200	Borebi	2013-09-03 15:30:12.389704	25	1	borebi
8201	Botucatu	2013-09-03 15:30:12.389704	25	1	botucatu
8202	Bragança Paulista	2013-09-03 15:30:12.389704	25	1	braganca-paulista
8203	Braúna	2013-09-03 15:30:12.389704	25	1	brauna
8204	Brejo Alegre	2013-09-03 15:30:12.389704	25	1	brejo-alegre
8205	Brodowski	2013-09-03 15:30:12.389704	25	1	brodowski
8206	Brotas	2013-09-03 15:30:12.389704	25	1	brotas
8207	Buri	2013-09-03 15:30:12.389704	25	1	buri
8208	Buritama	2013-09-03 15:30:12.389704	25	1	buritama
8209	Buritizal	2013-09-03 15:30:12.389704	25	1	buritizal
8210	Cabrália Paulista	2013-09-03 15:30:12.389704	25	1	cabralia-paulista
8211	Cabreúva	2013-09-03 15:30:12.389704	25	1	cabreuva
8212	Caçapava	2013-09-03 15:30:12.389704	25	1	cacapava
8213	Cachoeira Paulista	2013-09-03 15:30:12.389704	25	1	cachoeira-paulista
8214	Caconde	2013-09-03 15:30:12.389704	25	1	caconde
8215	Cafelândia	2013-09-03 15:30:12.389704	25	1	cafelandia
8216	Caiabu	2013-09-03 15:30:12.389704	25	1	caiabu
8217	Caieiras	2013-09-03 15:30:12.389704	25	1	caieiras
8218	Caiuá	2013-09-03 15:30:12.389704	25	1	caiua
8219	Cajamar	2013-09-03 15:30:12.389704	25	1	cajamar
8220	Cajati	2013-09-03 15:30:12.389704	25	1	cajati
8221	Cajobi	2013-09-03 15:30:12.389704	25	1	cajobi
8222	Cajuru	2013-09-03 15:30:12.389704	25	1	cajuru
8223	Campina do Monte Alegre	2013-09-03 15:30:12.389704	25	1	campina-do-monte-alegre
8224	Campinas	2013-09-03 15:30:12.389704	25	1	campinas
8225	Campo Limpo Paulista	2013-09-03 15:30:12.389704	25	1	campo-limpo-paulista
8226	Campos do Jordão	2013-09-03 15:30:12.389704	25	1	campos-do-jordao
8227	Campos Novos Paulista	2013-09-03 15:30:12.389704	25	1	campos-novos-paulista
8228	Cananéia	2013-09-03 15:30:12.389704	25	1	cananeia
8229	Canas	2013-09-03 15:30:12.389704	25	1	canas
8230	Cândido Mota	2013-09-03 15:30:12.389704	25	1	candido-mota
8231	Cândido Rodrigues	2013-09-03 15:30:12.389704	25	1	candido-rodrigues
8232	Canitar	2013-09-03 15:30:12.389704	25	1	canitar
8233	Capão Bonito	2013-09-03 15:30:12.389704	25	1	capao-bonito
8234	Capela do Alto	2013-09-03 15:30:12.389704	25	1	capela-do-alto
8235	Capivari	2013-09-03 15:30:12.389704	25	1	capivari
8236	Caraguatatuba	2013-09-03 15:30:12.389704	25	1	caraguatatuba
8237	Carapicuíba	2013-09-03 15:30:12.389704	25	1	carapicuiba
8238	Cardoso	2013-09-03 15:30:12.389704	25	1	cardoso
8239	Casa Branca	2013-09-03 15:30:12.389704	25	1	casa-branca
8240	Cássia dos Coqueiros	2013-09-03 15:30:12.389704	25	1	cassia-dos-coqueiros
8241	Castilho	2013-09-03 15:30:12.389704	25	1	castilho
8242	Catanduva	2013-09-03 15:30:12.389704	25	1	catanduva
8243	Catiguá	2013-09-03 15:30:12.389704	25	1	catigua
8244	Cedral	2013-09-03 15:30:12.389704	25	1	cedral
8245	Cerqueira César	2013-09-03 15:30:12.389704	25	1	cerqueira-cesar
8246	Cerquilho	2013-09-03 15:30:12.389704	25	1	cerquilho
8247	Cesário Lange	2013-09-03 15:30:12.389704	25	1	cesario-lange
8248	Charqueada	2013-09-03 15:30:12.389704	25	1	charqueada
8249	Chavantes	2013-09-03 15:30:12.389704	25	1	chavantes
8250	Clementina	2013-09-03 15:30:12.389704	25	1	clementina
8251	Colina	2013-09-03 15:30:12.389704	25	1	colina
8252	Colômbia	2013-09-03 15:30:12.389704	25	1	colombia
8253	Conchal	2013-09-03 15:30:12.389704	25	1	conchal
8254	Conchas	2013-09-03 15:30:12.389704	25	1	conchas
8255	Cordeirópolis	2013-09-03 15:30:12.389704	25	1	cordeiropolis
8256	Coroados	2013-09-03 15:30:12.389704	25	1	coroados
8257	Coronel Macedo	2013-09-03 15:30:12.389704	25	1	coronel-macedo
8258	Corumbataí	2013-09-03 15:30:12.389704	25	1	corumbatai
8259	Cosmópolis	2013-09-03 15:30:12.389704	25	1	cosmopolis
8260	Cosmorama	2013-09-03 15:30:12.389704	25	1	cosmorama
8261	Cotia	2013-09-03 15:30:12.389704	25	1	cotia
8262	Cravinhos	2013-09-03 15:30:12.389704	25	1	cravinhos
8263	Cristais Paulista	2013-09-03 15:30:12.389704	25	1	cristais-paulista
8264	Cruzália	2013-09-03 15:30:12.389704	25	1	cruzalia
8265	Cruzeiro	2013-09-03 15:30:12.389704	25	1	cruzeiro
8266	Cubatão	2013-09-03 15:30:12.389704	25	1	cubatao
8267	Cunha	2013-09-03 15:30:12.389704	25	1	cunha
8268	Descalvado	2013-09-03 15:30:12.389704	25	1	descalvado
8269	Diadema	2013-09-03 15:30:12.389704	25	1	diadema
8270	Dirce Reis	2013-09-03 15:30:12.389704	25	1	dirce-reis
8271	Divinolândia	2013-09-03 15:30:12.389704	25	1	divinolandia
8272	Dobrada	2013-09-03 15:30:12.389704	25	1	dobrada
8273	Dois Córregos	2013-09-03 15:30:12.389704	25	1	dois-corregos
8274	Dolcinópolis	2013-09-03 15:30:12.389704	25	1	dolcinopolis
8275	Dourado	2013-09-03 15:30:12.389704	25	1	dourado
8276	Dracena	2013-09-03 15:30:12.389704	25	1	dracena
8277	Duartina	2013-09-03 15:30:12.389704	25	1	duartina
8278	Dumont	2013-09-03 15:30:12.389704	25	1	dumont
8279	Echaporã	2013-09-03 15:30:12.389704	25	1	echapora
8280	Eldorado	2013-09-03 15:30:12.389704	25	1	eldorado
8281	Elias Fausto	2013-09-03 15:30:12.389704	25	1	elias-fausto
8282	Elisiário	2013-09-03 15:30:12.389704	25	1	elisiario
8283	Embaúba	2013-09-03 15:30:12.389704	25	1	embauba
8284	Embu	2013-09-03 15:30:12.389704	25	1	embu
8285	Embu-Guaçu	2013-09-03 15:30:12.389704	25	1	embu-guacu
8286	Emilianópolis	2013-09-03 15:30:12.389704	25	1	emilianopolis
8287	Engenheiro Coelho	2013-09-03 15:30:12.389704	25	1	engenheiro-coelho
8288	Espírito Santo do Pinhal	2013-09-03 15:30:12.389704	25	1	espirito-santo-do-pinhal
8289	Espírito Santo do Turvo	2013-09-03 15:30:12.389704	25	1	espirito-santo-do-turvo
8290	Estiva Gerbi	2013-09-03 15:30:12.389704	25	1	estiva-gerbi
8291	Estrela d`Oeste	2013-09-03 15:30:12.389704	25	1	estrela-d-oeste
8292	Estrela do Norte	2013-09-03 15:30:12.389704	25	1	estrela-do-norte
8293	Euclides da Cunha Paulista	2013-09-03 15:30:12.389704	25	1	euclides-da-cunha-paulista
8294	Fartura	2013-09-03 15:30:12.389704	25	1	fartura
8295	Fernando Prestes	2013-09-03 15:30:12.389704	25	1	fernando-prestes
8296	Fernandópolis	2013-09-03 15:30:12.389704	25	1	fernandopolis
8297	Fernão	2013-09-03 15:30:12.389704	25	1	fernao
8298	Ferraz de Vasconcelos	2013-09-03 15:30:12.389704	25	1	ferraz-de-vasconcelos
8299	Flora Rica	2013-09-03 15:30:12.389704	25	1	flora-rica
8300	Floreal	2013-09-03 15:30:12.389704	25	1	floreal
8301	Flórida Paulista	2013-09-03 15:30:12.389704	25	1	florida-paulista
8302	Florínia	2013-09-03 15:30:12.389704	25	1	florinia
8303	Franca	2013-09-03 15:30:12.389704	25	1	franca
8304	Francisco Morato	2013-09-03 15:30:12.389704	25	1	francisco-morato
8305	Franco da Rocha	2013-09-03 15:30:12.389704	25	1	franco-da-rocha
8306	Gabriel Monteiro	2013-09-03 15:30:12.389704	25	1	gabriel-monteiro
8307	Gália	2013-09-03 15:30:12.389704	25	1	galia
8308	Garça	2013-09-03 15:30:12.389704	25	1	garca
8309	Gastão Vidigal	2013-09-03 15:30:12.389704	25	1	gastao-vidigal
8310	Gavião Peixoto	2013-09-03 15:30:12.389704	25	1	gaviao-peixoto
8311	General Salgado	2013-09-03 15:30:12.389704	25	1	general-salgado
8312	Getulina	2013-09-03 15:30:12.389704	25	1	getulina
8313	Glicério	2013-09-03 15:30:12.389704	25	1	glicerio
8314	Guaiçara	2013-09-03 15:30:12.389704	25	1	guaicara
8315	Guaimbê	2013-09-03 15:30:12.389704	25	1	guaimbe
8316	Guaíra	2013-09-03 15:30:12.389704	25	1	guaira
8317	Guapiaçu	2013-09-03 15:30:12.389704	25	1	guapiacu
8318	Guapiara	2013-09-03 15:30:12.389704	25	1	guapiara
8319	Guará	2013-09-03 15:30:12.389704	25	1	guara
8320	Guaraçaí	2013-09-03 15:30:12.389704	25	1	guaracai
8321	Guaraci	2013-09-03 15:30:12.389704	25	1	guaraci
8322	Guarani d`Oeste	2013-09-03 15:30:12.389704	25	1	guarani-d-oeste
8323	Guarantã	2013-09-03 15:30:12.389704	25	1	guaranta
8324	Guararapes	2013-09-03 15:30:12.389704	25	1	guararapes
8325	Guararema	2013-09-03 15:30:12.389704	25	1	guararema
8326	Guaratinguetá	2013-09-03 15:30:12.389704	25	1	guaratingueta
8327	Guareí	2013-09-03 15:30:12.389704	25	1	guarei
8328	Guariba	2013-09-03 15:30:12.389704	25	1	guariba
8329	Guarujá	2013-09-03 15:30:12.389704	25	1	guaruja
8330	Guarulhos	2013-09-03 15:30:12.389704	25	1	guarulhos
8331	Guatapará	2013-09-03 15:30:12.389704	25	1	guatapara
8332	Guzolândia	2013-09-03 15:30:12.389704	25	1	guzolandia
8333	Herculândia	2013-09-03 15:30:12.389704	25	1	herculandia
8334	Holambra	2013-09-03 15:30:12.389704	25	1	holambra
8335	Hortolândia	2013-09-03 15:30:12.389704	25	1	hortolandia
8336	Iacanga	2013-09-03 15:30:12.389704	25	1	iacanga
8337	Iacri	2013-09-03 15:30:12.389704	25	1	iacri
8338	Iaras	2013-09-03 15:30:12.389704	25	1	iaras
8339	Ibaté	2013-09-03 15:30:12.389704	25	1	ibate
8340	Ibirá	2013-09-03 15:30:12.389704	25	1	ibira
8341	Ibirarema	2013-09-03 15:30:12.389704	25	1	ibirarema
8342	Ibitinga	2013-09-03 15:30:12.389704	25	1	ibitinga
8343	Ibiúna	2013-09-03 15:30:12.389704	25	1	ibiuna
8344	Icém	2013-09-03 15:30:12.389704	25	1	icem
8345	Iepê	2013-09-03 15:30:12.389704	25	1	iepe
8346	Igaraçu do Tietê	2013-09-03 15:30:12.389704	25	1	igaracu-do-tiete
8347	Igarapava	2013-09-03 15:30:12.389704	25	1	igarapava
8348	Igaratá	2013-09-03 15:30:12.389704	25	1	igarata
8349	Iguape	2013-09-03 15:30:12.389704	25	1	iguape
8350	Ilha Comprida	2013-09-03 15:30:12.389704	25	1	ilha-comprida
8351	Ilha Solteira	2013-09-03 15:30:12.389704	25	1	ilha-solteira
8352	Ilhabela	2013-09-03 15:30:12.389704	25	1	ilhabela
8353	Indaiatuba	2013-09-03 15:30:12.389704	25	1	indaiatuba
8354	Indiana	2013-09-03 15:30:12.389704	25	1	indiana
8355	Indiaporã	2013-09-03 15:30:12.389704	25	1	indiapora
8356	Inúbia Paulista	2013-09-03 15:30:12.389704	25	1	inubia-paulista
8357	Ipaussu	2013-09-03 15:30:12.389704	25	1	ipaussu
8358	Iperó	2013-09-03 15:30:12.389704	25	1	ipero
8359	Ipeúna	2013-09-03 15:30:12.389704	25	1	ipeuna
8360	Ipiguá	2013-09-03 15:30:12.389704	25	1	ipigua
8361	Iporanga	2013-09-03 15:30:12.389704	25	1	iporanga
8362	Ipuã	2013-09-03 15:30:12.389704	25	1	ipua
8363	Iracemápolis	2013-09-03 15:30:12.389704	25	1	iracemapolis
8364	Irapuã	2013-09-03 15:30:12.389704	25	1	irapua
8365	Irapuru	2013-09-03 15:30:12.389704	25	1	irapuru
8366	Itaberá	2013-09-03 15:30:12.389704	25	1	itabera
8367	Itaí	2013-09-03 15:30:12.389704	25	1	itai
8368	Itajobi	2013-09-03 15:30:12.389704	25	1	itajobi
8369	Itaju	2013-09-03 15:30:12.389704	25	1	itaju
8370	Itanhaém	2013-09-03 15:30:12.389704	25	1	itanhaem
8371	Itaóca	2013-09-03 15:30:12.389704	25	1	itaoca
8372	Itapecerica da Serra	2013-09-03 15:30:12.389704	25	1	itapecerica-da-serra
8373	Itapetininga	2013-09-03 15:30:12.389704	25	1	itapetininga
8374	Itapeva	2013-09-03 15:30:12.389704	25	1	itapeva
8375	Itapevi	2013-09-03 15:30:12.389704	25	1	itapevi
8376	Itapira	2013-09-03 15:30:12.389704	25	1	itapira
8377	Itapirapuã Paulista	2013-09-03 15:30:12.389704	25	1	itapirapua-paulista
8378	\nItápolis	2013-09-03 15:30:12.389704	25	1	itapolis
8379	Itaporanga	2013-09-03 15:30:12.389704	25	1	itaporanga
8380	Itapuí	2013-09-03 15:30:12.389704	25	1	itapui
8381	Itapura	2013-09-03 15:30:12.389704	25	1	itapura
8382	Itaquaquecetuba	2013-09-03 15:30:12.389704	25	1	itaquaquecetuba
8383	Itararé	2013-09-03 15:30:12.389704	25	1	itarare
8384	Itariri	2013-09-03 15:30:12.389704	25	1	itariri
8385	Itatiba	2013-09-03 15:30:12.389704	25	1	itatiba
8386	Itatinga	2013-09-03 15:30:12.389704	25	1	itatinga
8387	Itirapina	2013-09-03 15:30:12.389704	25	1	itirapina
8388	Itirapuã	2013-09-03 15:30:12.389704	25	1	itirapua
8389	Itobi	2013-09-03 15:30:12.389704	25	1	itobi
8390	Itu	2013-09-03 15:30:12.389704	25	1	itu
8391	Itupeva	2013-09-03 15:30:12.389704	25	1	itupeva
8392	Ituverava	2013-09-03 15:30:12.389704	25	1	ituverava
8393	Jaborandi	2013-09-03 15:30:12.389704	25	1	jaborandi
8394	Jaboticabal	2013-09-03 15:30:12.389704	25	1	jaboticabal
8395	Jacareí	2013-09-03 15:30:12.389704	25	1	jacarei
8396	Jaci	2013-09-03 15:30:12.389704	25	1	jaci
8397	Jacupiranga	2013-09-03 15:30:12.389704	25	1	jacupiranga
8398	Jaguariúna	2013-09-03 15:30:12.389704	25	1	jaguariuna
8399	Jales	2013-09-03 15:30:12.389704	25	1	jales
8400	Jambeiro	2013-09-03 15:30:12.389704	25	1	jambeiro
8401	Jandira	2013-09-03 15:30:12.389704	25	1	jandira
8402	Jardinópolis	2013-09-03 15:30:12.389704	25	1	jardinopolis
8403	Jarinu	2013-09-03 15:30:12.389704	25	1	jarinu
8404	Jaú	2013-09-03 15:30:12.389704	25	1	jau
8405	Jeriquara	2013-09-03 15:30:12.389704	25	1	jeriquara
8406	Joanópolis	2013-09-03 15:30:12.389704	25	1	joanopolis
8407	João Ramalho	2013-09-03 15:30:12.389704	25	1	joao-ramalho
8408	José Bonifácio	2013-09-03 15:30:12.389704	25	1	jose-bonifacio
8409	Júlio Mesquita	2013-09-03 15:30:12.389704	25	1	julio-mesquita
8410	Jumirim	2013-09-03 15:30:12.389704	25	1	jumirim
8411	Jundiaí	2013-09-03 15:30:12.389704	25	1	jundiai
8412	Junqueirópolis	2013-09-03 15:30:12.389704	25	1	junqueiropolis
8413	Juquiá	2013-09-03 15:30:12.389704	25	1	juquia
8414	Juquitiba	2013-09-03 15:30:12.389704	25	1	juquitiba
8415	Lagoinha	2013-09-03 15:30:12.389704	25	1	lagoinha
8416	Laranjal Paulista	2013-09-03 15:30:12.389704	25	1	laranjal-paulista
8417	Lavínia	2013-09-03 15:30:12.389704	25	1	lavinia
8418	Lavrinhas	2013-09-03 15:30:12.389704	25	1	lavrinhas
8419	Leme	2013-09-03 15:30:12.389704	25	1	leme
8420	Lençóis Paulista	2013-09-03 15:30:12.389704	25	1	lencois-paulista
8421	Limeira	2013-09-03 15:30:12.389704	25	1	limeira
8422	Lindóia	2013-09-03 15:30:12.389704	25	1	lindoia
8423	Lins	2013-09-03 15:30:12.389704	25	1	lins
8424	Lorena	2013-09-03 15:30:12.389704	25	1	lorena
8425	Lourdes	2013-09-03 15:30:12.389704	25	1	lourdes
8426	Louveira	2013-09-03 15:30:12.389704	25	1	louveira
8427	Lucélia	2013-09-03 15:30:12.389704	25	1	lucelia
8428	Lucianópolis	2013-09-03 15:30:12.389704	25	1	lucianopolis
8429	Luís Antônio	2013-09-03 15:30:12.389704	25	1	luis-antonio
8430	Luiziânia	2013-09-03 15:30:12.389704	25	1	luiziania
8431	Lupércio	2013-09-03 15:30:12.389704	25	1	lupercio
8432	Lutécia	2013-09-03 15:30:12.389704	25	1	lutecia
8433	Macatuba	2013-09-03 15:30:12.389704	25	1	macatuba
8434	Macaubal	2013-09-03 15:30:12.389704	25	1	macaubal
8435	Macedônia	2013-09-03 15:30:12.389704	25	1	macedonia
8436	Magda	2013-09-03 15:30:12.389704	25	1	magda
8437	Mairinque	2013-09-03 15:30:12.389704	25	1	mairinque
8438	Mairiporã	2013-09-03 15:30:12.389704	25	1	mairipora
8439	Manduri	2013-09-03 15:30:12.389704	25	1	manduri
8440	Marabá Paulista	2013-09-03 15:30:12.389704	25	1	maraba-paulista
8441	Maracaí	2013-09-03 15:30:12.389704	25	1	maracai
8442	Marapoama	2013-09-03 15:30:12.389704	25	1	marapoama
8443	Mariápolis	2013-09-03 15:30:12.389704	25	1	mariapolis
8444	Marília	2013-09-03 15:30:12.389704	25	1	marilia
8445	Marinópolis	2013-09-03 15:30:12.389704	25	1	marinopolis
8446	Martinópolis	2013-09-03 15:30:12.389704	25	1	martinopolis
8447	Matão	2013-09-03 15:30:12.389704	25	1	matao
8448	Mauá	2013-09-03 15:30:12.389704	25	1	maua
8449	Mendonça	2013-09-03 15:30:12.389704	25	1	mendonca
8450	Meridiano	2013-09-03 15:30:12.389704	25	1	meridiano
8451	Mesópolis	2013-09-03 15:30:12.389704	25	1	mesopolis
8452	Miguelópolis	2013-09-03 15:30:12.389704	25	1	miguelopolis
8453	Mineiros do Tietê	2013-09-03 15:30:12.389704	25	1	mineiros-do-tiete
8454	Mira Estrela	2013-09-03 15:30:12.389704	25	1	mira-estrela
8455	Miracatu	2013-09-03 15:30:12.389704	25	1	miracatu
8456	Mirandópolis	2013-09-03 15:30:12.389704	25	1	mirandopolis
8457	Mirante do Paranapanema	2013-09-03 15:30:12.389704	25	1	mirante-do-paranapanema
8458	Mirassol	2013-09-03 15:30:12.389704	25	1	mirassol
8459	Mirassolândia	2013-09-03 15:30:12.389704	25	1	mirassolandia
8460	Mococa	2013-09-03 15:30:12.389704	25	1	mococa
8461	Mogi das Cruzes	2013-09-03 15:30:12.389704	25	1	mogi-das-cruzes
8462	Mogi Guaçu	2013-09-03 15:30:12.389704	25	1	mogi-guacu
8463	Moji Mirim	2013-09-03 15:30:12.389704	25	1	moji-mirim
8464	Mombuca	2013-09-03 15:30:12.389704	25	1	mombuca
8465	Monções	2013-09-03 15:30:12.389704	25	1	moncoes
8466	Mongaguá	2013-09-03 15:30:12.389704	25	1	mongagua
8467	Monte Alegre do Sul	2013-09-03 15:30:12.389704	25	1	monte-alegre-do-sul
8468	Monte Alto	2013-09-03 15:30:12.389704	25	1	monte-alto
8469	Monte Aprazível	2013-09-03 15:30:12.389704	25	1	monte-aprazivel
8470	Monte Azul Paulista	2013-09-03 15:30:12.389704	25	1	monte-azul-paulista
8471	Monte Castelo	2013-09-03 15:30:12.389704	25	1	monte-castelo
8472	Monte Mor	2013-09-03 15:30:12.389704	25	1	monte-mor
8473	Monteiro Lobato	2013-09-03 15:30:12.389704	25	1	monteiro-lobato
8474	Morro Agudo	2013-09-03 15:30:12.389704	25	1	morro-agudo
8475	Morungaba	2013-09-03 15:30:12.389704	25	1	morungaba
8476	Motuca	2013-09-03 15:30:12.389704	25	1	motuca
8477	Murutinga do Sul	2013-09-03 15:30:12.389704	25	1	murutinga-do-sul
8478	Nantes	2013-09-03 15:30:12.389704	25	1	nantes
8479	Narandiba	2013-09-03 15:30:12.389704	25	1	narandiba
8480	Natividade da Serra	2013-09-03 15:30:12.389704	25	1	natividade-da-serra
8481	Nazaré Paulista	2013-09-03 15:30:12.389704	25	1	nazare-paulista
8482	Neves Paulista	2013-09-03 15:30:12.389704	25	1	neves-paulista
8483	Nhandeara	2013-09-03 15:30:12.389704	25	1	nhandeara
8484	Nipoã	2013-09-03 15:30:12.389704	25	1	nipoa
8485	Nova Aliança	2013-09-03 15:30:12.389704	25	1	nova-alianca
8486	Nova Campina	2013-09-03 15:30:12.389704	25	1	nova-campina
8487	Nova Canaã Paulista	2013-09-03 15:30:12.389704	25	1	nova-canaa-paulista
8488	Nova Castilho	2013-09-03 15:30:12.389704	25	1	nova-castilho
8489	Nova Europa	2013-09-03 15:30:12.389704	25	1	nova-europa
8490	Nova Granada	2013-09-03 15:30:12.389704	25	1	nova-granada
8491	Nova Guataporanga	2013-09-03 15:30:12.389704	25	1	nova-guataporanga
8492	Nova Independência	2013-09-03 15:30:12.389704	25	1	nova-independencia
8493	Nova Luzitânia	2013-09-03 15:30:12.389704	25	1	nova-luzitania
8494	Nova Odessa	2013-09-03 15:30:12.389704	25	1	nova-odessa
8495	Novais	2013-09-03 15:30:12.389704	25	1	novais
8496	Novo Horizonte	2013-09-03 15:30:12.389704	25	1	novo-horizonte
8497	Nuporanga	2013-09-03 15:30:12.389704	25	1	nuporanga
8498	Ocauçu	2013-09-03 15:30:12.389704	25	1	ocaucu
8499	Óleo	2013-09-03 15:30:12.389704	25	1	oleo
8500	Olímpia	2013-09-03 15:30:12.389704	25	1	olimpia
8501	Onda Verde	2013-09-03 15:30:12.389704	25	1	onda-verde
8502	Oriente	2013-09-03 15:30:12.389704	25	1	oriente
8503	Orindiúva	2013-09-03 15:30:12.389704	25	1	orindiuva
8504	Orlândia	2013-09-03 15:30:12.389704	25	1	orlandia
8505	Osasco	2013-09-03 15:30:12.389704	25	1	osasco
8506	Oscar Bressane	2013-09-03 15:30:12.389704	25	1	oscar-bressane
8507	Osvaldo Cruz	2013-09-03 15:30:12.389704	25	1	osvaldo-cruz
8508	Ourinhos	2013-09-03 15:30:12.389704	25	1	ourinhos
8509	Ouro Verde	2013-09-03 15:30:12.389704	25	1	ouro-verde
8510	Ouroeste	2013-09-03 15:30:12.389704	25	1	ouroeste
8511	Pacaembu	2013-09-03 15:30:12.389704	25	1	pacaembu
8512	Palestina	2013-09-03 15:30:12.389704	25	1	palestina
8513	Palmares Paulista	2013-09-03 15:30:12.389704	25	1	palmares-paulista
8514	Palmeira d`Oeste	2013-09-03 15:30:12.389704	25	1	palmeira-d-oeste
8515	Palmital	2013-09-03 15:30:12.389704	25	1	palmital
8516	Panorama	2013-09-03 15:30:12.389704	25	1	panorama
8517	Paraguaçu Paulista	2013-09-03 15:30:12.389704	25	1	paraguacu-paulista
8518	Paraibuna	2013-09-03 15:30:12.389704	25	1	paraibuna
8519	Paraíso	2013-09-03 15:30:12.389704	25	1	paraiso
8520	Paranapanema	2013-09-03 15:30:12.389704	25	1	paranapanema
8521	Paranapuã	2013-09-03 15:30:12.389704	25	1	paranapua
8522	Parapuã	2013-09-03 15:30:12.389704	25	1	parapua
8523	Pardinho	2013-09-03 15:30:12.389704	25	1	pardinho
8524	Pariquera-Açu	2013-09-03 15:30:12.389704	25	1	pariquera-acu
8525	Parisi	2013-09-03 15:30:12.389704	25	1	parisi
8526	Patrocínio Paulista	2013-09-03 15:30:12.389704	25	1	patrocinio-paulista
8527	Paulicéia	2013-09-03 15:30:12.389704	25	1	pauliceia
8528	Paulínia	2013-09-03 15:30:12.389704	25	1	paulinia
8529	Paulistânia	2013-09-03 15:30:12.389704	25	1	paulistania
8530	Paulo de Faria	2013-09-03 15:30:12.389704	25	1	paulo-de-faria
8531	Pederneiras	2013-09-03 15:30:12.389704	25	1	pederneiras
8532	Pedra Bela	2013-09-03 15:30:12.389704	25	1	pedra-bela
8533	Pedranópolis	2013-09-03 15:30:12.389704	25	1	pedranopolis
8534	Pedregulho	2013-09-03 15:30:12.389704	25	1	pedregulho
8535	Pedreira	2013-09-03 15:30:12.389704	25	1	pedreira
8536	Pedrinhas Paulista	2013-09-03 15:30:12.389704	25	1	pedrinhas-paulista
8537	Pedro de Toledo	2013-09-03 15:30:12.389704	25	1	pedro-de-toledo
8538	Penápolis	2013-09-03 15:30:12.389704	25	1	penapolis
8539	Pereira Barreto	2013-09-03 15:30:12.389704	25	1	pereira-barreto
8540	Pereiras	2013-09-03 15:30:12.389704	25	1	pereiras
8541	Peruíbe	2013-09-03 15:30:12.389704	25	1	peruibe
8542	Piacatu	2013-09-03 15:30:12.389704	25	1	piacatu
8543	Piedade	2013-09-03 15:30:12.389704	25	1	piedade
8544	Pilar do Sul	2013-09-03 15:30:12.389704	25	1	pilar-do-sul
8545	Pindamonhangaba	2013-09-03 15:30:12.389704	25	1	pindamonhangaba
8546	Pindorama	2013-09-03 15:30:12.389704	25	1	pindorama
8547	Pinhalzinho	2013-09-03 15:30:12.389704	25	1	pinhalzinho
8548	Piquerobi	2013-09-03 15:30:12.389704	25	1	piquerobi
8549	Piquete	2013-09-03 15:30:12.389704	25	1	piquete
8550	Piracaia	2013-09-03 15:30:12.389704	25	1	piracaia
8551	Piracicaba	2013-09-03 15:30:12.389704	25	1	piracicaba
8552	Piraju	2013-09-03 15:30:12.389704	25	1	piraju
8553	Pirajuí	2013-09-03 15:30:12.389704	25	1	pirajui
8554	Pirangi	2013-09-03 15:30:12.389704	25	1	pirangi
8555	Pirapora do Bom Jesus	2013-09-03 15:30:12.389704	25	1	pirapora-do-bom-jesus
8556	Pirapozinho	2013-09-03 15:30:12.389704	25	1	pirapozinho
8557	Pirassununga	2013-09-03 15:30:12.389704	25	1	pirassununga
8558	Piratininga	2013-09-03 15:30:12.389704	25	1	piratininga
8559	Pitangueiras	2013-09-03 15:30:12.389704	25	1	pitangueiras
8560	Planalto	2013-09-03 15:30:12.389704	25	1	planalto
8561	Platina	2013-09-03 15:30:12.389704	25	1	platina
8562	Poá	2013-09-03 15:30:12.389704	25	1	poa
8563	Poloni	2013-09-03 15:30:12.389704	25	1	poloni
8564	Pompéia	2013-09-03 15:30:12.389704	25	1	pompeia
8565	Pongaí	2013-09-03 15:30:12.389704	25	1	pongai
8566	Pontal	2013-09-03 15:30:12.389704	25	1	pontal
8567	Pontalinda	2013-09-03 15:30:12.389704	25	1	pontalinda
8568	Pontes Gestal	2013-09-03 15:30:12.389704	25	1	pontes-gestal
8569	Populina	2013-09-03 15:30:12.389704	25	1	populina
8570	Porangaba	2013-09-03 15:30:12.389704	25	1	porangaba
8571	Porto Feliz	2013-09-03 15:30:12.389704	25	1	porto-feliz
8572	Porto Ferreira	2013-09-03 15:30:12.389704	25	1	porto-ferreira
8573	Potim	2013-09-03 15:30:12.389704	25	1	potim
8574	Potirendaba	2013-09-03 15:30:12.389704	25	1	potirendaba
8575	Pracinha	2013-09-03 15:30:12.389704	25	1	pracinha
8576	Pradópolis	2013-09-03 15:30:12.389704	25	1	pradopolis
8577	Praia Grande	2013-09-03 15:30:12.389704	25	1	praia-grande
8578	Pratânia	2013-09-03 15:30:12.389704	25	1	pratania
8579	Presidente Alves	2013-09-03 15:30:12.389704	25	1	presidente-alves
8580	Presidente Bernardes	2013-09-03 15:30:12.389704	25	1	presidente-bernardes
8581	Presidente Epitácio	2013-09-03 15:30:12.389704	25	1	presidente-epitacio
8582	Presidente Prudente	2013-09-03 15:30:12.389704	25	1	presidente-prudente
8583	Presidente Venceslau	2013-09-03 15:30:12.389704	25	1	presidente-venceslau
8584	Promissão	2013-09-03 15:30:12.389704	25	1	promissao
8585	Quadra	2013-09-03 15:30:12.389704	25	1	quadra
8586	Quatá	2013-09-03 15:30:12.389704	25	1	quata
8587	Queiroz	2013-09-03 15:30:12.389704	25	1	queiroz
8588	Queluz	2013-09-03 15:30:12.389704	25	1	queluz
8589	Quintana	2013-09-03 15:30:12.389704	25	1	quintana
8590	Rafard	2013-09-03 15:30:12.389704	25	1	rafard
8591	Rancharia	2013-09-03 15:30:12.389704	25	1	rancharia
8592	Redenção da Serra	2013-09-03 15:30:12.389704	25	1	redencao-da-serra
8593	Regente Feijó	2013-09-03 15:30:12.389704	25	1	regente-feijo
8594	Reginópolis	2013-09-03 15:30:12.389704	25	1	reginopolis
8595	Registro	2013-09-03 15:30:12.389704	25	1	registro
8596	Restinga	2013-09-03 15:30:12.389704	25	1	restinga
8597	Ribeira	2013-09-03 15:30:12.389704	25	1	ribeira
8598	Ribeirão Bonito	2013-09-03 15:30:12.389704	25	1	ribeirao-bonito
8599	Ribeirão Branco	2013-09-03 15:30:12.389704	25	1	ribeirao-branco
8600	Ribeirão Corrente	2013-09-03 15:30:12.389704	25	1	ribeirao-corrente
8601	Ribeirão do Sul	2013-09-03 15:30:12.389704	25	1	ribeirao-do-sul
8602	Ribeirão dos Índios	2013-09-03 15:30:12.389704	25	1	ribeirao-dos-indios
8603	Ribeirão Grande	2013-09-03 15:30:12.389704	25	1	ribeirao-grande
8604	Ribeirão Pires	2013-09-03 15:30:12.389704	25	1	ribeirao-pires
8605	Ribeirão Preto	2013-09-03 15:30:12.389704	25	1	ribeirao-preto
8606	Rifaina	2013-09-03 15:30:12.389704	25	1	rifaina
8607	Rincão	2013-09-03 15:30:12.389704	25	1	rincao
8608	Rinópolis	2013-09-03 15:30:12.389704	25	1	rinopolis
8609	Rio Claro	2013-09-03 15:30:12.389704	25	1	rio-claro
8610	Rio das Pedras	2013-09-03 15:30:12.389704	25	1	rio-das-pedras
8611	Rio Grande da Serra	2013-09-03 15:30:12.389704	25	1	rio-grande-da-serra
8612	Riolândia	2013-09-03 15:30:12.389704	25	1	riolandia
8613	Riversul	2013-09-03 15:30:12.389704	25	1	riversul
8614	Rosana	2013-09-03 15:30:12.389704	25	1	rosana
8615	Roseira	2013-09-03 15:30:12.389704	25	1	roseira
8616	Rubiácea	2013-09-03 15:30:12.389704	25	1	rubiacea
8617	Rubinéia	2013-09-03 15:30:12.389704	25	1	rubineia
8618	Sabino	2013-09-03 15:30:12.389704	25	1	sabino
8619	Sagres	2013-09-03 15:30:12.389704	25	1	sagres
8620	Sales	2013-09-03 15:30:12.389704	25	1	sales
8621	Sales Oliveira	2013-09-03 15:30:12.389704	25	1	sales-oliveira
8622	Salesópolis	2013-09-03 15:30:12.389704	25	1	salesopolis
8623	Salmourão	2013-09-03 15:30:12.389704	25	1	salmourao
8624	Saltinho	2013-09-03 15:30:12.389704	25	1	saltinho
8625	Salto	2013-09-03 15:30:12.389704	25	1	salto
8626	Salto de Pirapora	2013-09-03 15:30:12.389704	25	1	salto-de-pirapora
8627	Salto Grande	2013-09-03 15:30:12.389704	25	1	salto-grande
8628	Sandovalina	2013-09-03 15:30:12.389704	25	1	sandovalina
8629	Santa Adélia	2013-09-03 15:30:12.389704	25	1	santa-adelia
8630	Santa Albertina	2013-09-03 15:30:12.389704	25	1	santa-albertina
8631	Santa Bárbara d`Oeste	2013-09-03 15:30:12.389704	25	1	santa-barbara-d-oeste
8632	Santa Branca	2013-09-03 15:30:12.389704	25	1	santa-branca
8633	Santa Clara d`Oeste	2013-09-03 15:30:12.389704	25	1	santa-clara-d-oeste
8634	Santa Cruz da Conceição	2013-09-03 15:30:12.389704	25	1	santa-cruz-da-conceicao
8635	Santa Cruz da Esperança	2013-09-03 15:30:12.389704	25	1	santa-cruz-da-esperanca
8636	Santa Cruz das Palmeiras	2013-09-03 15:30:12.389704	25	1	santa-cruz-das-palmeiras
8637	Santa Cruz do Rio Pardo	2013-09-03 15:30:12.389704	25	1	santa-cruz-do-rio-pardo
8638	Santa Ernestina	2013-09-03 15:30:12.389704	25	1	santa-ernestina
8639	Santa Fé do Sul	2013-09-03 15:30:12.389704	25	1	santa-fe-do-sul
8640	Santa Gertrudes	2013-09-03 15:30:12.389704	25	1	santa-gertrudes
8641	Santa Isabel	2013-09-03 15:30:12.389704	25	1	santa-isabel
8642	Santa Lúcia	2013-09-03 15:30:12.389704	25	1	santa-lucia
8643	Santa Maria da Serra	2013-09-03 15:30:12.389704	25	1	santa-maria-da-serra
8644	Santa Mercedes	2013-09-03 15:30:12.389704	25	1	santa-mercedes
8645	Santa Rita d`Oeste	2013-09-03 15:30:12.389704	25	1	santa-rita-d-oeste
8646	Santa Rita do Passa Quatro	2013-09-03 15:30:12.389704	25	1	santa-rita-do-passa-quatro
8647	Santa Rosa de Viterbo	2013-09-03 15:30:12.389704	25	1	santa-rosa-de-viterbo
8648	Santa Salete	2013-09-03 15:30:12.389704	25	1	santa-salete
8649	Santana da Ponte Pensa	2013-09-03 15:30:12.389704	25	1	santana-da-ponte-pensa
8650	Santana de Parnaíba	2013-09-03 15:30:12.389704	25	1	santana-de-parnaiba
8651	Santo Anastácio	2013-09-03 15:30:12.389704	25	1	santo-anastacio
8652	Santo André	2013-09-03 15:30:12.389704	25	1	santo-andre
8653	Santo Antônio da Alegria	2013-09-03 15:30:12.389704	25	1	santo-antonio-da-alegria
8654	Santo Antônio de Posse	2013-09-03 15:30:12.389704	25	1	santo-antonio-de-posse
8655	Santo Antônio do Aracanguá	2013-09-03 15:30:12.389704	25	1	santo-antonio-do-aracangua
8656	Santo Antônio do Jardim	2013-09-03 15:30:12.389704	25	1	santo-antonio-do-jardim
8657	Santo Antônio do Pinhal	2013-09-03 15:30:12.389704	25	1	santo-antonio-do-pinhal
8658	Santo Expedito	2013-09-03 15:30:12.389704	25	1	santo-expedito
8659	Santópolis do Aguapeí	2013-09-03 15:30:12.389704	25	1	santopolis-do-aguapei
8660	Santos	2013-09-03 15:30:12.389704	25	1	santos
8661	São Bento do Sapucaí	2013-09-03 15:30:12.389704	25	1	sao-bento-do-sapucai
8662	São Bernardo do Campo	2013-09-03 15:30:12.389704	25	1	sao-bernardo-do-campo
8663	São Caetano do Sul	2013-09-03 15:30:12.389704	25	1	sao-caetano-do-sul
8664	São Carlos	2013-09-03 15:30:12.389704	25	1	sao-carlos
8665	São Francisco	2013-09-03 15:30:12.389704	25	1	sao-francisco
8666	São João da Boa Vista	2013-09-03 15:30:12.389704	25	1	sao-joao-da-boa-vista
8667	São João das Duas Pontes	2013-09-03 15:30:12.389704	25	1	sao-joao-das-duas-pontes
8668	São João de Iracema	2013-09-03 15:30:12.389704	25	1	sao-joao-de-iracema
8669	São João do Pau d`Alho	2013-09-03 15:30:12.389704	25	1	sao-joao-do-pau-d-alho
8670	São Joaquim da Barra	2013-09-03 15:30:12.389704	25	1	sao-joaquim-da-barra
8671	São José da Bela Vista	2013-09-03 15:30:12.389704	25	1	sao-jose-da-bela-vista
8672	São José do Barreiro	2013-09-03 15:30:12.389704	25	1	sao-jose-do-barreiro
8673	São José do Rio Pardo	2013-09-03 15:30:12.389704	25	1	sao-jose-do-rio-pardo
8674	São José do Rio Preto	2013-09-03 15:30:12.389704	25	1	sao-jose-do-rio-preto
8675	São José dos Campos	2013-09-03 15:30:12.389704	25	1	sao-jose-dos-campos
8676	São Lourenço da Serra	2013-09-03 15:30:12.389704	25	1	sao-lourenco-da-serra
8677	São Luís do Paraitinga	2013-09-03 15:30:12.389704	25	1	sao-luis-do-paraitinga
8678	São Manuel	2013-09-03 15:30:12.389704	25	1	sao-manuel
8679	São Miguel Arcanjo	2013-09-03 15:30:12.389704	25	1	sao-miguel-arcanjo
8681	São Pedro	2013-09-03 15:30:12.389704	25	1	sao-pedro
8682	São Pedro do Turvo	2013-09-03 15:30:12.389704	25	1	sao-pedro-do-turvo
8683	São Roque	2013-09-03 15:30:12.389704	25	1	sao-roque
8684	São Sebastião	2013-09-03 15:30:12.389704	25	1	sao-sebastiao
8685	São Sebastião da Grama	2013-09-03 15:30:12.389704	25	1	sao-sebastiao-da-grama
8686	São Simão	2013-09-03 15:30:12.389704	25	1	sao-simao
8687	São Vicente	2013-09-03 15:30:12.389704	25	1	sao-vicente
8688	Sarapuí	2013-09-03 15:30:12.389704	25	1	sarapui
8689	Sarutaiá	2013-09-03 15:30:12.389704	25	1	sarutaia
8690	Sebastianópolis do Sul	2013-09-03 15:30:12.389704	25	1	sebastianopolis-do-sul
8691	Serra Azul	2013-09-03 15:30:12.389704	25	1	serra-azul
8692	Serra Negra	2013-09-03 15:30:12.389704	25	1	serra-negra
8693	Serrana	2013-09-03 15:30:12.389704	25	1	serrana
8694	Sertãozinho	2013-09-03 15:30:12.389704	25	1	sertaozinho
8695	Sete Barras	2013-09-03 15:30:12.389704	25	1	sete-barras
8696	Severínia	2013-09-03 15:30:12.389704	25	1	severinia
8697	Silveiras	2013-09-03 15:30:12.389704	25	1	silveiras
8698	Socorro	2013-09-03 15:30:12.389704	25	1	socorro
8699	Sorocaba	2013-09-03 15:30:12.389704	25	1	sorocaba
8700	Sud Mennucci	2013-09-03 15:30:12.389704	25	1	sud-mennucci
8701	Sumaré	2013-09-03 15:30:12.389704	25	1	sumare
8702	Suzanápolis	2013-09-03 15:30:12.389704	25	1	suzanapolis
8703	Suzano	2013-09-03 15:30:12.389704	25	1	suzano
8704	Tabapuã	2013-09-03 15:30:12.389704	25	1	tabapua
8705	Tabatinga	2013-09-03 15:30:12.389704	25	1	tabatinga
8706	Taboão da Serra	2013-09-03 15:30:12.389704	25	1	taboao-da-serra
8707	Taciba	2013-09-03 15:30:12.389704	25	1	taciba
8708	Taguaí	2013-09-03 15:30:12.389704	25	1	taguai
8709	Taiaçu	2013-09-03 15:30:12.389704	25	1	taiacu
8710	Taiúva	2013-09-03 15:30:12.389704	25	1	taiuva
8711	Tambaú	2013-09-03 15:30:12.389704	25	1	tambau
8712	Tanabi	2013-09-03 15:30:12.389704	25	1	tanabi
8713	Tapiraí	2013-09-03 15:30:12.389704	25	1	tapirai
8714	Tapiratiba	2013-09-03 15:30:12.389704	25	1	tapiratiba
8715	Taquaral	2013-09-03 15:30:12.389704	25	1	taquaral
8716	Taquaritinga	2013-09-03 15:30:12.389704	25	1	taquaritinga
8717	Taquarituba	2013-09-03 15:30:12.389704	25	1	taquarituba
8718	Taquarivaí	2013-09-03 15:30:12.389704	25	1	taquarivai
8719	Tarabai	2013-09-03 15:30:12.389704	25	1	tarabai
8720	Tarumã	2013-09-03 15:30:12.389704	25	1	taruma
8721	Tatuí	2013-09-03 15:30:12.389704	25	1	tatui
8722	Taubaté	2013-09-03 15:30:12.389704	25	1	taubate
8723	Tejupá	2013-09-03 15:30:12.389704	25	1	tejupa
8724	Teodoro Sampaio	2013-09-03 15:30:12.389704	25	1	teodoro-sampaio
8725	Terra Roxa	2013-09-03 15:30:12.389704	25	1	terra-roxa
8726	Tietê	2013-09-03 15:30:12.389704	25	1	tiete
8727	Timburi	2013-09-03 15:30:12.389704	25	1	timburi
8728	Torre de Pedra	2013-09-03 15:30:12.389704	25	1	torre-de-pedra
8729	Torrinha	2013-09-03 15:30:12.389704	25	1	torrinha
8730	Trabiju	2013-09-03 15:30:12.389704	25	1	trabiju
8731	Tremembé	2013-09-03 15:30:12.389704	25	1	tremembe
8732	Três Fronteiras	2013-09-03 15:30:12.389704	25	1	tres-fronteiras
8733	Tuiuti	2013-09-03 15:30:12.389704	25	1	tuiuti
8734	Tupã	2013-09-03 15:30:12.389704	25	1	tupa
8735	Tupi Paulista	2013-09-03 15:30:12.389704	25	1	tupi-paulista
8736	Turiúba	2013-09-03 15:30:12.389704	25	1	turiuba
8737	Turmalina	2013-09-03 15:30:12.389704	25	1	turmalina
8738	Ubarana	2013-09-03 15:30:12.389704	25	1	ubarana
8739	Ubatuba	2013-09-03 15:30:12.389704	25	1	ubatuba
8740	Ubirajara	2013-09-03 15:30:12.389704	25	1	ubirajara
8741	Uchoa	2013-09-03 15:30:12.389704	25	1	uchoa
8742	União Paulista	2013-09-03 15:30:12.389704	25	1	uniao-paulista
8743	Urânia	2013-09-03 15:30:12.389704	25	1	urania
8744	Uru	2013-09-03 15:30:12.389704	25	1	uru
8745	Urupês	2013-09-03 15:30:12.389704	25	1	urupes
8746	Valentim Gentil	2013-09-03 15:30:12.389704	25	1	valentim-gentil
8747	Valinhos	2013-09-03 15:30:12.389704	25	1	valinhos
8748	Valparaíso	2013-09-03 15:30:12.389704	25	1	valparaiso
8749	Vargem	2013-09-03 15:30:12.389704	25	1	vargem
8750	Vargem Grande do Sul	2013-09-03 15:30:12.389704	25	1	vargem-grande-do-sul
8751	Vargem Grande Paulista	2013-09-03 15:30:12.389704	25	1	vargem-grande-paulista
8752	Várzea Paulista	2013-09-03 15:30:12.389704	25	1	varzea-paulista
8753	Vera Cruz	2013-09-03 15:30:12.389704	25	1	vera-cruz
8754	Vinhedo	2013-09-03 15:30:12.389704	25	1	vinhedo
8755	Viradouro	2013-09-03 15:30:12.389704	25	1	viradouro
8756	Vista Alegre do Alto	2013-09-03 15:30:12.389704	25	1	vista-alegre-do-alto
8757	Vitória Brasil	2013-09-03 15:30:12.389704	25	1	vitoria-brasil
8758	Votorantim	2013-09-03 15:30:12.389704	25	1	votorantim
8759	Votuporanga	2013-09-03 15:30:12.389704	25	1	votuporanga
8760	Zacarias	2013-09-03 15:30:12.389704	25	1	zacarias
9139	Abreulândia	2013-09-03 15:30:12.389704	27	1	abreulandia
9140	Aguiarnópolis	2013-09-03 15:30:12.389704	27	1	aguiarnopolis
9141	Aliança do Tocantins	2013-09-03 15:30:12.389704	27	1	alianca-do-tocantins
9142	Almas	2013-09-03 15:30:12.389704	27	1	almas
9143	Alvorada	2013-09-03 15:30:12.389704	27	1	alvorada
9144	Ananás	2013-09-03 15:30:12.389704	27	1	ananas
9145	Angico	2013-09-03 15:30:12.389704	27	1	angico
9146	Aparecida do Rio\nNegro	2013-09-03 15:30:12.389704	27	1	aparecida-do-rio-negro
9147	Aragominas	2013-09-03 15:30:12.389704	27	1	aragominas
9148	Araguacema	2013-09-03 15:30:12.389704	27	1	araguacema
9149	Araguaçu	2013-09-03 15:30:12.389704	27	1	araguacu
9150	Araguaína	2013-09-03 15:30:12.389704	27	1	araguaina
9151	Araguanã	2013-09-03 15:30:12.389704	27	1	araguana
9152	Araguatins	2013-09-03 15:30:12.389704	27	1	araguatins
9153	Arapoema	2013-09-03 15:30:12.389704	27	1	arapoema
9154	Arraias	2013-09-03 15:30:12.389704	27	1	arraias
9155	Augustinópolis	2013-09-03 15:30:12.389704	27	1	augustinopolis
9156	Aurora do Tocantins	2013-09-03 15:30:12.389704	27	1	aurora-do-tocantins
9157	Axixá do Tocantins	2013-09-03 15:30:12.389704	27	1	axixa-do-tocantins
9158	Babaçulândia	2013-09-03 15:30:12.389704	27	1	babaculandia
9159	Bandeirantes do Tocantins	2013-09-03 15:30:12.389704	27	1	bandeirantes-do-tocantins
9160	Barra do Ouro	2013-09-03 15:30:12.389704	27	1	barra-do-ouro
9161	Barrolândia	2013-09-03 15:30:12.389704	27	1	barrolandia
9162	Bernardo Sayão	2013-09-03 15:30:12.389704	27	1	bernardo-sayao
9163	Bom Jesus do Tocantins	2013-09-03 15:30:12.389704	27	1	bom-jesus-do-tocantins
9164	Brasilândia do Tocantins	2013-09-03 15:30:12.389704	27	1	brasilandia-do-tocantins
9165	Brejinho de Nazaré	2013-09-03 15:30:12.389704	27	1	brejinho-de-nazare
9166	Buriti do Tocantins	2013-09-03 15:30:12.389704	27	1	buriti-do-tocantins
9167	Cachoeirinha	2013-09-03 15:30:12.389704	27	1	cachoeirinha
9168	Campos Lindos	2013-09-03 15:30:12.389704	27	1	campos-lindos
9169	Cariri do Tocantins	2013-09-03 15:30:12.389704	27	1	cariri-do-tocantins
9170	Carmolândia	2013-09-03 15:30:12.389704	27	1	carmolandia
9171	Carrasco Bonito	2013-09-03 15:30:12.389704	27	1	carrasco-bonito
9172	Caseara	2013-09-03 15:30:12.389704	27	1	caseara
9173	Centenário	2013-09-03 15:30:12.389704	27	1	centenario
9174	Chapada da Natividade	2013-09-03 15:30:12.389704	27	1	chapada-da-natividade
9175	Chapada de Areia	2013-09-03 15:30:12.389704	27	1	chapada-de-areia
9176	Colinas do Tocantins	2013-09-03 15:30:12.389704	27	1	colinas-do-tocantins
9177	Colméia	2013-09-03 15:30:12.389704	27	1	colmeia
9178	Combinado	2013-09-03 15:30:12.389704	27	1	combinado
9179	Conceição do Tocantins	2013-09-03 15:30:12.389704	27	1	conceicao-do-tocantins
9180	Couto de Magalhães	2013-09-03 15:30:12.389704	27	1	couto-de-magalhaes
9181	Cristalândia	2013-09-03 15:30:12.389704	27	1	cristalandia
9182	Crixás do Tocantins	2013-09-03 15:30:12.389704	27	1	crixas-do-tocantins
9183	Darcinópolis	2013-09-03 15:30:12.389704	27	1	darcinopolis
9184	Dianópolis	2013-09-03 15:30:12.389704	27	1	dianopolis
9185	Divinópolis do Tocantins	2013-09-03 15:30:12.389704	27	1	divinopolis-do-tocantins
9186	Dois Irmãos do Tocantins	2013-09-03 15:30:12.389704	27	1	dois-irmaos-do-tocantins
9187	Dueré	2013-09-03 15:30:12.389704	27	1	duere
9188	Esperantina	2013-09-03 15:30:12.389704	27	1	esperantina
9189	Fátima	2013-09-03 15:30:12.389704	27	1	fatima
9190	Figueirópolis	2013-09-03 15:30:12.389704	27	1	figueiropolis
9191	Filadélfia	2013-09-03 15:30:12.389704	27	1	filadelfia
9192	Formoso do Araguaia	2013-09-03 15:30:12.389704	27	1	formoso-do-araguaia
9193	Fortaleza do Tabocão	2013-09-03 15:30:12.389704	27	1	fortaleza-do-tabocao
9194	Goianorte	2013-09-03 15:30:12.389704	27	1	goianorte
9195	Goiatins	2013-09-03 15:30:12.389704	27	1	goiatins
9196	Guaraí	2013-09-03 15:30:12.389704	27	1	guarai
9197	Gurupi	2013-09-03 15:30:12.389704	27	1	gurupi
9198	Ipueiras	2013-09-03 15:30:12.389704	27	1	ipueiras
9199	Itacajá	2013-09-03 15:30:12.389704	27	1	itacaja
9200	Itaguatins	2013-09-03 15:30:12.389704	27	1	itaguatins
9201	Itapiratins	2013-09-03 15:30:12.389704	27	1	itapiratins
9202	Itaporã do Tocantins	2013-09-03 15:30:12.389704	27	1	itapora-do-tocantins
9203	Jaú do Tocantins	2013-09-03 15:30:12.389704	27	1	jau-do-tocantins
9204	Juarina	2013-09-03 15:30:12.389704	27	1	juarina
9205	Lagoa da Confusão	2013-09-03 15:30:12.389704	27	1	lagoa-da-confusao
9206	Lagoa do Tocantins	2013-09-03 15:30:12.389704	27	1	lagoa-do-tocantins
9207	Lajeado	2013-09-03 15:30:12.389704	27	1	lajeado
9208	Lavandeira	2013-09-03 15:30:12.389704	27	1	lavandeira
9209	Lizarda	2013-09-03 15:30:12.389704	27	1	lizarda
9210	Luzinópolis	2013-09-03 15:30:12.389704	27	1	luzinopolis
9211	Marianópolis do Tocantins	2013-09-03 15:30:12.389704	27	1	marianopolis-do-tocantins
9212	Mateiros	2013-09-03 15:30:12.389704	27	1	mateiros
9213	Maurilândia do Tocantins	2013-09-03 15:30:12.389704	27	1	maurilandia-do-tocantins
9214	Miracema do Tocantins	2013-09-03 15:30:12.389704	27	1	miracema-do-tocantins
9215	Miranorte	2013-09-03 15:30:12.389704	27	1	miranorte
9216	Monte do Carmo	2013-09-03 15:30:12.389704	27	1	monte-do-carmo
9217	Monte Santo do Tocantins	2013-09-03 15:30:12.389704	27	1	monte-santo-do-tocantins
9218	Muricilândia	2013-09-03 15:30:12.389704	27	1	muricilandia
9219	Natividade	2013-09-03 15:30:12.389704	27	1	natividade
9220	Nazaré	2013-09-03 15:30:12.389704	27	1	nazare
9221	Nova Olinda	2013-09-03 15:30:12.389704	27	1	nova-olinda
9222	Nova Rosalândia	2013-09-03 15:30:12.389704	27	1	nova-rosalandia
9223	Novo Acordo	2013-09-03 15:30:12.389704	27	1	novo-acordo
9224	Novo Alegre	2013-09-03 15:30:12.389704	27	1	novo-alegre
9225	Novo Jardim	2013-09-03 15:30:12.389704	27	1	novo-jardim
9226	Oliveira de Fátima	2013-09-03 15:30:12.389704	27	1	oliveira-de-fatima
9227	Palmas	2013-09-03 15:30:12.389704	27	1	palmas
9228	Palmeirante	2013-09-03 15:30:12.389704	27	1	palmeirante
9229	Palmeiras do Tocantins	2013-09-03 15:30:12.389704	27	1	palmeiras-do-tocantins
9230	Palmeirópolis	2013-09-03 15:30:12.389704	27	1	palmeiropolis
9231	Paraíso do Tocantins	2013-09-03 15:30:12.389704	27	1	paraiso-do-tocantins
9232	Paranã	2013-09-03 15:30:12.389704	27	1	parana
9233	Pau d`Arco	2013-09-03 15:30:12.389704	27	1	pau-d-arco
9234	Pedro Afonso	2013-09-03 15:30:12.389704	27	1	pedro-afonso
9235	Peixe	2013-09-03 15:30:12.389704	27	1	peixe
9236	Pequizeiro	2013-09-03 15:30:12.389704	27	1	pequizeiro
9237	Pindorama do Tocantins	2013-09-03 15:30:12.389704	27	1	pindorama-do-tocantins
9238	Piraquê	2013-09-03 15:30:12.389704	27	1	piraque
9239	Pium	2013-09-03 15:30:12.389704	27	1	pium
9240	Ponte Alta do Bom Jesus	2013-09-03 15:30:12.389704	27	1	ponte-alta-do-bom-jesus
9241	Ponte Alta do Tocantins	2013-09-03 15:30:12.389704	27	1	ponte-alta-do-tocantins
9242	Porto Alegre do Tocantins	2013-09-03 15:30:12.389704	27	1	porto-alegre-do-tocantins
9243	Porto Nacional	2013-09-03 15:30:12.389704	27	1	porto-nacional
9244	Praia Norte	2013-09-03 15:30:12.389704	27	1	praia-norte
9245	Presidente Kennedy	2013-09-03 15:30:12.389704	27	1	presidente-kennedy
9246	Pugmil	2013-09-03 15:30:12.389704	27	1	pugmil
9247	Recursolândia	2013-09-03 15:30:12.389704	27	1	recursolandia
9248	Riachinho	2013-09-03 15:30:12.389704	27	1	riachinho
9249	Rio da Conceição	2013-09-03 15:30:12.389704	27	1	rio-da-conceicao
9250	Rio dos Bois	2013-09-03 15:30:12.389704	27	1	rio-dos-bois
9251	Rio Sono	2013-09-03 15:30:12.389704	27	1	rio-sono
9252	Sampaio	2013-09-03 15:30:12.389704	27	1	sampaio
9253	Sandolândia	2013-09-03 15:30:12.389704	27	1	sandolandia
9254	Santa Fé do Araguaia	2013-09-03 15:30:12.389704	27	1	santa-fe-do-araguaia
9255	Santa Maria do Tocantins	2013-09-03 15:30:12.389704	27	1	santa-maria-do-tocantins
9256	Santa Rita do Tocantins	2013-09-03 15:30:12.389704	27	1	santa-rita-do-tocantins
9257	Santa Rosa do Tocantins	2013-09-03 15:30:12.389704	27	1	santa-rosa-do-tocantins
9258	Santa Tereza do Tocantins	2013-09-03 15:30:12.389704	27	1	santa-tereza-do-tocantins
9259	Santa Terezinha do Tocantins	2013-09-03 15:30:12.389704	27	1	santa-terezinha-do-tocantins
9260	São Bento do Tocantins	2013-09-03 15:30:12.389704	27	1	sao-bento-do-tocantins
9261	São Félix do Tocantins	2013-09-03 15:30:12.389704	27	1	sao-felix-do-tocantins
9262	São Miguel do Tocantins	2013-09-03 15:30:12.389704	27	1	sao-miguel-do-tocantins
9263	São Salvador do Tocantins	2013-09-03 15:30:12.389704	27	1	sao-salvador-do-tocantins
9264	São Sebastião do Tocantins	2013-09-03 15:30:12.389704	27	1	sao-sebastiao-do-tocantins
9265	São Valério da Natividade	2013-09-03 15:30:12.389704	27	1	sao-valerio-da-natividade
9266	Silvanópolis	2013-09-03 15:30:12.389704	27	1	silvanopolis
9267	Sítio Novo do Tocantins	2013-09-03 15:30:12.389704	27	1	sitio-novo-do-tocantins
9268	Sucupira	2013-09-03 15:30:12.389704	27	1	sucupira
9269	Taguatinga	2013-09-03 15:30:12.389704	27	1	taguatinga
9270	Taipas do Tocantins	2013-09-03 15:30:12.389704	27	1	taipas-do-tocantins
9271	Talismã	2013-09-03 15:30:12.389704	27	1	talisma
9272	Tocantínia	2013-09-03 15:30:12.389704	27	1	tocantinia
9273	Tocantinópolis	2013-09-03 15:30:12.389704	27	1	tocantinopolis
9274	Tupirama	2013-09-03 15:30:12.389704	27	1	tupirama
9275	Tupiratins	2013-09-03 15:30:12.389704	27	1	tupiratins
9276	Wanderlândia	2013-09-03 15:30:12.389704	27	1	wanderlandia
9277	Xambioá	2013-09-03 15:30:12.389704	27	1	xambioa
\.


--
-- TOC entry 2071 (class 0 OID 0)
-- Dependencies: 180
-- Name: city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('city_id_seq', 2, true);


-- Completed on 2013-09-03 16:05:16 BRT

--
-- PostgreSQL database dump complete
--

