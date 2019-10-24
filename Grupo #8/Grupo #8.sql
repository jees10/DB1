/******************************************************************************************
                                        GRUPO #8
******************************************************************************************/

CREATE TABLE cuentaporpagar (
    idcuenta           VARCHAR2(50) NOT NULL,
    descripcion        VARCHAR2(200),
    monto              INTEGER,
    fechainicio        DATE,
    fechavencimiento   DATE,
    estado             VARCHAR2(20),
    proveedor_nit      VARCHAR2(12) NOT NULL
);

ALTER TABLE cuentaporpagar ADD CONSTRAINT cuentaporpagar_pk PRIMARY KEY ( idcuenta );

CREATE TABLE proveedor (
    nit                     VARCHAR2(12) NOT NULL,
    nombrecomercial         VARCHAR2(50),
    direccion               VARCHAR2(100),
    telefono                VARCHAR2(30),
    nombrerepresentante     VARCHAR2(50),
    telefonorepresentante   VARCHAR2(30),
    email                   VARCHAR2(100)
);

ALTER TABLE proveedor ADD CONSTRAINT proveedor_pk PRIMARY KEY ( nit );

ALTER TABLE cuentaporpagar
    ADD CONSTRAINT cuentaporpagar_proveedor_fk FOREIGN KEY ( proveedor_nit )
        REFERENCES proveedor ( nit );



