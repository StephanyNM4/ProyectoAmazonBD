-- Generated by Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   at:        2023-12-08 22:54:21 CST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE tbl_categorias_productos (
    id_categoria_producto NUMBER NOT NULL,
    id_categoria_padre    NUMBER,
    categoria             VARCHAR2(100)
);

ALTER TABLE tbl_categorias_productos ADD CONSTRAINT tbl_categorias_productos_pk PRIMARY KEY ( id_categoria_producto );

CREATE TABLE tbl_colores (
    id_color NUMBER NOT NULL,
    color    VARCHAR2(50)
);

ALTER TABLE tbl_colores ADD CONSTRAINT tbl_colores_pk PRIMARY KEY ( id_color );

CREATE TABLE tbl_comentarios (
    id_comentario     NUMBER NOT NULL,
    id_producto       NUMBER NOT NULL,
    id_consumidor     NUMBER NOT NULL,
    calificacion      NUMBER,
    encabezado        VARCHAR2(100),
    fecha_publicacion DATE,
    comentario        VARCHAR2(300),
    util              CHAR(1)
);

ALTER TABLE tbl_comentarios ADD CONSTRAINT tbl_comentarios_pk PRIMARY KEY ( id_comentario );

CREATE TABLE tbl_consumidores (
    id_consumidor     NUMBER NOT NULL,
    nombre            VARCHAR2(100),
    correo            VARCHAR2(100),
    contrasena        VARCHAR2(100),
    numero_telefonico VARCHAR2(25)
);

ALTER TABLE tbl_consumidores ADD CONSTRAINT tbl_consumidores_pk PRIMARY KEY ( id_consumidor );

CREATE TABLE tbl_direcciones_consumidor (
    id_direccion_consumidor NUMBER NOT NULL,
    id_consumidor           NUMBER NOT NULL,
    id_lugar                NUMBER NOT NULL,
    costo_envio             NUMBER
);

ALTER TABLE tbl_direcciones_consumidor ADD CONSTRAINT tbl_direccciones_consumidor_pk PRIMARY KEY ( id_direccion_consumidor );

CREATE TABLE tbl_editoriales (
    id_editorial NUMBER NOT NULL,
    editorial    VARCHAR2(100)
);

ALTER TABLE tbl_editoriales ADD CONSTRAINT tbl_editoriales_pk PRIMARY KEY ( id_editorial );

CREATE TABLE tbl_empresas (
    id_empresa      NUMBER NOT NULL,
    id_lugar        NUMBER NOT NULL,
    nombre          VARCHAR2(100),
    numero_registro NUMBER
);

ALTER TABLE tbl_empresas ADD CONSTRAINT tbl_empresas_pk PRIMARY KEY ( id_empresa );

CREATE TABLE tbl_equipajes (
    id_producto    NUMBER NOT NULL,
    peso_soportado NUMBER,
    ruedas         CHAR(1)
);

ALTER TABLE tbl_equipajes ADD CONSTRAINT tbl_equipajes_pk PRIMARY KEY ( id_producto );

CREATE TABLE tbl_estados_pedido (
    id_estado NUMBER NOT NULL,
    estado    VARCHAR2(50)
);

ALTER TABLE tbl_estados_pedido ADD CONSTRAINT tbl_estados_pedido_pk PRIMARY KEY ( id_estado );

CREATE TABLE tbl_estados_productos (
    id_estado NUMBER NOT NULL,
    estado    VARCHAR2(50)
);

ALTER TABLE tbl_estados_productos ADD CONSTRAINT tbl_estados_productos_pk PRIMARY KEY ( id_estado );

CREATE TABLE tbl_imagenes (
    id_imagen   NUMBER NOT NULL,
    id_producto NUMBER NOT NULL,
    src         VARCHAR2(200)
);

ALTER TABLE tbl_imagenes ADD CONSTRAINT tbl_imagenes_pk PRIMARY KEY ( id_imagen );

CREATE TABLE tbl_juguetes (
    id_producto NUMBER NOT NULL,
    id_color    NUMBER NOT NULL,
    rango_edad  VARCHAR2(20)
);

ALTER TABLE tbl_juguetes ADD CONSTRAINT tbl_juguetes_pk PRIMARY KEY ( id_producto );

CREATE TABLE tbl_keywords (
    id_keyword NUMBER NOT NULL,
    keyword    VARCHAR2(100)
);

ALTER TABLE tbl_keywords ADD CONSTRAINT tbl_keyword_pk PRIMARY KEY ( id_keyword );

