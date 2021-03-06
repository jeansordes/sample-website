drop database if exists :db_name;
create database :db_name default character set utf8mb4 collate utf8mb4_general_ci;
use :db_name;

create or replace table _enum_user_role (
    description varchar(50) not null primary key
);
insert into _enum_user_role(description) values ('admin');
insert into _enum_user_role(description) values ('normal_user');

create or replace table users (
    id_user int(11) primary key not null auto_increment,
    user_role varchar(50) not null,
    email varchar(200) default null unique,
    password_hash text not null,
    last_user_update time not null default current_timestamp(),
    constraint
        foreign key (user_role) references _enum_user_role(description)
);

-- admin account (admin_php_starter@yopmail.com:admin)
insert into users(email, password_hash, user_role) values ('admin_php_starter@yopmail.com', '$2y$12$hA2wxJZhBLdHPJPQHQA.2e.sSUOqI/HAndSH8/9LD9WHn.cZ8qfz2', 'admin');

select 'Query done';