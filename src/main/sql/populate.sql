INSERT INTO users(id,username,password,enabled) VALUES (1,'guest','guest', TRUE);
INSERT INTO users(id,username,password,enabled) VALUES (2,'admin','admin', TRUE);

INSERT INTO user_roles (id,userid, authority) VALUES (1,1, 'ROLE_USER');
INSERT INTO user_roles (id,userid, authority) VALUES (2,2, 'ROLE_ADMIN');
INSERT INTO user_roles (id,userid, authority) VALUES (3,2, 'ROLE_USER');