CREATE TABLE tbl_keywords_productos (
    id_keyword  NUMBER NOT NULL,
    id_producto NUMBER NOT NULL
);

ALTER TABLE tbl_keywords_productos ADD CONSTRAINT tbl_keywords_productos_pk PRIMARY KEY ( id_keyword,
                                                                                          id_producto );

CREATE TABLE tbl_libros (
    id_producto       NUMBER NOT NULL,
    id_autor          NUMBER NOT NULL,
    id_editorial      NUMBER NOT NULL,
    titulo            VARCHAR2(200),
    cantidad_paginas  NUMBER,
    fecha_publicacion DATE
);

ALTER TABLE tbl_libros ADD CONSTRAINT tbl_libros_pk PRIMARY KEY ( id_producto );

CREATE TABLE tbl_lugares (
    id_lugar       NUMBER NOT NULL,
    id_lugar_padre NUMBER,
    id_tipo_lugar  NUMBER NOT NULL,
    lugar          VARCHAR2(150),
    zip            NUMBER
);

ALTER TABLE tbl_lugares ADD CONSTRAINT tbl_lugares_pk PRIMARY KEY ( id_lugar );

CREATE TABLE tbl_marcas (
    id_marca NUMBER NOT NULL,
    nombre   VARCHAR2(100)
);

ALTER TABLE tbl_marcas ADD CONSTRAINT tbl_marcas_pk PRIMARY KEY ( id_marca );

CREATE TABLE tbl_memorias (
    id_memoria NUMBER NOT NULL,
    memoria    VARCHAR2(20)
);

ALTER TABLE tbl_memorias ADD CONSTRAINT tbl_memorias_pk PRIMARY KEY ( id_memoria );

CREATE TABLE tbl_mensajes (
    id_mensaje       NUMBER NOT NULL,
    id_vendedor      NUMBER NOT NULL,
    id_consumidor    NUMBER NOT NULL,
    id_mensaje_padre NUMBER,
    mensaje          VARCHAR2(300),
    emisor           CHAR(1),
    leido            CHAR(1)
);

ALTER TABLE tbl_mensajes ADD CONSTRAINT tbl_mensajes_pk PRIMARY KEY ( id_mensaje );

CREATE TABLE tbl_pedidos (
    id_pedido               NUMBER NOT NULL,
    id_direccion_consumidor NUMBER NOT NULL,
    id_tarjeta_bancaria     NUMBER NOT NULL,
    id_estado               NUMBER NOT NULL,
    fecha                   DATE,
    subtotal                NUMBER,
    isv                     NUMBER,
    total                   NUMBER,
    fecha_entrega           DATE
);

ALTER TABLE tbl_pedidos ADD CONSTRAINT tbl_pedidos_pk PRIMARY KEY ( id_pedido );

CREATE TABLE tbl_personas (
    id_persona       NUMBER NOT NULL,
    genero           CHAR 
--  WARNING: CHAR size not specified 
    ,
    nombre           VARCHAR2(100),
    fecha_nacimiento DATE
);

ALTER TABLE tbl_personas ADD CONSTRAINT tbl_personas_pk PRIMARY KEY ( id_persona );

CREATE TABLE tbl_pinturas (
    id_producto NUMBER NOT NULL,
    id_pintor   NUMBER NOT NULL,
    id_tecnica  NUMBER NOT NULL
);

ALTER TABLE tbl_pinturas ADD CONSTRAINT tbl_pinturas_pk PRIMARY KEY ( id_producto );

CREATE TABLE tbl_procesadores (
    id_procesador       NUMBER NOT NULL,
    id_marca_procesador NUMBER NOT NULL,
    procesador          VARCHAR2(100)
);

ALTER TABLE tbl_procesadores ADD CONSTRAINT tbl_procesadores_pk PRIMARY KEY ( id_procesador );

CREATE TABLE tbl_productos (
    id_producto             NUMBER NOT NULL,
    id_categoria_producto   NUMBER NOT NULL,
    id_marca                NUMBER,
    nombre                  VARCHAR2(300),
    descripcion             VARCHAR2(400),
    calificacion            NUMBER,
    dimensiones             VARCHAR2(100),
    caracteristica_especial VARCHAR2(300),
    vinetas                 VARCHAR2(200),
    aviso_legal             VARCHAR2(1000)
);

ALTER TABLE tbl_productos ADD CONSTRAINT tbl_productos_pk PRIMARY KEY ( id_producto );

