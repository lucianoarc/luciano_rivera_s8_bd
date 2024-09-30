-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-09-30 03:36:33 CLST
--   sitio:      Oracle Database 21c
--   tipo:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE costo (
    id_costo                   NUMBER(10) NOT NULL,
    descricipcion_costo        VARCHAR2(100 BYTE) NOT NULL,
    monto                      NUMBER(10, 2) NOT NULL,
    fecha                      DATE NOT NULL,
    escuela_deporte_id_escuela NUMBER(10) NOT NULL
);

ALTER TABLE costo ADD CONSTRAINT costo_pk PRIMARY KEY ( id_costo );

CREATE TABLE entrenador (
    id_personal      NUMBER(10) NOT NULL,
    id_entrenador    NUMBER(10) NOT NULL,
    nivel_entrenador VARCHAR2(10 BYTE)
);

ALTER TABLE entrenador ADD CONSTRAINT entrenador_pk PRIMARY KEY ( id_personal );

ALTER TABLE entrenador ADD CONSTRAINT entrenador_pkv1 UNIQUE ( id_entrenador );

CREATE TABLE escuela_deporte (
    id_escuela     NUMBER(10) NOT NULL,
    nombre_escuela VARCHAR2(50 BYTE) NOT NULL,
    tipo_escuela   VARCHAR2(30 BYTE) NOT NULL,
    contacto       NUMBER(10),
    ubicacion      VARCHAR2(100 BYTE) NOT NULL
);

ALTER TABLE escuela_deporte ADD CONSTRAINT escuela_deportiva_pk PRIMARY KEY ( id_escuela );

CREATE TABLE instalacion (
    id_instalacion             NUMBER(10) NOT NULL,
    nombre_instalacion         VARCHAR2(50 BYTE) NOT NULL,
    capacidad                  INTEGER NOT NULL,
    ubicacion_instalacion      VARCHAR2(100 BYTE) NOT NULL,
    escuela_deporte_id_escuela NUMBER(10) NOT NULL
);

ALTER TABLE instalacion ADD CONSTRAINT instalacion_pk PRIMARY KEY ( id_instalacion );

CREATE TABLE personal (
    id_personal                NUMBER(10) NOT NULL,
    nombre_personal            VARCHAR2(50 BYTE) NOT NULL,
    profesion                  VARCHAR2(30 BYTE) NOT NULL,
    nacionalidad               VARCHAR2(30 BYTE),
    telefono                   NUMBER(10),
    escuela_deporte_id_escuela NUMBER(10) NOT NULL
);

ALTER TABLE personal ADD CONSTRAINT personal_pk PRIMARY KEY ( id_personal );

CREATE TABLE relation_5 (
    personal_id_personal NUMBER(10) NOT NULL,
    costo_id_costo       NUMBER(10) NOT NULL
);

ALTER TABLE relation_5 ADD CONSTRAINT relation_5_pk PRIMARY KEY ( personal_id_personal,
                                                                  costo_id_costo );

ALTER TABLE costo
    ADD CONSTRAINT costo_escuela_deporte_fk FOREIGN KEY ( escuela_deporte_id_escuela )
        REFERENCES escuela_deporte ( id_escuela );

ALTER TABLE entrenador
    ADD CONSTRAINT entrenador_personal_fk FOREIGN KEY ( id_personal )
        REFERENCES personal ( id_personal );

ALTER TABLE instalacion
    ADD CONSTRAINT instalacion_escuela_deporte_fk FOREIGN KEY ( escuela_deporte_id_escuela )
        REFERENCES escuela_deporte ( id_escuela );

ALTER TABLE personal
    ADD CONSTRAINT personal_escuela_deporte_fk FOREIGN KEY ( escuela_deporte_id_escuela )
        REFERENCES escuela_deporte ( id_escuela );

ALTER TABLE relation_5
    ADD CONSTRAINT relation_5_costo_fk FOREIGN KEY ( costo_id_costo )
        REFERENCES costo ( id_costo );

ALTER TABLE relation_5
    ADD CONSTRAINT relation_5_personal_fk FOREIGN KEY ( personal_id_personal )
        REFERENCES personal ( id_personal );

CREATE OR REPLACE TRIGGER fkntm_relation_5 BEFORE
    UPDATE OF costo_id_costo ON relation_5
BEGIN
    raise_application_error(-20225, 'Non Transferable FK constraint  on table Relation_5 is violated');
END;
/



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             0
-- ALTER TABLE                             13
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           1
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
