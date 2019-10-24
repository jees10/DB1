CREATE TABLE depatamento (
    id_depto   INTEGER NOT NULL,
    depto      VARCHAR2(50)
);

ALTER TABLE depatamento ADD CONSTRAINT depatamento_pk PRIMARY KEY ( id_depto );

CREATE TABLE empleado (
    cod_empleado    INTEGER,
    nombre          VARCHAR2(50),
    apellido        VARCHAR2(50),
    salario         NUMBER,
    puesto          VARCHAR2(20),
    fecha_ingreso   DATE,
    id_depto        INTEGER NOT NULL,
    user_id         NUMBER NOT NULL
);

ALTER TABLE empleado ADD CONSTRAINT empleado_pk PRIMARY KEY ( user_id );

CREATE TABLE usuarios (
    "user"         VARCHAR2(50),
    password       VARCHAR2(30),
    id_user        VARCHAR2(30) NOT NULL,
    cod_empleado   NUMBER NOT NULL
);

CREATE UNIQUE INDEX usuarios__idx ON
    usuarios (
        cod_empleado
    ASC );

ALTER TABLE usuarios ADD CONSTRAINT usuarios_pk PRIMARY KEY ( id_user );

ALTER TABLE empleado
    ADD CONSTRAINT empleado_depatamento_fk FOREIGN KEY ( id_depto )
        REFERENCES depatamento ( id_depto );

ALTER TABLE usuarios
    ADD CONSTRAINT usuarios_empleado_fk FOREIGN KEY ( cod_empleado )
        REFERENCES empleado ( user_id );

ALTER TABLE empleado
    ADD CONSTRAINT empleado_depatamento_fk FOREIGN KEY ( id_depto )
        REFERENCES depatamento ( id_depto );

ALTER TABLE usuarios
    ADD CONSTRAINT usuarios_empleado_fk FOREIGN KEY ( cod_empleado )
        REFERENCES empleado ( user_id );

CREATE SEQUENCE empleado_user_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER empleado_user_id_trg BEFORE
    INSERT ON empleado
    FOR EACH ROW
    WHEN ( new.user_id IS NULL )
BEGIN
    :new.user_id := empleado_user_id_seq.nextval;
END;
/
