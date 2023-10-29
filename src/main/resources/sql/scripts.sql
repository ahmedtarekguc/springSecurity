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


CREATE TABLE IF NOT EXISTS public.accounts
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    customer_id integer NOT NULL REFERENCES customer(id),
    account_number integer NOT NULL,
    account_type text COLLATE pg_catalog."default" NOT NULL,
    branch_address text COLLATE pg_catalog."default" NOT NULL,
    created_date date NOT NULL,
    CONSTRAINT accounts_pkey PRIMARY KEY (id)
    )

    TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.accounts
    OWNER to postgres;


CREATE TABLE IF NOT EXISTS public.accounts
(
    customer_id integer NOT NULL,
    account_number integer NOT NULL,
    account_type text COLLATE pg_catalog."default" NOT NULL,
    branch_address text COLLATE pg_catalog."default" NOT NULL,
    created_date date NOT NULL,
    CONSTRAINT account_numbers_pkey PRIMARY KEY (account_number),
    CONSTRAINT accounts_customer_id_fkey FOREIGN KEY (customer_id)
    REFERENCES public.customer (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    )

    TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.accounts
    OWNER to postgres;


CREATE TABLE IF NOT EXISTS public.account_transactions
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    transaction_id text NOT NULL,
    account_number integer NOT NULL REFERENCES accounts(account_number),
    customer_id integer NOT NULL REFERENCES customer(id),
    transaction_type text COLLATE pg_catalog."default" NOT NULL,
    transaction_summary text COLLATE pg_catalog."default" NOT NULL,
    transaction_date date NOT NULL,
    transaction_amount integer NOT NULL,
    closing_balance integer NOT NULL,
    created_date date NOT NULL,
    CONSTRAINT account_transactions_pkey PRIMARY KEY (id)
    )

    TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.account_transactions
    OWNER to postgres;


CREATE TABLE IF NOT EXISTS public.cards
(
    card_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    card_number text COLLATE pg_catalog."default" NOT NULL,
    customer_id integer NOT NULL REFERENCES customer(id),
    card_type text COLLATE pg_catalog."default" NOT NULL,
    total_limit integer NOT NULL,
    amount_used integer NOT NULL,
    available_amount integer NOT NULL,
    created_date date NOT NULL,
    CONSTRAINT cards_pkey PRIMARY KEY (card_id)
    )

    TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.cards
    OWNER to postgres;



CREATE TABLE IF NOT EXISTS public.loans
(
    loan_number integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    loan_type text COLLATE pg_catalog."default" NOT NULL,
    customer_id integer NOT NULL REFERENCES customer(id),
    total_loan integer NOT NULL,
    amount_paid integer NOT NULL,
    outstanding_amount integer NOT NULL,
    start_date date NOT NULL,
    create_date date NOT NULL,
    CONSTRAINT loans_pkey PRIMARY KEY (loan_number)
    )

    TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.loans
    OWNER to postgres;






CREATE TABLE IF NOT EXISTS public.notice_details
(
    notice_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    notice_summary text COLLATE pg_catalog."default" NOT NULL,
    notice_details text COLLATE pg_catalog."default" NOT NULL,
    notic_beg_date date NOT NULL,
    notic_end_date date DEFAULT NULL,
    create_dt date DEFAULT NULL,
    update_dt date DEFAULT NULL,
    CONSTRAINT notice_details_pkey PRIMARY KEY (notice_id)
    )

    TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.notice_details
    OWNER to postgres;




CREATE TABLE IF NOT EXISTS public.contact_messages
(
    contact_id text COLLATE pg_catalog."default" NOT NULL,
    contact_name text COLLATE pg_catalog."default" NOT NULL,
    contact_email text COLLATE pg_catalog."default" NOT NULL,
    subject text COLLATE pg_catalog."default" NOT NULL,
    message text COLLATE pg_catalog."default" NOT NULL,
    created_date date NOT NULL,
    CONSTRAINT contact_messages_pkey PRIMARY KEY (contact_id)
    )

    TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.contact_messages
    OWNER to postgres;


insert into users(username, password, enabled) values('happy','12345',1)
    insert into authorities(username,authority) values('happy','write')


INSERT INTO customer (name,email,mobile_number, password, role,created_date)
VALUES ('Happy','happy@example.com','9876548337', '$2y$12$oRRbkNfwuR8ug4MlzH5FOeui.//1mkd.RsOAJMbykTSupVy.x/vb2', 'admin',current_date);


INSERT INTO accounts (customer_id,account_number,account_type, branch_address,created_date)
VALUES (5,1865764534,'Savings', 'New Cairo',current_date);


INSERT INTO account_transactions ( account_number, customer_id, transaction_date, transaction_summary, transaction_type,transaction_amount,
                                   closing_balance, created_date)  VALUES ( 1865764534, 5, CURRENT_DATE - INTERVAL '7 days', 'Coffee Shop', 'Withdrawal', 30,34500,CURRENT_DATE - INTERVAL '7 days');

INSERT INTO account_transactions ( account_number, customer_id, transaction_date, transaction_summary, transaction_type,transaction_amount,
                                   closing_balance, created_date)  VALUES ( 1865764534, 5, CURRENT_DATE - INTERVAL '6 days', 'Uber', 'Withdrawal', 100,34400,CURRENT_DATE - INTERVAL '6 days');

INSERT INTO account_transactions ( account_number, customer_id, transaction_date, transaction_summary, transaction_type,transaction_amount,
                                   closing_balance, created_date)  VALUES ( 1865764534, 5, CURRENT_DATE - INTERVAL '5 days', 'Self Deposit', 'Deposit', 500,34900,CURRENT_DATE - INTERVAL '5 days');

