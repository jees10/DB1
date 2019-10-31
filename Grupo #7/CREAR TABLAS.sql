-----------------------------------------------------------------------------------------------
        ------------------------------ TABLA DE BODEGA ------------------------------
        
CREATE TABLE cellar (
    id               INTEGER NOT NULL,
    id_product       INTEGER NOT NULL,
    quantity_exist   INTEGER NOT NULL,
    status           SMALLINT NOT NULL
);

CREATE INDEX cellar__idx ON
    cellar (
        id
    ASC,
        id_product
    ASC );

ALTER TABLE cellar ADD CONSTRAINT cellar_pk PRIMARY KEY ( id );
CREATE SEQUENCE cellar_pk START WITH 1;

-----------------------------------------------------------------------------------------------
        ------------------------------ TABLA DE CLIENTE ------------------------------

CREATE TABLE client (
    id                INTEGER NOT NULL,
    name              VARCHAR2(100) NOT NULL,
    last_name         VARCHAR2(100) NOT NULL,
    nit               VARCHAR2(50) NOT NULL,
    phone             VARCHAR2(15) NOT NULL,
    id_user_creator   INTEGER NOT NULL
);

CREATE INDEX client__idx ON
    client (
        id
    ASC );

ALTER TABLE client ADD CONSTRAINT client_pk PRIMARY KEY ( id );
CREATE SEQUENCE client_pk START WITH 1;

-----------------------------------------------------------------------------------------------
    ------------------------------ TABLA DE CUENTAS POR PAGAR ------------------------------
    
CREATE TABLE DEBTS_TO_PAY (
    id_provider   INTEGER NOT NULL,
    bill          INTEGER NOT NULL,
    total         NUMBER(18, 2) NOT NULL
);

-----------------------------------------------------------------------------------------------
    ------------------------------ TABLA DE DEPARTAMENTO ------------------------------

CREATE TABLE depto (
    id      INTEGER NOT NULL,
    descr   VARCHAR2(100) NOT NULL
);

CREATE INDEX depto__idx ON
    depto (
        id
    ASC );

ALTER TABLE depto ADD CONSTRAINT depto_pk PRIMARY KEY ( id );
CREATE SEQUENCE depto_pk START WITH 1;

-----------------------------------------------------------------------------------------------
        ------------------------------ TABLA DE EMPLEADO ------------------------------

CREATE TABLE employee (
    id_user       INTEGER NOT NULL,
    id_depto      INTEGER NOT NULL,
    id_position   INTEGER NOT NULL
);

CREATE INDEX employee__idx ON
    employee (
        id_user
    ASC );
    
-----------------------------------------------------------------------------------------------
    ------------------------------ TABLA DE VENTA ENCABEZADO ------------------------------

CREATE TABLE "ORDER" (
    id_order       INTEGER NOT NULL,
    id_client      INTEGER NOT NULL,
    total          NUMBER(18, 2) NOT NULL,
    type_order     INTEGER NOT NULL,
    id_user_sale   INTEGER NOT NULL
);
    
CREATE INDEX order__idx ON
    "ORDER" (
        id_order
    ASC );

-----------------------------------------------------------------------------------------------
    ------------------------------ TABLA DE VENTA DETALLE ------------------------------
    
CREATE TABLE order_detail (
    id           INTEGER NOT NULL,
    id_client    INTEGER NOT NULL,
    id_product   INTEGER NOT NULL,
    quantity     INTEGER NOT NULL,
    price_unit   NUMBER(18, 2) NOT NULL,
    total        NUMBER(18, 2) NOT NULL
);

CREATE INDEX order_detail__idx ON
    order_detail (
        id
    ASC );

ALTER TABLE order_detail ADD CONSTRAINT order_detail_pk PRIMARY KEY ( id );
CREATE SEQUENCE order_detail_pk START WITH 1;

-----------------------------------------------------------------------------------------------
        ------------------------------ TABLA DE PERMISOS ------------------------------

CREATE TABLE permit (
    id      INTEGER NOT NULL,
    descr   VARCHAR2(100) NOT NULL
);

