--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.4
-- Dumped by pg_dump version 9.3.4
-- Started on 2014-07-16 11:46:13 BRT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 223 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2288 (class 0 OID 0)
-- Dependencies: 223
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 220 (class 1259 OID 20951)
-- Name: actions_log; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE actions_log (
    id integer NOT NULL,
    dt_when timestamp without time zone DEFAULT now() NOT NULL,
    url text,
    user_id integer,
    message text,
    ip text
);


ALTER TABLE public.actions_log OWNER TO root;

--
-- TOC entry 219 (class 1259 OID 20949)
-- Name: actions_log_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE actions_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actions_log_id_seq OWNER TO root;

--
-- TOC entry 2289 (class 0 OID 0)
-- Dependencies: 219
-- Name: actions_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE actions_log_id_seq OWNED BY actions_log.id;


--
-- TOC entry 182 (class 1259 OID 20605)
-- Name: candidate; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE candidate (
    id integer NOT NULL,
    name text NOT NULL,
    email text,
    phone text,
    img_profile text,
    political_party_id integer NOT NULL,
    vice text
);


ALTER TABLE public.candidate OWNER TO root;

--
-- TOC entry 181 (class 1259 OID 20603)
-- Name: candidate_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE candidate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.candidate_id_seq OWNER TO root;

--
-- TOC entry 2290 (class 0 OID 0)
-- Dependencies: 181
-- Name: candidate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE candidate_id_seq OWNED BY candidate.id;