INSERT INTO account_transactions ( account_number, customer_id, transaction_date, transaction_summary, transaction_type,transaction_amount,
                                   closing_balance, created_date)  VALUES ( 1865764534, 5, CURRENT_DATE - INTERVAL '4 days', 'Ebay', 'Withdrawal', 600,34300,CURRENT_DATE - INTERVAL '4 days');

INSERT INTO account_transactions ( account_number, customer_id, transaction_date, transaction_summary, transaction_type,transaction_amount,
                                   closing_balance, created_date)  VALUES ( 1865764534, 5, CURRENT_DATE - INTERVAL '2 days', 'OnlineTransfer', 'Deposit', 700,35000,CURRENT_DATE - INTERVAL '2 days');


INSERT INTO account_transactions ( account_number, customer_id, transaction_date, transaction_summary, transaction_type,transaction_amount,
                                   closing_balance, created_date)  VALUES ( 1865764534, 5, CURRENT_DATE - INTERVAL '1 days', 'Amazon.com', 'Withdrawal', 100,34900,CURRENT_DATE - INTERVAL '1 days');


INSERT INTO loans  (  customer_id ,  start_date ,  loan_type ,  total_loan ,  amount_paid ,  outstanding_amount ,  created_date )
VALUES ( 5, '2020-10-13', 'Home', 200000, 50000, 150000, '2020-10-13');

INSERT INTO  loans  (  customer_id ,  start_date ,  loan_type ,  total_loan ,  amount_paid ,  outstanding_amount ,  created_date )
VALUES ( 5, '2020-06-06', 'Vehicle', 40000, 10000, 30000, '2020-06-06');

INSERT INTO  loans  (  customer_id ,  start_date ,  loan_type ,  total_loan ,  amount_paid ,  outstanding_amount ,  created_date )
VALUES ( 5, '2018-02-14', 'Home', 50000, 10000, 40000, '2018-02-14');

INSERT INTO  loans  (  customer_id ,  start_date ,  loan_type ,  total_loan ,  amount_paid ,  outstanding_amount ,  created_date )
VALUES ( 5, '2018-02-14', 'Personal', 10000, 3500, 6500, '2018-02-14');



INSERT INTO  cards  ( card_number ,  customer_id ,  card_type ,  total_limit ,  amount_used ,  available_amount ,  created_date )
VALUES ('4565XXXX4656', 5, 'Credit', 10000, 500, 9500, CURRENT_DATE);

INSERT INTO cards (card_number, customer_id,  card_type ,  total_limit ,  amount_used ,  available_amount ,  created_date )
VALUES ('3455XXXX8673', 5, 'Credit', 7500, 600, 6900, CURRENT_DATE);

INSERT INTO cards (card_number, customer_id,  card_type ,  total_limit ,  amount_used ,  available_amount ,  created_date )
VALUES ('2359XXXX9346', 5, 'Credit', 20000, 4000, 16000, CURRENT_DATE);


INSERT INTO notice_details ( notice_summary,  notice_details ,  notic_beg_date ,  notic_end_date ,  created_date ,  updated_date )
VALUES ('Home Loan Interest rates reduced', 'Home loan interest rates are reduced as per the goverment guidelines. The updated rates will be effective immediately',
        CURRENT_DATE - INTERVAL '30 days', CURRENT_DATE + INTERVAL '30 days', CURRENT_DATE, null);

INSERT INTO notice_details ( notice_summary, notice_details, notic_beg_date, notic_end_date, created_date, updated_date)
VALUES ('Net Banking Offers', 'Customers who will opt for Internet banking while opening a saving account will get a $50 amazon voucher',
        CURRENT_DATE - INTERVAL '30 days', CURRENT_DATE + INTERVAL '30 days', CURRENT_DATE, null);

INSERT INTO  notice_details  (  notice_summary ,  notice_details ,  notic_beg_date ,  notic_end_date ,  created_date ,  updated_date )
VALUES ('Mobile App Downtime', 'The mobile application of the EazyBank will be down from 2AM-5AM on 12/05/2020 due to maintenance activities',
        CURRENT_DATE - INTERVAL '30 days', CURRENT_DATE + INTERVAL '30 days', CURRENT_DATE, null);

INSERT INTO  notice_details  (  notice_summary ,  notice_details ,  notic_beg_date ,  notic_end_date ,  created_date ,  updated_date )
VALUES ('E Auction notice', 'There will be a e-auction on 12/08/2020 on the Bank website for all the stubborn arrears.Interested parties can participate in the e-auction',
        CURRENT_DATE - INTERVAL '30 days', CURRENT_DATE + INTERVAL '30 days', CURRENT_DATE, null);

INSERT INTO  notice_details  (  notice_summary ,  notice_details ,  notic_beg_date ,  notic_end_date ,  created_date ,  updated_date )
VALUES ('Launch of Millennia Cards', 'Millennia Credit Cards are launched for the premium customers of EazyBank. With these cards, you will get 5% cashback for each purchase',
        CURRENT_DATE - INTERVAL '30 days', CURRENT_DATE + INTERVAL '30 days', CURRENT_DATE, null);

INSERT INTO  notice_details  (  notice_summary ,  notice_details ,  notic_beg_date ,  notic_end_date ,  created_date ,  updated_date )
VALUES ('COVID-19 Insurance', 'EazyBank launched an insurance policy which will cover COVID-19 expenses. Please reach out to the branch for more details',
        CURRENT_DATE - INTERVAL '30 days', CURRENT_DATE + INTERVAL '30 days', CURRENT_DATE, null);