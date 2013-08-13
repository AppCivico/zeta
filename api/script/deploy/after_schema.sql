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



-- role: superadmin                                     user:
INSERT INTO "user_role" ( user_id, role_id) VALUES (1, 0); -- superadmin

-- role: webapi                                         user:
INSERT INTO "user_role" ( user_id, role_id) VALUES (2, 7); -- webapi-1

-- role: admintracker                                         user:
INSERT INTO "user_role" ( user_id, role_id) VALUES (3, 6); -- admin-tracker
-- usuario da API
-- que tem acesso aos endpoints 'publicos'
INSERT INTO user_session(user_id,api_key,valid_for_ip,valid_until)
VALUES (2, 'p01IpoDpNjPAzB8azQVTcK7v450u1EAjlnFu0J0DPbDz6uuMVgSsFst8wDRF17v9qOcGP8mK6wJfAOMwnRDMhHmsnK84Tma20kdC', null, '2020-01-01');


-- estados/paises/cidades
INSERT INTO "country" (name, name_url, created_by) VALUES ('Brazil', 'brazil', 1); -- default country
INSERT INTO "state" (name, created_by, country_id, uf) VALUES ('Sao paulo',1, 1, 'SP'); -- default country
INSERT INTO "city" (name, state_id, country_id) VALUES ('Sao paulo', 1, 1); -- default country




