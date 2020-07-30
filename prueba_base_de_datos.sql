{\rtf1\ansi\ansicpg1252\cocoartf1561\cocoasubrtf610
{\fonttbl\f0\fnil\fcharset0 Monaco;}
{\colortbl;\red255\green255\blue255;\red242\green242\blue242;\red0\green0\blue0;}
{\*\expandedcolortbl;;\csgray\c95825;\csgray\c0\c85000;}
\margl1440\margr1440\vieww13860\viewh17220\viewkind0
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\f0\fs20 \cf2 \cb3 \CocoaLigature0 (base) felipes-MacBook-Air:~ felipeletelier$ psql\
psql (12.3)\
Type "help" for help.\
\
\
felipeletelier=# CREATE DATABASE prueba;\
CREATE DATABASE\
\
felipeletelier=# \\c prueba;\
You are now connected to database "prueba" as user "felipeletelier".\
prueba=# CREATE TABLE cliente(\
prueba(# id SERIAL PRIMARY KEY,\
prueba(# nombre_cliente VARCHAR(50),\
prueba(# direccion_cliente VARCHAR(200)\
prueba(# );\
CREATE TABLE\
\
prueba=# CREATE TABLE factura(\
prueba(# numero_factura SERIAL PRIMARY KEY,\
prueba(# fecha_factura VARCHAR(50),\
prueba(# id_cliente INT REFERENCES cliente(id) \
prueba(# );\
CREATE TABLE\
\
prueba=# CREATE TABLE categorias(\
prueba(# id SERIAL PRIMARY KEY,\
prueba(# nombre_categoria VARCHAR(50),\
prueba(# descripcion VARCHAR(300)\
prueba(# );\
CREATE TABLE\
\
prueba=# CREATE TABLE item(\
id SERIAL PRIMARY KEY,\
nombre_item VARCHAR(50),\
valor_item INT,\
descripcion VARCHAR(200),\
id_categoria INT REFERENCES categorias(id)\
);\
CREATE TABLE\
\
prueba=# CREATE TABLE factura_item(\
prueba(# numero_factura INT REFERENCES factura(numero_factura),\
prueba(# numero_item INT REFERENCES item(id)\
prueba(# );\
CREATE TABLE\
\
prueba=# SELECT * FROM cliente;\
 id | nombre_cliente | direccion_cliente \
----+----------------+-------------------\
(0 rows)\
\
\
prueba=# SELECT * FROM factura;\
 numero_factura | fecha_factura | id_cliente \
----------------+---------------+------------\
(0 rows)\
\
\
prueba=# SELECT * FROM categorias;\
 id | nombre_categoria | descripcion \
----+------------------+-------------\
(0 rows)\
\
\
prueba=# SELECT * FROM item;\
 id | nombre_item | valor_item | descripcion | id_categoria \
----+-------------+------------+-------------+--------------\
(0 rows)\
\
\
prueba=# SELECT * FROM factura_item;\
 numero_factura | numero_item \
----------------+-------------\
(0 rows)\
\
\
prueba=# INSERT INTO cliente(nombre_cliente) VALUES ('Pablo');\
INSERT 0 1\
\
prueba=# DELETE FROM cliente WHERE nombre_cliente='Pablo';\
DELETE 1\
\
prueba=# INSERT INTO cliente(nombre_cliente,direccion_cliente) VALUES ('Pablo','Apoquindo 1111');\
INSERT 0 1\
\
prueba=# INSERT INTO cliente(nombre_cliente,direccion_cliente) VALUES ('Fernanda','Las Cruces 4456');\
INSERT 0 1\
\
prueba=# INSERT INTO cliente(nombre_cliente,direccion_cliente) VALUES ('Jose','Camino Real 5050');\
INSERT 0 1\
\
prueba=# INSERT INTO cliente(nombre_cliente,direccion_cliente) VALUES ('Fransisca','Pedro de Valdivia 3344');\
INSERT 0 1\
\
prueba=# INSERT INTO cliente(nombre_cliente,direccion_cliente) VALUES ('Juan','Los Lagos 4567');\
INSERT 0 1\
\
prueba=# SELECT * FROM cliente;\
 id | nombre_cliente |   direccion_cliente    \
----+----------------+------------------------\
  2 | Pablo          | Apoquindo 1111\
  3 | Fernanda       | Las Cruces 4456\
  4 | Jose           | Camino Real 5050\
  5 | Fransisca      | Pedro de Valdivia 3344\
  6 | Juan           | Los Lagos 4567\
(5 rows)\
\
prueba=# INSERT INTO item(nombre_item,valor_item,descripcion) VALUES ('mesa','100000','mesa de madera pintada negra');\
INSERT 0 1\
\
prueba=# INSERT INTO item(nombre_item,valor_item,descripcion) VALUES ('silla','30000','silla sin respaldo');\
INSERT 0 1\
\
prueba=# INSERT INTO item(nombre_item,valor_item,descripcion) VALUES ('plato','2000','plato de fondo blanco');\
INSERT 0 1\
\
prueba=# INSERT INTO item(nombre_item,valor_item,descripcion) VALUES ('mouse','10000','mouse marca Green-e verde');INSERT 0 1\
\
prueba=# INSERT INTO item(nombre_item,valor_item,descripcion) VALUES ('teclado inalambrico','25000','teclado inalambrico que se carga via usb');\
INSERT 0 1\
\
prueba=# INSERT INTO item(nombre_item,valor_item,descripcion) VALUES ('cuaderno','2500','cuaderno cuadriculado marca torre');\
INSERT 0 1\
\
prueba=# INSERT INTO item(nombre_item,valor_item,descripcion) VALUES ('lapiz','1000','portamina 0.5');\
INSERT 0 1\
\
prueba=# INSERT INTO item(nombre_item,valor_item,descripcion) VALUES ('disco duro','80000','disco duro externo 1 tera');\
INSERT 0 1\
\
prueba=# \
prueba=# SELECT * FROM item;\
 id |     nombre_item     | valor_item |               descripcion                | id_categoria \
----+---------------------+------------+------------------------------------------+--------------\
  1 | mesa                |     100000 | mesa de madera pintada negra             |             \
  2 | silla               |      30000 | silla sin respaldo                       |             \
  3 | plato               |       2000 | plato de fondo blanco                    |             \
  4 | mouse               |      10000 | mouse marca Green-e verde                |             \
  5 | teclado inalambrico |      25000 | teclado inalambrico que se carga via usb |             \
  6 | cuaderno            |       2500 | cuaderno cuadriculado marca torre        |             \
  7 | lapiz               |       1000 | portamina 0.5                            |             \
  8 | disco duro          |      80000 | disco duro externo 1 tera                |             \
(8 rows)\
\
prueba=# INSERT INTO categorias(nombre_categoria,descripcion)VALUES('living/comedor','todo lo que necesitas para tu hogar');\
INSERT 0 1\
\
prueba=# INSERT INTO categorias(nombre_categoria,descripcion)VALUES('libreria','materiales para el colegio y oficina');\
INSERT 0 1\
\
prueba=# INSERT INTO categorias(nombre_categoria,descripcion)VALUES('digital','todo lo que necesitas para tu computador');\
INSERT 0 1\
\
prueba=# SELECT * FROM categorias;\
 id | nombre_categoria |               descripcion                \
----+------------------+------------------------------------------\
  1 | living/comedor   | todo lo que necesitas para tu hogar\
  2 | libreria         | materiales para el colegio y oficina\
  3 | digital          | todo lo que necesitas para tu computador\
(3 rows)\
\
\
prueba=# UPDATE item SET id_categoria=1 WHERE nombre_item='mesa';\
UPDATE 1\
\
prueba=# UPDATE item SET id_categoria=1 WHERE nombre_item='silla';\
UPDATE 1\
\
prueba=# UPDATE item SET id_categoria=1 WHERE nombre_item='plato';\
UPDATE 1\
\
prueba=# UPDATE item SET id_categoria=3 WHERE nombre_item='mouse';\
UPDATE 1\
\
prueba=# UPDATE item SET id_categoria=3 WHERE nombre_item='teclado inalambrico';\
UPDATE 1\
\
prueba=# UPDATE item SET id_categoria=3 WHERE nombre_item='disco duro';\
UPDATE 1\
\
prueba=# UPDATE item SET id_categoria=2 WHERE nombre_item='cuaderno';\
UPDATE 1\
\
prueba=# UPDATE item SET id_categoria=2 WHERE nombre_item='lapiz';\
UPDATE 1\
\
prueba=# SELECT * FROM item;\
 id |     nombre_item     | valor_item |               descripcion                | id_categoria \
----+---------------------+------------+------------------------------------------+--------------\
  1 | mesa                |     100000 | mesa de madera pintada negra             |            1\
  2 | silla               |      30000 | silla sin respaldo                       |            1\
  3 | plato               |       2000 | plato de fondo blanco                    |            1\
  4 | mouse               |      10000 | mouse marca Green-e verde                |            3\
  5 | teclado inalambrico |      25000 | teclado inalambrico que se carga via usb |            3\
  8 | disco duro          |      80000 | disco duro externo 1 tera                |            3\
  6 | cuaderno            |       2500 | cuaderno cuadriculado marca torre        |            2\
  7 | lapiz               |       1000 | portamina 0.5                            |            2\
(8 rows)\
\
prueba=# INSERT INTO factura(fecha_factura,id_cliente)VALUES('29-07-2020',2);\
INSERT 0 1\
\
prueba=# INSERT INTO factura(fecha_factura,id_cliente)VALUES('10-05-2020',6);\
INSERT 0 1\
\
prueba=# INSERT INTO factura(fecha_factura,id_cliente)VALUES('10-06-2019',6);\
INSERT 0 1\
\
prueba=# INSERT INTO factura(fecha_factura,id_cliente)VALUES('04-03-2019',4);\
INSERT 0 1\
\
prueba=# INSERT INTO factura(fecha_factura,id_cliente)VALUES('12-03-2019',4);\
INSERT 0 1\
\
prueba=# INSERT INTO factura(fecha_factura,id_cliente)VALUES('20-07-2019',5);\
INSERT 0 1\
\
prueba=# INSERT INTO factura(fecha_factura,id_cliente)VALUES('20-07-2019',3);\
INSERT 0 1\
\
prueba=# INSERT INTO factura(fecha_factura,id_cliente)VALUES('15-12-2018',3);\
INSERT 0 1\
\
prueba=# INSERT INTO factura(fecha_factura,id_cliente)VALUES('15-12-2017',2);\
INSERT 0 1\
\
prueba=# INSERT INTO factura(fecha_factura,id_cliente)VALUES('11-08-2017',5);\
INSERT 0 1\
\
prueba=# SELECT * FROM factura;\
 numero_factura | fecha_factura | id_cliente \
----------------+---------------+------------\
              1 | 29-07-2020    |          2\
              2 | 10-05-2020    |          6\
              3 | 10-06-2019    |          6\
              4 | 04-03-2019    |          4\
              5 | 12-03-2019    |          4\
              6 | 20-07-2019    |          5\
              7 | 20-07-2019    |          3\
              8 | 15-12-2018    |          3\
              9 | 15-12-2017    |          2\
             10 | 11-08-2017    |          5\
(10 rows)\
\
prueba=# UPDATE factura SET id_cliente=2 WHERE fecha_factura='10-05-2020';\
UPDATE 1\
\
prueba=# UPDATE factura SET id_cliente=3 WHERE fecha_factura='10-06-2019';\
UPDATE 1\
\
prueba=# UPDATE factura SET id_cliente=3 WHERE fecha_factura='04-03-2019';\
UPDATE 1\
\
prueba=# UPDATE factura SET id_cliente=3 WHERE fecha_factura='12-03-2019';\
UPDATE 1\
\
prueba=# UPDATE factura SET id_cliente=4 WHERE fecha_factura='12-03-2019';\
UPDATE 1\
\
prueba=# UPDATE factura SET id_cliente=3 WHERE fecha_factura='12-03-2019';\
UPDATE 1\
\
prueba=# UPDATE factura SET id_cliente=5 WHERE numero_factura='7';\
UPDATE 1\
\
prueba=# UPDATE factura SET id_cliente=5 WHERE numero_factura='7';\
UPDATE 1\
prueba=# UPDATE factura SET id_cliente=5 WHERE numero_factura='8';\
UPDATE 1\
prueba=# UPDATE factura SET id_cliente=5 WHERE numero_factura='9';\
UPDATE 1\
prueba=# UPDATE factura SET id_cliente=5 WHERE numero_factura='10';\
UPDATE 1\
\
prueba=# SELECT * FROM factura;\
 numero_factura | fecha_factura | id_cliente \
----------------+---------------+------------\
              1 | 29-07-2020    |          2\
              2 | 10-05-2020    |          2\
              3 | 10-06-2019    |          3\
              4 | 04-03-2019    |          3\
              5 | 12-03-2019    |          3\
              6 | 20-07-2019    |          4\
              7 | 20-07-2019    |          5\
              8 | 15-12-2018    |          5\
              9 | 15-12-2017    |          5\
             10 | 11-08-2017    |          5\
(10 rows)\
\
prueba=# INSERT INTO factura_item(numero_factura,numero_item)VALUES(1,1);\
INSERT 0 1\
\
prueba=# INSERT INTO factura_item(numero_factura,numero_item)VALUES(1,2);\
INSERT 0 1\
\
prueba=# INSERT INTO factura_item(numero_factura,numero_item)VALUES(2,2);\
INSERT 0 1\
\
prueba=# INSERT INTO factura_item(numero_factura,numero_item)VALUES(2,3);\
INSERT 0 1\
\
prueba=# INSERT INTO factura_item(numero_factura,numero_item)VALUES(2,2);\
INSERT 0 1\
\
prueba=# INSERT INTO factura_item(numero_factura,numero_item)VALUES(3,5);\
INSERT 0 1\
\
prueba=# INSERT INTO factura_item(numero_factura,numero_item)VALUES(3,6);\
INSERT 0 1\
\
prueba=# INSERT INTO factura_item(numero_factura,numero_item)VALUES(3,8);\
INSERT 0 1\
\
prueba=# INSERT INTO factura_item(numero_factura,numero_item)VALUES(4,1);\
INSERT 0 1\
\
prueba=# INSERT INTO factura_item(numero_factura,numero_item)VALUES(4,2);\
INSERT 0 1\
\
prueba=# INSERT INTO factura_item(numero_factura,numero_item)VALUES(5,7);\
INSERT 0 1\
\
prueba=# INSERT INTO factura_item(numero_factura,numero_item)VALUES(5,6);\
INSERT 0 1\
\
prueba=# INSERT INTO factura_item(numero_factura,numero_item)VALUES(5,1);\
INSERT 0 1\
\
prueba=# INSERT INTO factura_item(numero_factura,numero_item)VALUES(6,3);\
INSERT 0 1\
\
prueba=# INSERT INTO factura_item(numero_factura,numero_item)VALUES(7,4);\
INSERT 0 1\
\
prueba=# INSERT INTO factura_item(numero_factura,numero_item)VALUES(7,2);\
INSERT 0 1\
\
prueba=# INSERT INTO factura_item(numero_factura,numero_item)VALUES(8,2);\
INSERT 0 1\
\
prueba=# INSERT INTO factura_item(numero_factura,numero_item)VALUES(8,1);\
INSERT 0 1\
\
prueba=# INSERT INTO factura_item(numero_factura,numero_item)VALUES(8,5);\
INSERT 0 1\
\
prueba=# INSERT INTO factura_item(numero_factura,numero_item)VALUES(9,1);\
INSERT 0 1\
\
prueba=# INSERT INTO factura_item(numero_factura,numero_item)VALUES(9,2);\
INSERT 0 1\
\
prueba=# INSERT INTO factura_item(numero_factura,numero_item)VALUES(9,4);\
INSERT 0 1\
\
prueba=# INSERT INTO factura_item(numero_factura,numero_item)VALUES(9,5);\
INSERT 0 1\
\
prueba=# INSERT INTO factura_item(numero_factura,numero_item)VALUES(10,1);\
INSERT 0 1\
\
prueba=# SELECT * FROM factura_item;\
 numero_factura | numero_item \
----------------+-------------\
              1 |           1\
              1 |           2\
              2 |           2\
              2 |           3\
              2 |           2\
              3 |           5\
              3 |           6\
              3 |           8\
              4 |           1\
              4 |           2\
              5 |           7\
              5 |           6\
              5 |           1\
              6 |           3\
              7 |           4\
              7 |           2\
              8 |           2\
              8 |           1\
              8 |           5\
              9 |           1\
              9 |           2\
              9 |           4\
              9 |           5\
             10 |           1\
\
\
prueba=# SELECT factura.id_cliente,factura.numero_factura,SUM(item.valor_item) FROM factura INNER JOIN factura_item ON factura.id_cliente=factura_item.numero_factura INNER JOIN item ON factura_item.numero_item=item.id GROUP BY factura.numero_factura,item.valor_item;\
\
\
prueba=# UPDATE factura SET sub_total=13000 WHERE numero_factura=1;\
UPDATE 1\
prueba=# UPDATE factura SET sub_total=62000 WHERE numero_factura=2;\
UPDATE 1\
prueba=# UPDATE factura SET sub_total=107500 WHERE numero_factura=3;\
UPDATE 1\
prueba=# UPDATE factura SET sub_total=13000 WHERE numero_factura=4;\
UPDATE 1\
prueba=# UPDATE factura SET sub_total=103500 WHERE numero_factura=5;\
UPDATE 1\
prueba=# UPDATE factura SET sub_total=2000 WHERE numero_factura=6;\
UPDATE 1\
prueba=# UPDATE factura SET sub_total=40000 WHERE numero_factura=7;\
UPDATE 1\
prueba=# UPDATE factura SET sub_total=15500 WHERE numero_factura=8;\
UPDATE 1\
prueba=# UPDATE factura SET sub_total=165000 WHERE numero_factura=9;\
UPDATE 1\
prueba=# UPDATE factura SET sub_total=100000 WHERE numero_factura=10;\
UPDATE 1\
\
prueba=# SELECT * FROM factura;\
 numero_factura | fecha_factura | id_cliente | sub_total \
----------------+---------------+------------+-----------\
              1 | 29-07-2020    |          2 |     13000\
              2 | 10-05-2020    |          2 |     62000\
              3 | 10-06-2019    |          3 |    107500\
              4 | 04-03-2019    |          3 |     13000\
              5 | 12-03-2019    |          3 |    103500\
              6 | 20-07-2019    |          4 |      2000\
              7 | 20-07-2019    |          5 |     40000\
              8 | 15-12-2018    |          5 |     15500\
              9 | 15-12-2017    |          5 |    165000\
             10 | 11-08-2017    |          5 |    100000\
(10 rows)\
\
prueba=# SELECT factura.id_cliente,factura.numero_factura,factura.sub_total FROM factura INNER JOIN factura_item ON factura.id_cliente=factura_item.numero_factura INNER JOIN item ON factura_item.numero_item=item.id GROUP BY factura.numero_factura,factura.sub_total ORDER BY sub_total DESC;\
 id_cliente | numero_factura | sub_total \
------------+----------------+-----------\
          5 |              9 |    165000\
          3 |              3 |    107500\
          3 |              5 |    103500\
          5 |             10 |    100000\
          2 |              2 |     62000\
          5 |              7 |     40000\
          5 |              8 |     15500\
          2 |              1 |     13000\
          3 |              4 |     13000\
          4 |              6 |      2000\
(10 rows)\
\
prueba=# SELECT factura.id_cliente,factura.numero_factura,factura.sub_total FROM factura INNER JOIN factura_item ON factura.id_cliente=factura_item.numero_factura INNER JOIN item ON factura_item.numero_item=item.id GROUP BY factura.numero_factura,factura.sub_total ORDER BY sub_total DESC LIMIT(1) ;\
 id_cliente | numero_factura | sub_total \
------------+----------------+-----------\
          5 |              9 |    165000\
(1 row)\
\
prueba=# \
\
\
prueba=# SELECT factura.id_cliente,factura.numero_factura,factura.sub_total FROM factura INNER JOIN factura_item ON factura.id_cliente=factura_item.numero_factura INNER JOIN item ON factura_item.numero_item=item.id WHERE factura.sub_total>100000;\
 id_cliente | numero_factura | sub_total \
------------+----------------+-----------\
          3 |              5 |    103500\
          3 |              3 |    107500\
          3 |              5 |    103500\
          3 |              3 |    107500\
          3 |              5 |    103500\
          3 |              3 |    107500\
          5 |              9 |    165000\
          5 |              9 |    165000\
          5 |              9 |    165000\
(9 rows)\
\
prueba=# SELECT factura.id_cliente,factura.numero_factura,factura.sub_total FROM factura INNER JOIN factura_item ON factura.id_cliente=factura_item.numero_factura INNER JOIN item ON factura_item.numero_item=item.id WHERE factura.sub_total>100000 ORDER BY sub_total DESC;\
 id_cliente | numero_factura | sub_total \
------------+----------------+-----------\
          5 |              9 |    165000\
          5 |              9 |    165000\
          5 |              9 |    165000\
          3 |              3 |    107500\
          3 |              3 |    107500\
          3 |              3 |    107500\
          3 |              5 |    103500\
          3 |              5 |    103500\
          3 |              5 |    103500\
(9 rows)\
\
\
\
prueba=# SELECT factura.id_cliente,factura.numero_factura,factura.sub_total FROM factura INNER JOIN factura_item ON factura.id_cliente=factura_item.numero_factura INNER JOIN item ON factura_item.numero_item=item.id WHERE factura_item.numero_item=6;\
 id_cliente | numero_factura | sub_total \
------------+----------------+-----------\
          3 |              3 |    107500\
          3 |              4 |     13000\
          3 |              5 |    103500\
          5 |              7 |     40000\
          5 |              8 |     15500\
          5 |              9 |    165000\
          5 |             10 |    100000\
(7 rows)\
                                                             \
prueba=# SELECT factura.id_cliente,factura.numero_factura,factura_item.numero_item,factura.sub_total FROM factura INNER JOIN factura_item ON factura.id_cliente=factura_item.numero_factura INNER JOIN item ON factura_item.numero_item=item.id WHERE factura_item.numero_item=6 ORDER BY sub_total DESC;
 id_cliente | numero_factura | numero_item | sub_total 
------------+----------------+-------------+-----------
          5 |              9 |           6 |    165000
          3 |              3 |           6 |    107500
          3 |              5 |           6 |    103500
          5 |             10 |           6 |    100000
          5 |              7 |           6 |     40000
          5 |              8 |           6 |     15500
          3 |              4 |           6 |     13000
(7 rows)
prueba=# \
\
}