CREATE TABLE tbl_productos_en_venta (
    id_prod_vend NUMBER NOT NULL,
    id_producto  NUMBER NOT NULL,
    id_vendedor  NUMBER NOT NULL,
    id_estado    NUMBER NOT NULL,
    sku          VARCHAR2(100),
    precio       NUMBER,
    cantidad     NUMBER,
    descuento    NUMBER
);

ALTER TABLE tbl_productos_en_venta ADD CONSTRAINT tbl_productos_en_venta_pk PRIMARY KEY ( id_prod_vend );

CREATE TABLE tbl_productos_pedidos (
    id_prod_ped  NUMBER NOT NULL,
    id_pedido    NUMBER NOT NULL,
    id_prod_vend NUMBER NOT NULL,
    cantidad     NUMBER,
    precio       NUMBER,
    subtotal     NUMBER
);

ALTER TABLE tbl_productos_pedidos ADD CONSTRAINT tbl_productos_pedidos_pk PRIMARY KEY ( id_prod_ped );

CREATE TABLE tbl_sistemas_operativos (
    id_sistema_operativo NUMBER NOT NULL,
    sistema_operativo    VARCHAR2(50)
);

ALTER TABLE tbl_sistemas_operativos ADD CONSTRAINT tbl_sistemas_operativos_pk PRIMARY KEY ( id_sistema_operativo );

CREATE TABLE tbl_tarjetas_bancarias (
    id_tarjeta          NUMBER NOT NULL,
    id_tipo_propietario NUMBER NOT NULL,
    id_consumidor       NUMBER,
    id_vendedor         NUMBER,
    numero_tarjeta      NUMBER,
    nombre_propietario  VARCHAR2(100),
    fecha_vencimiento   DATE
);

ALTER TABLE tbl_tarjetas_bancarias ADD CONSTRAINT tbl_tarjetas_bancarias_pk PRIMARY KEY ( id_tarjeta );

CREATE TABLE tbl_tecnicas (
    id_tecnica NUMBER NOT NULL,
    tecnica    VARCHAR2(100)
);

ALTER TABLE tbl_tecnicas ADD CONSTRAINT tbl_tecnicas_pk PRIMARY KEY ( id_tecnica );

CREATE TABLE tbl_telefonos (
    id_producto           NUMBER NOT NULL,
    id_color              NUMBER NOT NULL,
    id_procesador         NUMBER NOT NULL,
    id_sistema_operativo  NUMBER NOT NULL,
    id_memoria_interna    NUMBER NOT NULL,
    id_memoria_ram        NUMBER NOT NULL,
    modelo                VARCHAR2(100),
    bateria               VARCHAR2(100),
    desbloqueo_biometrico CHAR(1),
    resistibilidad_agua   CHAR(1)
);

ALTER TABLE tbl_telefonos ADD CONSTRAINT tbl_telefonos_pk PRIMARY KEY ( id_producto );

CREATE TABLE tbl_tipo_logistica (
    id_logistica NUMBER NOT NULL,
    nombre       VARCHAR2(50),
    costo        NUMBER
);

ALTER TABLE tbl_tipo_logistica ADD CONSTRAINT tbl_tipo_logistica_pk PRIMARY KEY ( id_logistica );

CREATE TABLE tbl_tipos_cuentas (
    id_tipo_cuenta NUMBER NOT NULL,
    id_logistica   NUMBER NOT NULL,
    tipo_cuenta    VARCHAR2(50)
);

ALTER TABLE tbl_tipos_cuentas ADD CONSTRAINT tbl_tipos_cuentas_pk PRIMARY KEY ( id_tipo_cuenta );

CREATE TABLE tbl_tipos_lugares (
    id_tipo_lugar NUMBER NOT NULL,
    nombre        VARCHAR2(100)
);

ALTER TABLE tbl_tipos_lugares ADD CONSTRAINT tbl_tipos_lugares_pk PRIMARY KEY ( id_tipo_lugar );

CREATE TABLE tbl_tipos_propietarios (
    id_tipo_propietario NUMBER NOT NULL,
    tipo_propietario    VARCHAR2(100)
);

ALTER TABLE tbl_tipos_propietarios ADD CONSTRAINT tbl_tipos_propietarios_pk PRIMARY KEY ( id_tipo_propietario );

