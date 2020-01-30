--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2
-- Dumped by pg_dump version 11.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: movierank; Type: SCHEMA; Schema: -; Owner: zachenney
--

CREATE SCHEMA movierank;


ALTER SCHEMA movierank OWNER TO zachenney;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: actor; Type: TABLE; Schema: movierank; Owner: zachenney
--

CREATE TABLE movierank.actor (
    aid bigint NOT NULL,
    name character varying(45) NOT NULL,
    dob timestamp with time zone NOT NULL,
    thumbnail_url character varying(255)
);


ALTER TABLE movierank.actor OWNER TO zachenney;

--
-- Name: actor_aid_seq; Type: SEQUENCE; Schema: movierank; Owner: zachenney
--

CREATE SEQUENCE movierank.actor_aid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE movierank.actor_aid_seq OWNER TO zachenney;

--
-- Name: actor_aid_seq; Type: SEQUENCE OWNED BY; Schema: movierank; Owner: zachenney
--

ALTER SEQUENCE movierank.actor_aid_seq OWNED BY movierank.actor.aid;


--
-- Name: director; Type: TABLE; Schema: movierank; Owner: zachenney
--

CREATE TABLE movierank.director (
    did bigint NOT NULL,
    name character varying(45) NOT NULL
);


ALTER TABLE movierank.director OWNER TO zachenney;

--
-- Name: director_did_seq; Type: SEQUENCE; Schema: movierank; Owner: zachenney
--

CREATE SEQUENCE movierank.director_did_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE movierank.director_did_seq OWNER TO zachenney;

--
-- Name: director_did_seq; Type: SEQUENCE OWNED BY; Schema: movierank; Owner: zachenney
--

ALTER SEQUENCE movierank.director_did_seq OWNED BY movierank.director.did;


--
-- Name: genre; Type: TABLE; Schema: movierank; Owner: zachenney
--

CREATE TABLE movierank.genre (
    gid bigint NOT NULL,
    name character varying(45) NOT NULL
);


ALTER TABLE movierank.genre OWNER TO zachenney;

--
-- Name: genre_gid_seq; Type: SEQUENCE; Schema: movierank; Owner: zachenney
--

CREATE SEQUENCE movierank.genre_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE movierank.genre_gid_seq OWNER TO zachenney;

--
-- Name: genre_gid_seq; Type: SEQUENCE OWNED BY; Schema: movierank; Owner: zachenney
--

ALTER SEQUENCE movierank.genre_gid_seq OWNED BY movierank.genre.gid;


--
-- Name: movie; Type: TABLE; Schema: movierank; Owner: zachenney
--

CREATE TABLE movierank.movie (
    mid bigint NOT NULL,
    name character varying(45) NOT NULL,
    release_date character varying(45),
    mpaa_rating character varying(45),
    runtime time(6) without time zone,
    description character varying(45),
    thumbnail_url character varying(45),
    gid bigint NOT NULL,
    did bigint NOT NULL
);


ALTER TABLE movierank.movie OWNER TO zachenney;

--
-- Name: movie_mid_seq; Type: SEQUENCE; Schema: movierank; Owner: zachenney
--

CREATE SEQUENCE movierank.movie_mid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE movierank.movie_mid_seq OWNER TO zachenney;

--
-- Name: movie_mid_seq; Type: SEQUENCE OWNED BY; Schema: movierank; Owner: zachenney
--

ALTER SEQUENCE movierank.movie_mid_seq OWNED BY movierank.movie.mid;


--
-- Name: movieactor; Type: TABLE; Schema: movierank; Owner: zachenney
--

CREATE TABLE movierank.movieactor (
    aid bigint NOT NULL,
    mid bigint NOT NULL
);


ALTER TABLE movierank.movieactor OWNER TO zachenney;

--
-- Name: movierating; Type: TABLE; Schema: movierank; Owner: zachenney
--

CREATE TABLE movierank.movierating (
    mid bigint NOT NULL,
    rid bigint NOT NULL
);


ALTER TABLE movierank.movierating OWNER TO zachenney;

--
-- Name: rating; Type: TABLE; Schema: movierank; Owner: zachenney
--

CREATE TABLE movierank.rating (
    rid bigint NOT NULL,
    rating bigint NOT NULL,
    uid bigint NOT NULL
);


ALTER TABLE movierank.rating OWNER TO zachenney;

--
-- Name: rating_rid_seq; Type: SEQUENCE; Schema: movierank; Owner: zachenney
--

CREATE SEQUENCE movierank.rating_rid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE movierank.rating_rid_seq OWNER TO zachenney;

