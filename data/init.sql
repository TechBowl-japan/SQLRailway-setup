SET GLOBAL local_infile=on;

CREATE DATABASE IF NOT EXISTS sql_railway;

USE sql_railway;

CREATE TABLE users (
  id int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  name varchar(256) NOT NULL COMMENT 'ユーザー名',
  birthday date COMMENT '生年月日',
  gender enum('男', '女') COMMENT '性別',
  age int COMMENT '年齢',
  created_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  PRIMARY KEY (id)
);

CREATE TABLE players (
  id int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  name varchar(256) NOT NULL COMMENT 'プレイヤー名',
  team enum('A', 'B', 'C') NOT NULL COMMENT '所属チーム名',
  created_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  PRIMARY KEY (id)
);

CREATE TABLE students (
  id int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  name varchar(256) NOT NULL COMMENT '名前',
  school_level int NOT NULL COMMENT '学年',
  created_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  PRIMARY KEY (id)
);

CREATE TABLE grades (
  subject varchar(256) NOT NULL COMMENT '科目',
  user_id int NOT NULL COMMENT 'ユーザーID',
  created_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  PRIMARY KEY (subject, user_id),
  FOREIGN KEY (user_id)
  REFERENCES users(id)
);

CREATE TABLE purchase_histories(
  id int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  user_id int NOT NULL COMMENT 'ユーザーID',
  product_name varchar(256) NOT NULL COMMENT '製品名',
  product_category varchar(256) COMMENT '製品カテゴリ',
  price int COMMENT '価格',
  purchased_at datetime COMMENT '購入日',
  created_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  PRIMARY KEY (id),
  FOREIGN KEY (user_id)
  REFERENCES users(id)
);

CREATE TABLE fruits (
    id int NOT NULL AUTO_INCREMENT COMMENT 'ID',
    name varchar(256) NOT NULL COMMENT '名前',
    created_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (id)
);

LOAD DATA LOCAL INFILE '/content/SQLRailway-setup/data/users.csv'
INTO TABLE users
FIELDS TERMINATED BY ',' (id, name, birthday, gender, age);

LOAD DATA LOCAL INFILE '/content/SQLRailway-setup/data/fruits.csv'
INTO TABLE fruits
FIELDS TERMINATED BY ',' (id, name);

LOAD DATA LOCAL INFILE '/content/SQLRailway-setup/data/grades.csv'
INTO TABLE grades
FIELDS TERMINATED BY ',' (subject, user_id);

LOAD DATA LOCAL INFILE '/content/SQLRailway-setup/data/players.csv'
INTO TABLE players
FIELDS TERMINATED BY ',' (id, name, team);

LOAD DATA LOCAL INFILE '/content/SQLRailway-setup/data/players.csv'
INTO TABLE players
FIELDS TERMINATED BY ',' (id, name, team);

LOAD DATA LOCAL INFILE '/content/SQLRailway-setup/data/purchase_histories.csv'
INTO TABLE purchase_histories
FIELDS TERMINATED BY ',' (id, user_id, product_name, product_category, price, purchased_at);

LOAD DATA LOCAL INFILE '/content/SQLRailway-setup/data/students.csv'
INTO TABLE students
FIELDS TERMINATED BY ',' (id, name, school_level);