CREATE TABLE tbl_vendedores (
    id_vendedor         NUMBER NOT NULL,
    id_tipo_cuenta      NUMBER NOT NULL,
    id_empresa          NUMBER NOT NULL,
    id_lugar_residencia NUMBER NOT NULL,
    id_lugar_nacimiento NUMBER NOT NULL,
    primer_nombre       VARCHAR2(50),
    segundo_nombre      VARCHAR2(50),
    correo              VARCHAR2(50),
    contrasena          VARCHAR2(50),
    apellido            VARCHAR2(50),
    fecha_nacimiento    DATE,
    identificacion      VARCHAR2(50),
    fecha_inicio_cuenta DATE,
    numero_telefonico   VARCHAR2(25)
);

ALTER TABLE tbl_vendedores ADD CONSTRAINT tbl_vendedores_pk PRIMARY KEY ( id_vendedor );

ALTER TABLE tbl_categorias_productos
    ADD CONSTRAINT tbl_cat_prod_tbl_cat_prod_fk FOREIGN KEY ( id_categoria_padre )
        REFERENCES tbl_categorias_productos ( id_categoria_producto );

ALTER TABLE tbl_comentarios
    ADD CONSTRAINT tbl_com_tbl_cons_fk FOREIGN KEY ( id_consumidor )
        REFERENCES tbl_consumidores ( id_consumidor );

ALTER TABLE tbl_comentarios
    ADD CONSTRAINT tbl_com_tbl_pro_fk FOREIGN KEY ( id_producto )
        REFERENCES tbl_productos ( id_producto );

ALTER TABLE tbl_direcciones_consumidor
    ADD CONSTRAINT tbl_dir_con_tbl_con_fk FOREIGN KEY ( id_consumidor )
        REFERENCES tbl_consumidores ( id_consumidor );

ALTER TABLE tbl_direcciones_consumidor
    ADD CONSTRAINT tbl_dir_con_tbl_lug_fk FOREIGN KEY ( id_lugar )
        REFERENCES tbl_lugares ( id_lugar );

ALTER TABLE tbl_empresas
    ADD CONSTRAINT tbl_emp_tbl_lug_fk FOREIGN KEY ( id_lugar )
        REFERENCES tbl_lugares ( id_lugar );

ALTER TABLE tbl_equipajes
    ADD CONSTRAINT tbl_equip_tbl_prod_fk FOREIGN KEY ( id_producto )
        REFERENCES tbl_productos ( id_producto );

ALTER TABLE tbl_imagenes
    ADD CONSTRAINT tbl_imag_tbl_pro_fk FOREIGN KEY ( id_producto )
        REFERENCES tbl_productos ( id_producto );

ALTER TABLE tbl_juguetes
    ADD CONSTRAINT tbl_jug_tbl_col_fk FOREIGN KEY ( id_color )
        REFERENCES tbl_colores ( id_color );

ALTER TABLE tbl_juguetes
    ADD CONSTRAINT tbl_jug_tbl_prod_fk FOREIGN KEY ( id_producto )
        REFERENCES tbl_productos ( id_producto );

ALTER TABLE tbl_keywords_productos
    ADD CONSTRAINT tbl_key_pro_tbl_prod_fk FOREIGN KEY ( id_producto )
        REFERENCES tbl_productos ( id_producto );

ALTER TABLE tbl_keywords_productos
    ADD CONSTRAINT tbl_key_prod_tbl_key_fk FOREIGN KEY ( id_keyword )
        REFERENCES tbl_keywords ( id_keyword );

ALTER TABLE tbl_libros
    ADD CONSTRAINT tbl_lib_tbl_edi_fk FOREIGN KEY ( id_editorial )
        REFERENCES tbl_editoriales ( id_editorial );

ALTER TABLE tbl_libros
    ADD CONSTRAINT tbl_lib_tbl_per_fk FOREIGN KEY ( id_autor )
        REFERENCES tbl_personas ( id_persona );

ALTER TABLE tbl_libros
    ADD CONSTRAINT tbl_lib_tbl_pro_fk FOREIGN KEY ( id_producto )
        REFERENCES tbl_productos ( id_producto );

ALTER TABLE tbl_lugares
    ADD CONSTRAINT tbl_lug_tbl_lug_fk FOREIGN KEY ( id_lugar_padre )
        REFERENCES tbl_lugares ( id_lugar );

ALTER TABLE tbl_lugares
    ADD CONSTRAINT tbl_lug_tbl_tip_lug_fk FOREIGN KEY ( id_tipo_lugar )
        REFERENCES tbl_tipos_lugares ( id_tipo_lugar );

