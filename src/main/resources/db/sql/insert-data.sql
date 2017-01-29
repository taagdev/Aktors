INSERT INTO users VALUES (1, 'Alexey', 'Filippov' ,'58414411', 'Estonia', 'Tartu mnt');
INSERT INTO users VALUES (2, 'Keidi', 'V.','54141414', 'Estonia', 'A.H Tammsaare');
INSERT INTO users VALUES (3, 'Kris', 'Predbann','5954414' , 'Estonia', 'Tartu mnt');
INSERT INTO products VALUES (123, 'Piim', 2.45, 'Piim', '01/30/2017');
INSERT INTO products VALUES (1234, 'Hapukoor', 2.55, 'Hapukoor', '01/30/2017');
INSERT INTO products VALUES (12345, 'Pepsi', 2.65, 'Pepsi Co 1.5L', '01/30/2017');

INSERT INTO orders (price, userId, productId, productQuantity, orderingDate, productName) VALUES (2.45, 1, 123, 2, '2014-11-22 12:45:34', 'Piim');
INSERT INTO orders (price, userId, productId, productQuantity, productName) VALUES (2.55, 2, 1234, 3, 'Hapukoor');
INSERT INTO orders (price, userId, productId, productQuantity, orderingDate, productName) VALUES (2.65, 1, 12345, 2, '2011-11-22 12:45:34', 'Pepsi');
INSERT INTO orders (price, userId, productId, productQuantity, orderingDate, productName) VALUES (2.65, 1, 12345, 2, '2008-11-22 12:45:34', 'Pepsi');
INSERT INTO orders (price, userId, productId, productQuantity, orderingDate, productName) VALUES (2.55, 1, 1234, 2, '2008-11-22 12:45:34', 'Hapukoor');
INSERT INTO orders (price, userId, productId, productQuantity, orderingDate, productName) VALUES (2.65, 1, 12345, 2, '2015-11-22 12:45:34', 'Pepsi');
