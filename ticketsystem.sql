--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 9.6.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Ticket_comment; Type: TABLE; Schema: public; Owner: ktn
--

CREATE TABLE "Ticket_comment" (
    id integer NOT NULL,
    active boolean NOT NULL,
    comment text NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    tickets_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE "Ticket_comment" OWNER TO ktn;

--
-- Name: Ticket_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: ktn
--

CREATE SEQUENCE "Ticket_comment_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Ticket_comment_id_seq" OWNER TO ktn;

--
-- Name: Ticket_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ktn
--

ALTER SEQUENCE "Ticket_comment_id_seq" OWNED BY "Ticket_comment".id;


--
-- Name: Ticket_status; Type: TABLE; Schema: public; Owner: ktn
--

CREATE TABLE "Ticket_status" (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(500) NOT NULL,
    active boolean NOT NULL,
    created timestamp with time zone NOT NULL
);


ALTER TABLE "Ticket_status" OWNER TO ktn;

--
-- Name: Ticket_status_id_seq; Type: SEQUENCE; Schema: public; Owner: ktn
--

CREATE SEQUENCE "Ticket_status_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Ticket_status_id_seq" OWNER TO ktn;

--
-- Name: Ticket_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ktn
--

ALTER SEQUENCE "Ticket_status_id_seq" OWNED BY "Ticket_status".id;


--
-- Name: Ticket_ticket; Type: TABLE; Schema: public; Owner: ktn
--

CREATE TABLE "Ticket_ticket" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    subject character varying(255) NOT NULL,
    active boolean NOT NULL,
    message text NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    status_id integer NOT NULL,
    tickettype_id integer NOT NULL,
    urgency_id integer NOT NULL,
    user_id integer
);


ALTER TABLE "Ticket_ticket" OWNER TO ktn;

--
-- Name: Ticket_ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: ktn
--

CREATE SEQUENCE "Ticket_ticket_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Ticket_ticket_id_seq" OWNER TO ktn;

--
-- Name: Ticket_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ktn
--

ALTER SEQUENCE "Ticket_ticket_id_seq" OWNED BY "Ticket_ticket".id;


--
-- Name: Ticket_type; Type: TABLE; Schema: public; Owner: ktn
--

CREATE TABLE "Ticket_type" (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(500) NOT NULL,
    active boolean NOT NULL,
    created timestamp with time zone NOT NULL
);


ALTER TABLE "Ticket_type" OWNER TO ktn;

--
-- Name: Ticket_type_id_seq; Type: SEQUENCE; Schema: public; Owner: ktn
--

CREATE SEQUENCE "Ticket_type_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Ticket_type_id_seq" OWNER TO ktn;

--
-- Name: Ticket_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ktn
--

ALTER SEQUENCE "Ticket_type_id_seq" OWNED BY "Ticket_type".id;


--
-- Name: Ticket_urgency; Type: TABLE; Schema: public; Owner: ktn
--

CREATE TABLE "Ticket_urgency" (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(500) NOT NULL,
    active boolean NOT NULL,
    created timestamp with time zone NOT NULL
);


ALTER TABLE "Ticket_urgency" OWNER TO ktn;

--
-- Name: Ticket_urgency_id_seq; Type: SEQUENCE; Schema: public; Owner: ktn
--

CREATE SEQUENCE "Ticket_urgency_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Ticket_urgency_id_seq" OWNER TO ktn;

--
-- Name: Ticket_urgency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ktn
--

ALTER SEQUENCE "Ticket_urgency_id_seq" OWNED BY "Ticket_urgency".id;


--
-- Name: Tickets_comment; Type: TABLE; Schema: public; Owner: ktn
--

CREATE TABLE "Tickets_comment" (
    id integer NOT NULL,
    user_id integer NOT NULL,
    tickets_id integer NOT NULL,
    comment text NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    active boolean DEFAULT true
);


ALTER TABLE "Tickets_comment" OWNER TO ktn;

--
-- Name: Tickets_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: ktn
--

CREATE SEQUENCE "Tickets_comment_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Tickets_comment_id_seq" OWNER TO ktn;

--
-- Name: Tickets_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ktn
--

ALTER SEQUENCE "Tickets_comment_id_seq" OWNED BY "Tickets_comment".id;


--
-- Name: Tickets_status; Type: TABLE; Schema: public; Owner: ktn
--

CREATE TABLE "Tickets_status" (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(500) NOT NULL,
    created timestamp with time zone NOT NULL,
    active boolean DEFAULT true
);


ALTER TABLE "Tickets_status" OWNER TO ktn;

--
-- Name: Tickets_status_id_seq; Type: SEQUENCE; Schema: public; Owner: ktn
--

CREATE SEQUENCE "Tickets_status_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Tickets_status_id_seq" OWNER TO ktn;

--
-- Name: Tickets_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ktn
--

ALTER SEQUENCE "Tickets_status_id_seq" OWNED BY "Tickets_status".id;


--
-- Name: Tickets_ticket; Type: TABLE; Schema: public; Owner: ktn
--

CREATE TABLE "Tickets_ticket" (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    subject character varying(100) NOT NULL,
    urgency_id integer NOT NULL,
    tickettype_id integer NOT NULL,
    message text NOT NULL,
    created timestamp with time zone NOT NULL,
    active boolean DEFAULT true
);


ALTER TABLE "Tickets_ticket" OWNER TO ktn;

--
-- Name: Tickets_ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: ktn
--

CREATE SEQUENCE "Tickets_ticket_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Tickets_ticket_id_seq" OWNER TO ktn;

--
-- Name: Tickets_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ktn
--

ALTER SEQUENCE "Tickets_ticket_id_seq" OWNED BY "Tickets_ticket".id;


