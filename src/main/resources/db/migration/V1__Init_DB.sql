create table book (
    id integer not null,
    book_name varchar(60),
    review varchar(400),
    user_id integer,
    primary key (id)
    )
    engine=InnoDB;

create table hibernate_sequence (
    next_val bigint
    )
    engine=InnoDB;

insert into hibernate_sequence values ( 1 );

insert into hibernate_sequence values ( 1 );

create table user (
    id integer not null,
    activation_code varchar(255),
    active bit not null,
    email varchar(255),
    password varchar(255) not null,
    username varchar(255) not null,
    primary key (id)
    ) engine=InnoDB;

create table user_role (
    user_id integer not null,
    roles varchar(255)
    ) engine=InnoDB;

alter table book
    add constraint book_user_fk
    foreign key (user_id) references user (id);

alter table user_role
    add constraint user_role_user_fk
    foreign key (user_id) references user (id)