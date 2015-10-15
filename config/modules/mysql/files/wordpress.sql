DROP TABLE IF EXISTS users;

CREATE TABLE users 
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255),
	body TEXT
);

INSERT INTO users
(
	id, name, body
) 
VALUES 
(
	default, "WANDI", "THIS IS WANDI"
);


INSERT INTO users
(
	id, name, body
) 
VALUES 
(
	default, "WERNER", "THIS ISNT WERNER"
);