--
-- Name: rating_rid_seq; Type: SEQUENCE OWNED BY; Schema: movierank; Owner: zachenney
--

ALTER SEQUENCE movierank.rating_rid_seq OWNED BY movierank.rating.rid;


--
-- Name: user; Type: TABLE; Schema: movierank; Owner: zachenney
--

CREATE TABLE movierank."user" (
    uid bigint NOT NULL,
    username character varying(45) NOT NULL,
    password character varying(45) NOT NULL,
    thumbnail_url character varying(45)
);


ALTER TABLE movierank."user" OWNER TO zachenney;

--
-- Name: user_uid_seq; Type: SEQUENCE; Schema: movierank; Owner: zachenney
--

CREATE SEQUENCE movierank.user_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE movierank.user_uid_seq OWNER TO zachenney;

--
-- Name: user_uid_seq; Type: SEQUENCE OWNED BY; Schema: movierank; Owner: zachenney
--

ALTER SEQUENCE movierank.user_uid_seq OWNED BY movierank."user".uid;


--
-- Name: actor; Type: TABLE; Schema: public; Owner: zachenney
--

CREATE TABLE public.actor (
    aid bigint NOT NULL,
    name character varying(45) NOT NULL,
    dob timestamp with time zone NOT NULL,
    thumbnail_url character varying(255)
);


ALTER TABLE public.actor OWNER TO zachenney;

--
-- Name: actor_aid_seq; Type: SEQUENCE; Schema: public; Owner: zachenney
--

CREATE SEQUENCE public.actor_aid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actor_aid_seq OWNER TO zachenney;

--
-- Name: actor_aid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zachenney
--

ALTER SEQUENCE public.actor_aid_seq OWNED BY public.actor.aid;


--
-- Name: director; Type: TABLE; Schema: public; Owner: zachenney
--

CREATE TABLE public.director (
    did bigint NOT NULL,
    name character varying(45) NOT NULL
);


ALTER TABLE public.director OWNER TO zachenney;

--
-- Name: director_did_seq; Type: SEQUENCE; Schema: public; Owner: zachenney
--

CREATE SEQUENCE public.director_did_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.director_did_seq OWNER TO zachenney;

--
-- Name: director_did_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zachenney
--

ALTER SEQUENCE public.director_did_seq OWNED BY public.director.did;


--
-- Name: genre; Type: TABLE; Schema: public; Owner: zachenney
--

CREATE TABLE public.genre (
    gid bigint NOT NULL,
    name character varying(45) NOT NULL
);


ALTER TABLE public.genre OWNER TO zachenney;

--
-- Name: genre_gid_seq; Type: SEQUENCE; Schema: public; Owner: zachenney
--

CREATE SEQUENCE public.genre_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genre_gid_seq OWNER TO zachenney;

--
-- Name: genre_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zachenney
--

ALTER SEQUENCE public.genre_gid_seq OWNED BY public.genre.gid;


--
-- Name: movie; Type: TABLE; Schema: public; Owner: zachenney
--

CREATE TABLE public.movie (
    mid bigint NOT NULL,
    name character varying(45) NOT NULL,
    release_date character varying(45),
    mpaa_rating character varying(45),
    runtime time(6) without time zone,
    description character varying(256),
    thumbnail_url character varying(256),
    did bigint
);


ALTER TABLE public.movie OWNER TO zachenney;

--
-- Name: movie_mid_seq; Type: SEQUENCE; Schema: public; Owner: zachenney
--

CREATE SEQUENCE public.movie_mid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movie_mid_seq OWNER TO zachenney;

--
-- Name: movie_mid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zachenney
--

ALTER SEQUENCE public.movie_mid_seq OWNED BY public.movie.mid;


--
-- Name: movieactor; Type: TABLE; Schema: public; Owner: zachenney
--

CREATE TABLE public.movieactor (
    aid bigint NOT NULL,
    mid bigint NOT NULL
);


ALTER TABLE public.movieactor OWNER TO zachenney;

--
-- Name: moviegenre; Type: TABLE; Schema: public; Owner: zachenney
--

CREATE TABLE public.moviegenre (
    mid bigint NOT NULL,
    gid bigint NOT NULL
);


ALTER TABLE public.moviegenre OWNER TO zachenney;

--
-- Name: movierating; Type: TABLE; Schema: public; Owner: zachenney
--

CREATE TABLE public.movierating (
    mid bigint NOT NULL,
    rid bigint NOT NULL
);


ALTER TABLE public.movierating OWNER TO zachenney;