--
-- Name: Tickets_type; Type: TABLE; Schema: public; Owner: ktn
--

CREATE TABLE "Tickets_type" (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(500) NOT NULL,
    created timestamp with time zone NOT NULL,
    active boolean DEFAULT true
);


ALTER TABLE "Tickets_type" OWNER TO ktn;

--
-- Name: Tickets_type_id_seq; Type: SEQUENCE; Schema: public; Owner: ktn
--

CREATE SEQUENCE "Tickets_type_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Tickets_type_id_seq" OWNER TO ktn;

--
-- Name: Tickets_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ktn
--

ALTER SEQUENCE "Tickets_type_id_seq" OWNED BY "Tickets_type".id;


--
-- Name: Tickets_urgency; Type: TABLE; Schema: public; Owner: ktn
--

CREATE TABLE "Tickets_urgency" (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(500) NOT NULL,
    created timestamp with time zone NOT NULL,
    active boolean DEFAULT true
);


ALTER TABLE "Tickets_urgency" OWNER TO ktn;

--
-- Name: Tickets_urgency_id_seq; Type: SEQUENCE; Schema: public; Owner: ktn
--

CREATE SEQUENCE "Tickets_urgency_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Tickets_urgency_id_seq" OWNER TO ktn;

--
-- Name: Tickets_urgency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ktn
--

ALTER SEQUENCE "Tickets_urgency_id_seq" OWNED BY "Tickets_urgency".id;


--
-- Name: Users_token; Type: TABLE; Schema: public; Owner: ktn
--

CREATE TABLE "Users_token" (
    id integer NOT NULL,
    user_id integer NOT NULL,
    token character varying(100) NOT NULL,
    created timestamp with time zone NOT NULL
);


ALTER TABLE "Users_token" OWNER TO ktn;

--
-- Name: Users_token_id_seq; Type: SEQUENCE; Schema: public; Owner: ktn
--

CREATE SEQUENCE "Users_token_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Users_token_id_seq" OWNER TO ktn;

--
-- Name: Users_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ktn
--

ALTER SEQUENCE "Users_token_id_seq" OWNED BY "Users_token".id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: ktn
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO ktn;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ktn
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO ktn;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ktn
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: ktn
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO ktn;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ktn
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO ktn;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ktn
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: ktn
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO ktn;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: ktn
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO ktn;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ktn
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: ktn
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO ktn;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: ktn
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO ktn;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: ktn
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO ktn;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ktn
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ktn
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO ktn;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ktn
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: ktn
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO ktn;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ktn
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO ktn;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ktn
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: ktn
--

CREATE TABLE authtoken_token (
    key character varying(40) NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL
);


ALTER TABLE authtoken_token OWNER TO ktn;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: ktn
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO ktn;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: ktn
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO ktn;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ktn
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: ktn
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO ktn;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: ktn
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO ktn;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ktn
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: ktn
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO ktn;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: ktn
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO ktn;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ktn
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: ktn
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO ktn;

--
-- Name: users_token; Type: TABLE; Schema: public; Owner: ktn
--