ALTER TABLE tbl_mensajes
    ADD CONSTRAINT tbl_mens_tbl_consu_fk FOREIGN KEY ( id_consumidor )
        REFERENCES tbl_consumidores ( id_consumidor );

ALTER TABLE tbl_mensajes
    ADD CONSTRAINT tbl_mens_tbl_mens_fk FOREIGN KEY ( id_mensaje_padre )
        REFERENCES tbl_mensajes ( id_mensaje );

ALTER TABLE tbl_mensajes
    ADD CONSTRAINT tbl_mensa_tbl_ven_fk FOREIGN KEY ( id_vendedor )
        REFERENCES tbl_vendedores ( id_vendedor );

ALTER TABLE tbl_productos_pedidos
    ADD CONSTRAINT tbl_p_pe_tbl_p_en_v_fk FOREIGN KEY ( id_prod_vend )
        REFERENCES tbl_productos_en_venta ( id_prod_vend );

ALTER TABLE tbl_productos_en_venta
    ADD CONSTRAINT tbl_p_ven_tbl_est_p_fk FOREIGN KEY ( id_estado )
        REFERENCES tbl_estados_productos ( id_estado );

ALTER TABLE tbl_pedidos
    ADD CONSTRAINT tbl_ped_tbl_dir_cons_fk FOREIGN KEY ( id_direccion_consumidor )
        REFERENCES tbl_direcciones_consumidor ( id_direccion_consumidor );

ALTER TABLE tbl_pedidos
    ADD CONSTRAINT tbl_ped_tbl_est_ped_fk FOREIGN KEY ( id_estado )
        REFERENCES tbl_estados_pedido ( id_estado );

ALTER TABLE tbl_pedidos
    ADD CONSTRAINT tbl_ped_tbl_tar_banc_fk FOREIGN KEY ( id_tarjeta_bancaria )
        REFERENCES tbl_tarjetas_bancarias ( id_tarjeta );

ALTER TABLE tbl_pinturas
    ADD CONSTRAINT tbl_pint_tbl_per_fk FOREIGN KEY ( id_pintor )
        REFERENCES tbl_personas ( id_persona );

ALTER TABLE tbl_pinturas
    ADD CONSTRAINT tbl_pint_tbl_prod_fk FOREIGN KEY ( id_producto )
        REFERENCES tbl_productos ( id_producto );

ALTER TABLE tbl_pinturas
    ADD CONSTRAINT tbl_pint_tbl_tecn_fk FOREIGN KEY ( id_tecnica )
        REFERENCES tbl_tecnicas ( id_tecnica );

ALTER TABLE tbl_productos
    ADD CONSTRAINT tbl_pro_tbl_cat_pro_fk FOREIGN KEY ( id_categoria_producto )
        REFERENCES tbl_categorias_productos ( id_categoria_producto );

ALTER TABLE tbl_productos_en_venta
    ADD CONSTRAINT tbl_pro_ven_tbl_ven_fk FOREIGN KEY ( id_vendedor )
        REFERENCES tbl_vendedores ( id_vendedor );

ALTER TABLE tbl_procesadores
    ADD CONSTRAINT tbl_proc_tbl_mar_fk FOREIGN KEY ( id_marca_procesador )
        REFERENCES tbl_marcas ( id_marca );

ALTER TABLE tbl_productos_pedidos
    ADD CONSTRAINT tbl_prod_ped_tbl_ped_fk FOREIGN KEY ( id_pedido )
        REFERENCES tbl_pedidos ( id_pedido );

ALTER TABLE tbl_productos
    ADD CONSTRAINT tbl_prod_tbl_mar_fk FOREIGN KEY ( id_marca )
        REFERENCES tbl_marcas ( id_marca );

ALTER TABLE tbl_productos_en_venta
    ADD CONSTRAINT tbl_prod_ven_tbl_pro_fk FOREIGN KEY ( id_producto )
        REFERENCES tbl_productos ( id_producto );

ALTER TABLE tbl_tipos_cuentas
    ADD CONSTRAINT tbl_t_cu_tbl_t_log_fk FOREIGN KEY ( id_logistica )
        REFERENCES tbl_tipo_logistica ( id_logistica );

ALTER TABLE tbl_tarjetas_bancarias
    ADD CONSTRAINT tbl_tar_b_tbl_ti_pr_fk FOREIGN KEY ( id_tipo_propietario )
        REFERENCES tbl_tipos_propietarios ( id_tipo_propietario );