CREATE INDEX permit__idx ON
    permit (
        id
    ASC );


ALTER TABLE permit ADD CONSTRAINT permit_pk PRIMARY KEY ( id );
CREATE SEQUENCE permit_pk START WITH 1;

-----------------------------------------------------------------------------------------------
    ------------------------------ TABLA DE PERMISOS POR ROL ------------------------------
    
CREATE TABLE permite_rol (
    id_permit   INTEGER NOT NULL,
    id_rol      INTEGER NOT NULL
);

-----------------------------------------------------------------------------------------------
        ------------------------------ TABLA DE PUESTO ------------------------------
    
CREATE TABLE position (
    id      INTEGER NOT NULL,
    descr   VARCHAR2(100) NOT NULL
);

CREATE INDEX position__idx ON
    position (
        id
    ASC );

ALTER TABLE position ADD CONSTRAINT position_pk PRIMARY KEY ( id );
CREATE SEQUENCE position_pk START WITH 1;

-----------------------------------------------------------------------------------------------
        ------------------------------ TABLA DE PRODUCTO ------------------------------
        
CREATE TABLE product (
    id           INTEGER NOT NULL,
    descr        INTEGER NOT NULL,
    price_unit   NUMBER(18, 2) NOT NULL,
    color        VARCHAR2(50) NOT NULL
);

CREATE INDEX product__idx ON
    product (
        id
    ASC );

ALTER TABLE product ADD CONSTRAINT product_pk PRIMARY KEY ( id );
CREATE SEQUENCE product_pk START WITH 1;

-----------------------------------------------------------------------------------------------
        ------------------------------ TABLA DE PROVEEDOR ------------------------------

CREATE TABLE provider (
    id        INTEGER NOT NULL,
    name      VARCHAR(50) NOT NULL,
    phone     VARCHAR2(15) NOT NULL,
    address   VARCHAR2(150) NOT NULL,
    nit       VARCHAR2(50) NOT NULL
);

CREATE INDEX provider__idx ON
    provider (
        id
    ASC );

ALTER TABLE provider ADD CONSTRAINT provider_pk PRIMARY KEY ( id );
CREATE SEQUENCE provider_pk START WITH 1;

-----------------------------------------------------------------------------------------------
        ------------------------------ TABLA DE COMPRA ------------------------------
        
CREATE TABLE purchase (
    id           INTEGER NOT NULL,
    id_product   INTEGER NOT NULL,
    price_unit   NUMBER(18, 2),
    total        NUMBER(18, 2) NOT NULL
);

CREATE INDEX purchase__idx ON
    purchase (
        id
    ASC );

ALTER TABLE purchase ADD CONSTRAINT purchase_pk PRIMARY KEY ( id );
CREATE SEQUENCE purchase_pk START WITH 1;

-----------------------------------------------------------------------------------------------
        ------------------------------ TABLA DE ROLES ------------------------------
        
CREATE TABLE rol (
    id      INTEGER NOT NULL,
    descr   VARCHAR2(100) NOT NULL
);

CREATE INDEX rol__idx ON
    rol (
        id
    ASC );

ALTER TABLE rol ADD CONSTRAINT rol_pk PRIMARY KEY ( id );
CREATE SEQUENCE rol_pk START WITH 1;

-----------------------------------------------------------------------------------------------
    ------------------------------ TABLA DE TIPO DE VENTA ------------------------------

CREATE TABLE type_order (
    id      INTEGER NOT NULL,
    descr   VARCHAR2(100) NOT NULL
);

CREATE INDEX type_order__idx ON
    type_order (
        id
    ASC );

ALTER TABLE type_order ADD CONSTRAINT type_order_pk PRIMARY KEY ( id );
CREATE SEQUENCE type_order_pk START WITH 1;

-----------------------------------------------------------------------------------------------
    ------------------------------ TABLA DE TIPO DE USUARIO ------------------------------


CREATE TABLE type_user (
    id      INTEGER NOT NULL,
    descr   VARCHAR2(100) NOT NULL
);

