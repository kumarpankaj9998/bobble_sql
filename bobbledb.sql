--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: aboutstore; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aboutstore (
    id integer NOT NULL,
    heading character varying(50),
    body character varying(1000),
    vision character varying(500),
    mission character varying(500),
    store_id integer NOT NULL
);


ALTER TABLE public.aboutstore OWNER TO postgres;

--
-- Name: aboutstore_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aboutstore_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aboutstore_id_seq OWNER TO postgres;

--
-- Name: aboutstore_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aboutstore_id_seq OWNED BY public.aboutstore.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    store_id integer NOT NULL,
    type character varying(30) NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: collections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collections (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    description character varying(255),
    type character varying(30) NOT NULL,
    category_id integer NOT NULL,
    network_id integer NOT NULL,
    user_id integer NOT NULL,
    store_id integer NOT NULL,
    image_url character varying(455),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.collections OWNER TO postgres;

--
-- Name: collections_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.collections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collections_id_seq OWNER TO postgres;

--
-- Name: collections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.collections_id_seq OWNED BY public.collections.id;


--
-- Name: contactstore; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contactstore (
    id integer NOT NULL,
    phone_number character varying(15),
    office_address character varying(255),
    email character varying(255),
    store_id integer NOT NULL
);


ALTER TABLE public.contactstore OWNER TO postgres;

--
-- Name: contactstore_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contactstore_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contactstore_id_seq OWNER TO postgres;

--
-- Name: contactstore_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contactstore_id_seq OWNED BY public.contactstore.id;


--
-- Name: event_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_logs (
    id integer NOT NULL,
    name character varying(60),
    value character varying(500),
    user_id integer,
    created_at timestamp with time zone
);


ALTER TABLE public.event_logs OWNER TO postgres;

--
-- Name: event_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_logs_id_seq OWNER TO postgres;

--
-- Name: event_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_logs_id_seq OWNED BY public.event_logs.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    run_on timestamp without time zone NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: networks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.networks (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.networks OWNER TO postgres;

--
-- Name: networks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.networks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.networks_id_seq OWNER TO postgres;

--
-- Name: networks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.networks_id_seq OWNED BY public.networks.id;


--
-- Name: nfts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nfts (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    image_url character varying(455) NOT NULL,
    description character varying(255) NOT NULL,
    external_link character varying(255),
    category_id integer NOT NULL,
    price integer NOT NULL,
    user_id integer NOT NULL,
    collection_id integer NOT NULL,
    store_id integer NOT NULL,
    nft_id character varying(255) DEFAULT public.uuid_generate_v4(),
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    issold boolean
);


ALTER TABLE public.nfts OWNER TO postgres;

--
-- Name: nfts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nfts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nfts_id_seq OWNER TO postgres;

--
-- Name: nfts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nfts_id_seq OWNED BY public.nfts.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    type character varying(30) NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: store_community; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_community (
    store_id integer NOT NULL,
    community_title character varying(60),
    community_content character varying(255),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.store_community OWNER TO postgres;

--
-- Name: store_privacy_policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_privacy_policy (
    store_id integer NOT NULL,
    privacy_title character varying(60),
    privacy_content character varying(255),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.store_privacy_policy OWNER TO postgres;

--
-- Name: store_refund_policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_refund_policy (
    store_id integer NOT NULL,
    refund_title character varying(60),
    refund_content character varying(255),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.store_refund_policy OWNER TO postgres;

--
-- Name: store_risk_policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_risk_policy (
    store_id integer NOT NULL,
    risk_title character varying(60),
    risk_content character varying(255),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.store_risk_policy OWNER TO postgres;

--
-- Name: store_seo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_seo (
    store_id integer NOT NULL,
    meta_tags character varying(255),
    meta_title character varying(60),
    meta_description character varying(160),
    meta_keyword character varying(60),
    favicon character varying(455),
    featured_image_url character varying(455),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.store_seo OWNER TO postgres;

--
-- Name: store_social_media_urls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_social_media_urls (
    store_id integer NOT NULL,
    facebook_link character varying(455),
    linkedin_link character varying(455),
    instagram_link character varying(455),
    twitter_link character varying(455),
    discord_link character varying(455),
    portfolio_link character varying(455),
    telegram_link character varying(455),
    youtube_link character varying(455),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.store_social_media_urls OWNER TO postgres;

--
-- Name: store_terms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_terms (
    store_id integer NOT NULL,
    terms_title character varying(60),
    terms_content character varying(255),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.store_terms OWNER TO postgres;

--
-- Name: stores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stores (
    id integer NOT NULL,
    user_id integer NOT NULL,
    name character varying(30) NOT NULL,
    email character varying(255) NOT NULL,
    country_code character varying(2),
    industry character varying(30),
    logo_url character varying(455),
    nav_logo_url character varying(455),
    primary_sales_fees integer,
    secondary_sales_fees integer,
    store_wallet character varying(255),
    header character varying(100),
    header_description character varying(255),
    button_title character varying(50),
    button_link character varying(255),
    hero_image character varying(255),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.stores OWNER TO postgres;

--
-- Name: stores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stores_id_seq OWNER TO postgres;

--
-- Name: stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stores_id_seq OWNED BY public.stores.id;


--
-- Name: team; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.team (
    id integer NOT NULL,
    store_id integer NOT NULL,
    user_id integer NOT NULL,
    role_id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.team OWNER TO postgres;

--
-- Name: team_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_id_seq OWNER TO postgres;

--
-- Name: team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.team_id_seq OWNED BY public.team.id;


--
-- Name: transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transactions (
    id integer NOT NULL,
    sender_id character varying(50) NOT NULL,
    receiver_id character varying(50) NOT NULL,
    price integer NOT NULL,
    nft_id integer NOT NULL,
    token_id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    store_id integer NOT NULL
);


ALTER TABLE public.transactions OWNER TO postgres;

--
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transactions_id_seq OWNER TO postgres;

--
-- Name: transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transactions_id_seq OWNED BY public.transactions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(20) NOT NULL,
    full_name character varying(60) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    phone_number character varying(15) NOT NULL,
    country character varying(30),
    biography character varying(255),
    avatar_url character varying(255),
    wallet_address character varying(255),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: aboutstore id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aboutstore ALTER COLUMN id SET DEFAULT nextval('public.aboutstore_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: collections id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collections ALTER COLUMN id SET DEFAULT nextval('public.collections_id_seq'::regclass);


--
-- Name: contactstore id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contactstore ALTER COLUMN id SET DEFAULT nextval('public.contactstore_id_seq'::regclass);


--
-- Name: event_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_logs ALTER COLUMN id SET DEFAULT nextval('public.event_logs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: networks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.networks ALTER COLUMN id SET DEFAULT nextval('public.networks_id_seq'::regclass);


--
-- Name: nfts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nfts ALTER COLUMN id SET DEFAULT nextval('public.nfts_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: stores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores ALTER COLUMN id SET DEFAULT nextval('public.stores_id_seq'::regclass);


--
-- Name: team id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team ALTER COLUMN id SET DEFAULT nextval('public.team_id_seq'::regclass);


--
-- Name: transactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions ALTER COLUMN id SET DEFAULT nextval('public.transactions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: aboutstore; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aboutstore (id, heading, body, vision, mission, store_id) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, store_id, type, created_at, updated_at) FROM stdin;
1	2	category1	2022-06-22 14:53:01.309+05:30	\N
2	2	category2	2022-06-23 15:50:32.233+05:30	\N
\.


--
-- Data for Name: collections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.collections (id, name, description, type, category_id, network_id, user_id, store_id, image_url, created_at, updated_at) FROM stdin;
2	my_art1	my art collection	NFT	1	4	26	2	https://test.com	2022-07-02 22:56:37.124+05:30	\N
3	my_art3	my art collection	NFT	1	4	26	2	https://test.com	2022-07-06 16:21:33.484+05:30	\N
\.


--
-- Data for Name: contactstore; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contactstore (id, phone_number, office_address, email, store_id) FROM stdin;
2	918851319469	ijijij	test@test.com	2
\.


--
-- Data for Name: event_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_logs (id, name, value, user_id, created_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, name, run_on) FROM stdin;
1	/20220616100441-uuid	2022-06-16 17:12:19.271
2	/20220616100522-users	2022-06-16 17:12:19.313
12	/20220616111046-team	2022-06-16 17:12:19.511
13	/20220616111205-networks	2022-06-16 17:12:19.522
17	/20220616113912-index-store-name	2022-06-16 17:12:19.573
18	/20220616113920-index-nft-id	2022-06-16 17:12:19.581
19	/20220616113927-index-nft-title	2022-06-16 17:12:19.59
20	/20220616113938-index-collection-name	2022-06-16 17:12:19.597
28	/20220616115412-event-logs	2022-06-21 18:00:26.58
29	/20220616100854-stores	2022-06-22 12:45:17.521
30	/20220616101635-store-seo	2022-06-22 12:45:17.539
31	/20220616102607-store-social-media-urls	2022-06-22 12:45:17.555
32	/20220616102728-store-privacy-policy	2022-06-22 12:45:17.568
33	/20220616103420-store-terms	2022-06-22 12:45:17.578
34	/20220616103459-store-community	2022-06-22 12:45:17.592
35	/20220616103740-store-risk-policy	2022-06-22 12:45:17.607
36	/20220616104756-store-refund-policy	2022-06-22 12:45:17.62
37	/20220616111311-categories	2022-06-22 14:52:14.806
40	/20220702162809-networkdata	2022-07-02 22:10:01.986
41	/20220616111003-roles	2022-07-02 22:15:25.044
42	/20220702164105-rolesdataadmin	2022-07-02 22:15:25.066
43	/20220616111734-collections	2022-07-02 22:50:59.638
44	/20220616112058-nfts	2022-07-02 22:50:59.664
45	/20220702170246-networkEthereum	2022-07-02 22:50:59.687
46	/20220705184038-contact-us	2022-07-06 01:40:40.706
47	/20220705184652-about-us	2022-07-06 01:40:40.727
48	/20220623075353-transactions	2022-07-06 16:50:50.426
\.


--
-- Data for Name: networks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.networks (id, name, created_at, updated_at) FROM stdin;
4	ethereum	2022-07-02 22:50:59.667101+05:30	\N
\.


--
-- Data for Name: nfts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nfts (id, title, image_url, description, external_link, category_id, price, user_id, collection_id, store_id, nft_id, created_at, updated_at, issold) FROM stdin;
12	frko	1171e71f-0f10-4eed-8416-308448c67c44.png	this is my nft	fghjht6789yv	1	1	26	2	2	404bd810-e0bb-407e-b0b3-446459e02c60	\N	\N	f
13	plpll	1171e71f-0f10-4eed-8416-308448c67c44.png	this is my nft	fghjht6789yv	1	1	26	2	2	eb951100-31bb-4488-ad27-d7cc988b0a0d	\N	\N	f
14	kkkk	1171e71f-0f10-4eed-8416-308448c67c44.png	this is my nft	fghjht6789yv	1	1	26	2	2	d9a87cd7-9323-4021-9418-dbd1d2820271	\N	\N	f
15	llll	1171e71f-0f10-4eed-8416-308448c67c44.png	this is my nft	fghjht6789yv	1	1	4	2	2	46d369b9-a861-4f74-8bbe-94abf0ebf555	\N	2022-07-04 17:42:36.208+05:30	f
16	mmm	1171e71f-0f10-4eed-8416-308448c67c44.png	this is my nft	fghjht6789yv	1	1	26	2	2	e527e59e-86f7-45cf-acff-a229d478025e	\N	\N	f
17	ccc	1171e71f-0f10-4eed-8416-308448c67c44.png\n	this is my nft	fghjht6789yv	1	1	26	2	2	d1383939-6860-4be3-aa23-7315461dfcc5	\N	\N	f
1	ggg	1171e71f-0f10-4eed-8416-308448c67c44.png	this is my nft	fghjht6789yv	1	1	26	2	2	89ef623d-757d-400e-b7d0-8ca0b7c32e5a	\N	\N	f
3	bb	1171e71f-0f10-4eed-8416-308448c67c44.png	this is my nft	fghjht6789yv	1	1	26	2	2	ef51538e-c296-483e-9067-4484b7f23677	\N	\N	f
2	aa	1171e71f-0f10-4eed-8416-308448c67c44.png	this is my nft	fghjht6789yv	1	1	4	2	2	357ad4e9-430f-4044-92b9-2bbcf378bb4c	\N	2022-07-03 01:59:55.637+05:30	f
5	Final Test	1171e71f-0f10-4eed-8416-308448c67c44.png	this is my nft	fghjht6789yv	1	1	26	2	2	01c5eb33-64d7-4f39-a373-2d5a3ec30fbe	\N	\N	f
6	Final Test	1171e71f-0f10-4eed-8416-308448c67c44.png	this is my nft	fghjht6789yv	1	1	26	2	2	9ab1889a-a775-440e-b448-64ae463758ef	\N	\N	f
4	Final Test	1171e71f-0f10-4eed-8416-308448c67c44.png	this is my nft	fghjht6789yv	1	1	4	2	2	2713c47a-6bc8-42de-814d-a1295ce03090	\N	2022-07-03 20:00:35.2+05:30	f
7	Final Test	1171e71f-0f10-4eed-8416-308448c67c44.png	this is my nft	fghjht6789yv	1	1	4	2	2	188b3383-74b5-426d-b386-a3ecf304d4cb	\N	2022-07-03 20:02:33.499+05:30	f
8	Final Test	1171e71f-0f10-4eed-8416-308448c67c44.png	this is my nft	fghjht6789yv	1	1	26	2	2	5d9454cb-8108-4731-a0df-e02b282797d2	\N	\N	f
9	aaaaaaaa	1171e71f-0f10-4eed-8416-308448c67c44.png	this is my nft	fghjht6789yv	1	1	26	2	2	24b04c8b-9cfc-4917-8593-5a91f9db839a	\N	\N	f
18	fff	1171e71f-0f10-4eed-8416-308448c67c44.png	this is my nft	fghjht6789yv	1	1	4	2	2	b481929f-5c18-45fa-8a95-023e59b2e5bd	\N	2022-07-05 00:46:05.207+05:30	f
10	testst	1171e71f-0f10-4eed-8416-308448c67c44.png	this is my nft	fghjht6789yv	1	1	26	2	2	8287c82a-fe96-4aa2-9452-9159acc81ab6	\N	\N	f
11	aaaadadawdw	1171e71f-0f10-4eed-8416-308448c67c44.png	this is my nft	fghjht6789yv	1	1	4	2	2	5314403a-9740-438c-827b-2d8aa8600d64	\N	2022-07-03 22:45:41.974+05:30	f
21	test	1171e71f-0f10-4eed-8416-308448c67c44.png	test	http://ffff.com	1	1	26	2	2	5746a8c9-036a-47db-b7b9-25536f7c0a29	\N	\N	f
20	FFFFFF	45849d03-9eee-4d78-81d0-4dc54096ecff.jpg	FFFFFF	http://ffff.com	1	1	4	2	2	fea80d6f-1717-40b6-a253-9a6eeaaf3cbe	\N	\N	f
19	dededefr	9439d82f-1946-4a6d-99df-cc46959fefbc.png	this is my nft	fghjht6789yv	1	1	26	2	2	83b275f4-1168-43a5-96c9-be150888455e	\N	2022-09-13 02:57:18.521+05:30	t
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, type, created_at, updated_at) FROM stdin;
1	admin	2022-07-02 22:15:25.055434+05:30	\N
\.


--
-- Data for Name: store_community; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_community (store_id, community_title, community_content, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: store_privacy_policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_privacy_policy (store_id, privacy_title, privacy_content, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: store_refund_policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_refund_policy (store_id, refund_title, refund_content, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: store_risk_policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_risk_policy (store_id, risk_title, risk_content, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: store_seo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_seo (store_id, meta_tags, meta_title, meta_description, meta_keyword, favicon, featured_image_url, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: store_social_media_urls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_social_media_urls (store_id, facebook_link, linkedin_link, instagram_link, twitter_link, discord_link, portfolio_link, telegram_link, youtube_link, created_at, updated_at) FROM stdin;
2									2022-07-04 15:15:34.326+05:30	\N
\.


--
-- Data for Name: store_terms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_terms (store_id, terms_title, terms_content, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stores (id, user_id, name, email, country_code, industry, logo_url, nav_logo_url, primary_sales_fees, secondary_sales_fees, store_wallet, header, header_description, button_title, button_link, hero_image, created_at, updated_at) FROM stdin;
2	26	nftmarketplace	myy@gmail.com	AS	test1	\N	https://www.bobble.ai/logo-final.png	20	20	\N	Header from backend	\N	title from backend	https://datafrombackend.com	https://nft-digital-art.com/wp-content/uploads/2021/04/nft-digital-art.com-what-are-nfts-scaled-e1618106347325-2048x1152.jpeg	2022-06-22 13:27:10.197+05:30	2022-06-24 15:45:04.436+05:30
38	33	rty	aryan040501@gmail.com	AU	Sports	http://localhost:9000/e74af896-7fb4-42d1-89c2-303e3f983410.jpeg	http://google.com	10	10	test	Test123	Test123	Test	http://test.com	C:\\fakepath\\Cancelled Cheque.jpeg	2022-07-04 18:57:10.796+05:30	\N
37	26	localhost	myy@gmail.com	AS	test1	\N	https://www.bobble.ai/logo-final.png	20	20	\N	Header from backend	\N	title from backend	https://datafrombackend.com	https://nft-digital-art.com/wp-content/uploads/2021/04/nft-digital-art.com-what-are-nfts-scaled-e1618106347325-2048x1152.jpeg	2022-07-02 21:23:53.696+05:30	2022-07-05 16:35:04.013+05:30
\.


--
-- Data for Name: team; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.team (id, store_id, user_id, role_id, created_at, updated_at) FROM stdin;
57	2	26	1	\N	\N
\.


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transactions (id, sender_id, receiver_id, price, nft_id, token_id, created_at, updated_at, store_id) FROM stdin;
1	aaaaaaa	aaaaaaaa	2000	9	1	2022-07-06 16:54:35.086+05:30	\N	2
2	aaaaaaa	aaaaaaaa	2000	10	1	2022-07-06 16:54:39.467+05:30	\N	2
3	aaaaaaa	aaaaaaaa	2000	11	1	2022-07-06 16:54:41.851+05:30	\N	2
4	aaaaaaa	aaaaaaaa	2000	12	1	2022-07-06 16:54:43.82+05:30	\N	2
5	aaaaaaa	aaaaaaaa	2000	13	1	2022-07-06 16:54:45.113+05:30	\N	2
6	aaaaaaa	aaaaaaaa	2000	14	1	2022-07-06 16:54:46.401+05:30	\N	2
7	aaaaaaa	aaaaaaaa	2000	15	1	2022-07-06 16:54:47.656+05:30	\N	2
9	0xBf551dB141Cda5E1a5583F9AF6Fbb1BE65290cB8	0xBf551dB141Cda5E1a5583F9AF6Fbb1BE65290cB8	1	19	24	2022-09-13 02:52:23.932+05:30	\N	2
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, full_name, email, password, phone_number, country, biography, avatar_url, wallet_address, created_at, updated_at) FROM stdin;
20	aryan03405012	aryaman	aryan04305012@gmail.com	$2b$12$y81c6VNyE5JNYqWkMncr/e7yjBy9WGJk1eGMzXpTJX7aiLH82DuNa	918851319469	\N	\N	\N	\N	2022-06-17 17:17:01.928+05:30	\N
24	aryan0340533012	aryaman	aryan3304305012@gmail.com	$2b$12$GW1cmk.yQlNtFgOmOtH0J.dcU6G1NRKcaoWYFLJnbIP..tRksROty	918851319469	\N	\N	\N	\N	2022-06-17 17:23:56.593+05:30	\N
25	aryan034053d3012	aryaman	aryan33dd04305012@gmail.com	$2b$12$C5LmpAF0PWhlvvssSL6i9uiPQeGOISk4r4Ma2SSdcyiG1oKAJcqMG	918851319469	\N	\N	\N	\N	2022-06-17 17:25:10.122+05:30	\N
27	aryan	aryaman	aryan@gmail.com	$2b$12$E5yCFYWlzkLmOBadLjk6meL1/VpkkedRcFKgiOV2kxJt4pxZuiSCG	918851319469	\N	\N	\N	\N	2022-06-24 15:38:58.335+05:30	\N
28	aryan040501_1	aryaman sinha	aryan040501gmail.com	$2b$12$WpCywDzNNXhO.4sOjZF5FOf1.y11kuqK0dIyx1DF7DS1r8BgvYqOu	8851319469	\N	\N	\N	\N	2022-06-24 17:36:55.659+05:30	\N
29	aaaaa	aryaman sinha	aaaaa@gmail.com	$2b$12$DPutZVDffNQGE1TYtoLzqOjdt6o.8g5QRwwItUKqsAifDVn4/L3Sy	8851319469	\N	\N	\N	\N	2022-06-28 16:06:39.208+05:30	\N
30	aaaaaa	aryaman asinha	aaaaaa@gmail.com	$2b$12$tvvktDDor5MCM4BdTXQSfuwaEz0V6x2zBllezWDx5j3CFm1E478jm	885131948969	\N	\N	\N	\N	2022-06-28 16:06:56.647+05:30	\N
31	apple	aryaman asinha	apple@gmail.com	$2b$12$X5gSJIaXIpSKyC/EsROcv.XGl4LttpE8sA3WBtBYX1.XQfHdhnn16	985131948969	\N	\N	\N	\N	2022-06-30 16:39:48.997+05:30	\N
32	mango	aryaman asinha	mango@gmail.com	$2b$12$U6L/aNl5I.mK9gg432tr2.vfLNhyMQO4xu2R.oifRsHcTkfB0DCqK	989131948969	\N	\N	\N	\N	2022-06-30 16:42:32.306+05:30	\N
26	aryan040501	aryaman asinha	aryan040501@gmail.com	$2b$12$f1naJeERd7i.UuJWo6J7G.PnCzuoYvKH2UPqfLy4xb8GbrqjjKjkW	989131948969	\N	\N	\N	0x14Ef1E40e9c6ADE2Da50a69C4C91241BF6DFc03F	2022-06-20 12:19:36.148+05:30	\N
4	aryan0405012	aryaman asinha	aryan0405012@gmail.com	$2b$12$2NZqi/uIvgA2yvCu52vAx.S0RxWdbe20pubCEZEuAgeVf4BRKEPAa	989131948969	\N	\N	\N	0xBf551dB141Cda5E1a5583F9AF6Fbb1BE65290cB8	2022-06-17 16:51:32.576+05:30	\N
33	aryan04050123	aryaman asinha	aryan04050123@gmail.com	$2b$12$3FehXYyLiV2u030Im8CgQOaLL6mU2bnKyi7hzLgBYIji1UHiDitGO	989131948969	\N	\N	\N	0xBf551dB141Cda5E1a5583F9AF6Fbb1BE65290cB8	2022-07-04 18:48:29.247+05:30	\N
\.


--
-- Name: aboutstore_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aboutstore_id_seq', 1, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 2, true);


--
-- Name: collections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.collections_id_seq', 3, true);


--
-- Name: contactstore_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contactstore_id_seq', 2, true);


--
-- Name: event_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_logs_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 48, true);


--
-- Name: networks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.networks_id_seq', 4, true);


--
-- Name: nfts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nfts_id_seq', 21, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 1, true);


--
-- Name: stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stores_id_seq', 38, true);


--
-- Name: team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.team_id_seq', 66, true);


--
-- Name: transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transactions_id_seq', 9, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 33, true);


--
-- Name: aboutstore aboutstore_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aboutstore
    ADD CONSTRAINT aboutstore_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: collections collections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collections
    ADD CONSTRAINT collections_pkey PRIMARY KEY (id);


--
-- Name: contactstore contactstore_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contactstore
    ADD CONSTRAINT contactstore_pkey PRIMARY KEY (id);


--
-- Name: event_logs event_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_logs
    ADD CONSTRAINT event_logs_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: networks networks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.networks
    ADD CONSTRAINT networks_pkey PRIMARY KEY (id);


--
-- Name: nfts nfts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nfts
    ADD CONSTRAINT nfts_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: store_community store_community_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_community
    ADD CONSTRAINT store_community_pkey PRIMARY KEY (store_id);


--
-- Name: store_privacy_policy store_privacy_policy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_privacy_policy
    ADD CONSTRAINT store_privacy_policy_pkey PRIMARY KEY (store_id);


--
-- Name: store_refund_policy store_refund_policy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_refund_policy
    ADD CONSTRAINT store_refund_policy_pkey PRIMARY KEY (store_id);


--
-- Name: store_risk_policy store_risk_policy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_risk_policy
    ADD CONSTRAINT store_risk_policy_pkey PRIMARY KEY (store_id);


--
-- Name: store_seo store_seo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_seo
    ADD CONSTRAINT store_seo_pkey PRIMARY KEY (store_id);


--
-- Name: store_social_media_urls store_social_media_urls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_social_media_urls
    ADD CONSTRAINT store_social_media_urls_pkey PRIMARY KEY (store_id);


--
-- Name: store_terms store_terms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_terms
    ADD CONSTRAINT store_terms_pkey PRIMARY KEY (store_id);


--
-- Name: stores stores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- Name: team team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team
    ADD CONSTRAINT team_pkey PRIMARY KEY (id);


--
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: collections category_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collections
    ADD CONSTRAINT category_id FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: nfts category_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nfts
    ADD CONSTRAINT category_id FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: nfts collection_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nfts
    ADD CONSTRAINT collection_id FOREIGN KEY (collection_id) REFERENCES public.collections(id);


--
-- Name: collections network_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collections
    ADD CONSTRAINT network_id FOREIGN KEY (network_id) REFERENCES public.networks(id);


--
-- Name: transactions nft_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT nft_id FOREIGN KEY (nft_id) REFERENCES public.nfts(id);


--
-- Name: store_seo store_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_seo
    ADD CONSTRAINT store_id FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: store_social_media_urls store_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_social_media_urls
    ADD CONSTRAINT store_id FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: store_privacy_policy store_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_privacy_policy
    ADD CONSTRAINT store_id FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: store_terms store_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_terms
    ADD CONSTRAINT store_id FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: store_community store_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_community
    ADD CONSTRAINT store_id FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: store_risk_policy store_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_risk_policy
    ADD CONSTRAINT store_id FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: store_refund_policy store_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_refund_policy
    ADD CONSTRAINT store_id FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: categories store_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT store_id FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: collections store_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collections
    ADD CONSTRAINT store_id FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: nfts store_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nfts
    ADD CONSTRAINT store_id FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: contactstore store_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contactstore
    ADD CONSTRAINT store_id FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: aboutstore store_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aboutstore
    ADD CONSTRAINT store_id FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: transactions store_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT store_id FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: team user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: stores user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: collections user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collections
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: nfts user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nfts
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