ALTER TABLE tbl_tarjetas_bancarias
    ADD CONSTRAINT tbl_tar_ban_tbl_ven_fk FOREIGN KEY ( id_vendedor )
        REFERENCES tbl_vendedores ( id_vendedor );

ALTER TABLE tbl_tarjetas_bancarias
    ADD CONSTRAINT tbl_tar_banc_tbl_c_fk FOREIGN KEY ( id_consumidor )
        REFERENCES tbl_consumidores ( id_consumidor );

ALTER TABLE tbl_telefonos
    ADD CONSTRAINT tbl_tel_tbl_col_fk FOREIGN KEY ( id_color )
        REFERENCES tbl_colores ( id_color );

ALTER TABLE tbl_telefonos
    ADD CONSTRAINT tbl_tel_tbl_mem_fk FOREIGN KEY ( id_memoria_ram )
        REFERENCES tbl_memorias ( id_memoria );

ALTER TABLE tbl_telefonos
    ADD CONSTRAINT tbl_tel_tbl_mem_fkv2 FOREIGN KEY ( id_memoria_interna )
        REFERENCES tbl_memorias ( id_memoria );

ALTER TABLE tbl_telefonos
    ADD CONSTRAINT tbl_tel_tbl_pr_fk FOREIGN KEY ( id_procesador )
        REFERENCES tbl_procesadores ( id_procesador );

ALTER TABLE tbl_telefonos
    ADD CONSTRAINT tbl_tel_tbl_pro_fk FOREIGN KEY ( id_producto )
        REFERENCES tbl_productos ( id_producto );

ALTER TABLE tbl_telefonos
    ADD CONSTRAINT tbl_tele_tbl_sis_ope_fk FOREIGN KEY ( id_sistema_operativo )
        REFERENCES tbl_sistemas_operativos ( id_sistema_operativo );

ALTER TABLE tbl_vendedores
    ADD CONSTRAINT tbl_ven_tbl_emp_fk FOREIGN KEY ( id_empresa )
        REFERENCES tbl_empresas ( id_empresa );

ALTER TABLE tbl_vendedores
    ADD CONSTRAINT tbl_ven_tbl_t_cuen_fk FOREIGN KEY ( id_tipo_cuenta )
        REFERENCES tbl_tipos_cuentas ( id_tipo_cuenta );

ALTER TABLE tbl_vendedores
    ADD CONSTRAINT tbl_vend_tbl_lug_fk FOREIGN KEY ( id_lugar_residencia )
        REFERENCES tbl_lugares ( id_lugar );

ALTER TABLE tbl_vendedores
    ADD CONSTRAINT tbl_vend_tbl_lug_fkv2 FOREIGN KEY ( id_lugar_nacimiento )
        REFERENCES tbl_lugares ( id_lugar );

CREATE SEQUENCE tbl_categorias_productos_id_ca START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_categorias_productos_id_ca BEFORE
    INSERT ON tbl_categorias_productos
    FOR EACH ROW
    WHEN ( new.id_categoria_producto IS NULL )
BEGIN
    :new.id_categoria_producto := tbl_categorias_productos_id_ca.nextval;
END;
/

CREATE SEQUENCE tbl_colores_id_color_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_colores_id_color_trg BEFORE
    INSERT ON tbl_colores
    FOR EACH ROW
    WHEN ( new.id_color IS NULL )
BEGIN
    :new.id_color := tbl_colores_id_color_seq.nextval;
END;
/

CREATE SEQUENCE tbl_comentarios_id_comentario START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_comentarios_id_comentario BEFORE
    INSERT ON tbl_comentarios
    FOR EACH ROW
    WHEN ( new.id_comentario IS NULL )
BEGIN
    :new.id_comentario := tbl_comentarios_id_comentario.nextval;
END;
/

CREATE SEQUENCE tbl_consumidores_id_consumidor START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_consumidores_id_consumidor BEFORE
    INSERT ON tbl_consumidores
    FOR EACH ROW
    WHEN ( new.id_consumidor IS NULL )
BEGIN
    :new.id_consumidor := tbl_consumidores_id_consumidor.nextval;
END;
/

CREATE SEQUENCE tbl_direcciones_consumidor_id_ START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_direcciones_consumidor_id_ BEFORE
    INSERT ON tbl_direcciones_consumidor
    FOR EACH ROW
    WHEN ( new.id_direccion_consumidor IS NULL )