--
-- Name: rating; Type: TABLE; Schema: public; Owner: zachenney
--

CREATE TABLE public.rating (
    rid bigint NOT NULL,
    rating bigint NOT NULL,
    uid bigint NOT NULL
);


ALTER TABLE public.rating OWNER TO zachenney;

--
-- Name: rating_rid_seq; Type: SEQUENCE; Schema: public; Owner: zachenney
--

CREATE SEQUENCE public.rating_rid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rating_rid_seq OWNER TO zachenney;

--
-- Name: rating_rid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zachenney
--

ALTER SEQUENCE public.rating_rid_seq OWNED BY public.rating.rid;


--
-- Name: user; Type: TABLE; Schema: public; Owner: zachenney
--

CREATE TABLE public."user" (
    uid bigint NOT NULL,
    username character varying(45) NOT NULL,
    password character varying(45) NOT NULL,
    thumbnail_url character varying(256)
);


ALTER TABLE public."user" OWNER TO zachenney;

--
-- Name: user_uid_seq; Type: SEQUENCE; Schema: public; Owner: zachenney
--

CREATE SEQUENCE public.user_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_uid_seq OWNER TO zachenney;

--
-- Name: user_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zachenney
--

ALTER SEQUENCE public.user_uid_seq OWNED BY public."user".uid;


--
-- Name: users; Type: TABLE; Schema: public; Owner: zachenney
--

CREATE TABLE public.users (
    uid bigint NOT NULL,
    username character varying(45) NOT NULL,
    password character varying(45) NOT NULL,
    thumbnail_url character varying(256)
);


ALTER TABLE public.users OWNER TO zachenney;

--
-- Name: users_uid_seq; Type: SEQUENCE; Schema: public; Owner: zachenney
--

CREATE SEQUENCE public.users_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_uid_seq OWNER TO zachenney;

--
-- Name: users_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zachenney
--

ALTER SEQUENCE public.users_uid_seq OWNED BY public.users.uid;


--
-- Name: actor aid; Type: DEFAULT; Schema: movierank; Owner: zachenney
--

ALTER TABLE ONLY movierank.actor ALTER COLUMN aid SET DEFAULT nextval('movierank.actor_aid_seq'::regclass);


--
-- Name: director did; Type: DEFAULT; Schema: movierank; Owner: zachenney
--

ALTER TABLE ONLY movierank.director ALTER COLUMN did SET DEFAULT nextval('movierank.director_did_seq'::regclass);


--
-- Name: genre gid; Type: DEFAULT; Schema: movierank; Owner: zachenney
--

ALTER TABLE ONLY movierank.genre ALTER COLUMN gid SET DEFAULT nextval('movierank.genre_gid_seq'::regclass);


--
-- Name: movie mid; Type: DEFAULT; Schema: movierank; Owner: zachenney
--

ALTER TABLE ONLY movierank.movie ALTER COLUMN mid SET DEFAULT nextval('movierank.movie_mid_seq'::regclass);


--
-- Name: rating rid; Type: DEFAULT; Schema: movierank; Owner: zachenney
--

ALTER TABLE ONLY movierank.rating ALTER COLUMN rid SET DEFAULT nextval('movierank.rating_rid_seq'::regclass);


--
-- Name: user uid; Type: DEFAULT; Schema: movierank; Owner: zachenney
--

ALTER TABLE ONLY movierank."user" ALTER COLUMN uid SET DEFAULT nextval('movierank.user_uid_seq'::regclass);


--
-- Name: actor aid; Type: DEFAULT; Schema: public; Owner: zachenney
--

ALTER TABLE ONLY public.actor ALTER COLUMN aid SET DEFAULT nextval('public.actor_aid_seq'::regclass);


--
-- Name: director did; Type: DEFAULT; Schema: public; Owner: zachenney
--

ALTER TABLE ONLY public.director ALTER COLUMN did SET DEFAULT nextval('public.director_did_seq'::regclass);


--
-- Name: genre gid; Type: DEFAULT; Schema: public; Owner: zachenney
--

ALTER TABLE ONLY public.genre ALTER COLUMN gid SET DEFAULT nextval('public.genre_gid_seq'::regclass);


--
-- Name: movie mid; Type: DEFAULT; Schema: public; Owner: zachenney
--

ALTER TABLE ONLY public.movie ALTER COLUMN mid SET DEFAULT nextval('public.movie_mid_seq'::regclass);


--
-- Name: rating rid; Type: DEFAULT; Schema: public; Owner: zachenney
--

ALTER TABLE ONLY public.rating ALTER COLUMN rid SET DEFAULT nextval('public.rating_rid_seq'::regclass);


