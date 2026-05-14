create table persons (
    id bigserial primary key,
    src_system smallint not null, --Indicates the originating system. Value is determined in MongoDB before migration: 0 = API Gateway, 1 = CRM System.
    first_name text not null,
    last_name text not null,
    SSN text
);

create table applications (
    id bigserial primary key,
    person_id bigint not null,
    src_system smallint not null, --Indicates the originating system. Value is determined in MongoDB before migration: 0 = API Gateway, 1 = CRM System.
    appl_number integer not null,
    appl_date timestamp not null,
    FOREIGN KEY (person_id) REFERENCES persons(id) ON DELETE CASCADE
);

create table client_phones (
    id bigserial primary key,
    person_id bigint not null,
    src_system smallint not null, --Indicates the originating system. Value is determined in MongoDB before migration: 0 = API Gateway, 1 = CRM System.
    phone_number text not null,
    phone_type text,
    FOREIGN KEY (person_id) REFERENCES persons(id) ON DELETE CASCADE,
    CONSTRAINT unique_person_phone UNIQUE(person_id, phone_number)
);

create table client_addresses(
    id bigserial primary key,
    person_id bigint not null,
    src_system smallint not null, --Indicates the originating system. Value is determined in MongoDB before migration: 0 = API Gateway, 1 = CRM System.
    address text not null,
    FOREIGN KEY (person_id) REFERENCES persons(id) ON DELETE CASCADE
);

create table client_emails(
    id bigserial primary key,
    person_id bigint not null,
    src_system smallint not null, --Indicates the originating system. Value is determined in MongoDB before migration: 0 = API Gateway, 1 = CRM System.
    email text not null,
    FOREIGN KEY (person_id) REFERENCES persons(id) ON DELETE CASCADE,
    CONSTRAINT unique_person_email UNIQUE(person_id, email)
);

create table contracts(
    id bigserial primary key,
    applications_id bigint not null,
    person_id bigint not null,
    src_system smallint not null, --Indicates the originating system. Value is determined in MongoDB before migration: 0 = API Gateway, 1 = CRM System.
    contract_id text,
    amount decimal(15, 4),
    FOREIGN KEY (applications_id) REFERENCES applications(id) ON DELETE CASCADE,
    FOREIGN KEY (person_id) REFERENCES persons(id) ON DELETE CASCADE
);

create table deduplication_queue (
    id bigserial primary key,
    target_person_id bigint,
    candidate_person_id bigint, -- Used when Scenario 2 detects a match between two existing persons.
    src_system smallint not null, --Indicates the originating system. Value is determined in MongoDB before migration: 0 = API Gateway, 1 = CRM System.
    raw_candidate_data json,
    match_scenario smallint,
    status text default 'pending', -- pending, approved, rejected
    created_at timestamp default now(),
    FOREIGN KEY (target_person_id) REFERENCES persons(id) ON DELETE CASCADE,
    FOREIGN KEY (candidate_person_id) REFERENCES persons(id) ON DELETE CASCADE
);