BEGIN
    :new.id_direccion_consumidor := tbl_direcciones_consumidor_id_.nextval;
END;
/

CREATE SEQUENCE tbl_editoriales_id_editorial START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_editoriales_id_editorial BEFORE
    INSERT ON tbl_editoriales
    FOR EACH ROW
    WHEN ( new.id_editorial IS NULL )
BEGIN
    :new.id_editorial := tbl_editoriales_id_editorial.nextval;
END;
/

CREATE SEQUENCE tbl_empresas_id_empresa_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_empresas_id_empresa_trg BEFORE
    INSERT ON tbl_empresas
    FOR EACH ROW
    WHEN ( new.id_empresa IS NULL )
BEGIN
    :new.id_empresa := tbl_empresas_id_empresa_seq.nextval;
END;
/

CREATE SEQUENCE tbl_estados_pedido_id_estado START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_estados_pedido_id_estado BEFORE
    INSERT ON tbl_estados_pedido
    FOR EACH ROW
    WHEN ( new.id_estado IS NULL )
BEGIN
    :new.id_estado := tbl_estados_pedido_id_estado.nextval;
END;
/

CREATE SEQUENCE tbl_estados_productos_id_estad START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_estados_productos_id_estad BEFORE
    INSERT ON tbl_estados_productos
    FOR EACH ROW
    WHEN ( new.id_estado IS NULL )
BEGIN
    :new.id_estado := tbl_estados_productos_id_estad.nextval;
END;
/

CREATE SEQUENCE tbl_imagenes_id_imagen_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_imagenes_id_imagen_trg BEFORE
    INSERT ON tbl_imagenes
    FOR EACH ROW
    WHEN ( new.id_imagen IS NULL )
BEGIN
    :new.id_imagen := tbl_imagenes_id_imagen_seq.nextval;
END;
/

CREATE SEQUENCE tbl_keywords_id_keyword_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_keywords_id_keyword_trg BEFORE
    INSERT ON tbl_keywords
    FOR EACH ROW
    WHEN ( new.id_keyword IS NULL )
BEGIN
    :new.id_keyword := tbl_keywords_id_keyword_seq.nextval;
END;
/

CREATE SEQUENCE tbl_lugares_id_lugar_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_lugares_id_lugar_trg BEFORE
    INSERT ON tbl_lugares
    FOR EACH ROW
    WHEN ( new.id_lugar IS NULL )
BEGIN
    :new.id_lugar := tbl_lugares_id_lugar_seq.nextval;
END;
/

CREATE SEQUENCE tbl_marcas_id_marca_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_marcas_id_marca_trg BEFORE
    INSERT ON tbl_marcas
    FOR EACH ROW
    WHEN ( new.id_marca IS NULL )
BEGIN
    :new.id_marca := tbl_marcas_id_marca_seq.nextval;
END;
/

CREATE SEQUENCE tbl_memorias_id_memoria_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_memorias_id_memoria_trg BEFORE
    INSERT ON tbl_memorias
    FOR EACH ROW
    WHEN ( new.id_memoria IS NULL )
BEGIN
    :new.id_memoria := tbl_memorias_id_memoria_seq.nextval;
END;
/

CREATE SEQUENCE tbl_mensajes_id_mensaje_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_mensajes_id_mensaje_trg BEFORE
    INSERT ON tbl_mensajes
    FOR EACH ROW
    WHEN ( new.id_mensaje IS NULL )
BEGIN
    :new.id_mensaje := tbl_mensajes_id_mensaje_seq.nextval;
END;
/

CREATE SEQUENCE tbl_pedidos_id_pedido_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_pedidos_id_pedido_trg BEFORE
    INSERT ON tbl_pedidos
    FOR EACH ROW
    WHEN ( new.id_pedido IS NULL )
BEGIN
    :new.id_pedido := tbl_pedidos_id_pedido_seq.nextval;
END;
/

CREATE SEQUENCE tbl_personas_id_persona_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_personas_id_persona_trg BEFORE
    INSERT ON tbl_personas
    FOR EACH ROW
    WHEN ( new.id_persona IS NULL )
BEGIN
    :new.id_persona := tbl_personas_id_persona_seq.nextval;
END;
/

CREATE SEQUENCE tbl_procesadores_id_procesador START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_procesadores_id_procesador BEFORE
    INSERT ON tbl_procesadores
    FOR EACH ROW
    WHEN ( new.id_procesador IS NULL )
