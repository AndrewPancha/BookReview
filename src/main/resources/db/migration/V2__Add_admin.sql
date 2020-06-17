insert into user (id, username, password, active)
    values (1, 'admin', '123', true);

insert user_role (user_id, roles)
    values (1, 'USER'), (1, 'ADMIN');