CREATE TABLE users_token (
    id integer NOT NULL,
    token character varying(100) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE users_token OWNER TO ktn;

--
-- Name: users_token_id_seq; Type: SEQUENCE; Schema: public; Owner: ktn
--

CREATE SEQUENCE users_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_token_id_seq OWNER TO ktn;

--
-- Name: users_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ktn
--

ALTER SEQUENCE users_token_id_seq OWNED BY users_token.id;


--
-- Name: Ticket_comment id; Type: DEFAULT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY "Ticket_comment" ALTER COLUMN id SET DEFAULT nextval('"Ticket_comment_id_seq"'::regclass);


--
-- Name: Ticket_status id; Type: DEFAULT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY "Ticket_status" ALTER COLUMN id SET DEFAULT nextval('"Ticket_status_id_seq"'::regclass);


--
-- Name: Ticket_ticket id; Type: DEFAULT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY "Ticket_ticket" ALTER COLUMN id SET DEFAULT nextval('"Ticket_ticket_id_seq"'::regclass);


--
-- Name: Ticket_type id; Type: DEFAULT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY "Ticket_type" ALTER COLUMN id SET DEFAULT nextval('"Ticket_type_id_seq"'::regclass);


--
-- Name: Ticket_urgency id; Type: DEFAULT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY "Ticket_urgency" ALTER COLUMN id SET DEFAULT nextval('"Ticket_urgency_id_seq"'::regclass);


--
-- Name: Tickets_comment id; Type: DEFAULT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY "Tickets_comment" ALTER COLUMN id SET DEFAULT nextval('"Tickets_comment_id_seq"'::regclass);


--
-- Name: Tickets_status id; Type: DEFAULT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY "Tickets_status" ALTER COLUMN id SET DEFAULT nextval('"Tickets_status_id_seq"'::regclass);


--
-- Name: Tickets_ticket id; Type: DEFAULT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY "Tickets_ticket" ALTER COLUMN id SET DEFAULT nextval('"Tickets_ticket_id_seq"'::regclass);


--
-- Name: Tickets_type id; Type: DEFAULT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY "Tickets_type" ALTER COLUMN id SET DEFAULT nextval('"Tickets_type_id_seq"'::regclass);


--
-- Name: Tickets_urgency id; Type: DEFAULT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY "Tickets_urgency" ALTER COLUMN id SET DEFAULT nextval('"Tickets_urgency_id_seq"'::regclass);


--
-- Name: Users_token id; Type: DEFAULT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY "Users_token" ALTER COLUMN id SET DEFAULT nextval('"Users_token_id_seq"'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: users_token id; Type: DEFAULT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY users_token ALTER COLUMN id SET DEFAULT nextval('users_token_id_seq'::regclass);


--
-- Data for Name: Ticket_comment; Type: TABLE DATA; Schema: public; Owner: ktn
--

COPY "Ticket_comment" (id, active, comment, created, updated, tickets_id, user_id) FROM stdin;
1	t	New Test comment	2018-09-14 18:33:03+05:30	2018-09-14 18:33:05+05:30	1	2
2	t	hello how are you?	2018-09-15 11:17:38.081267+05:30	2018-09-15 11:17:38.081279+05:30	7	2
3	t	hello! how are you?	2018-09-15 11:18:12.476904+05:30	2018-09-15 11:18:12.476916+05:30	7	2
4	t	xxxx	2018-09-15 12:16:41.711943+05:30	2018-09-15 12:16:41.711955+05:30	7	2
5	t	test	2018-09-15 12:16:58.054413+05:30	2018-09-15 12:16:58.054422+05:30	7	2
6	t	xxx	2018-09-15 12:17:26.880483+05:30	2018-09-15 12:17:26.880495+05:30	7	2
7	t	hello how are you?	2018-09-15 12:17:34.675591+05:30	2018-09-15 12:17:34.675601+05:30	7	2
8	t	this is testing comments	2018-09-15 12:18:15.938287+05:30	2018-09-15 12:18:15.9383+05:30	7	2
9	t	Hi! how are you?\nThis is the test comments	2018-09-15 12:18:58.517063+05:30	2018-09-15 12:18:58.517072+05:30	9	2
10	t	xxx	2018-09-15 12:19:17.955663+05:30	2018-09-15 12:19:17.955676+05:30	8	2
11	t	gggg	2018-09-15 12:20:14.489612+05:30	2018-09-15 12:20:14.489621+05:30	8	2
12	t	ggg	2018-09-15 12:23:15.826245+05:30	2018-09-15 12:23:15.826255+05:30	16	2
13	t	xxx	2018-09-15 12:23:18.806124+05:30	2018-09-15 12:23:18.806136+05:30	16	2
14	t	33333 333	2018-09-15 12:23:31.487177+05:30	2018-09-15 12:23:31.487188+05:30	16	2
15	t	xxxx	2018-09-15 12:24:01.594166+05:30	2018-09-15 12:24:01.594178+05:30	15	2
16	t	hi ketan! how are you?	2018-09-15 12:25:02.944979+05:30	2018-09-15 12:25:02.944989+05:30	8	2
17	t	this is the xx comments, pleae ignore it	2018-09-15 12:25:48.57147+05:30	2018-09-15 12:25:48.571479+05:30	15	2
18	t	LAst comments	2018-09-15 18:43:15.584246+05:30	2018-09-15 18:43:15.584256+05:30	16	2
\.


--
-- Name: Ticket_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ktn
--

SELECT pg_catalog.setval('"Ticket_comment_id_seq"', 18, true);


--
-- Data for Name: Ticket_status; Type: TABLE DATA; Schema: public; Owner: ktn
--

COPY "Ticket_status" (id, name, description, active, created) FROM stdin;
1	Open	Open	t	2018-09-14 17:11:14+05:30
2	In Progress	In Progress	t	2018-09-14 17:11:36+05:30
3	Completed	Completed	t	2018-09-14 17:11:46+05:30
4	Rejected	Rejected	t	2018-09-14 17:11:54+05:30
\.


--
-- Name: Ticket_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ktn
--

SELECT pg_catalog.setval('"Ticket_status_id_seq"', 4, true);


--
-- Data for Name: Ticket_ticket; Type: TABLE DATA; Schema: public; Owner: ktn
--

COPY "Ticket_ticket" (id, name, email, subject, active, message, created, updated, status_id, tickettype_id, urgency_id, user_id) FROM stdin;
1	ketan	modi.ketan30@gmail.com	New Ticket	f	First App	2018-09-14 18:32:38+05:30	2018-09-14 20:39:03.458119+05:30	1	1	1	2
2	Niranjan	niranjan@gmail.com	Testing	f	how are you?	2018-09-14 19:28:51.994752+05:30	2018-09-14 20:41:46.553087+05:30	1	1	1	2
3	Niranjan	niranjan@gmail.com	test	f	test	2018-09-14 19:30:34.600136+05:30	2018-09-14 20:42:25.754873+05:30	1	1	1	2
4	Niranjan Kapadiya	niranjan@gmail.com	This is the second success ticket	f	this is the testing ticket, please ignore this ticket.	2018-09-14 19:35:27.948315+05:30	2018-09-14 20:42:32.22495+05:30	1	1	1	2
5	Niranjan Kapadiya	niranjan@gmail.com	This is the second success ticket	f	this is the testing ticket, please ignore this ticket.	2018-09-14 19:35:32.09661+05:30	2018-09-14 20:42:37.473718+05:30	1	1	1	2
6	Niranjan Kapadiya	niranjan@gmail.com	This is the second success ticket	f	this is the testing ticket, please ignore this ticket.	2018-09-14 19:35:40.25675+05:30	2018-09-14 20:42:42.151349+05:30	1	1	1	2
10	xxxx	xx@gmail.com	xxx	f	xxx xxx x x x  x xx xxxx x xjlkj x xklxj ;lkjx lxx	2018-09-14 19:53:55.012356+05:30	2018-09-14 20:42:49.108843+05:30	1	1	1	2
11	test	test@gmail.com	tst	f	test sdf asdfasdf	2018-09-14 19:54:24.712317+05:30	2018-09-14 20:42:57.610499+05:30	1	1	1	2
13	Test	niranjan@gmail.com	test	f	testing testing	2018-09-14 19:57:06.554984+05:30	2018-09-14 20:43:02.36374+05:30	1	1	1	2
12	aasdfasd	asasdf@gmail.com	sdfasd fasdf asdf	f	sdf sdfaskdf aslkdfjha slkdfjas;lkj;lksajf;lkasjfd	2018-09-14 19:55:03.520715+05:30	2018-09-14 20:43:06.919458+05:30	1	1	1	2
14	Niranjan Kapadiya	niranjan@gmail.com	Testing ticket	f	this is the testing ticket	2018-09-14 20:44:28.736753+05:30	2018-09-14 20:59:20.864132+05:30	2	1	1	2
16	Nelson	nela@gmail.com	this is testing	t	test	2018-09-15 10:38:32.88756+05:30	2018-09-15 10:41:39.462808+05:30	2	3	2	2
9	Niranjan Kapadiya	niranjan@gmail.com	Authorozed ticket	t	This ticket is created from logged user	2018-09-14 19:48:36.910754+05:30	2018-09-15 16:00:15.005904+05:30	2	1	1	2
7	Chirag Patelx	chigo1@gmail.comx	Ticket 3x	f	This is the last ticket, please ignore this x	2018-09-14 19:36:36.360616+05:30	2018-09-15 13:27:58.654453+05:30	2	1	2	2
17	Latest TIcket	nk@gmail.com	This is the latest ticket	f	Please ignore the ticket, it's for testing.	2018-09-15 18:42:46.493718+05:30	2018-09-15 18:42:55.330864+05:30	1	2	1	2
15	Niranjan	niranjan@gmail.com	Testing color	f	this is the feature request ticket	2018-09-15 10:35:59.590615+05:30	2018-09-15 18:43:04.11997+05:30	4	2	2	2
18	New Ticket	new@gmail.com	Test NEw	t	testing message! how are you?	2018-09-15 18:54:21.075678+05:30	2018-09-15 18:54:21.07573+05:30	1	1	1	2
8	Niranjan Kapadiya	niranjan@gmail.com	Ticket4	t	This is the testing ticket, please ignore this	2018-09-14 19:37:29.46221+05:30	2018-09-15 18:54:47.89606+05:30	1	2	1	2
\.


--
-- Name: Ticket_ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ktn
--

SELECT pg_catalog.setval('"Ticket_ticket_id_seq"', 18, true);


--
-- Data for Name: Ticket_type; Type: TABLE DATA; Schema: public; Owner: ktn
--

COPY "Ticket_type" (id, name, description, active, created) FROM stdin;
1	Bug Report	Bug Report	t	2018-09-14 17:12:13+05:30
2	Feature Request	Feature Request	t	2018-09-14 17:12:23+05:30
3	Other	Other	t	2018-09-14 17:12:32+05:30
\.


--
-- Name: Ticket_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ktn
--

SELECT pg_catalog.setval('"Ticket_type_id_seq"', 3, true);


--
-- Data for Name: Ticket_urgency; Type: TABLE DATA; Schema: public; Owner: ktn
--

COPY "Ticket_urgency" (id, name, description, active, created) FROM stdin;
1	Low	Low	t	2018-09-14 17:12:47+05:30
2	Mid	Mid	t	2018-09-14 17:12:55+05:30
3	High	High	t	2018-09-14 17:13:03+05:30
\.


--
-- Name: Ticket_urgency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ktn
--

SELECT pg_catalog.setval('"Ticket_urgency_id_seq"', 3, true);


--
-- Data for Name: Tickets_comment; Type: TABLE DATA; Schema: public; Owner: ktn
--

COPY "Tickets_comment" (id, user_id, tickets_id, comment, created, updated, active) FROM stdin;
\.


--
-- Name: Tickets_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ktn
--

SELECT pg_catalog.setval('"Tickets_comment_id_seq"', 1, false);


--
-- Data for Name: Tickets_status; Type: TABLE DATA; Schema: public; Owner: ktn
--

COPY "Tickets_status" (id, name, description, created, active) FROM stdin;
1	Open	Open	2018-09-14 19:58:50+05:30	t
2	In Progress	In Progress	2018-09-14 19:59:00+05:30	t
3	Completed	Completed	2018-09-14 19:59:12+05:30	t
4	Rejected	Rejected	2018-09-14 19:59:21+05:30	t
\.


--
-- Name: Tickets_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ktn
--

SELECT pg_catalog.setval('"Tickets_status_id_seq"', 4, true);


--
-- Data for Name: Tickets_ticket; Type: TABLE DATA; Schema: public; Owner: ktn
--

COPY "Tickets_ticket" (id, name, email, subject, urgency_id, tickettype_id, message, created, active) FROM stdin;
\.


--
-- Name: Tickets_ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ktn
--

SELECT pg_catalog.setval('"Tickets_ticket_id_seq"', 1, false);


--
-- Data for Name: Tickets_type; Type: TABLE DATA; Schema: public; Owner: ktn
--

COPY "Tickets_type" (id, name, description, created, active) FROM stdin;
1	Bug Report	Bug Report	2018-09-14 19:58:08+05:30	t
2	Feature Request	Feature Request	2018-09-14 19:58:21+05:30	t
3	Other	Other	2018-09-14 19:58:30+05:30	t
\.


--
-- Name: Tickets_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ktn
--

SELECT pg_catalog.setval('"Tickets_type_id_seq"', 3, true);


--
-- Data for Name: Tickets_urgency; Type: TABLE DATA; Schema: public; Owner: ktn
--

COPY "Tickets_urgency" (id, name, description, created, active) FROM stdin;
1	High Urgency	High Urgency	2018-09-14 19:56:02+05:30	t
2	Low Urgency	Low Urgency	2018-09-14 19:56:25+05:30	t
3	Medium Urgency	Medium Urgency	2018-09-14 19:57:48+05:30	t
\.


--
-- Name: Tickets_urgency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ktn
--

SELECT pg_catalog.setval('"Tickets_urgency_id_seq"', 3, true);


--
-- Data for Name: Users_token; Type: TABLE DATA; Schema: public; Owner: ktn
--

COPY "Users_token" (id, user_id, token, created) FROM stdin;
1	2	247ed57f-85c8-4241-9a3e-780a4d1993ed	2018-09-14 13:06:55.386501+05:30
2	2	5adac992-3b9e-45b8-b11f-2e06f98fe780	2018-09-14 13:13:01.470983+05:30
3	2	c0da6866-ac41-4203-85eb-73bacb5d79fc	2018-09-14 15:44:06.023654+05:30
\.


--
-- Name: Users_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ktn
--

SELECT pg_catalog.setval('"Users_token_id_seq"', 3, true);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: ktn
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ktn
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: ktn
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ktn
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: ktn
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add token	7	add_token
20	Can change token	7	change_token
21	Can delete token	7	delete_token
22	Can add token	8	add_token
23	Can change token	8	change_token
24	Can delete token	8	delete_token
25	Can add urgency	9	add_urgency
26	Can change urgency	9	change_urgency
27	Can delete urgency	9	delete_urgency
28	Can add type	10	add_type
29	Can change type	10	change_type
30	Can delete type	10	delete_type
31	Can add ticket	11	add_ticket
32	Can change ticket	11	change_ticket
33	Can delete ticket	11	delete_ticket
34	Can add status	12	add_status
35	Can change status	12	change_status
36	Can delete status	12	delete_status
37	Can add comment	13	add_comment
38	Can change comment	13	change_comment
39	Can delete comment	13	delete_comment
40	Can add token	14	add_token
41	Can change token	14	change_token
42	Can delete token	14	delete_token
43	Can add ticket	15	add_ticket
44	Can change ticket	15	change_ticket
45	Can delete ticket	15	delete_ticket
46	Can add comment	16	add_comment
47	Can change comment	16	change_comment
48	Can delete comment	16	delete_comment
49	Can add urgency	17	add_urgency
50	Can change urgency	17	change_urgency
51	Can delete urgency	17	delete_urgency
52	Can add status	18	add_status
53	Can change status	18	change_status
54	Can delete status	18	delete_status
55	Can add type	19	add_type
56	Can change type	19	change_type
57	Can delete type	19	delete_type
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ktn
--

SELECT pg_catalog.setval('auth_permission_id_seq', 57, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: ktn
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$36000$MtwdaKNmEOd1$0fpuYHiHS2YFb/pLqG35uBdLGG3fLCi1usbyR4RXzBs=	2018-09-14 12:00:41+05:30	f	modi.ketan30@gmail.com	ketan	modi	modi.ketan30@gmail.com	f	t	2018-09-14 12:00:41+05:30
1	pbkdf2_sha256$36000$EYnzVWyhcEV0$YbL27YShUH68eULvS/+GFuFpB7wI/Qgix2p3qE/gMRw=	2018-09-15 18:58:09.002112+05:30	t	ktn			ketan.kanhasoft@gmail.com	t	t	2018-09-14 11:54:38.990105+05:30
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: ktn
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ktn
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ktn
--

SELECT pg_catalog.setval('auth_user_id_seq', 2, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: ktn
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ktn
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: ktn
--

COPY authtoken_token (key, user_id, created) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: ktn
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
1	2018-09-14 12:00:41.754848+05:30	1	4	2	ketan	1	
2	2018-09-14 12:01:14.212496+05:30	1	4	2	ketan	2	Changed first_name, last_name and email.
3	2018-09-14 13:10:37.607958+05:30	1	4	2	modi.ketan30@gmail.com	2	Changed username.
4	2018-09-14 14:26:15.177021+05:30	1	9	1	Urgency object	1	
5	2018-09-14 14:26:28.234771+05:30	1	9	2	Urgency object	1	
6	2018-09-14 14:27:50.563322+05:30	1	9	3	Urgency object	1	
7	2018-09-14 14:28:09.479153+05:30	1	10	1	Type object	1	
8	2018-09-14 14:28:23.016512+05:30	1	10	2	Type object	1	
9	2018-09-14 14:28:32.165592+05:30	1	10	3	Type object	1	
10	2018-09-14 14:28:51.405114+05:30	1	12	1	Status object	1	
11	2018-09-14 14:29:01.460478+05:30	1	12	2	Status object	1	
12	2018-09-14 14:29:13.668909+05:30	1	12	3	Status object	1	
13	2018-09-14 14:29:23.275657+05:30	1	12	4	Status object	1	
14	2018-09-14 17:11:28.585825+05:30	1	18	1	Status object	1	[{"added": {}}]
15	2018-09-14 17:11:37.686228+05:30	1	18	2	Status object	1	[{"added": {}}]
16	2018-09-14 17:11:47.364118+05:30	1	18	3	Status object	1	[{"added": {}}]
17	2018-09-14 17:11:55.169383+05:30	1	18	4	Status object	1	[{"added": {}}]
18	2018-09-14 17:12:14.500407+05:30	1	19	1	Type object	1	[{"added": {}}]
19	2018-09-14 17:12:25.114083+05:30	1	19	2	Type object	1	[{"added": {}}]
20	2018-09-14 17:12:34.540185+05:30	1	19	3	Type object	1	[{"added": {}}]
21	2018-09-14 17:12:48.153381+05:30	1	17	1	Urgency object	1	[{"added": {}}]
22	2018-09-14 17:12:56.627082+05:30	1	17	2	Urgency object	1	[{"added": {}}]
23	2018-09-14 17:13:04.471282+05:30	1	17	3	Urgency object	1	[{"added": {}}]
24	2018-09-14 18:32:43.612105+05:30	1	15	1	Ticket object	1	[{"added": {}}]
25	2018-09-14 18:33:06.685171+05:30	1	16	1	Comment object	1	[{"added": {}}]
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ktn
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 25, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: ktn
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	authtoken	token
8	Users	token
9	Tickets	urgency
10	Tickets	type
11	Tickets	ticket
12	Tickets	status
13	Tickets	comment
14	users	token
15	Ticket	ticket
16	Ticket	comment
17	Ticket	urgency
18	Ticket	status
19	Ticket	type
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ktn
--

SELECT pg_catalog.setval('django_content_type_id_seq', 19, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: ktn
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-09-14 16:59:10.292386+05:30
2	auth	0001_initial	2018-09-14 16:59:10.419356+05:30
3	Ticket	0001_initial	2018-09-14 16:59:11.043142+05:30
4	admin	0001_initial	2018-09-14 16:59:11.143367+05:30
5	admin	0002_logentry_remove_auto_add	2018-09-14 16:59:11.220436+05:30
6	contenttypes	0002_remove_content_type_name	2018-09-14 16:59:11.292395+05:30
7	auth	0002_alter_permission_name_max_length	2018-09-14 16:59:11.326587+05:30
8	auth	0003_alter_user_email_max_length	2018-09-14 16:59:11.36994+05:30
9	auth	0004_alter_user_username_opts	2018-09-14 16:59:11.415939+05:30
10	auth	0005_alter_user_last_login_null	2018-09-14 16:59:11.456895+05:30
11	auth	0006_require_contenttypes_0002	2018-09-14 16:59:11.469985+05:30
12	auth	0007_alter_validators_add_error_messages	2018-09-14 16:59:11.505554+05:30
13	auth	0008_alter_user_username_max_length	2018-09-14 16:59:11.58834+05:30
14	authtoken	0001_initial	2018-09-14 16:59:11.640522+05:30
15	authtoken	0002_auto_20160226_1747	2018-09-14 16:59:11.79874+05:30
16	sessions	0001_initial	2018-09-14 16:59:11.817015+05:30
17	users	0001_initial	2018-09-14 16:59:11.954926+05:30
18	users	0002_token	2018-09-14 16:59:12.065511+05:30
19	users	0003_auto_20180914_1128	2018-09-14 16:59:12.141938+05:30
20	Ticket	0002_ticket_user	2018-09-14 19:45:33.926909+05:30
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ktn
--

SELECT pg_catalog.setval('django_migrations_id_seq', 20, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: ktn
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
wmc1pop9fotf5u01sqpawgdm5mcgyc3r	ZjM3MTQ0MGNlYmFiMThiYWE0MWU4ZDcwOWYwOTEwZGJmMTE3MDEzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2018-09-28 11:58:39.059657+05:30
wujgr46ygoycbz74px7rzw895miin9mu	NDZkNjhkOGYzZTg3OTkxNTczYmQzMWRkM2NjN2NjYTRkYWRiMjNmYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiMThlNmZmZWJhMmM2NjllYmVmNWEyNTc1NDRmYzllYjBiOGRjYjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-09-29 18:58:09.028973+05:30
\.


--
-- Data for Name: users_token; Type: TABLE DATA; Schema: public; Owner: ktn
--

COPY users_token (id, token, created, user_id) FROM stdin;
1	bcc8eb51-ab98-4540-8dea-e56e9f866983	2018-09-14 16:59:34.738183+05:30	2
2	1f6e536e-bf6c-44b6-9d79-603c689dbf6c	2018-09-14 17:02:19.78468+05:30	2
3	0a892cda-3f3c-4976-bfa6-48276c5e9474	2018-09-14 17:03:27.395626+05:30	2
4	f0c329f6-0af4-4ec6-b2a9-a5fc5d1dc4c1	2018-09-14 17:07:20.667324+05:30	2
5	48c1b299-4b5b-4527-9ee9-7794e8cf7cda	2018-09-14 17:07:40.521676+05:30	2
6	5d59b29a-1e1b-4620-80e8-618b6b977e05	2018-09-14 17:08:26.174467+05:30	2
7	c8ae1a91-c646-47f0-ba51-bcf6384f2e0d	2018-09-14 17:08:41.955999+05:30	2
8	fc18d928-342a-49c4-8131-c3743f12db69	2018-09-14 17:09:31.976091+05:30	2
9	ad50a8b7-eaa1-456d-a08b-c4a7474b32fd	2018-09-14 17:10:55.869841+05:30	2
10	a003af99-e1d5-4c6c-85ba-31a3afb0c078	2018-09-14 17:11:07.216844+05:30	2
11	1fa6554f-3ca4-4a0d-ae63-305b089f1796	2018-09-14 17:11:46.092548+05:30	2
12	f9af058f-c060-42c6-8cbe-3283aef3f1e9	2018-09-14 17:18:21.898474+05:30	2
13	847ded7c-b646-4fc1-b5e7-c93c00ec4826	2018-09-14 17:21:05.433912+05:30	2
14	f1c6417c-3b51-4788-82a9-39e14c7ea014	2018-09-14 17:23:15.450114+05:30	2
15	4cafba65-055e-4a4d-99b3-949605127f52	2018-09-14 17:23:38.631729+05:30	2
16	8c7bb800-4f82-4d3c-90a0-8a0dbe3bca5c	2018-09-14 17:24:30.698223+05:30	2
17	86480537-596d-43f3-8c75-bc891476c7df	2018-09-14 17:24:39.792526+05:30	2
18	d67b9a97-3b90-4174-a59f-1d9b16688a5e	2018-09-14 17:25:29.836725+05:30	2
19	13ec2fbd-e490-4820-9da8-b439685a8e64	2018-09-14 17:26:39.583648+05:30	2
20	c802a207-5634-4b51-97dd-bb5ffb2ea313	2018-09-14 17:31:04.756775+05:30	2
21	50e3af9c-e3d9-4712-a6fb-86f57331f9e8	2018-09-14 18:48:37.04909+05:30	2
22	313bd56f-c251-4755-ab45-39df818861ac	2018-09-14 18:57:07.753493+05:30	2
34	40be1b30-724f-4cf3-b24f-43f42706aad3	2018-09-15 18:43:26.39582+05:30	2
23	3448194a-395f-4273-a1a9-6582426c8cb4	2018-09-14 19:28:51.891595+05:30	2
24	8caccb89-2e81-4ddf-8079-3f1ec2276c6d	2018-09-14 19:32:10.007012+05:30	2
25	74f11704-3d8a-4ecb-b9cf-babce6127c9d	2018-09-14 19:54:24.694872+05:30	2
26	4f43d59e-e78a-4129-aa4a-d35f3dc44469	2018-09-14 19:57:06.518585+05:30	2
27	e2ee687e-4f1a-4202-a057-d387d4c2e6af	2018-09-14 20:01:28.317342+05:30	2
28	a55b8711-d4cd-4410-b016-d1ef90fb6bcc	2018-09-14 20:04:45.128206+05:30	2
30	889d9650-425b-43ce-a5cd-3c90dc6e489d	2018-09-14 21:03:50.955633+05:30	2
31	3c9fc9e9-b62a-44d6-a1ec-90141457b848	2018-09-15 10:18:13.265945+05:30	2
35	5cbddd1a-7931-458d-b41d-4de9b282f687	2018-09-15 18:55:12.278717+05:30	2
32	7725d681-864b-4231-9d82-5719a12b4e33	2018-09-15 13:33:46.668102+05:30	2
33	7e3bebd5-a711-4937-99b0-6bfa55e68dae	2018-09-15 16:16:01.846496+05:30	2
29	2d6da893-09e2-4e54-b174-c735256c1149	2018-09-14 20:59:25.43858+05:30	2
\.


--
-- Name: users_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ktn
--

SELECT pg_catalog.setval('users_token_id_seq', 35, true);


--
-- Name: Ticket_comment Ticket_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY "Ticket_comment"
    ADD CONSTRAINT "Ticket_comment_pkey" PRIMARY KEY (id);


--
-- Name: Ticket_status Ticket_status_pkey; Type: CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY "Ticket_status"
    ADD CONSTRAINT "Ticket_status_pkey" PRIMARY KEY (id);


--
-- Name: Ticket_ticket Ticket_ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY "Ticket_ticket"
    ADD CONSTRAINT "Ticket_ticket_pkey" PRIMARY KEY (id);


--
-- Name: Ticket_type Ticket_type_pkey; Type: CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY "Ticket_type"
    ADD CONSTRAINT "Ticket_type_pkey" PRIMARY KEY (id);


--
-- Name: Ticket_urgency Ticket_urgency_pkey; Type: CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY "Ticket_urgency"
    ADD CONSTRAINT "Ticket_urgency_pkey" PRIMARY KEY (id);


--
-- Name: Tickets_comment Tickets_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY "Tickets_comment"
    ADD CONSTRAINT "Tickets_comment_pkey" PRIMARY KEY (id);


--
-- Name: Tickets_status Tickets_status_pkey; Type: CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY "Tickets_status"
    ADD CONSTRAINT "Tickets_status_pkey" PRIMARY KEY (id);


--
-- Name: Tickets_ticket Tickets_ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY "Tickets_ticket"
    ADD CONSTRAINT "Tickets_ticket_pkey" PRIMARY KEY (id);


--
-- Name: Tickets_type Tickets_type_pkey; Type: CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY "Tickets_type"
    ADD CONSTRAINT "Tickets_type_pkey" PRIMARY KEY (id);


--
-- Name: Tickets_urgency Tickets_urgency_pkey; Type: CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY "Tickets_urgency"
    ADD CONSTRAINT "Tickets_urgency_pkey" PRIMARY KEY (id);


--
-- Name: Users_token Users_token_pkey; Type: CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY "Users_token"
    ADD CONSTRAINT "Users_token_pkey" PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: users_token users_token_pkey; Type: CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY users_token
    ADD CONSTRAINT users_token_pkey PRIMARY KEY (id);


--
-- Name: Ticket_comment_tickets_id_86142a28; Type: INDEX; Schema: public; Owner: ktn
--

CREATE INDEX "Ticket_comment_tickets_id_86142a28" ON "Ticket_comment" USING btree (tickets_id);


--
-- Name: Ticket_comment_user_id_9b9afa33; Type: INDEX; Schema: public; Owner: ktn
--

CREATE INDEX "Ticket_comment_user_id_9b9afa33" ON "Ticket_comment" USING btree (user_id);


--
-- Name: Ticket_ticket_status_id_b0d1f338; Type: INDEX; Schema: public; Owner: ktn
--

CREATE INDEX "Ticket_ticket_status_id_b0d1f338" ON "Ticket_ticket" USING btree (status_id);


--
-- Name: Ticket_ticket_tickettype_id_5bbc31f8; Type: INDEX; Schema: public; Owner: ktn
--

CREATE INDEX "Ticket_ticket_tickettype_id_5bbc31f8" ON "Ticket_ticket" USING btree (tickettype_id);


--
-- Name: Ticket_ticket_urgency_id_c761c46d; Type: INDEX; Schema: public; Owner: ktn
--

CREATE INDEX "Ticket_ticket_urgency_id_c761c46d" ON "Ticket_ticket" USING btree (urgency_id);


--
-- Name: Ticket_ticket_user_id_c1c90ead; Type: INDEX; Schema: public; Owner: ktn
--

CREATE INDEX "Ticket_ticket_user_id_c1c90ead" ON "Ticket_ticket" USING btree (user_id);


--
-- Name: Tickets_comment_tickets_id; Type: INDEX; Schema: public; Owner: ktn
--

CREATE INDEX "Tickets_comment_tickets_id" ON "Tickets_comment" USING btree (tickets_id);


--
-- Name: Tickets_comment_user_id; Type: INDEX; Schema: public; Owner: ktn
--

CREATE INDEX "Tickets_comment_user_id" ON "Tickets_comment" USING btree (user_id);


--
-- Name: Tickets_ticket_tickettype_id; Type: INDEX; Schema: public; Owner: ktn
--

CREATE INDEX "Tickets_ticket_tickettype_id" ON "Tickets_ticket" USING btree (tickettype_id);


--
-- Name: Tickets_ticket_urgency_id; Type: INDEX; Schema: public; Owner: ktn
--

CREATE INDEX "Tickets_ticket_urgency_id" ON "Tickets_ticket" USING btree (urgency_id);


--
-- Name: Users_token_user_id; Type: INDEX; Schema: public; Owner: ktn
--

CREATE INDEX "Users_token_user_id" ON "Users_token" USING btree (user_id);


--
-- Name: auth_group_name_like; Type: INDEX; Schema: public; Owner: ktn
--

CREATE INDEX auth_group_name_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: ktn
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: ktn
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: ktn
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: ktn
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: ktn
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: ktn
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: ktn
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_like; Type: INDEX; Schema: public; Owner: ktn
--

CREATE INDEX auth_user_username_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_like; Type: INDEX; Schema: public; Owner: ktn
--

CREATE INDEX authtoken_token_key_like ON authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: ktn
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: ktn
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: ktn
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_like; Type: INDEX; Schema: public; Owner: ktn
--

CREATE INDEX django_session_session_key_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: users_token_user_id_af964690; Type: INDEX; Schema: public; Owner: ktn
--

CREATE INDEX users_token_user_id_af964690 ON users_token USING btree (user_id);


--
-- Name: Ticket_comment Ticket_comment_tickets_id_86142a28_fk_Ticket_ticket_id; Type: FK CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY "Ticket_comment"
    ADD CONSTRAINT "Ticket_comment_tickets_id_86142a28_fk_Ticket_ticket_id" FOREIGN KEY (tickets_id) REFERENCES "Ticket_ticket"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Ticket_comment Ticket_comment_user_id_9b9afa33_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY "Ticket_comment"
    ADD CONSTRAINT "Ticket_comment_user_id_9b9afa33_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Ticket_ticket Ticket_ticket_status_id_b0d1f338_fk_Ticket_status_id; Type: FK CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY "Ticket_ticket"
    ADD CONSTRAINT "Ticket_ticket_status_id_b0d1f338_fk_Ticket_status_id" FOREIGN KEY (status_id) REFERENCES "Ticket_status"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Ticket_ticket Ticket_ticket_tickettype_id_5bbc31f8_fk_Ticket_type_id; Type: FK CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY "Ticket_ticket"
    ADD CONSTRAINT "Ticket_ticket_tickettype_id_5bbc31f8_fk_Ticket_type_id" FOREIGN KEY (tickettype_id) REFERENCES "Ticket_type"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Ticket_ticket Ticket_ticket_urgency_id_c761c46d_fk_Ticket_urgency_id; Type: FK CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY "Ticket_ticket"
    ADD CONSTRAINT "Ticket_ticket_urgency_id_c761c46d_fk_Ticket_urgency_id" FOREIGN KEY (urgency_id) REFERENCES "Ticket_urgency"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Ticket_ticket Ticket_ticket_user_id_c1c90ead_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY "Ticket_ticket"
    ADD CONSTRAINT "Ticket_ticket_user_id_c1c90ead_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Tickets_comment Tickets_comment_tickets_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY "Tickets_comment"
    ADD CONSTRAINT "Tickets_comment_tickets_id_fkey" FOREIGN KEY (tickets_id) REFERENCES "Tickets_ticket"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Tickets_comment Tickets_comment_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY "Tickets_comment"
    ADD CONSTRAINT "Tickets_comment_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Tickets_ticket Tickets_ticket_tickettype_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY "Tickets_ticket"
    ADD CONSTRAINT "Tickets_ticket_tickettype_id_fkey" FOREIGN KEY (tickettype_id) REFERENCES "Tickets_type"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Tickets_ticket Tickets_ticket_urgency_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY "Tickets_ticket"
    ADD CONSTRAINT "Tickets_ticket_urgency_id_fkey" FOREIGN KEY (urgency_id) REFERENCES "Tickets_urgency"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Users_token Users_token_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY "Users_token"
    ADD CONSTRAINT "Users_token_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log content_type_id_refs_id_93d2d1f8; Type: FK CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT content_type_id_refs_id_93d2d1f8 FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission content_type_id_refs_id_d043b34a; Type: FK CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_d043b34a FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions group_id_refs_id_f4b32aac; Type: FK CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_f4b32aac FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups user_id_refs_id_40c41112; Type: FK CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_40c41112 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions user_id_refs_id_4dc23c39; Type: FK CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_4dc23c39 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log user_id_refs_id_c0d12874; Type: FK CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT user_id_refs_id_c0d12874 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_token users_token_user_id_af964690_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ktn
--

ALTER TABLE ONLY users_token
    ADD CONSTRAINT users_token_user_id_af964690_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

