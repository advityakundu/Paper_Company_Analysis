--
-- Name: accounts; Type: TABLE; Schema: public;-
--

CREATE TABLE public.accounts (
    id integer NOT NULL,
    name character varying NOT NULL,
    website character varying,
    lat numeric,
    long numeric,
    primary_poc character varying,
    sales_rep_id integer
);


--
-- Name: orders; Type: TABLE; Schema: public;-
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    account_id integer NOT NULL,
    occurred_at timestamp without time zone NOT NULL,
    standard_qty integer,
    gloss_qty integer,
    poster_qty integer,
    total integer,
    standard_amt_usd numeric,
    gloss_amt_usd numeric,
    poster_amt_usd numeric,
    total_amt_usd numeric
);


--
-- Name: region; Type: TABLE; Schema: public;-
--

CREATE TABLE public.region (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- Name: sales_reps; Type: TABLE; Schema: public;-
--

CREATE TABLE public.sales_reps (
    id integer NOT NULL,
    name character varying NOT NULL,
    region_id integer NOT NULL
);


--
-- Name: web_events; Type: TABLE; Schema: public;-
--

CREATE TABLE public.web_events (
    id integer NOT NULL,
    account_id integer NOT NULL,
    occurred_at timestamp without time zone NOT NULL,
    channel character varying NOT NULL
);


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public;-
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public;-
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: region region_pkey; Type: CONSTRAINT; Schema: public;-
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (id);


--
-- Name: sales_reps sales_reps_pkey; Type: CONSTRAINT; Schema: public;-
--

ALTER TABLE ONLY public.sales_reps
    ADD CONSTRAINT sales_reps_pkey PRIMARY KEY (id);


--
-- Name: web_events web_events_pkey; Type: CONSTRAINT; Schema: public;-
--

ALTER TABLE ONLY public.web_events
    ADD CONSTRAINT web_events_pkey PRIMARY KEY (id);


--
-- Name: accounts accounts_sales_rep_id_fkey; Type: FK CONSTRAINT; Schema: public;-
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_sales_rep_id_fkey FOREIGN KEY (sales_rep_id) REFERENCES public.sales_reps(id) ON DELETE CASCADE;


--
-- Name: orders orders_account_id_fkey; Type: FK CONSTRAINT; Schema: public;-
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.accounts(id) ON DELETE CASCADE;


--
-- Name: sales_reps sales_reps_region_id_fkey; Type: FK CONSTRAINT; Schema: public;-
--

ALTER TABLE ONLY public.sales_reps
    ADD CONSTRAINT sales_reps_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.region(id) ON DELETE CASCADE;


--
-- Name: web_events web_events_account_id_fkey; Type: FK CONSTRAINT; Schema: public;-
--

ALTER TABLE ONLY public.web_events
    ADD CONSTRAINT web_events_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.accounts(id) ON DELETE CASCADE;