--
-- TOC entry 190 (class 1259 OID 20667)
-- Name: category; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE category (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.category OWNER TO root;

--
-- TOC entry 189 (class 1259 OID 20665)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO root;

--
-- TOC entry 2291 (class 0 OID 0)
-- Dependencies: 189
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE category_id_seq OWNED BY category.id;


--
-- TOC entry 216 (class 1259 OID 20920)
-- Name: cep_cache; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE cep_cache (
    id integer NOT NULL,
    address text NOT NULL,
    postal_code integer NOT NULL,
    neighborhood text,
    city_id integer NOT NULL,
    state_id integer NOT NULL,
    location text
);


ALTER TABLE public.cep_cache OWNER TO root;

--
-- TOC entry 215 (class 1259 OID 20918)
-- Name: cep_cache_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE cep_cache_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cep_cache_id_seq OWNER TO root;

--
-- TOC entry 2292 (class 0 OID 0)
-- Dependencies: 215
-- Name: cep_cache_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE cep_cache_id_seq OWNED BY cep_cache.id;


--
-- TOC entry 175 (class 1259 OID 20541)
-- Name: city; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE city (
    id integer NOT NULL,
    name text NOT NULL,
    state_id integer NOT NULL,
    name_url text,
    created_at timestamp without time zone,
    country_id integer
);


ALTER TABLE public.city OWNER TO root;

--
-- TOC entry 174 (class 1259 OID 20539)
-- Name: city_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_id_seq OWNER TO root;

--
-- TOC entry 2293 (class 0 OID 0)
-- Dependencies: 174
-- Name: city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE city_id_seq OWNED BY city.id;


--
-- TOC entry 184 (class 1259 OID 20622)
-- Name: coalition; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE coalition (
    id integer NOT NULL,
    name text,
    election_campaign_id integer,
    created_at timestamp without time zone DEFAULT now(),
    is_active boolean
);


ALTER TABLE public.coalition OWNER TO root;

--
-- TOC entry 183 (class 1259 OID 20620)
-- Name: coalition_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE coalition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coalition_id_seq OWNER TO root;

--
-- TOC entry 2294 (class 0 OID 0)
-- Dependencies: 183
-- Name: coalition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE coalition_id_seq OWNED BY coalition.id;


--
-- TOC entry 188 (class 1259 OID 20649)
-- Name: coalitions_political_parties; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE coalitions_political_parties (
    id integer NOT NULL,
    coalition_id integer NOT NULL,
    political_party_id integer NOT NULL
);


ALTER TABLE public.coalitions_political_parties OWNER TO root;

--
-- TOC entry 187 (class 1259 OID 20647)
-- Name: coalitions_political_parties_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE coalitions_political_parties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coalitions_political_parties_id_seq OWNER TO root;

--
-- TOC entry 2295 (class 0 OID 0)
-- Dependencies: 187
-- Name: coalitions_political_parties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE coalitions_political_parties_id_seq OWNED BY coalitions_political_parties.id;


--
-- TOC entry 171 (class 1259 OID 20514)
-- Name: country; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE country (
    id integer NOT NULL,
    name text NOT NULL,
    acronym text NOT NULL,
    name_url text
);


ALTER TABLE public.country OWNER TO root;

--
-- TOC entry 170 (class 1259 OID 20512)
-- Name: country_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_id_seq OWNER TO root;

--
-- TOC entry 2296 (class 0 OID 0)
-- Dependencies: 170
-- Name: country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE country_id_seq OWNED BY country.id;


--
-- TOC entry 192 (class 1259 OID 20678)
-- Name: election_campaign; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE election_campaign (
    id integer NOT NULL,
    year integer NOT NULL,
    state_id integer,
    city_id integer,
    country_id integer,
    political_position_id integer NOT NULL,
    elected_candidate_id integer,
    is_active boolean
);


ALTER TABLE public.election_campaign OWNER TO root;

--
-- TOC entry 194 (class 1259 OID 20711)
-- Name: election_campaign_candidates; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE election_campaign_candidates (
    id integer NOT NULL,
    election_campaign_id integer NOT NULL,
    candidate_id integer NOT NULL
);


ALTER TABLE public.election_campaign_candidates OWNER TO root;

--
-- TOC entry 193 (class 1259 OID 20709)
-- Name: election_campaign_candidates_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE election_campaign_candidates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.election_campaign_candidates_id_seq OWNER TO root;

--
-- TOC entry 2297 (class 0 OID 0)
-- Dependencies: 193
-- Name: election_campaign_candidates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE election_campaign_candidates_id_seq OWNED BY election_campaign_candidates.id;


--
-- TOC entry 191 (class 1259 OID 20676)
-- Name: election_campaign_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE election_campaign_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.election_campaign_id_seq OWNER TO root;

--
-- TOC entry 2298 (class 0 OID 0)
-- Dependencies: 191
-- Name: election_campaign_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE election_campaign_id_seq OWNED BY election_campaign.id;


--
-- TOC entry 202 (class 1259 OID 20792)
-- Name: electoral_regional_court; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE electoral_regional_court (
    id integer NOT NULL,
    state_id integer NOT NULL
);


ALTER TABLE public.electoral_regional_court OWNER TO root;

--
-- TOC entry 201 (class 1259 OID 20790)
-- Name: electoral_regional_court_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE electoral_regional_court_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.electoral_regional_court_id_seq OWNER TO root;

--
-- TOC entry 2299 (class 0 OID 0)
-- Dependencies: 201
-- Name: electoral_regional_court_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE electoral_regional_court_id_seq OWNED BY electoral_regional_court.id;


--
-- TOC entry 200 (class 1259 OID 20778)
-- Name: electoral_superior_court; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE electoral_superior_court (
    id integer NOT NULL,
    country_id integer NOT NULL
);


ALTER TABLE public.electoral_superior_court OWNER TO root;

--
-- TOC entry 199 (class 1259 OID 20776)
-- Name: electoral_superior_court_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE electoral_superior_court_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.electoral_superior_court_id_seq OWNER TO root;

--
-- TOC entry 2300 (class 0 OID 0)
-- Dependencies: 199
-- Name: electoral_superior_court_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE electoral_superior_court_id_seq OWNED BY electoral_superior_court.id;


--
-- TOC entry 204 (class 1259 OID 20805)
-- Name: federal_electoral_process; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE federal_electoral_process (
    id integer NOT NULL,
    content text NOT NULL,
    source text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    created_by integer NOT NULL,
    name text NOT NULL,
    electoral_superior_court_id integer NOT NULL
);


ALTER TABLE public.federal_electoral_process OWNER TO root;

--
-- TOC entry 203 (class 1259 OID 20803)
-- Name: federal_electoral_process_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE federal_electoral_process_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.federal_electoral_process_id_seq OWNER TO root;

--
-- TOC entry 2301 (class 0 OID 0)
-- Dependencies: 203
-- Name: federal_electoral_process_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE federal_electoral_process_id_seq OWNED BY federal_electoral_process.id;


--
-- TOC entry 177 (class 1259 OID 20557)
-- Name: organization; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE organization (
    id integer NOT NULL,
    name text NOT NULL,
    address text,
    postal_code text,
    city_id integer,
    description text,
    email text,
    website text,
    phone text,
    number text,
    complement text
);


ALTER TABLE public.organization OWNER TO root;

--
-- TOC entry 176 (class 1259 OID 20555)
-- Name: organization_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE organization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organization_id_seq OWNER TO root;

--
-- TOC entry 2302 (class 0 OID 0)
-- Dependencies: 176
-- Name: organization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE organization_id_seq OWNED BY organization.id;


--
-- TOC entry 222 (class 1259 OID 21633)
-- Name: political_party_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE political_party_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483648
    CACHE 1;


ALTER TABLE public.political_party_id_seq OWNER TO root;

--
-- TOC entry 180 (class 1259 OID 20594)
-- Name: political_party; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE political_party (
    id integer DEFAULT nextval('political_party_id_seq'::regclass) NOT NULL,
    name text NOT NULL,
    acronym text NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    party_number integer
);


ALTER TABLE public.political_party OWNER TO root;

--
-- TOC entry 186 (class 1259 OID 20633)
-- Name: political_position; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE political_position (
    id integer NOT NULL,
    "position" text NOT NULL
);


ALTER TABLE public.political_position OWNER TO root;

--
-- TOC entry 185 (class 1259 OID 20631)
-- Name: political_position_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE political_position_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.political_position_id_seq OWNER TO root;

--
-- TOC entry 2303 (class 0 OID 0)
-- Dependencies: 185
-- Name: political_position_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE political_position_id_seq OWNED BY political_position.id;


--
-- TOC entry 196 (class 1259 OID 20729)
-- Name: promise; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE promise (
    id integer NOT NULL,
    name text NOT NULL,
    description text,
    category_id integer NOT NULL,
    election_campaign_id integer,
    candidate_id integer NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    source text,
    city_id integer,
    state_id integer,
    country_id integer,
    publication_date date
);


ALTER TABLE public.promise OWNER TO root;

--
-- TOC entry 198 (class 1259 OID 20761)
-- Name: promise_content; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE promise_content (
    id integer NOT NULL,
    promise_id integer NOT NULL,
    name text,
    link text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    created_by integer NOT NULL,
    source text
);


ALTER TABLE public.promise_content OWNER TO root;

--
-- TOC entry 197 (class 1259 OID 20759)
-- Name: promise_content_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE promise_content_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promise_content_id_seq OWNER TO root;

--
-- TOC entry 2304 (class 0 OID 0)
-- Dependencies: 197
-- Name: promise_content_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE promise_content_id_seq OWNED BY promise_content.id;


--
-- TOC entry 195 (class 1259 OID 20727)
-- Name: promise_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE promise_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promise_id_seq OWNER TO root;

--
-- TOC entry 2305 (class 0 OID 0)
-- Dependencies: 195
-- Name: promise_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE promise_id_seq OWNED BY promise.id;


--
-- TOC entry 179 (class 1259 OID 20579)
-- Name: user; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE "user" (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    organization_id integer,
    is_active smallint DEFAULT 0,
    reset_password_key text
);


ALTER TABLE public."user" OWNER TO root;

--
-- TOC entry 178 (class 1259 OID 20577)
-- Name: promise_monitor_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE promise_monitor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promise_monitor_id_seq OWNER TO root;

--
-- TOC entry 2306 (class 0 OID 0)
-- Dependencies: 178
-- Name: promise_monitor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE promise_monitor_id_seq OWNED BY "user".id;


--
-- TOC entry 218 (class 1259 OID 20937)
-- Name: region; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE region (
    id integer NOT NULL,
    name text NOT NULL,
    city_id integer NOT NULL
);


ALTER TABLE public.region OWNER TO root;

--
-- TOC entry 217 (class 1259 OID 20935)
-- Name: region_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.region_id_seq OWNER TO root;

--
-- TOC entry 2307 (class 0 OID 0)
-- Dependencies: 217
-- Name: region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE region_id_seq OWNED BY region.id;


--
-- TOC entry 208 (class 1259 OID 20839)
-- Name: role; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE role (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.role OWNER TO root;

--
-- TOC entry 207 (class 1259 OID 20837)
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq OWNER TO root;

--
-- TOC entry 2308 (class 0 OID 0)
-- Dependencies: 207
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE role_id_seq OWNED BY role.id;


--
-- TOC entry 173 (class 1259 OID 20525)
-- Name: state; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE state (
    id integer NOT NULL,
    name text NOT NULL,
    uf text NOT NULL,
    country_id integer NOT NULL,
    created_at timestamp without time zone,
    created_by integer
);


ALTER TABLE public.state OWNER TO root;

--
-- TOC entry 206 (class 1259 OID 20822)
-- Name: state_electoral_process; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE state_electoral_process (
    id integer NOT NULL,
    content text NOT NULL,
    source text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    created_by integer NOT NULL,
    name text NOT NULL,
    electoral_regional_court_id integer NOT NULL
);


ALTER TABLE public.state_electoral_process OWNER TO root;

--
-- TOC entry 205 (class 1259 OID 20820)
-- Name: state_electoral_process_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE state_electoral_process_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.state_electoral_process_id_seq OWNER TO root;

--
-- TOC entry 2309 (class 0 OID 0)
-- Dependencies: 205
-- Name: state_electoral_process_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE state_electoral_process_id_seq OWNED BY state_electoral_process.id;


--
-- TOC entry 172 (class 1259 OID 20523)
-- Name: state_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE state_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.state_id_seq OWNER TO root;

--
-- TOC entry 2310 (class 0 OID 0)
-- Dependencies: 172
-- Name: state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE state_id_seq OWNED BY state.id;


--
-- TOC entry 210 (class 1259 OID 20850)
-- Name: user_role; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE user_role (
    role_id integer NOT NULL,
    user_id integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.user_role OWNER TO root;

--
-- TOC entry 209 (class 1259 OID 20848)
-- Name: user_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE user_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_roles_id_seq OWNER TO root;

--
-- TOC entry 2311 (class 0 OID 0)
-- Dependencies: 209
-- Name: user_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE user_roles_id_seq OWNED BY user_role.id;


--
-- TOC entry 212 (class 1259 OID 20881)
-- Name: user_session; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE user_session (
    id integer NOT NULL,
    user_id integer NOT NULL,
    api_key text,
    valid_for_ip text,
    valid_until timestamp without time zone DEFAULT (now() + '1 day'::interval) NOT NULL,
    ts_created timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.user_session OWNER TO root;

--
-- TOC entry 211 (class 1259 OID 20879)
-- Name: user_session_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE user_session_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_session_id_seq OWNER TO root;

--
-- TOC entry 2312 (class 0 OID 0)
-- Dependencies: 211
-- Name: user_session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE user_session_id_seq OWNED BY user_session.id;


--
-- TOC entry 221 (class 1259 OID 20966)
-- Name: user_token; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE user_token (
    id integer NOT NULL,
    user_id integer NOT NULL,
    token text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    used_at timestamp without time zone,
    admin_tracker_id integer NOT NULL,
    alert_sent_at timestamp without time zone
);


ALTER TABLE public.user_token OWNER TO root;

--
-- TOC entry 214 (class 1259 OID 20897)
-- Name: zone; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE zone (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.zone OWNER TO root;

--
-- TOC entry 213 (class 1259 OID 20895)
-- Name: zone_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE zone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zone_id_seq OWNER TO root;

--
-- TOC entry 2313 (class 0 OID 0)
-- Dependencies: 213
-- Name: zone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE zone_id_seq OWNED BY zone.id;


--
-- TOC entry 2070 (class 2604 OID 20954)
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY actions_log ALTER COLUMN id SET DEFAULT nextval('actions_log_id_seq'::regclass);


--
-- TOC entry 2044 (class 2604 OID 20608)
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY candidate ALTER COLUMN id SET DEFAULT nextval('candidate_id_seq'::regclass);


--
-- TOC entry 2049 (class 2604 OID 20670)
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY category ALTER COLUMN id SET DEFAULT nextval('category_id_seq'::regclass);


--
-- TOC entry 2068 (class 2604 OID 20923)
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY cep_cache ALTER COLUMN id SET DEFAULT nextval('cep_cache_id_seq'::regclass);


--
-- TOC entry 2038 (class 2604 OID 20544)
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY city ALTER COLUMN id SET DEFAULT nextval('city_id_seq'::regclass);


--
-- TOC entry 2045 (class 2604 OID 20625)
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY coalition ALTER COLUMN id SET DEFAULT nextval('coalition_id_seq'::regclass);


--
-- TOC entry 2048 (class 2604 OID 20652)
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY coalitions_political_parties ALTER COLUMN id SET DEFAULT nextval('coalitions_political_parties_id_seq'::regclass);


--
-- TOC entry 2036 (class 2604 OID 20517)
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY country ALTER COLUMN id SET DEFAULT nextval('country_id_seq'::regclass);


--
-- TOC entry 2050 (class 2604 OID 20681)
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY election_campaign ALTER COLUMN id SET DEFAULT nextval('election_campaign_id_seq'::regclass);


--
-- TOC entry 2051 (class 2604 OID 20714)
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY election_campaign_candidates ALTER COLUMN id SET DEFAULT nextval('election_campaign_candidates_id_seq'::regclass);


--
-- TOC entry 2057 (class 2604 OID 20795)
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY electoral_regional_court ALTER COLUMN id SET DEFAULT nextval('electoral_regional_court_id_seq'::regclass);


--
-- TOC entry 2056 (class 2604 OID 20781)
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY electoral_superior_court ALTER COLUMN id SET DEFAULT nextval('electoral_superior_court_id_seq'::regclass);


--
-- TOC entry 2058 (class 2604 OID 20808)
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY federal_electoral_process ALTER COLUMN id SET DEFAULT nextval('federal_electoral_process_id_seq'::regclass);


--
-- TOC entry 2039 (class 2604 OID 20560)
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY organization ALTER COLUMN id SET DEFAULT nextval('organization_id_seq'::regclass);


--
-- TOC entry 2047 (class 2604 OID 20636)
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY political_position ALTER COLUMN id SET DEFAULT nextval('political_position_id_seq'::regclass);


--
-- TOC entry 2052 (class 2604 OID 20732)
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY promise ALTER COLUMN id SET DEFAULT nextval('promise_id_seq'::regclass);


--
-- TOC entry 2054 (class 2604 OID 20764)
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY promise_content ALTER COLUMN id SET DEFAULT nextval('promise_content_id_seq'::regclass);


--
-- TOC entry 2069 (class 2604 OID 20940)
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY region ALTER COLUMN id SET DEFAULT nextval('region_id_seq'::regclass);


--
-- TOC entry 2062 (class 2604 OID 20842)
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY role ALTER COLUMN id SET DEFAULT nextval('role_id_seq'::regclass);


--
-- TOC entry 2037 (class 2604 OID 20528)
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY state ALTER COLUMN id SET DEFAULT nextval('state_id_seq'::regclass);


--
-- TOC entry 2060 (class 2604 OID 20825)
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY state_electoral_process ALTER COLUMN id SET DEFAULT nextval('state_electoral_process_id_seq'::regclass);


--
-- TOC entry 2040 (class 2604 OID 20582)
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('promise_monitor_id_seq'::regclass);


--
-- TOC entry 2063 (class 2604 OID 20853)
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY user_role ALTER COLUMN id SET DEFAULT nextval('user_roles_id_seq'::regclass);


--
-- TOC entry 2064 (class 2604 OID 20884)
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY user_session ALTER COLUMN id SET DEFAULT nextval('user_session_id_seq'::regclass);


--
-- TOC entry 2067 (class 2604 OID 20900)
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY zone ALTER COLUMN id SET DEFAULT nextval('zone_id_seq'::regclass);


--
-- TOC entry 2131 (class 2606 OID 20960)
-- Name: actions_log_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY actions_log
    ADD CONSTRAINT actions_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2086 (class 2606 OID 20613)
-- Name: candidate_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY candidate
    ADD CONSTRAINT candidate_pkey PRIMARY KEY (id);


--
-- TOC entry 2094 (class 2606 OID 20675)
-- Name: category_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 2125 (class 2606 OID 20928)
-- Name: cep_cache_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY cep_cache
    ADD CONSTRAINT cep_cache_pkey PRIMARY KEY (id);


--
-- TOC entry 2078 (class 2606 OID 20549)
-- Name: city_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);


--
-- TOC entry 2088 (class 2606 OID 20630)
-- Name: coalition_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY coalition
    ADD CONSTRAINT coalition_pkey PRIMARY KEY (id);


--
-- TOC entry 2092 (class 2606 OID 20654)
-- Name: coalitions_political_parties_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY coalitions_political_parties
    ADD CONSTRAINT coalitions_political_parties_pkey PRIMARY KEY (id);


--
-- TOC entry 2074 (class 2606 OID 20519)
-- Name: country_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- TOC entry 2098 (class 2606 OID 20716)
-- Name: election_campaign_candidates_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY election_campaign_candidates
    ADD CONSTRAINT election_campaign_candidates_pkey PRIMARY KEY (id);


--
-- TOC entry 2096 (class 2606 OID 20683)
-- Name: election_campaign_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY election_campaign
    ADD CONSTRAINT election_campaign_pkey PRIMARY KEY (id);


--
-- TOC entry 2106 (class 2606 OID 20797)
-- Name: electoral_regional_court_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY electoral_regional_court
    ADD CONSTRAINT electoral_regional_court_pkey PRIMARY KEY (id);


--
-- TOC entry 2104 (class 2606 OID 20784)
-- Name: electoral_superior_court_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY electoral_superior_court
    ADD CONSTRAINT electoral_superior_court_pkey PRIMARY KEY (id);


--
-- TOC entry 2108 (class 2606 OID 21379)
-- Name: federal_electoral_process_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY federal_electoral_process
    ADD CONSTRAINT federal_electoral_process_pkey PRIMARY KEY (id);


--
-- TOC entry 2080 (class 2606 OID 20565)
-- Name: organization_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY organization
    ADD CONSTRAINT organization_pkey PRIMARY KEY (id);


--
-- TOC entry 2084 (class 2606 OID 20602)
-- Name: political_party_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY political_party
    ADD CONSTRAINT political_party_pkey PRIMARY KEY (id);


--
-- TOC entry 2090 (class 2606 OID 20641)
-- Name: political_position_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY political_position
    ADD CONSTRAINT political_position_pkey PRIMARY KEY (id);


--
-- TOC entry 2102 (class 2606 OID 20770)
-- Name: promise_content_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY promise_content
    ADD CONSTRAINT promise_content_pkey PRIMARY KEY (id);


--
-- TOC entry 2100 (class 2606 OID 20738)
-- Name: promise_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY promise
    ADD CONSTRAINT promise_pkey PRIMARY KEY (id);


--
-- TOC entry 2128 (class 2606 OID 20945)
-- Name: region_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY region
    ADD CONSTRAINT region_pkey PRIMARY KEY (id);


--
-- TOC entry 2112 (class 2606 OID 20847)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2110 (class 2606 OID 21401)
-- Name: state_electoral_process_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY state_electoral_process
    ADD CONSTRAINT state_electoral_process_pkey PRIMARY KEY (id);


--
-- TOC entry 2076 (class 2606 OID 20533)
-- Name: state_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY state
    ADD CONSTRAINT state_pkey PRIMARY KEY (id);


--
-- TOC entry 2082 (class 2606 OID 20588)
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 2114 (class 2606 OID 21428)
-- Name: user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (id);


--
-- TOC entry 2116 (class 2606 OID 20893)
-- Name: user_session_api_key_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY user_session
    ADD CONSTRAINT user_session_api_key_key UNIQUE (api_key);


--
-- TOC entry 2119 (class 2606 OID 20891)
-- Name: user_session_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY user_session
    ADD CONSTRAINT user_session_pkey PRIMARY KEY (id);


--
-- TOC entry 2135 (class 2606 OID 20974)
-- Name: user_token_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY user_token
    ADD CONSTRAINT user_token_pkey PRIMARY KEY (id);


--
-- TOC entry 2121 (class 2606 OID 20905)
-- Name: zone_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY zone
    ADD CONSTRAINT zone_pkey PRIMARY KEY (id);


--
-- TOC entry 2129 (class 1259 OID 20961)
-- Name: actions_log_idx_user_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX actions_log_idx_user_id ON actions_log USING btree (user_id);


--
-- TOC entry 2122 (class 1259 OID 20929)
-- Name: cep_cache_idx_city_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX cep_cache_idx_city_id ON cep_cache USING btree (city_id);


--
-- TOC entry 2123 (class 1259 OID 20930)
-- Name: cep_cache_idx_state_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX cep_cache_idx_state_id ON cep_cache USING btree (state_id);


--
-- TOC entry 2126 (class 1259 OID 20946)
-- Name: region_idx_city_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX region_idx_city_id ON region USING btree (city_id);


--
-- TOC entry 2117 (class 1259 OID 20894)
-- Name: user_session_idx_user_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX user_session_idx_user_id ON user_session USING btree (user_id);


--
-- TOC entry 2132 (class 1259 OID 20975)
-- Name: user_token_idx_admin_tracker_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX user_token_idx_admin_tracker_id ON user_token USING btree (admin_tracker_id);


--
-- TOC entry 2133 (class 1259 OID 20976)
-- Name: user_token_idx_user_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX user_token_idx_user_id ON user_token USING btree (user_id);


--
-- TOC entry 2171 (class 2606 OID 21057)
-- Name: actions_log_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY actions_log
    ADD CONSTRAINT actions_log_fk_user_id FOREIGN KEY (user_id) REFERENCES "user"(id);


--
-- TOC entry 2140 (class 2606 OID 21308)
-- Name: candidate_political_party_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY candidate
    ADD CONSTRAINT candidate_political_party_id_fkey FOREIGN KEY (political_party_id) REFERENCES political_party(id);


--
-- TOC entry 2168 (class 2606 OID 21022)
-- Name: cep_cache_fk_city_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY cep_cache
    ADD CONSTRAINT cep_cache_fk_city_id FOREIGN KEY (city_id) REFERENCES city(id);


--
-- TOC entry 2169 (class 2606 OID 21027)
-- Name: cep_cache_fk_state_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY cep_cache
    ADD CONSTRAINT cep_cache_fk_state_id FOREIGN KEY (state_id) REFERENCES state(id);


--
-- TOC entry 2137 (class 2606 OID 21412)
-- Name: city_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY city
    ADD CONSTRAINT city_state_id_fkey FOREIGN KEY (state_id) REFERENCES state(id);


--
-- TOC entry 2141 (class 2606 OID 21636)
-- Name: coalition_election_campaign_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY coalition
    ADD CONSTRAINT coalition_election_campaign_id_fkey FOREIGN KEY (election_campaign_id) REFERENCES election_campaign(id);


--
-- TOC entry 2142 (class 2606 OID 21323)
-- Name: coalitions_political_parties_coalition_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY coalitions_political_parties
    ADD CONSTRAINT coalitions_political_parties_coalition_id_fkey FOREIGN KEY (coalition_id) REFERENCES coalition(id);


--
-- TOC entry 2143 (class 2606 OID 21328)
-- Name: coalitions_political_parties_political_party_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY coalitions_political_parties
    ADD CONSTRAINT coalitions_political_parties_political_party_id_fkey FOREIGN KEY (political_party_id) REFERENCES political_party(id);


--
-- TOC entry 2150 (class 2606 OID 21363)
-- Name: election_campaign_candidates_candidate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY election_campaign_candidates
    ADD CONSTRAINT election_campaign_candidates_candidate_id_fkey FOREIGN KEY (candidate_id) REFERENCES candidate(id);


--
-- TOC entry 2149 (class 2606 OID 21358)
-- Name: election_campaign_candidates_election_campaign_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY election_campaign_candidates
    ADD CONSTRAINT election_campaign_candidates_election_campaign_id_fkey FOREIGN KEY (election_campaign_id) REFERENCES election_campaign(id);


--
-- TOC entry 2145 (class 2606 OID 21338)
-- Name: election_campaign_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY election_campaign
    ADD CONSTRAINT election_campaign_city_id_fkey FOREIGN KEY (city_id) REFERENCES city(id);


--
-- TOC entry 2146 (class 2606 OID 21343)
-- Name: election_campaign_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY election_campaign
    ADD CONSTRAINT election_campaign_country_id_fkey FOREIGN KEY (country_id) REFERENCES country(id);


--
-- TOC entry 2148 (class 2606 OID 21353)
-- Name: election_campaign_elected_candidate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY election_campaign
    ADD CONSTRAINT election_campaign_elected_candidate_id_fkey FOREIGN KEY (elected_candidate_id) REFERENCES candidate(id);


--
-- TOC entry 2147 (class 2606 OID 21348)
-- Name: election_campaign_political_position_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY election_campaign
    ADD CONSTRAINT election_campaign_political_position_id_fkey FOREIGN KEY (political_position_id) REFERENCES political_position(id);


--
-- TOC entry 2144 (class 2606 OID 21333)
-- Name: election_campaign_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY election_campaign
    ADD CONSTRAINT election_campaign_state_id_fkey FOREIGN KEY (state_id) REFERENCES state(id);


--
-- TOC entry 2160 (class 2606 OID 21368)
-- Name: electoral_regional_court_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY electoral_regional_court
    ADD CONSTRAINT electoral_regional_court_state_id_fkey FOREIGN KEY (state_id) REFERENCES state(id);


--
-- TOC entry 2159 (class 2606 OID 21373)
-- Name: electoral_superior_court_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY electoral_superior_court
    ADD CONSTRAINT electoral_superior_court_country_id_fkey FOREIGN KEY (country_id) REFERENCES country(id);


--
-- TOC entry 2161 (class 2606 OID 21380)
-- Name: federal_electoral_process_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY federal_electoral_process
    ADD CONSTRAINT federal_electoral_process_created_by_fkey FOREIGN KEY (created_by) REFERENCES "user"(id);


--
-- TOC entry 2162 (class 2606 OID 21657)
-- Name: federal_electoral_process_electoral_superior_court_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY federal_electoral_process
    ADD CONSTRAINT federal_electoral_process_electoral_superior_court_id_fkey FOREIGN KEY (electoral_superior_court_id) REFERENCES electoral_superior_court(id);


--
-- TOC entry 2138 (class 2606 OID 21385)
-- Name: organization_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY organization
    ADD CONSTRAINT organization_city_id_fkey FOREIGN KEY (city_id) REFERENCES city(id);


--
-- TOC entry 2153 (class 2606 OID 20749)
-- Name: promise_candidate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY promise
    ADD CONSTRAINT promise_candidate_id_fkey FOREIGN KEY (candidate_id) REFERENCES candidate(id);


--
-- TOC entry 2151 (class 2606 OID 20739)
-- Name: promise_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY promise
    ADD CONSTRAINT promise_category_id_fkey FOREIGN KEY (category_id) REFERENCES category(id);


--
-- TOC entry 2154 (class 2606 OID 21641)
-- Name: promise_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY promise
    ADD CONSTRAINT promise_city_id_fkey FOREIGN KEY (city_id) REFERENCES city(id);


--
-- TOC entry 2158 (class 2606 OID 21395)
-- Name: promise_content_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY promise_content
    ADD CONSTRAINT promise_content_created_by_fkey FOREIGN KEY (created_by) REFERENCES "user"(id);


--
-- TOC entry 2157 (class 2606 OID 21390)
-- Name: promise_content_promise_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY promise_content
    ADD CONSTRAINT promise_content_promise_id_fkey FOREIGN KEY (promise_id) REFERENCES promise(id);


--
-- TOC entry 2156 (class 2606 OID 21651)
-- Name: promise_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY promise
    ADD CONSTRAINT promise_country_id_fkey FOREIGN KEY (country_id) REFERENCES country(id);


--
-- TOC entry 2152 (class 2606 OID 20744)
-- Name: promise_election_campaign_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY promise
    ADD CONSTRAINT promise_election_campaign_id_fkey FOREIGN KEY (election_campaign_id) REFERENCES election_campaign(id);


--
-- TOC entry 2155 (class 2606 OID 21646)
-- Name: promise_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY promise
    ADD CONSTRAINT promise_state_id_fkey FOREIGN KEY (state_id) REFERENCES state(id);


--
-- TOC entry 2170 (class 2606 OID 21047)
-- Name: region_fk_city_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY region
    ADD CONSTRAINT region_fk_city_id FOREIGN KEY (city_id) REFERENCES city(id);


--
-- TOC entry 2136 (class 2606 OID 21407)
-- Name: state_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY state
    ADD CONSTRAINT state_country_id_fkey FOREIGN KEY (country_id) REFERENCES country(id);


--
-- TOC entry 2163 (class 2606 OID 21402)
-- Name: state_electoral_process_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY state_electoral_process
    ADD CONSTRAINT state_electoral_process_created_by_fkey FOREIGN KEY (created_by) REFERENCES "user"(id);


--
-- TOC entry 2164 (class 2606 OID 21662)
-- Name: state_electoral_process_electoral_regional_court_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY state_electoral_process
    ADD CONSTRAINT state_electoral_process_electoral_regional_court_id_fkey FOREIGN KEY (electoral_regional_court_id) REFERENCES electoral_regional_court(id);


--
-- TOC entry 2139 (class 2606 OID 21318)
-- Name: user_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES organization(id);


--
-- TOC entry 2166 (class 2606 OID 21434)
-- Name: user_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY user_role
    ADD CONSTRAINT user_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2165 (class 2606 OID 21429)
-- Name: user_role_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY user_role
    ADD CONSTRAINT user_role_user_id_fkey FOREIGN KEY (user_id) REFERENCES "user"(id);


--
-- TOC entry 2167 (class 2606 OID 20987)
-- Name: user_session_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY user_session
    ADD CONSTRAINT user_session_fk_user_id FOREIGN KEY (user_id) REFERENCES "user"(id) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;


--
-- TOC entry 2172 (class 2606 OID 21072)
-- Name: user_token_fk_admin_tracker_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY user_token
    ADD CONSTRAINT user_token_fk_admin_tracker_id FOREIGN KEY (admin_tracker_id) REFERENCES "user"(id);


--
-- TOC entry 2173 (class 2606 OID 21077)
-- Name: user_token_fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY user_token
    ADD CONSTRAINT user_token_fk_user_id FOREIGN KEY (user_id) REFERENCES "user"(id);


--
-- TOC entry 2287 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2014-07-16 11:46:13 BRT

--
-- PostgreSQL database dump complete
--

