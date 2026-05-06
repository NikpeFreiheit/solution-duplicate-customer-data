create table applications (
    id integer,
    src_system integer,
    appl_number integer,
    appl_date date,
    PRIMARY KEY (id)
);

create table persons (
    id integer,
    applications_id integer,
    first_name text,
    last_name text,
    SSN text,
    PRIMARY KEY (id),
    FOREIGN KEY (applications_id) REFERENCES applications (id) ON DELETE CASCADE
);

create table contacts (
    id integer,
    person_id integer,
    client_phones text,
    addresses text,
    emails text,
    PRIMARY KEY (id),
    FOREIGN KEY (person_id) REFERENCES persons (id) ON DELETE CASCADE
);

create table contracts(
    id integer,
    applications_id integer,
    person_id integer,
    contract_number text,
    amount double precision,
    PRIMARY KEY (id),
    FOREIGN KEY (applications_id) REFERENCES applications (id) ON DELETE CASCADE,
    FOREIGN KEY (person_id) REFERENCES persons (id) ON DELETE CASCADE
)