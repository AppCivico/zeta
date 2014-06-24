--SELECT setval('user_id_seq', 10, true);
--SELECT setval('role_id_seq', 10, true);


-- all passwords are 12345

INSERT INTO "role"(id,name)
VALUES
(0,'superadmin'),
(1,'admin'),
(2,'organization'),
(3,'user'),
(4,'webapi');


INSERT INTO "user"(id, name, email, password) VALUES (1, 'superadmin','superadmin@email.com', '$2a$08$Hys9hzza605zZVKNJvdiBe9bHfdB4JKFnG8douGv53IW4e9M5cKrW');
INSERT INTO "user"(id, name, email, password) VALUES (2, 'webapi-1','no email', 'no password');
INSERT INTO "user"(id, name, email, password) VALUES (3, 'admin','admin@email.com', '$2a$08$Hys9hzza605zZVKNJvdiBe9bHfdB4JKFnG8douGv53IW4e9M5cKrW');



-- role: superadmin                                     user:
INSERT INTO "user_role" ( user_id, role_id) VALUES (1, 0); -- superadmin

-- role: webapi                                         user:
INSERT INTO "user_role" ( user_id, role_id) VALUES (2, 4); -- webapi-1

-- role: admin
INSERT INTO "user_role" ( user_id, role_id) VALUES (3, 1); -- admin

-- usuario da AZeta
-- que tem acesso aos endpoints 'publicos'
INSERT INTO user_session(user_id,api_key,valid_for_ip,valid_until)
VALUES (2, 'p01IpoDpNjPAzB8azQVTcK7v450u1EAjlnFu0J0DPbDz6uuMVgSsFst8wDRF17v9qOcGP8mK6wJfAOMwnRDMhHmsnK84Tma20kdC', null, '2020-01-01');


-- estados/paises/cidades
INSERT INTO "country" (name, acronym, name_url) VALUES ('Brasil', 'BR', 'brasil'); -- default country