BEGIN
    :new.id_procesador := tbl_procesadores_id_procesador.nextval;
END;
/

CREATE SEQUENCE tbl_productos_id_producto_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_productos_id_producto_trg BEFORE
    INSERT ON tbl_productos
    FOR EACH ROW
    WHEN ( new.id_producto IS NULL )
BEGIN
    :new.id_producto := tbl_productos_id_producto_seq.nextval;
END;
/

CREATE SEQUENCE tbl_productos_en_venta_id_prod START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_productos_en_venta_id_prod BEFORE
    INSERT ON tbl_productos_en_venta
    FOR EACH ROW
    WHEN ( new.id_prod_vend IS NULL )
BEGIN
    :new.id_prod_vend := tbl_productos_en_venta_id_prod.nextval;
END;
/

CREATE SEQUENCE tbl_productos_pedidos_id_prod_ START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_productos_pedidos_id_prod_ BEFORE
    INSERT ON tbl_productos_pedidos
    FOR EACH ROW
    WHEN ( new.id_prod_ped IS NULL )
BEGIN
    :new.id_prod_ped := tbl_productos_pedidos_id_prod_.nextval;
END;
/

CREATE SEQUENCE tbl_sistemas_operativos_id_sis START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_sistemas_operativos_id_sis BEFORE
    INSERT ON tbl_sistemas_operativos
    FOR EACH ROW
    WHEN ( new.id_sistema_operativo IS NULL )
BEGIN
    :new.id_sistema_operativo := tbl_sistemas_operativos_id_sis.nextval;
END;
/

CREATE SEQUENCE tbl_tarjetas_bancarias_id_tarj START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_tarjetas_bancarias_id_tarj BEFORE
    INSERT ON tbl_tarjetas_bancarias
    FOR EACH ROW
    WHEN ( new.id_tarjeta IS NULL )
BEGIN
    :new.id_tarjeta := tbl_tarjetas_bancarias_id_tarj.nextval;
END;
/

CREATE SEQUENCE tbl_tecnicas_id_tecnica_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_tecnicas_id_tecnica_trg BEFORE
    INSERT ON tbl_tecnicas
    FOR EACH ROW
    WHEN ( new.id_tecnica IS NULL )
BEGIN
    :new.id_tecnica := tbl_tecnicas_id_tecnica_seq.nextval;
END;
/

CREATE SEQUENCE tbl_tipo_logistica_id_logistic START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_tipo_logistica_id_logistic BEFORE
    INSERT ON tbl_tipo_logistica
    FOR EACH ROW
    WHEN ( new.id_logistica IS NULL )
BEGIN
    :new.id_logistica := tbl_tipo_logistica_id_logistic.nextval;
END;
/

CREATE SEQUENCE tbl_tipos_cuentas_id_tipo_cuen START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_tipos_cuentas_id_tipo_cuen BEFORE
    INSERT ON tbl_tipos_cuentas
    FOR EACH ROW
    WHEN ( new.id_tipo_cuenta IS NULL )
BEGIN
    :new.id_tipo_cuenta := tbl_tipos_cuentas_id_tipo_cuen.nextval;
END;
/

CREATE SEQUENCE tbl_tipos_lugares_id_tipo_luga START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_tipos_lugares_id_tipo_luga BEFORE
    INSERT ON tbl_tipos_lugares
    FOR EACH ROW
    WHEN ( new.id_tipo_lugar IS NULL )
BEGIN
    :new.id_tipo_lugar := tbl_tipos_lugares_id_tipo_luga.nextval;
END;
/

CREATE SEQUENCE tbl_tipos_propietarios_id_tipo START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_tipos_propietarios_id_tipo BEFORE
    INSERT ON tbl_tipos_propietarios
    FOR EACH ROW
    WHEN ( new.id_tipo_propietario IS NULL )
BEGIN
    :new.id_tipo_propietario := tbl_tipos_propietarios_id_tipo.nextval;
END;
/

CREATE SEQUENCE tbl_vendedores_id_vendedor_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_vendedores_id_vendedor_trg BEFORE
    INSERT ON tbl_vendedores
    FOR EACH ROW
    WHEN ( new.id_vendedor IS NULL )
BEGIN
    :new.id_vendedor := tbl_vendedores_id_vendedor_seq.nextval;
END;
/



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            35
-- CREATE INDEX                             0
-- ALTER TABLE                             83
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                          29
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
-- CREATE SEQUENCE                         29
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
-- WARNINGS                                 1