--
-- Name: user uid; Type: DEFAULT; Schema: public; Owner: zachenney
--

ALTER TABLE ONLY public."user" ALTER COLUMN uid SET DEFAULT nextval('public.user_uid_seq'::regclass);


--
-- Name: users uid; Type: DEFAULT; Schema: public; Owner: zachenney
--

ALTER TABLE ONLY public.users ALTER COLUMN uid SET DEFAULT nextval('public.users_uid_seq'::regclass);


--
-- Data for Name: actor; Type: TABLE DATA; Schema: movierank; Owner: zachenney
--

COPY movierank.actor (aid, name, dob, thumbnail_url) FROM stdin;
1	Chris Evans	1981-06-13 00:00:00-07	https://test/photo1.png
\.


--
-- Data for Name: director; Type: TABLE DATA; Schema: movierank; Owner: zachenney
--

COPY movierank.director (did, name) FROM stdin;
\.


--
-- Data for Name: genre; Type: TABLE DATA; Schema: movierank; Owner: zachenney
--

COPY movierank.genre (gid, name) FROM stdin;
1	Action
\.


--
-- Data for Name: movie; Type: TABLE DATA; Schema: movierank; Owner: zachenney
--

COPY movierank.movie (mid, name, release_date, mpaa_rating, runtime, description, thumbnail_url, gid, did) FROM stdin;
\.


--
-- Data for Name: movieactor; Type: TABLE DATA; Schema: movierank; Owner: zachenney
--

COPY movierank.movieactor (aid, mid) FROM stdin;
\.


--
-- Data for Name: movierating; Type: TABLE DATA; Schema: movierank; Owner: zachenney
--

COPY movierank.movierating (mid, rid) FROM stdin;
\.


--
-- Data for Name: rating; Type: TABLE DATA; Schema: movierank; Owner: zachenney
--

COPY movierank.rating (rid, rating, uid) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: movierank; Owner: zachenney
--

COPY movierank."user" (uid, username, password, thumbnail_url) FROM stdin;
\.


--
-- Data for Name: actor; Type: TABLE DATA; Schema: public; Owner: zachenney
--

COPY public.actor (aid, name, dob, thumbnail_url) FROM stdin;
1	Chris Evans	1981-06-13 00:00:00-07	https://m.media-amazon.com/images/M/MV5BMTU2NTg1OTQzMF5BMl5BanBnXkFtZTcwNjIyMjkyMg@@._V1_UY317_CR6,0,214,317_AL_.jpg
2	Robert Downey Jr	1965-04-04 00:00:00-08	https://m.media-amazon.com/images/M/MV5BNzg1MTUyNDYxOF5BMl5BanBnXkFtZTgwNTQ4MTE2MjE@._V1_UX214_CR0,0,214,317_AL_.jpg
3	Chris Hemsworth	1983-08-11 00:00:00-07	https://m.media-amazon.com/images/M/MV5BOTU2MTI0NTIyNV5BMl5BanBnXkFtZTcwMTA4Nzc3OA@@._V1_UX214_CR0,0,214,317_AL_.jpg
4	Chris Pine	1980-08-26 00:00:00-07	https://m.media-amazon.com/images/M/MV5BMTM4OTQ4NTU3NV5BMl5BanBnXkFtZTcwNjEwNDU0OQ@@._V1_UX214_CR0,0,214,317_AL_.jpg
\.


--
-- Data for Name: director; Type: TABLE DATA; Schema: public; Owner: zachenney
--

COPY public.director (did, name) FROM stdin;
1	Josh Whedon
2	Kenneth Branagh
3	J.J. Abrams
\.


--
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: zachenney
--

COPY public.genre (gid, name) FROM stdin;
1	Action
2	Adventure
3	Sci-Fi
\.


--
-- Data for Name: movie; Type: TABLE DATA; Schema: public; Owner: zachenney
--

