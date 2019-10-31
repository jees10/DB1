-- Generado por Oracle SQL Developer Data Modeler 18.2.0.179.0756
--   en:        2019-10-30 20:16:41 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE cliente (
    id_cliente         INTEGER NOT NULL,
    nombre             NVARCHAR2(50),
    apellido           NVARCHAR2(50),
    dirección          NVARCHAR2(50),
    fecha_nacimiento   DATE,
    telefono           INTEGER,
    email              NVARCHAR2(50)
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( id_cliente );

CREATE TABLE detalle (
    id_detalle                 INTEGER NOT NULL,
    cantidad                   INTEGER,
    estados_cuenta_id_cuenta   INTEGER NOT NULL,
    factura_id_factura         INTEGER NOT NULL,
    descripción                NVARCHAR2(100)
);

ALTER TABLE detalle ADD CONSTRAINT detalle_pk PRIMARY KEY ( id_detalle );

CREATE TABLE estados_cuenta (
    id_cuenta     INTEGER NOT NULL,
    nombre        NVARCHAR2(50),
    descripción   NVARCHAR2(100)
);

ALTER TABLE estados_cuenta ADD CONSTRAINT estados_cuenta_pk PRIMARY KEY ( id_cuenta );

CREATE TABLE factura (
    id_factura           INTEGER NOT NULL,
    fecha                DATE,
    cliente_id_cliente   INTEGER NOT NULL,
    modo_pago_id_pago    INTEGER NOT NULL
);

ALTER TABLE factura ADD CONSTRAINT factura_pk PRIMARY KEY ( id_factura );

CREATE TABLE modo_pago (
    id_pago          INTEGER NOT NULL,
    nombre           NVARCHAR2(50),
    otros_detalles   NVARCHAR2(100)
);

ALTER TABLE modo_pago ADD CONSTRAINT modo_pago_pk PRIMARY KEY ( id_pago );

ALTER TABLE detalle
    ADD CONSTRAINT detalle_estados_cuenta_fk FOREIGN KEY ( estados_cuenta_id_cuenta )
        REFERENCES estados_cuenta ( id_cuenta );

ALTER TABLE detalle
    ADD CONSTRAINT detalle_factura_fk FOREIGN KEY ( factura_id_factura )
        REFERENCES factura ( id_factura );

ALTER TABLE factura
    ADD CONSTRAINT factura_cliente_fk FOREIGN KEY ( cliente_id_cliente )
        REFERENCES cliente ( id_cliente );

ALTER TABLE factura
    ADD CONSTRAINT factura_modo_pago_fk FOREIGN KEY ( modo_pago_id_pago )
        REFERENCES modo_pago ( id_pago );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                              9
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
