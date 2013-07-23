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
(6,'admin-tracker');


INSERT INTO "user"(id, name, email, password) VALUES (1, 'superadmin','superadmin@email.com', '$2a$08$Hys9hzza605zZVKNJvdiBe9bHfdB4JKFnG8douGv53IW4e9M5cKrW');



-- role: superadmin                                     user:
INSERT INTO "user_role" ( user_id, role_id) VALUES (1, 0); -- superadmin