COPY public.movie (mid, name, release_date, mpaa_rating, runtime, description, thumbnail_url, did) FROM stdin;
1	Avengers	04-23-2019	PG-13	02:38:33	Earth's mightiest heroes must come together and learn to fight as a team if they are going to stop the mischievous Loki and his alien army from enslaving humanity.	https://m.media-amazon.com/images/M/MV5BNDYxNjQyMjAtNTdiOS00NGYwLWFmNTAtNThmYjU5ZGI2YTI1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg	1
2	Thor	05-06-2011	PG-13	01:55:00	The powerful, but arrogant god Thor, is cast out of Asgard to live amongst humans in Midgard (Earth), where he soon becomes one of their finest defenders.	https://m.media-amazon.com/images/M/MV5BOGE4NzU1YTAtNzA3Mi00ZTA2LTg2YmYtMDJmMThiMjlkYjg2XkEyXkFqcGdeQXVyNTgzMDMzMTg@._V1_SX300.jpg	2
3	Star Trek	05-08-2009	PG-13	02:07:00	The brash James T. Kirk tries to live up to his father's legacy with Mr. Spock keeping him in check as a vengeful Romulan from the future creates black holes to destroy the Federation one planet at a time.	https://m.media-amazon.com/images/M/MV5BMjE5NDQ5OTE4Ml5BMl5BanBnXkFtZTcwOTE3NDIzMw@@._V1_SX300.jpg	3
4	Star Trek Into Darkness	05-16-2013	PG-13	02:12:00	After the crew of the Enterprise find an unstoppable force of terror from within their own organization, Captain Kirk leads a manhunt to a war-zone world to capture a one-man weapon of mass destruction.	https://m.media-amazon.com/images/M/MV5BMTk2NzczOTgxNF5BMl5BanBnXkFtZTcwODQ5ODczOQ@@._V1_SX300.jpg	3
\.


--
-- Data for Name: movieactor; Type: TABLE DATA; Schema: public; Owner: zachenney
--

COPY public.movieactor (aid, mid) FROM stdin;
1	1
2	1
3	2
4	3
4	4
\.


--
-- Data for Name: moviegenre; Type: TABLE DATA; Schema: public; Owner: zachenney
--

COPY public.moviegenre (mid, gid) FROM stdin;
1	1
1	2
1	3
2	1
2	2
2	3
3	1
3	2
3	3
4	1
4	2
4	3
\.


--
-- Data for Name: movierating; Type: TABLE DATA; Schema: public; Owner: zachenney
--

COPY public.movierating (mid, rid) FROM stdin;
2	2
3	3
1	1
1	4
2	8
\.


--
-- Data for Name: rating; Type: TABLE DATA; Schema: public; Owner: zachenney
--

COPY public.rating (rid, rating, uid) FROM stdin;
1	8	1
2	7	2
3	6	3
4	4	3
7	6	1
8	6	1
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: zachenney
--

COPY public."user" (uid, username, password, thumbnail_url) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: zachenney
--

COPY public.users (uid, username, password, thumbnail_url) FROM stdin;
2	user 2	password	https://i.kym-cdn.com/entries/icons/mobile/000/027/475/Screen_Shot_2018-10-25_at_11.02.15_AM.jpg
3	user 3	password	https://i.kym-cdn.com/entries/icons/mobile/000/027/475/Screen_Shot_2018-10-25_at_11.02.15_AM.jpg
5	zac2	pass	NULL
1	user 1	pass	https://i.kym-cdn.com/entries/icons/mobile/000/027/475/Screen_Shot_2018-10-25_at_11.02.15_AM.jpg
4	zac	pass	NULL
6	user2	pass	NULL
\.


--
-- Name: actor_aid_seq; Type: SEQUENCE SET; Schema: movierank; Owner: zachenney
--

SELECT pg_catalog.setval('movierank.actor_aid_seq', 1, true);


--
-- Name: director_did_seq; Type: SEQUENCE SET; Schema: movierank; Owner: zachenney
--

SELECT pg_catalog.setval('movierank.director_did_seq', 1, true);


--
-- Name: genre_gid_seq; Type: SEQUENCE SET; Schema: movierank; Owner: zachenney
--

SELECT pg_catalog.setval('movierank.genre_gid_seq', 1, true);


--
-- Name: movie_mid_seq; Type: SEQUENCE SET; Schema: movierank; Owner: zachenney
--

SELECT pg_catalog.setval('movierank.movie_mid_seq', 1, true);


--
-- Name: rating_rid_seq; Type: SEQUENCE SET; Schema: movierank; Owner: zachenney
--

SELECT pg_catalog.setval('movierank.rating_rid_seq', 1, true);


--
-- Name: user_uid_seq; Type: SEQUENCE SET; Schema: movierank; Owner: zachenney
--

SELECT pg_catalog.setval('movierank.user_uid_seq', 1, true);


--
-- Name: actor_aid_seq; Type: SEQUENCE SET; Schema: public; Owner: zachenney
--

SELECT pg_catalog.setval('public.actor_aid_seq', 4, true);


--
-- Name: director_did_seq; Type: SEQUENCE SET; Schema: public; Owner: zachenney
--

SELECT pg_catalog.setval('public.director_did_seq', 3, true);


