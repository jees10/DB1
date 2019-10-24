/**************************************************************************************************************
                                                    GRUPO #4
**************************************************************************************************************/

CREATE TABLE Cita
  (
    idCita                         NUMBER (10) NOT NULL ,
    idPrecioTienda                 NUMBER (10) NOT NULL ,
    idclienteCita                  NUMBER (10) NOT NULL ,
    idGrupo                        NUMBER (10) NOT NULL ,
    idGrupoEmpleado                NUMBER (10) NOT NULL ,
    fechaInicio                    DATE ,
    fechaFin                       DATE ,
    Tienda_idPrecioTienda          NUMBER (10) NOT NULL ,
    Cliente_cita_idCliente         NUMBER (10) NOT NULL ,
    Grupos_Tienda_idGrupo          NUMBER (10) NOT NULL ,
    Grupo_Empleado_idGrupoEmpleado NUMBER (10) NOT NULL
  ) ;
ALTER TABLE Cita ADD CONSTRAINT Cita_PK PRIMARY KEY ( idCita ) ;


CREATE TABLE Cita_Precio_Tienda
  (
    idPrecioTienda NUMBER (10) NOT NULL ,
    idTienda       NUMBER (10) ,
    PrecioMetro2   NUMBER
  ) ;
COMMENT ON COLUMN Cita_Precio_Tienda.idTienda
IS
  'Este es el id de la tabla de tiendas que tiene otro grupo' ;
ALTER TABLE Cita_Precio_Tienda ADD CONSTRAINT Cita_Precio_Tienda_PK PRIMARY KEY ( idPrecioTienda ) ;


CREATE TABLE Cliente_cita
  (
    idclienteCita NUMBER (10) NOT NULL ,
    idCliente     NUMBER (10) NOT NULL
  ) ;
ALTER TABLE Cliente_cita ADD CONSTRAINT Cliente_cita_PK PRIMARY KEY ( idCliente ) ;


CREATE TABLE Grupo_Empleado
  (
    idGrupoEmpleado NUMBER (10) NOT NULL ,
    idEmpleado      NUMBER (10) ,
    idGrupo         NUMBER
  ) ;
ALTER TABLE Grupo_Empleado ADD CONSTRAINT Grupo_Empleado_PK PRIMARY KEY ( idGrupoEmpleado ) ;


CREATE TABLE Grupos_Tienda
  (
    idGrupo     NUMBER (10) NOT NULL ,
    idTienda    NUMBER (10) NOT NULL ,
    nombreGrupo VARCHAR2 (50)
  ) ;
ALTER TABLE Grupos_Tienda ADD CONSTRAINT Grupos_Tienda_PK PRIMARY KEY ( idGrupo ) ;


ALTER TABLE Cita ADD CONSTRAINT Cita_Cita_Precio_Tienda_FK FOREIGN KEY ( Tienda_idPrecioTienda ) REFERENCES Cita_Precio_Tienda ( idPrecioTienda ) ;

ALTER TABLE Cita ADD CONSTRAINT Cita_Cliente_cita_FK FOREIGN KEY ( Cliente_cita_idCliente ) REFERENCES Cliente_cita ( idCliente ) ;

ALTER TABLE Cita ADD CONSTRAINT Cita_Grupo_Empleado_FK FOREIGN KEY ( Grupo_Empleado_idGrupoEmpleado ) REFERENCES Grupo_Empleado ( idGrupoEmpleado ) ;

ALTER TABLE Cita ADD CONSTRAINT Cita_Grupos_Tienda_FK FOREIGN KEY ( Grupos_Tienda_idGrupo ) REFERENCES Grupos_Tienda ( idGrupo ) ;
