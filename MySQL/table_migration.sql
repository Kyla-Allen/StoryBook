USE storybook_db;

Create Table users (
  id INT UNSIGNED AUTO_INCREMENT,
  username VARCHAR(100),
  password VARCHAR(100),
  role_id INT,
  PRIMARY KEY (id)
);

CREATE TABLE roles (
  id INT UNSIGNED AUTO_INCREMENT,
  role VARCHAR(75),
  PRIMARY KEY (id)
);

CREATE TABLE stories (
  id INT UNSIGNED AUTO_INCREMENT,
  user_id INT UNSIGNED,
  genre_id INT UNSIGNED,
  title VARCHAR(150),
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (genre_id) REFERENCES genres(id)
);

CREATE TABLE chapters (
  id INT UNSIGNED AUTO_INCREMENT,
  story_id INT UNSIGNED,
  title VARCHAR(200),
  content text,
  PRIMARY KEY (id),
  FOREIGN KEY (story_id) REFERENCES stories(id)
);

CREATE TABLE genres (
  id INT UNSIGNED AUTO_INCREMENT,
  genre VARCHAR(75),
  PRIMARY KEY (id)
);

CREATE TABLE comments (
  id INT UNSIGNED AUTO_INCREMENT,
  story_id INT UNSIGNED,
  user_id INT UNSIGNED,
  PRIMARY KEY (id),
  FOREIGN KEY (story_id) REFERENCES stories(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE favorites (
  story_id INT UNSIGNED,
  user_id INT UNSIGNED,
  FOREIGN KEY (story_id) REFERENCES stories(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);