--
-- Name: genre_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: zachenney
--

SELECT pg_catalog.setval('public.genre_gid_seq', 3, true);


--
-- Name: movie_mid_seq; Type: SEQUENCE SET; Schema: public; Owner: zachenney
--

SELECT pg_catalog.setval('public.movie_mid_seq', 4, true);


--
-- Name: rating_rid_seq; Type: SEQUENCE SET; Schema: public; Owner: zachenney
--

SELECT pg_catalog.setval('public.rating_rid_seq', 114, true);


--
-- Name: user_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: zachenney
--

SELECT pg_catalog.setval('public.user_uid_seq', 1, true);


--
-- Name: users_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: zachenney
--

SELECT pg_catalog.setval('public.users_uid_seq', 6, true);


--
-- Name: actor idx_43004_primary; Type: CONSTRAINT; Schema: movierank; Owner: zachenney
--

ALTER TABLE ONLY movierank.actor
    ADD CONSTRAINT idx_43004_primary PRIMARY KEY (aid);


--
-- Name: director idx_43010_primary; Type: CONSTRAINT; Schema: movierank; Owner: zachenney
--

ALTER TABLE ONLY movierank.director
    ADD CONSTRAINT idx_43010_primary PRIMARY KEY (did);


--
-- Name: genre idx_43016_primary; Type: CONSTRAINT; Schema: movierank; Owner: zachenney
--

ALTER TABLE ONLY movierank.genre
    ADD CONSTRAINT idx_43016_primary PRIMARY KEY (gid);


--
-- Name: movie idx_43022_primary; Type: CONSTRAINT; Schema: movierank; Owner: zachenney
--

ALTER TABLE ONLY movierank.movie
    ADD CONSTRAINT idx_43022_primary PRIMARY KEY (mid);


--
-- Name: rating idx_43034_primary; Type: CONSTRAINT; Schema: movierank; Owner: zachenney
--

ALTER TABLE ONLY movierank.rating
    ADD CONSTRAINT idx_43034_primary PRIMARY KEY (rid);


--
-- Name: user idx_43040_primary; Type: CONSTRAINT; Schema: movierank; Owner: zachenney
--

ALTER TABLE ONLY movierank."user"
    ADD CONSTRAINT idx_43040_primary PRIMARY KEY (uid);


--
-- Name: user idx_43266_primary; Type: CONSTRAINT; Schema: public; Owner: zachenney
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT idx_43266_primary PRIMARY KEY (uid);


--
-- Name: actor idx_43349_primary; Type: CONSTRAINT; Schema: public; Owner: zachenney
--

ALTER TABLE ONLY public.actor
    ADD CONSTRAINT idx_43349_primary PRIMARY KEY (aid);


--
-- Name: director idx_43355_primary; Type: CONSTRAINT; Schema: public; Owner: zachenney
--

ALTER TABLE ONLY public.director
    ADD CONSTRAINT idx_43355_primary PRIMARY KEY (did);


--
-- Name: genre idx_43361_primary; Type: CONSTRAINT; Schema: public; Owner: zachenney
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT idx_43361_primary PRIMARY KEY (gid);


--
-- Name: movie idx_43367_primary; Type: CONSTRAINT; Schema: public; Owner: zachenney
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT idx_43367_primary PRIMARY KEY (mid);


--
-- Name: rating idx_43385_primary; Type: CONSTRAINT; Schema: public; Owner: zachenney
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT idx_43385_primary PRIMARY KEY (rid);


--
-- Name: users idx_43391_primary; Type: CONSTRAINT; Schema: public; Owner: zachenney
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT idx_43391_primary PRIMARY KEY (uid);


--
-- Name: idx_43004_aid_unique; Type: INDEX; Schema: movierank; Owner: zachenney
--

CREATE UNIQUE INDEX idx_43004_aid_unique ON movierank.actor USING btree (aid);


--
-- Name: idx_43010_did_unique; Type: INDEX; Schema: movierank; Owner: zachenney
--

CREATE UNIQUE INDEX idx_43010_did_unique ON movierank.director USING btree (did);


--
-- Name: idx_43016_gid_unique; Type: INDEX; Schema: movierank; Owner: zachenney
--

CREATE UNIQUE INDEX idx_43016_gid_unique ON movierank.genre USING btree (gid);


--
-- Name: idx_43022_did_idx; Type: INDEX; Schema: movierank; Owner: zachenney
--

CREATE INDEX idx_43022_did_idx ON movierank.movie USING btree (did);


--
-- Name: idx_43022_gid_idx; Type: INDEX; Schema: movierank; Owner: zachenney
--

