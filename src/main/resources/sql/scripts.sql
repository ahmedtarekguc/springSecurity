CREATE TABLE IF NOT EXISTS public.users
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    username text COLLATE pg_catalog."default" NOT NULL,
    password text COLLATE pg_catalog."default" NOT NULL,
    enabled integer NOT NULL,
    CONSTRAINT users_pkey PRIMARY KEY (id)
    )

    TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.users
    OWNER to postgres;

CREATE TABLE IF NOT EXISTS public.authorities
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    username text COLLATE pg_catalog."default" NOT NULL,
    authority text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT authorities_pkey PRIMARY KEY (id)
    )

    TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.authorities
    OWNER to postgres;


CREATE TABLE IF NOT EXISTS public.customer
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    email text COLLATE pg_catalog."default" NOT NULL,
    password text COLLATE pg_catalog."default" NOT NULL,
    role text NOT NULL,
    CONSTRAINT users_pkey PRIMARY KEY (id)
    )

    TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.customer
    OWNER to postgres;

insert into users(username, password, enabled) values('happy','12345',1)
    insert into authorities(username,authority) values('happy','write')