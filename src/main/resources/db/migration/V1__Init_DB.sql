create sequence hibernate_sequence start 1 increment 1;

create table book (
    id int4 not null,
    book_name varchar(60),
    author varchar(60),
    review varchar(4056) not null,
    user_id int4,
    primary key (id)
);

create table user_role (
    user_id int4 not null,
    roles varchar(255)
);

create table usr (
    id int4 not null,
    activation_code varchar(255),
    active boolean not null,
    email varchar(255),
    password varchar(255) not null,
    username varchar(255) not null,
    primary key (id)
);

alter table if exists book
    add constraint book_user_fk
    foreign key (user_id) references usr;

alter table if exists user_role
    add constraint user_role_user_fk
    foreign key (user_id) references usr;