CREATE INDEX idx_43022_gid_idx ON movierank.movie USING btree (gid);


--
-- Name: idx_43022_mid_unique; Type: INDEX; Schema: movierank; Owner: zachenney
--

CREATE UNIQUE INDEX idx_43022_mid_unique ON movierank.movie USING btree (mid);


--
-- Name: idx_43026_aid_idx; Type: INDEX; Schema: movierank; Owner: zachenney
--

CREATE INDEX idx_43026_aid_idx ON movierank.movieactor USING btree (aid);


--
-- Name: idx_43026_mid_idx; Type: INDEX; Schema: movierank; Owner: zachenney
--

CREATE INDEX idx_43026_mid_idx ON movierank.movieactor USING btree (mid);


--
-- Name: idx_43029_mid_idx; Type: INDEX; Schema: movierank; Owner: zachenney
--

CREATE INDEX idx_43029_mid_idx ON movierank.movierating USING btree (mid);


--
-- Name: idx_43029_rid_idx; Type: INDEX; Schema: movierank; Owner: zachenney
--

CREATE INDEX idx_43029_rid_idx ON movierank.movierating USING btree (rid);


--
-- Name: idx_43034_rid_unique; Type: INDEX; Schema: movierank; Owner: zachenney
--

CREATE UNIQUE INDEX idx_43034_rid_unique ON movierank.rating USING btree (rid);


--
-- Name: idx_43034_uid_idx; Type: INDEX; Schema: movierank; Owner: zachenney
--

CREATE INDEX idx_43034_uid_idx ON movierank.rating USING btree (uid);


--
-- Name: idx_43040_uid_unique; Type: INDEX; Schema: movierank; Owner: zachenney
--

CREATE UNIQUE INDEX idx_43040_uid_unique ON movierank."user" USING btree (uid);


--
-- Name: idx_43040_username_unique; Type: INDEX; Schema: movierank; Owner: zachenney
--

CREATE UNIQUE INDEX idx_43040_username_unique ON movierank."user" USING btree (username);


--
-- Name: idx_43266_uid_unique; Type: INDEX; Schema: public; Owner: zachenney
--

CREATE UNIQUE INDEX idx_43266_uid_unique ON public."user" USING btree (uid);


--
-- Name: idx_43266_username_unique; Type: INDEX; Schema: public; Owner: zachenney
--

CREATE UNIQUE INDEX idx_43266_username_unique ON public."user" USING btree (username);


--
-- Name: idx_43349_aid_unique; Type: INDEX; Schema: public; Owner: zachenney
--

CREATE UNIQUE INDEX idx_43349_aid_unique ON public.actor USING btree (aid);


--
-- Name: idx_43355_did_unique; Type: INDEX; Schema: public; Owner: zachenney
--

CREATE UNIQUE INDEX idx_43355_did_unique ON public.director USING btree (did);


--
-- Name: idx_43361_gid_unique; Type: INDEX; Schema: public; Owner: zachenney
--

CREATE UNIQUE INDEX idx_43361_gid_unique ON public.genre USING btree (gid);


--
-- Name: idx_43367_did_idx; Type: INDEX; Schema: public; Owner: zachenney
--

CREATE INDEX idx_43367_did_idx ON public.movie USING btree (did);


--
-- Name: idx_43367_mid_unique; Type: INDEX; Schema: public; Owner: zachenney
--

CREATE UNIQUE INDEX idx_43367_mid_unique ON public.movie USING btree (mid);


--
-- Name: idx_43374_aid_idx; Type: INDEX; Schema: public; Owner: zachenney
--

CREATE INDEX idx_43374_aid_idx ON public.movieactor USING btree (aid);


--
-- Name: idx_43374_mid_idx; Type: INDEX; Schema: public; Owner: zachenney
--

CREATE INDEX idx_43374_mid_idx ON public.movieactor USING btree (mid);


--
-- Name: idx_43377_gid_idx; Type: INDEX; Schema: public; Owner: zachenney
--

CREATE INDEX idx_43377_gid_idx ON public.moviegenre USING btree (gid);


--
-- Name: idx_43377_mid_idx; Type: INDEX; Schema: public; Owner: zachenney
--

CREATE INDEX idx_43377_mid_idx ON public.moviegenre USING btree (mid);


--
-- Name: idx_43380_mid_idx; Type: INDEX; Schema: public; Owner: zachenney
--

CREATE INDEX idx_43380_mid_idx ON public.movierating USING btree (mid);


--
-- Name: idx_43380_rid_idx; Type: INDEX; Schema: public; Owner: zachenney
--

