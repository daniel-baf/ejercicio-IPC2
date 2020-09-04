

INSERT INTO cliente VALUES ('1000','JUAN','LOPEZ','Quetzaltenango','11111111',null);
INSERT INTO cliente VALUES ('1001','MARIA','GARCIA','Zacapa','22222222',null);
INSERT INTO cliente VALUES ('1002','FRANCISCO','MARTINEZ','Quetzaltenango','33333333',null);
INSERT INTO cliente VALUES ('1003','MANUEL','SAEZ','San Marcos','44444444',null);
INSERT INTO cliente VALUES ('1004','ANTONIO','GONZALEZ','Guatemala','55555555',null);

INSERT INTO aeropuerto VALUES ('AER-1','Aurora','Guatemala','Guatemala');
INSERT INTO aeropuerto VALUES ('AER-2','Haneda','Tokio','Japon');
INSERT INTO aeropuerto VALUES ('AER-3','Kongsito','Hong Kong','China');
INSERT INTO aeropuerto VALUES ('AER-4','Munichon','Munich','Alemania');

INSERT INTO clase VALUES ('CLA-1','Ejecutiva');
INSERT INTO clase VALUES ('CLA-2','Premium');
INSERT INTO clase VALUES ('CLA-3','Turista');
INSERT INTO clase VALUES ('CLA-4','Primera Clase');

INSERT INTO avion VALUES ('AVI-1');
INSERT INTO avion VALUES ('AVI-2');
INSERT INTO avion VALUES ('AVI-3');

INSERT INTO piso VALUES ('PIS-1','2','3','AVI-1');
INSERT INTO piso VALUES ('PIS-2','3','6','AVI-1');
INSERT INTO piso VALUES ('PIS-3','6','1','AVI-2');

INSERT INTO asiento VALUES ('AS-1','1','1','PIS-1','CLA-1');
INSERT INTO asiento VALUES ('AS-2','1','2','PIS-1','CLA-1');
INSERT INTO asiento VALUES ('AS-3','1','3','PIS-1','CLA-1');
INSERT INTO asiento VALUES ('AS-4','2','1','PIS-1','CLA-2');
INSERT INTO asiento VALUES ('AS-5','2','2','PIS-1','CLA-2');
INSERT INTO asiento VALUES ('AS-6','1','1','PIS-3','CLA-1');
INSERT INTO asiento VALUES ('AS-7','2','1','PIS-3','CLA-1');
INSERT INTO asiento VALUES ('AS-8','3','1','PIS-3','CLA-1');

INSERT INTO vuelo VALUES ('VUL-1',2020-01-01,'01:00','12:00','AER-1','AER-2','AVI-1');
INSERT INTO vuelo VALUES ('VUL-2',2020-01-02,'01:00','12:00','AER-2','AER-1','AVI-1');
INSERT INTO vuelo VALUES ('VUL-3',2020-01-01,'01:00','12:00','AER-3','AER-4','AVI-2');
INSERT INTO vuelo VALUES ('VUL-4',2020-01-02,'01:00','12:00','AER-4','AER-3','AVI-2');
INSERT INTO vuelo VALUES ('VUL-5',2020-01-03,'01:00','12:00','AER-1','AER-4','AVI-1');

INSERT INTO tarjeta_embarque VALUES (1,'Efectivo','1000','VUL-1');
INSERT INTO tarjeta_embarque VALUES (2,'Efectivo','1002','VUL-1');
INSERT INTO tarjeta_embarque VALUES (3,'Efectivo','1003','VUL-2');
INSERT INTO tarjeta_embarque VALUES (4,'Efectivo','1004','VUL-2');
