--DROP TABLE users IF EXISTS;

CREATE TABLE users (
  id         INTEGER PRIMARY KEY,
  name VARCHAR(30),
  secondname VARCHAR(30),
  phonenumber  VARCHAR(30),
  country VARCHAR(30),
  address VARCHAR(50),
);
CREATE TABLE products (
barcode         INTEGER PRIMARY KEY,
 name VARCHAR(30),
 price DOUBLE,
 description VARCHAR(50),
 releaseDate VARCHAR(30),
);
CREATE TABLE orders (
  id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
  price DOUBLE,
  userId INTEGER,
  orderingDate DATETIME DEFAULT CURRENT_TIMESTAMP,
  productId INTEGER,
  productQuantity INTEGER,
  productName VARCHAR(30),
--   FOREIGN KEY (productId) REFERENCES products(barcode),
  FOREIGN KEY (userId) REFERENCES users(id) ON DELETE CASCADE ,
)