CREATE INDEX idx_43380_rid_idx ON public.movierating USING btree (rid);


--
-- Name: idx_43385_rid_unique; Type: INDEX; Schema: public; Owner: zachenney
--

CREATE UNIQUE INDEX idx_43385_rid_unique ON public.rating USING btree (rid);


--
-- Name: idx_43385_uid_idx; Type: INDEX; Schema: public; Owner: zachenney
--

CREATE INDEX idx_43385_uid_idx ON public.rating USING btree (uid);


--
-- Name: idx_43391_uid_unique; Type: INDEX; Schema: public; Owner: zachenney
--

CREATE UNIQUE INDEX idx_43391_uid_unique ON public.users USING btree (uid);


--
-- Name: idx_43391_username_unique; Type: INDEX; Schema: public; Owner: zachenney
--

CREATE UNIQUE INDEX idx_43391_username_unique ON public.users USING btree (username);


--
-- Name: movieactor aid; Type: FK CONSTRAINT; Schema: movierank; Owner: zachenney
--

ALTER TABLE ONLY movierank.movieactor
    ADD CONSTRAINT aid FOREIGN KEY (aid) REFERENCES movierank.actor(aid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie did; Type: FK CONSTRAINT; Schema: movierank; Owner: zachenney
--

ALTER TABLE ONLY movierank.movie
    ADD CONSTRAINT did FOREIGN KEY (did) REFERENCES movierank.director(did) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie gid; Type: FK CONSTRAINT; Schema: movierank; Owner: zachenney
--

ALTER TABLE ONLY movierank.movie
    ADD CONSTRAINT gid FOREIGN KEY (gid) REFERENCES movierank.genre(gid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movieactor mid; Type: FK CONSTRAINT; Schema: movierank; Owner: zachenney
--

ALTER TABLE ONLY movierank.movieactor
    ADD CONSTRAINT mid FOREIGN KEY (mid) REFERENCES movierank.movie(mid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movierating rid; Type: FK CONSTRAINT; Schema: movierank; Owner: zachenney
--

ALTER TABLE ONLY movierank.movierating
    ADD CONSTRAINT rid FOREIGN KEY (rid) REFERENCES movierank.rating(rid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movierating rmid; Type: FK CONSTRAINT; Schema: movierank; Owner: zachenney
--

ALTER TABLE ONLY movierank.movierating
    ADD CONSTRAINT rmid FOREIGN KEY (mid) REFERENCES movierank.movie(mid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: rating uid; Type: FK CONSTRAINT; Schema: movierank; Owner: zachenney
--

ALTER TABLE ONLY movierank.rating
    ADD CONSTRAINT uid FOREIGN KEY (uid) REFERENCES movierank."user"(uid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movieactor aid; Type: FK CONSTRAINT; Schema: public; Owner: zachenney
--

ALTER TABLE ONLY public.movieactor
    ADD CONSTRAINT aid FOREIGN KEY (aid) REFERENCES public.actor(aid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movie did; Type: FK CONSTRAINT; Schema: public; Owner: zachenney
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT did FOREIGN KEY (did) REFERENCES public.director(did) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: moviegenre gid; Type: FK CONSTRAINT; Schema: public; Owner: zachenney
--

ALTER TABLE ONLY public.moviegenre
    ADD CONSTRAINT gid FOREIGN KEY (gid) REFERENCES public.genre(gid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: moviegenre mid; Type: FK CONSTRAINT; Schema: public; Owner: zachenney
--

ALTER TABLE ONLY public.moviegenre
    ADD CONSTRAINT mid FOREIGN KEY (mid) REFERENCES public.movie(mid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movieactor mvid; Type: FK CONSTRAINT; Schema: public; Owner: zachenney
--

ALTER TABLE ONLY public.movieactor
    ADD CONSTRAINT mvid FOREIGN KEY (mid) REFERENCES public.movie(mid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movierating rid; Type: FK CONSTRAINT; Schema: public; Owner: zachenney
--

ALTER TABLE ONLY public.movierating
    ADD CONSTRAINT rid FOREIGN KEY (rid) REFERENCES public.rating(rid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movierating rmid; Type: FK CONSTRAINT; Schema: public; Owner: zachenney
--

ALTER TABLE ONLY public.movierating
    ADD CONSTRAINT rmid FOREIGN KEY (mid) REFERENCES public.movie(mid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: rating uid; Type: FK CONSTRAINT; Schema: public; Owner: zachenney
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT uid FOREIGN KEY (uid) REFERENCES public.users(uid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

