SELECT setval('user_id_seq', 10, true);
SELECT setval('role_id_seq', 10, true);


-- all passwords are 12345

INSERT INTO "role"(id,name)
VALUES
(0,'superadmin'),
(1,'admin'),
(2,'client'),
(3,'user'),
(4,'admin-print'),
(5,'admin-sticker'),
(6,'admin-tracker'),
(7,'webapi');


INSERT INTO "user"(id, name, email, password) VALUES (1, 'superadmin','superadmin@email.com', '$2a$08$Hys9hzza605zZVKNJvdiBe9bHfdB4JKFnG8douGv53IW4e9M5cKrW');
INSERT INTO "user"(id, name, email, password) VALUES (2, 'webapi-1','no email', 'no password');
INSERT INTO "user"(id, name, email, password) VALUES (3, 'admin-tracker','admin-tracker@email.com', '$2a$08$Hys9hzza605zZVKNJvdiBe9bHfdB4JKFnG8douGv53IW4e9M5cKrW');
INSERT INTO "user"(id, name, email, password) VALUES (4, 'admin','admin@email.com', '$2a$08$Hys9hzza605zZVKNJvdiBe9bHfdB4JKFnG8douGv53IW4e9M5cKrW');



-- role: superadmin                                     user:
INSERT INTO "user_role" ( user_id, role_id) VALUES (1, 0); -- superadmin

-- role: webapi                                         user:
INSERT INTO "user_role" ( user_id, role_id) VALUES (2, 7); -- webapi-1

-- role: admintracker                                         user:
INSERT INTO "user_role" ( user_id, role_id) VALUES (3, 6); -- admin-tracker

-- role: admin
INSERT INTO "user_role" ( user_id, role_id) VALUES (4, 1); -- admin

-- usuario da API
-- que tem acesso aos endpoints 'publicos'
INSERT INTO user_session(user_id,api_key,valid_for_ip,valid_until)
VALUES (2, 'p01IpoDpNjPAzB8azQVTcK7v450u1EAjlnFu0J0DPbDz6uuMVgSsFst8wDRF17v9qOcGP8mK6wJfAOMwnRDMhHmsnK84Tma20kdC', null, '2020-01-01');


-- estados/paises/cidades
INSERT INTO "country" (name, name_url, created_by) VALUES ('Brasil', 'brasil', 1); -- default country

--insert brazilian states
insert into state (name,uf,country_id, created_by) values ('Goiás','GO',1, 1);
insert into state (name,uf,country_id, created_by) values ('Mato Grosso','MT',1, 1);
insert into state (name,uf,country_id, created_by) values ('Mato Grosso do Sul','MS',1, 1);
insert into state (name,uf,country_id, created_by) values ('Distrito Federal','DF',1, 1);
insert into state (name,uf,country_id, created_by) values ('Amazonas','AM',1, 1);
insert into state (name,uf,country_id, created_by) values ('Acre','AC',1, 1);
insert into state (name,uf,country_id, created_by) values ('Rondônia','RO',1, 1);
insert into state (name,uf,country_id, created_by) values ('Roraima','RR',1, 1);
insert into state (name,uf,country_id, created_by) values ('Amapá','AP',1, 1);
insert into state (name,uf,country_id, created_by) values ('Tocantins','TO',1, 1);
insert into state (name,uf,country_id, created_by) values ('Pará','PA',1, 1);
insert into state (name,uf,country_id, created_by) values ('Maranhão','MA',1, 1);
insert into state (name,uf,country_id, created_by) values ('Piauí', 'PI',1, 1);
insert into state (name,uf,country_id, created_by) values ('Ceará', 'CE',1, 1);
insert into state (name,uf,country_id, created_by) values ('Rio Grande do Norte', 'RN',1, 1);
insert into state (name,uf,country_id, created_by) values ('Paraíba', 'PB',1, 1);
insert into state (name,uf,country_id, created_by) values ('Pernambuco',  'PE',1, 1);
insert into state (name,uf,country_id, created_by) values ('Sergipe', 'SE',1, 1);
insert into state (name,uf,country_id, created_by) values ('Alagoas', 'AL',1, 1);
insert into state (name,uf,country_id, created_by) values ('Bahia', 'BA',1, 1);
insert into state (name,uf,country_id, created_by) values ('São Paulo','SP',1, 1);
insert into state (name,uf,country_id, created_by) values ('Minas Gerais', 'MG',1, 1);
insert into state (name,uf,country_id, created_by) values ('Rio de Janeiro','RJ',1, 1);
insert into state (name,uf,country_id, created_by) values ('Espírito Santo', 'ES',1, 1);
insert into state (name,uf,country_id, created_by) values ('Paraná','PR',1, 1);
insert into state (name,uf,country_id, created_by) values ('Santa Catarina','SC',1, 1);
insert into state (name,uf,country_id, created_by) values ('Rio Grande do Sul','RS',1, 1);

INSERT INTO "city" (name, state_id, country_id, name_url) VALUES ('São paulo', 1, 1, 'sao-paulo'); -- insert default city