CREATE INDEX type_user__idx ON
    type_user (
        id
    ASC );

ALTER TABLE type_user ADD CONSTRAINT type_user_pk PRIMARY KEY ( id );
CREATE SEQUENCE type_user_pk START WITH 1;

-----------------------------------------------------------------------------------------------
        ------------------------------ TABLA DE USUARIO ------------------------------
    
CREATE TABLE "USER" (
    id            INTEGER NOT NULL,
    name_1        VARCHAR2(75) NOT NULL,
    name_2        VARCHAR2(75) NOT NULL,
    last_name_1   VARCHAR2(75) NOT NULL,
    last_name_2   VARCHAR2(75) NOT NULL,
    password      VARCHAR2(255) NOT NULL,
    email         VARCHAR2(50) NOT NULL,
    id_rol        INTEGER NOT NULL,
    id_type_use   INTEGER NOT NULL
);

COMMENT ON COLUMN "USER".id_type_use IS
    '			';

CREATE INDEX user__idx ON
    "USER" (
        id
    ASC );

ALTER TABLE "USER" ADD CONSTRAINT user_pk PRIMARY KEY ( id );
CREATE SEQUENCE user_pk START WITH 1;

-----------------------------------------------------------------------------------------------
        ------------------------------ LLAVES FORANEAS ------------------------------


ALTER TABLE cellar
    ADD CONSTRAINT cellar_product_fk FOREIGN KEY ( id_product )
        REFERENCES product ( id );

ALTER TABLE client
    ADD CONSTRAINT client_user_fk FOREIGN KEY ( id_user_creator )
        REFERENCES "USER" ( id );

ALTER TABLE DEBTS_TO_PAY
    ADD CONSTRAINT DEBTS_TO_PAY_PROVIDER_FK FOREIGN KEY ( id_provider )
        REFERENCES provider ( id );

ALTER TABLE employee
    ADD CONSTRAINT employee_depto_fk FOREIGN KEY ( id_depto )
        REFERENCES depto ( id );

ALTER TABLE employee
    ADD CONSTRAINT employee_position_fk FOREIGN KEY ( id_position )
        REFERENCES position ( id );

ALTER TABLE employee
    ADD CONSTRAINT employee_user_fk FOREIGN KEY ( id_user )
        REFERENCES "USER" ( id );

ALTER TABLE order_detail
    ADD CONSTRAINT order_detail_client_fk FOREIGN KEY ( id_client )
        REFERENCES client ( id );

ALTER TABLE order_detail
    ADD CONSTRAINT order_detail_product_fk FOREIGN KEY ( id_product )
        REFERENCES product ( id );

ALTER TABLE "ORDER"
    ADD CONSTRAINT order_order_detail_fk FOREIGN KEY ( id_order )
        REFERENCES order_detail ( id );

ALTER TABLE "ORDER"
    ADD CONSTRAINT order_type_order_fk FOREIGN KEY ( type_order )
        REFERENCES type_order ( id );

ALTER TABLE "ORDER"
    ADD CONSTRAINT order_user_fk FOREIGN KEY ( id_user_sale )
        REFERENCES "USER" ( id );

ALTER TABLE permite_rol
    ADD CONSTRAINT permite_rol_permit_fk FOREIGN KEY ( id_permit )
        REFERENCES permit ( id );

ALTER TABLE permite_rol
    ADD CONSTRAINT permite_rol_rol_fk FOREIGN KEY ( id_rol )
        REFERENCES rol ( id );

ALTER TABLE purchase
    ADD CONSTRAINT purchase_product_fk FOREIGN KEY ( id_product )
        REFERENCES product ( id );

ALTER TABLE "USER"
    ADD CONSTRAINT user_rol_fk FOREIGN KEY ( id_rol )
        REFERENCES rol ( id );

ALTER TABLE "USER"
    ADD CONSTRAINT user_type_user_fk FOREIGN KEY ( id_type_use )
        REFERENCES type_user ( id );