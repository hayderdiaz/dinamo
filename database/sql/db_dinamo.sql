DROP TABLE tab_cont_invent;									   
DROP TABLE tab_reportes;
DROP TABLE tab_caja;
DROP TABLE tab_ing_egr;
DROP TABLE tab_devol_det;
DROP TABLE tab_devol_enc;
DROP TABLE tab_serv_clientes;
DROP TABLE tab_recaudos_det;
DROP TABLE tab_recaudos_enc;
DROP TABLE tab_can_apartados;
DROP TABLE tab_apartados_det;
DROP TABLE tab_apartados_enc;
DROP TABLE tab_guardados;
DROP TABLE tab_facturas_det;
DROP TABLE tab_info_factura;
DROP TABLE tab_facturas_enc;
DROP TABLE tab_kardex;
DROP TABLE tab_pedidos_det;
DROP TABLE tab_pedidos_enc;
DROP TABLE tab_med_pago;
DROP TABLE tab_for_pago;
DROP TABLE tab_consignaciones;
DROP TABLE tab_almacenes;
DROP TABLE tab_inventario;
DROP TABLE tab_labrados;
DROP TABLE tab_graficos;
DROP TABLE tab_colores;
DROP TABLE tab_tipos_productos;
DROP TABLE tab_medidas;
DROP TABLE tab_marcas;
DROP TABLE tab_insumos;
DROP TABLE tab_lineas_insumo;
DROP TABLE tab_clientes;
DROP TABLE tab_proveedores;
DROP TABLE tab_bon_det;
DROP TABLE tab_bon_enc;
DROP TABLE tab_com_emp;
DROP TABLE tab_avances;
DROP TABLE tab_empleados;
DROP TABLE tab_comisiones;
DROP TABLE tab_parametros;
DROP TABLE tab_ciudades;
DROP TABLE tab_departamentos;
DROP TABLE tab_perfil_submenu;
DROP TABLE tab_perfil_menu;
DROP TABLE tab_submenu;
DROP TABLE tab_menu;
DROP TABLE users;
DROP TABLE migrations;
DROP TABLE password_resets;
DROP TABLE tab_perfiles;
DROP SEQUENCE migrations_id_seq;
DROP SEQUENCE users_id_seq;


------------------------------------------------------------------------------------------------------------------------------------

CREATE SEQUENCE migrations_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 79
  CACHE 1;

------------------------------------------------------------------------------------------------------------------------------------

CREATE SEQUENCE users_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;

------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE migrations
(
	id			INTEGER 		NOT NULL DEFAULT nextval('migrations_id_seq'::regclass),					--Identificador del perfil
	migration	VARCHAR(255)	NOT NULL,					
	batch		INTEGER 		NOT NULL,
	PRIMARY KEY(id)
);

------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE password_resets
(
  email 	VARCHAR(255) NOT NULL,
  token 	VARCHAR(255) NOT NULL,
  created_at TIMESTAMP(0) WITHOUT TIME ZONE
);

------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE tab_perfiles
(
	id_perfil			DECIMAL(2,0) 				NOT NULL,					--Identificador del perfil
	nom_perfil			VARCHAR(20)					NOT NULL,					--Nombre del perfil
	PRIMARY KEY(id_perfil)
);
 
------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE users
(
	id 					INTEGER						NOT NULL DEFAULT nextval('users_id_seq'::regclass),
	id_usuario			VARCHAR(12)					NOT NULL,					--Identificador del usuario       
	id_perfil			DECIMAL(5,0)				NOT NULL,					--Identificador del perfil
	name 				VARCHAR(20)					NOT NULL,					--Nombre del usuario
	email				VARCHAR(30)					NOT NULL,
	ind_estado			BOOLEAN						NOT NULL DEFAULT TRUE,		--Indicador de usuario (t:Activo f:Inactivo)
	email_verified_at	TIMESTAMP(0) WITHOUT TIME ZONE,	
	password			VARCHAR(255)					NOT NULL,
	remember_token		VARCHAR(100),
	created_at 			TIMESTAMP(0) WITHOUT TIME ZONE,	
  	updated_at 			TIMESTAMP(0) WITHOUT TIME ZONE,	
	UNIQUE(email, id_usuario),
	PRIMARY KEY(id),
	FOREIGN KEY(id_perfil) REFERENCES tab_perfiles(id_perfil)
);

------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE tab_menu
(
	id_menu			DECIMAL(2,0)				NOT NULL,					--identificador del menu
	nom_menu		VARCHAR(50)					NOT NULL,					--Nombre del menu
	link_menu		VARCHAR(100)				NOT NULL,					--Link del menu
	ico_menu		VARCHAR(50)					NOT NULL,					--Imagen o icono del menu
	PRIMARY KEY(id_menu)
);

------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE tab_submenu
(
	id_submenu			DECIMAL(2,0)				NOT NULL,					--Identificador del submenu
	nom_submenu			VARCHAR(50)					NOT NULL,					--Nombre del submenu
	link_submenu		VARCHAR(100)				NOT NULL,					--Link del submenu
	ico_submenu			VARCHAR(50)					NOT NULL,					--Imagen o icono del submenu
	PRIMARY KEY(id_submenu)
);

------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE tab_perfil_menu
(
	id_perfil			DECIMAL(2,0) 				NOT NULL,					--Identificador del perfil
	id_menu				DECIMAL(2,0)				NOT NULL,					--identificador del menu
	usr_insert			VARCHAR(20)					NOT NULL, 
	fec_insert			TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update			VARCHAR(20),
	fec_update			TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_perfil, id_menu),
	FOREIGN KEY(id_perfil) REFERENCES tab_perfiles(id_perfil),
	FOREIGN KEY(id_menu) REFERENCES tab_menu(id_menu)
);

------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE tab_perfil_submenu
(
	id_perfil			DECIMAL(2,0) 				NOT NULL,					--Identificador del perfil
	id_menu				DECIMAL(2,0)				NOT NULL,					--identificador del menu
	id_submenu			DECIMAL(2,0)				NOT NULL,					--Identificador del submenu
	usr_insert			VARCHAR(20)					NOT NULL,
	fec_insert			TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update			VARCHAR(20),
	fec_update			TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_perfil, id_menu, id_submenu),
	FOREIGN KEY(id_perfil) REFERENCES tab_perfiles(id_perfil),
	FOREIGN KEY(id_menu) REFERENCES tab_menu(id_menu),
	FOREIGN KEY(id_submenu) REFERENCES tab_submenu(id_submenu)
);

------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE tab_departamentos
(
	id_depto		DECIMAL(3,0)	NOT NULL,		--Identificador del Departamento
	nom_depto		VARCHAR(50)		NOT NULL,		--Nombre del Departamento
	PRIMARY KEY(id_depto)
);

------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE tab_ciudades
(
	id_ciudad			DECIMAL(5,0)	NOT NULL,		--Identificador de la ciudad
	id_depto			DECIMAL(3,0)	NOT NULL,		--Identificador del Departamento
	nom_ciudad			VARCHAR(50)		NOT NULL,		--Nombre de la ciudad
	PRIMARY KEY(id_ciudad),
	FOREIGN KEY(id_depto)REFERENCES tab_departamentos(id_depto)
);

------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE tab_parametros
(
	id_consec			CHAR(1)						NOT NULL,				--Consecutivo
	id_empresa			VARCHAR(20)					NOT NULL,				--Identificador de la empresa
	id_ciudad			DECIMAL(5,0)				NOT NULL,				--Identificador de la ciudad
	nom_empresa			VARCHAR(100)				NOT NULL,				--Nombre de la empresa
	dir_empresa			VARCHAR(60)					NOT NULL DEFAULT 'N/A',	--Direccion de la empresa
	tel_empresa			VARCHAR(60)					NOT NULL DEFAULT 'N/A',	--Telefono de la empresa
	cor_empresa			VARCHAR(60)					NOT NULL DEFAULT 'N/A',	--Correo de la empresa
	pag_empresa			VARCHAR(100)				NOT NULL DEFAULT 'N/A',	--Pagina web de la empresa
	rep_legal			VARCHAR(100)				NOT NULL DEFAULT 'N/A',	--Representante legal
	ind_kardex			CHAR(1)						NOT NULL DEFAULT '1',	--Indicador de Kardex (1:Promedio ponderado)
	dias_apartado		SMALLINT					NOT NULL DEFAULT 5,		--Dias de plazo para cancelar los productos apartados
	/* Facturacion */
	ind_regimen			BOOLEAN						NOT NULL DEFAULT TRUE,	--False: (Regimen Simplificado), True: (Regimen Común) 		
	res_dian			VARCHAR(20)					NOT NULL,				--Resolución de la Dian								
	num_fac_ini			DECIMAL(7,0)				NOT NULL DEFAULT 1,		--Numero de factura inicial
	num_fac_act			DECIMAL(7,0)				NOT NULL DEFAULT 1,		--Numero de factura actual
	num_fac_fin			DECIMAL(7,0)				NOT NULL DEFAULT 1000,	--Numero de factura final
	obs_factura			VARCHAR(500)				NOT NULL,				--Observación de facturación (Legalidad)
	gar_factura			VARCHAR(500)				NOT NULL,				--Observación para garantia	
	/* Recaudos */
	num_rec_ini			DECIMAL(7,0)				NOT NULL DEFAULT 1,		--Numero de recaudo inicial
	num_rec_act			DECIMAL(7,0)				NOT NULL DEFAULT 1,		--Numero de recaudo actual
	num_rec_fin			DECIMAL(7,0)				NOT NULL DEFAULT 1000,	--Numero de recaudo final
	/* Sistecredito */
	por_siste			SMALLINT					NOT NULL DEFAULT 3,		--Porcentaje de sistecredito de la venta cobrado a dinamo
	por_des_siste		SMALLINT					NOT NULL DEFAULT 5,		--Porcentaje descuento del credito de sistecredito utilizado en la venta
	dias_siste			SMALLINT					NOT NULL DEFAULT 10,		--Dias de plazo para cancelar el valor de credito utilizado en la venta
	usr_update			VARCHAR(20),
	fec_update			TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_consec),
	FOREIGN KEY(id_ciudad)REFERENCES tab_ciudades(id_ciudad)
);

------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE tab_comisiones
(
	id_comision			DECIMAL(10,0)				NOT NULL,	--Identificador de la comision
	val_comision_ini	DECIMAL(10,0)				NOT NULL,	--Valor de venta inicial para comisionar.
	val_comision_fin	DECIMAL(10,0)				NOT NULL,	--Valor de venta final para comisionar.
	val_porcentaje		DECIMAL(4,0)				NOT NULL, 	--Porcentaje de comision.
	val_comision		DECIMAL(10,0)				NOT NULL,	--Valor a pagar para comision.
	tip_pago			BOOLEAN						NOT NULL,	--Tipo de pago(t:Porcentaje f:Valor fijo)
	ind_comision		BOOLEAN						NOT NULL DEFAULT TRUE,
	usr_insert			VARCHAR(20)					NOT NULL,
	fec_insert			TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update			VARCHAR(20),
	fec_update			TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_comision)
);

---------------------------------------------------------------------------------------------------------------

CREATE TABLE tab_empleados
(
	id_empleado		VARCHAR(12)					NOT NULL,				--Identificador del empleado
	nom_empleado	VARCHAR(100)				NOT NULL,				--Nombre del empleado
	dir_empleado	VARCHAR(50)					NOT NULL DEFAULT 'N/A',	--Direccion del empleado
	tel_empleado	VARCHAR(40)					NOT NULL DEFAULT 'N/A',	--Telefonos y celulares del empleado
	cor_empleado	VARCHAR(80)					NOT NULL DEFAULT 'N/A',	--Correo del empleado
	usr_insert		VARCHAR(20)					NOT NULL,
	fec_insert		TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update		VARCHAR(20),
	fec_update		TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_empleado)
);

---------------------------------------------------------------------------------------------------------------

CREATE TABLE tab_com_emp		-- Tabla de comisiones de empleados
(
	id_consec			DECIMAL(10,0) 				NOT NULL,	--Identificador del detalle de las bonificaciones
	id_comision			DECIMAL(10,0)				NOT NULL,	--Identificador de la comision
	id_empleado			VARCHAR(12)					NOT NULL,	--Identificador del empleado
	val_comision		DECIMAL(10,0)				NOT NULL,	--Valor que se gano en comisiones..
	val_facturas		DECIMAL(10,0)				NOT NULL,	--Valor total de las facturas comisionadas
	fec_comision		DATE						NOT NULL DEFAULT NOW(),	--Fecha de la comision
	ind_pago			BOOLEAN						NOT NULL DEFAULT FALSE,
	usr_insert			VARCHAR(20)					NOT NULL,
	fec_insert			TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update			VARCHAR(20),
	fec_update			TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_consec),
	FOREIGN KEY (id_empleado) REFERENCES tab_empleados(id_empleado),
	FOREIGN KEY (id_comision) REFERENCES tab_comisiones(id_comision)
);

---------------------------------------------------------------------------------------------------------------

CREATE TABLE tab_bon_enc		--Tabla del encabezado de las bonificaciones
(
	id_bonif			DECIMAL(10,0)				NOT NULL,	--Identificador del encabezado de las bonificaciones
	/* Pro productos */
	val_meta_pro		DECIMAL(10,0)				NOT NULL,	--Valor de meta (venta de productos)
	bon_meta_pro		DECIMAL(7,0)				NOT NULL,	--Bonificacion de la meta (venta de productos)
	ind_meta_pro		BOOLEAN						NOT NULL,	--Indicador de meta (venta de productos) (t:Activa f:Inactiva)
	/* Por servicios */
	val_meta_ser		DECIMAL(10,0)				NOT NULL,	--Valor de meta (venta de servicios)
	bon_meta_ser		DECIMAL(7,0)				NOT NULL,	--Bonificacion de la meta (venta de servicios)
	ind_meta_ser		BOOLEAN						NOT NULL,	--Indicador de meta (venta de servicios) (t:Activa f:Inactiva)
	mes_meta			VARCHAR(10)					NOT NULL,	--Mes de la meta
	ano_meta			CHAR(4)						NOT NULL,	--Año de la meta
	usr_insert			VARCHAR(20)					NOT NULL,
	fec_insert			TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update			VARCHAR(20),
	fec_update			TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_bonif)
);

---------------------------------------------------------------------------------------------------------------

CREATE TABLE tab_bon_det		--Tabla del detalle de las bonificaciones
(
	id_consec			DECIMAL(10,0) 				NOT NULL,				--Identificador del detalle de las bonificaciones
	id_bonif			DECIMAL(10,0) 				NOT NULL,				--Identificador del encabezado de las bonificaciones
	id_empleado			VARCHAR(12)					NOT NULL,				--Identificador del empleado
	val_acumulado		DECIMAL(10,0) 				NOT NULL,				--Valor total acumulado de las ventas del empleado
	val_bonificacion	DECIMAL(10,0) 				NOT NULL DEFAULT 0,		--Valor bonificado del empleado
	usr_insert			VARCHAR(20)					NOT NULL,
	fec_insert			TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update			VARCHAR(20),
	fec_update			TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_consec),
	FOREIGN KEY(id_bonif) REFERENCES tab_bon_enc(id_bonif),
	FOREIGN KEY(id_empleado) REFERENCES tab_empleados(id_empleado)
);

---------------------------------------------------------------------------------------------------------------


CREATE TABLE tab_proveedores
(
	id_proveedor		VARCHAR(30)					NOT NULL,					--Identificador del proveedor
	nom_proveedor		VARCHAR(100)				NOT NULL,					--Nombre del proveedor
	id_ciudad			DECIMAL(5,0)				NOT NULL,					--Identificador de la ciudad
	dir_proveedor		VARCHAR(50)					NOT NULL DEFAULT 'N/A',		--Direccion del proveedor
	tel_proveedor		VARCHAR(50)					NOT NULL DEFAULT 'N/A',		--Telefono del proveedor
	cor_proveedor		VARCHAR(60)					NOT NULL DEFAULT 'N/A',		--Correo del proveedor
	rep_legal			VARCHAR(70)					NOT NULL DEFAULT 'N/A',		--Representante legal
	sal_favor			DECIMAL(10,0)				NOT NULL DEFAULT 0,			--Saldo a favor de dinamo sobre las compras que se hacen al proveedor
	ind_estado			BOOLEAN						NOT NULL DEFAULT TRUE,
	usr_insert			VARCHAR(20)					NOT NULL,
	fec_insert			TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update			VARCHAR(20),
	fec_update			TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_proveedor),
	FOREIGN KEY(id_ciudad)REFERENCES tab_ciudades(id_ciudad)
);

---------------------------------------------------------------------------------------------------------------
CREATE TABLE tab_clientes
(
	id_cliente		VARCHAR(30)					NOT NULL,					--Identificador del cliente
	id_ciudad		DECIMAL(5,0)				NOT NULL,					--Identificador de la ciudad
	nom_cliente		VARCHAR(100)				NOT NULL,					--Nombre del cliente
	dir_cliente		VARCHAR(50)					NOT NULL DEFAULT 'N/A',		--Direccion del cliente
	tel_cliente		VARCHAR(60)					NOT NULL DEFAULT 'N/A',		--Telefonos del cliente
	cor_cliente		VARCHAR(60)					NOT NULL DEFAULT 'N/A',		--Correo del cliente
	tip_cliente		CHAR(1)						NOT NULL,					--Tipo de cliente(1:Cliente final 2:Mayorista)
	sal_favor		DECIMAL(10,0)				NOT NULL DEFAULT 0,			--Saldo a favor del cliente
	fid_cliente		BOOLEAN						NOT NULL DEFAULT FALSE,		--Fidelizacion del cliente (t:Fidelizado f:No fidelizado)
	ind_estado		BOOLEAN						NOT NULL DEFAULT TRUE,		--Estado del cliente(t:Activo f:Inactivo)
	usr_insert		VARCHAR(20)					NOT NULL,
	fec_insert		TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update		VARCHAR(20),
	fec_update		TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_cliente),
	FOREIGN KEY(id_ciudad)REFERENCES tab_ciudades(id_ciudad)
);
CREATE INDEX i_nom_cliente ON tab_clientes(nom_cliente);
---------------------------------------------------------------------------------------------------------------

CREATE TABLE tab_lineas_insumo										--Lineas de insumos
(
	id_linea		DECIMAL(5,0)				NOT NULL,				--Identificador de la linea
	nom_linea		VARCHAR(60)					NOT NULL,				--Nombre de la linea
	tip_linea		BOOLEAN						NOT NULL,				--Tipo de linea (t:Producto f:Servicio)
	val_iva			DECIMAL(2,0)				NOT NULL,				--Porcentaje del IVA
	/* indicadores del producto */
	ind_marca		BOOLEAN						NOT NULL,
	ind_medida		BOOLEAN						NOT NULL,
	ind_tipo		BOOLEAN						NOT NULL,
	ind_color		BOOLEAN						NOT NULL,
	ind_grafico		BOOLEAN						NOT NULL,
	ind_labrado		BOOLEAN						NOT NULL,
	ind_linea		BOOLEAN						NOT NULL DEFAULT TRUE,	--Indicador de la linea (t:Activa f:Inactiva)
	usr_insert		VARCHAR(20)					NOT NULL,
	fec_insert		TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update		VARCHAR(20),
	fec_update		TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_linea)
);

---------------------------------------------------------------------------------------------------------------

CREATE TABLE tab_insumos
(
	id_linea		DECIMAL(5,0)				NOT NULL,
	id_insumo		DECIMAL(15,0)				NOT NULL, 											--Identificador del insumo(codigo de barras)
	ref_producto	VARCHAR(20)					NOT NULL,
	nom_insumo		VARCHAR(100)				NOT NULL, 											--Nombre del inusmo
	tip_insumo		BOOLEAN						NOT NULL,											--Tipo de insumo (t:Producto f:Servicio)
	val_sistecredito	DECIMAL(10,0)			NOT NULL DEFAULT 0,									--Valor precio sugerido de venta
	val_cliente_f	DECIMAL(10,0)				NOT NULL DEFAULT 0,									--Valor del insumo cliente final
	val_cliente_m	DECIMAL(10,0)				NOT NULL DEFAULT 0,									--Valor del insumo cliente mayorista
	val_pag_web		DECIMAL(10,0)				NOT NULL DEFAULT 0,									--Valor precio de pagina web
	ind_iva			BOOLEAN						NOT NULL,											--Indicador de iva(t:con iva f:sin iva)
	tip_precio		BOOLEAN						NOT NULL DEFAULT TRUE,								--Tipo de precio(t:precio normal f:precio sugerido)
	ind_promocion	BOOLEAN						NOT NULL DEFAULT FALSE,								--(t:en promocion f:no esta en promocion)
	por_ganancia	SMALLINT					NOT NULL,											--Porcentaje de ganancia por servicios realizados
	ind_insumo		BOOLEAN						NOT NULL DEFAULT TRUE,								--Estado del insumo (t:Activo f:Inactivo)
	img_1			VARCHAR(100)				NOT NULL DEFAULT '/dinamo/images/img_insumos/default.jpg',	--Imagen del Producto o Servicio.
	img_2			VARCHAR(100)				NOT NULL DEFAULT '/dinamo/images/img_insumos/default.jpg',	--Imagen del Producto o Servicio.
	img_3			VARCHAR(100)				NOT NULL DEFAULT '/dinamo/images/img_insumos/default.jpg',	--Imagen del Producto o Servicio.
	img_4			VARCHAR(100)				NOT NULL DEFAULT '/dinamo/images/img_insumos/default.jpg',	--Imagen del Producto o Servicio.
	img_5			VARCHAR(100)				NOT NULL DEFAULT '/dinamo/images/img_insumos/default.jpg',	--Imagen del Producto o Servicio.
	val_minimo		INTEGER,																		--Valor minimo del insumo
	val_reorden		INTEGER,																		--Valor de reorden del insumo
	val_maximo		INTEGER,																		--Valor maximo del insumo
	usr_insert		VARCHAR(20)					NOT NULL,
	fec_insert		TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update		VARCHAR(20),
	fec_update		TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_insumo),
	FOREIGN KEY(id_linea)REFERENCES tab_lineas_insumo(id_linea)
);
CREATE INDEX i_tab_insumos ON tab_insumos(id_linea, id_insumo, nom_insumo, ind_insumo);

---------------------------------------------------------------------------------------------------------------

CREATE TABLE tab_marcas
(
	id_linea		DECIMAL(5,0)				NOT NULL,
	id_marca		DECIMAL(5,0)				NOT NULL,
	nom_marca		VARCHAR(50)					NOT NULL,
	ind_estado		BOOLEAN						NOT NULL DEFAULT FALSE,
	usr_insert		VARCHAR(20)					NOT NULL,
	fec_insert		TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update		VARCHAR(20),
	fec_update		TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_marca)
);

---------------------------------------------------------------------------------------------------------------

CREATE TABLE tab_medidas
(
	id_linea		DECIMAL(5,0)				NOT NULL,
	id_medida		DECIMAL(5,0)				NOT NULL,
	nom_medida		VARCHAR(50)					NOT NULL,
	ind_estado		BOOLEAN						NOT NULL DEFAULT FALSE,
	usr_insert		VARCHAR(20)					NOT NULL,
	fec_insert		TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update		VARCHAR(20),
	fec_update		TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_medida)
);

---------------------------------------------------------------------------------------------------------------

CREATE TABLE tab_tipos_productos
(
	id_linea		DECIMAL(5,0)				NOT NULL,
	id_tipo			DECIMAL(5,0)				NOT NULL,
	nom_tipo		VARCHAR(50)					NOT NULL,
	ind_estado		BOOLEAN						NOT NULL DEFAULT FALSE,
	usr_insert		VARCHAR(20)					NOT NULL,
	fec_insert		TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update		VARCHAR(20),
	fec_update		TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_tipo)
);

---------------------------------------------------------------------------------------------------------------

CREATE TABLE tab_colores
(
	id_linea		DECIMAL(5,0)				NOT NULL,
	id_color		DECIMAL(5,0)				NOT NULL,
	nom_color		VARCHAR(50)					NOT NULL,
	ind_estado		BOOLEAN						NOT NULL DEFAULT FALSE,
	usr_insert		VARCHAR(20)					NOT NULL,
	fec_insert		TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update		VARCHAR(20),
	fec_update		TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_color)
);

---------------------------------------------------------------------------------------------------------------

CREATE TABLE tab_graficos
(
	id_linea		DECIMAL(5,0)				NOT NULL,
	id_grafico		DECIMAL(5,0)				NOT NULL,
	nom_grafico		VARCHAR(50)					NOT NULL,
	ind_estado		BOOLEAN						NOT NULL DEFAULT FALSE,
	usr_insert		VARCHAR(20)					NOT NULL,
	fec_insert		TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update		VARCHAR(20),
	fec_update		TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_grafico)
);

---------------------------------------------------------------------------------------------------------------

CREATE TABLE tab_labrados
(
	id_linea		DECIMAL(5,0)				NOT NULL,
	id_labrado		DECIMAL(5,0)				NOT NULL,
	nom_labrado		VARCHAR(50)					NOT NULL,
	ind_estado		BOOLEAN						NOT NULL DEFAULT FALSE,
	usr_insert		VARCHAR(20)					NOT NULL,
	fec_insert		TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update		VARCHAR(20),
	fec_update		TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_labrado)
);

---------------------------------------------------------------------------------------------------------------

CREATE TABLE tab_inventario
(
	id_insumo		DECIMAL(15,0)				NOT NULL, 											--Identificador del insumo(codigo de barras)
	id_marca		DECIMAL(5,0)				NOT NULL,
	id_medida		DECIMAL(5,0)				NOT NULL,
	id_tipo			DECIMAL(5,0)				NOT NULL,
	id_color		DECIMAL(5,0)				NOT NULL,
	id_grafico		DECIMAL(5,0)				NOT NULL,
	id_labrado		DECIMAL(5,0)				NOT NULL,
	val_cantidad	DECIMAL(5,0)				NOT NULL,
	usr_insert		VARCHAR(20)					NOT NULL,
	fec_insert		TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update		VARCHAR(20),
	fec_update		TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_insumo),
	FOREIGN KEY(id_insumo)REFERENCES tab_insumos(id_insumo),
	FOREIGN KEY(id_marca)REFERENCES tab_marcas(id_marca),
	FOREIGN KEY(id_medida)REFERENCES tab_medidas(id_medida),
	FOREIGN KEY(id_tipo)REFERENCES tab_tipos_productos(id_tipo),
	FOREIGN KEY(id_color)REFERENCES tab_colores(id_color),
	FOREIGN KEY(id_grafico)REFERENCES tab_graficos(id_grafico),
	FOREIGN KEY(id_labrado)REFERENCES tab_labrados(id_labrado)
);

---------------------------------------------------------------------------------------------------------------

CREATE TABLE tab_almacenes --Lugares donde los productos son enviados (vitrina, bodega, etc)
(
	id_almacen	 		DECIMAL(2,0) 				NOT NULL, 					-- Identificador del Almacen
	nom_almacen			VARCHAR(50)					NOT NULL, 					-- Nombre del Almacen
	ind_almacen			BOOLEAN						NOT NULL DEFAULT TRUE,		-- Indicador Almacen (t: Activa, f: Inactiva)
	usr_insert			VARCHAR(20)					NOT NULL,
	fec_insert			TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update			VARCHAR(20),
	fec_update			TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_almacen)
);

---------------------------------------------------------------------------------------------------------------

CREATE TABLE tab_consignaciones
(
	id_consec			DECIMAL(6,0)				NOT NULL,					--consecutivo
	id_proveedor		VARCHAR(30)					NOT NULL,					--Identificador del proveedor
	val_consig			DECIMAL(7,0)				NOT NULL,					--valor consignacion
	observ				VARCHAR(150)				NOT NULL,					--Observacion o comentario de la consignacion
	fec_consig 			DATE						NOT NULL DEFAULT NOW(),		--Fecha de la consignacion
	img_consig			VARCHAR(100)				NOT NULL DEFAULT '/dinamo/images/img_consignaciones/default.jpg',	--Imagen del Producto o Servicio.
	usr_insert			VARCHAR(20)					NOT NULL,
	fec_insert			TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update			VARCHAR(20),
	fec_update			TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_consec),
	FOREIGN KEY(id_proveedor) REFERENCES tab_proveedores(id_proveedor)
);

CREATE TABLE tab_for_pago
(
	id_for_pago			SMALLINT					NOT NULL,
	for_pago			VARCHAR(50)					NOT NULL,
	ind_estado			BOOLEAN						NOT NULL DEFAULT TRUE,
	usr_insert			VARCHAR(20)					NOT NULL,
	fec_insert			TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update			VARCHAR(20),
	fec_update			TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_for_pago)
);

CREATE TABLE tab_med_pago
(
	id_consec			SMALLINT					NOT NULL,
	id_for_pago			SMALLINT					NOT NULL,
	med_pago			VARCHAR(50)					NOT NULL,
	por_cobro			SMALLINT					NOT NULL,
	ind_estado			BOOLEAN						NOT NULL DEFAULT TRUE,
	usr_insert			VARCHAR(20)					NOT NULL,
	fec_insert			TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update			VARCHAR(20),
	fec_update			TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_consec),
	FOREIGN KEY(id_for_pago) REFERENCES tab_for_pago(id_for_pago)
);

-- CREATE TABLE tab_tipo_pago
-- (
	-- id_consec			SMALLINT					NOT NULL,
	-- for_pago			VARCHAR(50)					NOT NULL,
	-- med_pago			VARCHAR(50)					NOT NULL,
	-- por_cobro			SMALLINT					NOT NULL,
	-- usr_insert			VARCHAR(20)					NOT NULL,
	-- fec_insert			TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	-- usr_update			VARCHAR(20),
	-- fec_update			TIMESTAMP WITHOUT TIME ZONE,
	-- PRIMARY KEY(id_consec)
-- );

CREATE TABLE tab_pedidos_enc
(
	id_pedido			DECIMAL(10,0)				NOT NULL,					--Identificador del pedido
	id_proveedor		VARCHAR(30)					NOT NULL,					--Identificador del proveedor
	num_pedido			DECIMAL(10,0),											--Numero de Factura del pedido que trae la compra
	fec_pedido 			DATE						NOT NULL,					--Fecha del Pedido
	vt_bruto			DECIMAL(10,0)				NOT NULL,					--Valor total bruto de la compra
	vt_iva				DECIMAL(10,0)				NOT NULL,					--Valor total iva de la compra
	subtotal			DECIMAL(10,0)				NOT NULL,					--Subtotal sin descuentos
	v_descuento			DECIMAL(10,0)				NOT NULL,					--Descuento por proveedores
	vt_neto				DECIMAL(10,0)				NOT NULL,					--Valor total neto de la compra
	pag_total			DECIMAL(10,0)				NOT NULL,					--Pago total de la factura
	sal_total			DECIMAL(10,0)				NOT NULL,					--Saldo total de la factura
	img_pedido			VARCHAR(100)				NOT NULL DEFAULT '/dinamo/images/img_compras/default.jpg',	--Imagen del Producto o Servicio.
	usr_insert			VARCHAR(20)					NOT NULL,
	fec_insert			TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update			VARCHAR(20),
	fec_update			TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_pedido),
	FOREIGN KEY(id_proveedor) REFERENCES tab_proveedores(id_proveedor)
);

---------------------------------------------------------------------------------------------------------------

CREATE TABLE tab_pedidos_det
(
	id_consec			DECIMAL(10,0)				NOT NULL,					--Identificador del detalle del pedido
	id_pedido			DECIMAL(10,0)				NOT NULL,					--Identificador del encabezado del pedido
	id_insumo			DECIMAL(15,0)				NOT NULL, 					--Identificador del insumo(codigo de barras)
	id_almacen	 		DECIMAL(2,0) 				NOT NULL, 					--Identificador almacen
	val_cantidad		DECIMAL(5,0)				NOT NULL,					--Cantidad del insumo
	val_cant_act		DECIMAL(5,0)				NOT NULL,					--Cantidad actual apartada
	val_cant_dev		DECIMAL(5,0)				NOT NULL DEFAULT 0,			--Cantidad devuelta
	val_unidad			DECIMAL(10,0) 				NOT NULL,					--Valor del insumo por unidad
	val_bruto			DECIMAL(10,0) 				NOT NULL,					--Valor bruto del insumo (val_cantidad * val_unidad)
	iva					DECIMAL(3,0) 				NOT NULL,					--IVA del insumo
	val_iva				DECIMAL(10,0) 				NOT NULL,					--Valor IVA del insumo
	val_neto			DECIMAL(10,0)				NOT NULL,					--Valor neto(val_bruto + val_iva)
	usr_insert			VARCHAR(20)					NOT NULL,
	fec_insert			TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update			VARCHAR(20),
	fec_update			TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_consec),
	FOREIGN KEY(id_pedido) REFERENCES tab_pedidos_enc (id_pedido),
	FOREIGN KEY(id_insumo) REFERENCES tab_insumos(id_insumo),
	FOREIGN KEY(id_almacen) REFERENCES tab_almacenes(id_almacen)
);
---------------------------------------------------------------------------------------------------------------
-- TABLA DE KARDEX CREADA POR RUBEN Y CEP
CREATE TABLE tab_kardex
(
	id_kardex			DECIMAL(10,0)				NOT NULL,					--Consecutivo
	id_insumo			DECIMAL(15,0)				NOT NULL, 					--Identificador del insumo(codigo de barras)
	ind_movimiento		CHAR(2)						NOT NULL,					--Indicador de los movimientos(Entrada/Salida)
	val_cant_movim		DECIMAL(5,0),											--Cantidad de producto vendido o comprado
	val_cant_actual		DECIMAL(5,0),											--Cantidad actual o saldo de producto que queda despues de vender o comprar
	val_precio_movim	DECIMAL(10,0),											--Valor precio unitario del producto vendido o comprado (promediado)
	val_precio_actual	DECIMAL(10,0),											--Valor precio unitario del producto vendido o comprado (promediado)
	val_total_movim		DECIMAL(10,0)				NOT NULL,					--Valor total en dinero del movimiento tras la venta o compra
	val_total_actual	DECIMAL(10,0)				NOT NULL,					--Valor total actual en dinero
	ind_saldo			BOOLEAN						NOT NULL,					--Indicador de si es saldo. T=Saldo actual F=No es saldo actual
	val_observacion		VARCHAR(255),											--ddscripción del movimiento
	fec_movim			DATE						NOT NULL DEFAULT NOW(),		--Fecha del movimiento
	hor_movim			CHAR(8)						NOT NULL DEFAULT TO_CHAR(LOCALTIME,'HH12:MI:SS'),		--Hora del movimiento
	usr_insert			VARCHAR(20)					NOT NULL,
	fec_insert			TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update			VARCHAR(20),
	fec_update			TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_kardex),
	FOREIGN KEY(id_insumo) REFERENCES tab_insumos (id_insumo)
);
--Movimientos						Efecto en existencia
--CP:Compra a Proveedor				+
--PP:Promocion de Proveedor			+
--DC:Devolución del Cliente			+
--SI:Saldo Inicial					+ (una sola vez al iniciar operaciones)
--CA:CAmbio							+ y - dependiendo
--SA:Saldo Actual					+ (Cada vez que hay transacción resulta)
--DP:Devolución al Proveedor		-
--VC:Venta a Cliente				-
--RI:Reajuste del inventario		+ y -

--fecha de apartado, id producto, id cliente, valor del recibo de caja, valor del producto, saldo
--porcentahe de pago de factura cuando se paga con tarjeta parametros

---------------------------------------------------------------------------------------------------------------
--Pendiente por definir descuentos--
CREATE TABLE tab_facturas_enc
(
	id_c_factura		DECIMAL(10,0)				NOT NULL,					--Consecutivo(Necesario para la facturacion de regimen comun)
	id_factura			DECIMAL(10,0)				NOT NULL,					--Identificador Factura encabezado
	id_cliente			VARCHAR(30)					NOT NULL,					--Identificador cliente
	id_empleado			VARCHAR(12)					NOT NULL,					--Identificador del empleado
	fec_factura			DATE						NOT NULL DEFAULT NOW(),		--Fecha de venta de la factura
	hor_factura			CHAR(8)						NOT NULL DEFAULT TO_CHAR(LOCALTIME,'HH12:MI:SS'),		--Hora de la factura
	fec_vencimiento		DATE						NOT NULL DEFAULT NOW(),		--Fecha de vencimiento de la factura
	vt_bruto			DECIMAL(10,0)				NOT NULL,					--Valor total bruto de la factura
	vt_iva				DECIMAL(10,0)				NOT NULL,					--Valor total IVA de la factura
	subtotal			DECIMAL(10,0)				NOT NULL,					--El mismo campo neto pero sin descuentos
	des_general			SMALLINT					NOT NULL,					--Porcentaje del descuento general
	v_des_general		DECIMAL(10,0)				NOT NULL,					--Valor del descuento general
	ind_siste			BOOLEAN						NOT NULL,					--(t: con sistecredito, f: sin sistecredito)
	fec_siste			DATE,													--Fecha de plazo para cancelar el valor utilizado de sistecredito en la factura(esta en los parametros)
	des_siste			SMALLINT					NOT NULL,					--Porcentaje de descuento sistecredito (solo para cuando se activa sistecredito y se ingresa un pago en efectivo)
	v_des_siste			DECIMAL(10,0)				NOT NULL,					--Valor del descuento sistecredito
	vt_neto				DECIMAL(10,0)				NOT NULL,					--Valor total neto o total a pagar
	pag_total			DECIMAL(10,0)				NOT NULL,					--Saldo total de la factura(Se actualiza al recibir mas pagos)
	val_siste			DECIMAL(10,0)				NOT NULL,					--Valor de sistecredito utilizado en la factura(solo si el indicador esta en TRUE)
	sal_total			DECIMAL(10,0)				NOT NULL,					--Saldo total de la factura(Se actualiza al recibir mas pagos)
	/* Anulacion */
	ind_anulacion		BOOLEAN						NOT NULL DEFAULT TRUE,		--Inidicador de anulacion(t:no anulada f:anulada)
	obs_anulacion		VARCHAR(200),
	-- Pago de comision
	id_comision			DECIMAL(10,0),
	ind_comision		BOOLEAN						NOT NULL DEFAULT FALSE,		--Comisiones para los empleados(t:comisionado f:no comisionado)
	fec_comision		DATE,
	id_caja				DECIMAL(10,0),
	usr_insert			VARCHAR(20)					NOT NULL,
	usr_update			VARCHAR(20),
	fec_update			TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_c_factura),
	FOREIGN KEY(id_cliente) REFERENCES tab_clientes(id_cliente),
	FOREIGN KEY (id_empleado) REFERENCES tab_empleados(id_empleado)
);

CREATE TABLE tab_info_factura
(
	id_c_factura		DECIMAL(10,0)				NOT NULL,
	/* Campos para el  PDF de la factura */
	pago				DECIMAL(10,0)				NOT NULL,
	saldo				DECIMAL(10,0)				NOT NULL,
	cambio				DECIMAL(10,0)				NOT NULL,					--Cambio del pago recibido respecto al valor de la factura
	/* Sistecredito dinamo */
	por_siste			SMALLINT,												--Porcentaje de sistecredito cobrado a dinamo(esta en parametros)
	vpor_siste			DECIMAL(10,0),											--Valor del porcentaje
	-- Informacion del cliente
	nom_cliente			VARCHAR(100)				NOT NULL,					--Nombre del cliente
	ciu_cliente			VARCHAR(50)					NOT NULL,					--Ciudad del cliente
	dir_cliente			VARCHAR(50)					NOT NULL,					--Direccion del cliente
	tel_cliente			VARCHAR(60)					NOT NULL,					--Telefonos del cliente
	cor_cliente			VARCHAR(60)					NOT NULL,					--Correo del cliente
	-- Informacion de dinamo
	res_dian			VARCHAR(20)					NOT NULL,					--Resolución de la Dian.
	ind_regimen			BOOLEAN						NOT NULL, 					--False: (Regimen Simplificado), True: (Regimen Común) 		
	nit_empresa			VARCHAR(20)					NOT NULL,					--NIT de dinamo
	nom_ciudad			VARCHAR(50)					NOT NULL,					--Nombre de la ciudad de dinamo
	nom_empresa			VARCHAR(100)				NOT NULL,					--Nombre de dinamo
	dir_empresa			VARCHAR(60)					NOT NULL,					--Direccion de dinamo
	tel_empresa			VARCHAR(60)					NOT NULL,					--Telefono de dinamo
	cor_empresa			VARCHAR(60)					NOT NULL,					--Correo de dinamo
	pag_empresa			VARCHAR(100)				NOT NULL,					--Pagina web de dinamo
	PRIMARY KEY(id_c_factura),
	FOREIGN KEY(id_c_factura) REFERENCES tab_facturas_enc(id_c_factura)
);

---------------------------------------------------------------------------------------------------------------

CREATE TABLE tab_facturas_det
(
	id_consec			DECIMAL(10,0) 				NOT NULL,					--Identificador Factura detalle
	id_c_factura		DECIMAL(10,0)				NOT NULL,					--Consecutivo(Necesario para la facturacion de regimen comun)
	id_insumo			DECIMAL(15,0)				NOT NULL, 					--Identificador del insumo(codigo de barras)
	tip_insumo			VARCHAR(10)					NOT NULL,					--Tipo de insumo(Producto o Servicio)
	id_almacen	 		DECIMAL(2,0)				NOT NULL, 					--Identificador Almacen
	val_cantidad		DECIMAL(5,0)				NOT NULL,					--Cantidad del insumo
	val_cant_act		DECIMAL(5,0)				NOT NULL,					--Cantidad actual apartada
	val_cant_dev		DECIMAL(5,0)				NOT NULL DEFAULT 0,			--Cantidad devuelta
	val_unidad			DECIMAL(10,0) 				NOT NULL,					--Valor del insumo por unidad
	val_bruto			DECIMAL(10,0) 				NOT NULL,					--Valor bruto del insumo (val_cantidad * val_unidad)
	iva					DECIMAL(2,0)				NOT NULL,
	val_iva				DECIMAL(10,0) 				NOT NULL,					--Valor iva del insumo
	val_neto			DECIMAL(10,0)				NOT NULL,					--Valor neto(val_bruto + val_iva)
	descuento			SMALLINT					NOT NULL,					--Descuento del producto(se aplica al val_neto)
	v_descuento			DECIMAL(10,0) 				NOT NULL,					--Valor del descuento
	val_kardex			DECIMAL(10,0)				NOT NULL,
	ind_insumo			BOOLEAN						NOT NULL, 					--Indicador de cobro del insumo(t: Se cobra el insumo f: No se cobra el insumo)
	usr_insert			VARCHAR(20)					NOT NULL,
	fec_insert			TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update			VARCHAR(20),
	fec_update			TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_consec),
	FOREIGN KEY(id_c_factura) REFERENCES tab_facturas_enc(id_c_factura),
	FOREIGN KEY(id_insumo) REFERENCES tab_insumos(id_insumo),
	FOREIGN KEY(id_almacen) REFERENCES tab_almacenes(id_almacen)
);

---------------------------------------------------------------------------------------------------------------
/* Tabla de productos guardados para la espera de generar factura */
CREATE TABLE tab_guardados
(
	id_cliente			VARCHAR(30)					NOT NULL,
	id_insumo			DECIMAL(15,0)				NOT NULL,
	val_cantidad		DECIMAL(5,0)				NOT NULL,
	val_unidad			DECIMAL(10,0) 				NOT NULL,
	usr_insert			VARCHAR(20)					NOT NULL,
	fec_insert			TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update			VARCHAR(20),
	fec_update			TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_cliente, id_insumo),
	FOREIGN KEY(id_cliente) REFERENCES tab_clientes(id_cliente),
	FOREIGN KEY(id_insumo) REFERENCES tab_insumos(id_insumo)
);

---------------------------------------------------------------------------------------------------------------

CREATE TABLE tab_apartados_enc
(
	id_consec			DECIMAL(10,0)				NOT NULL,
	id_cliente			VARCHAR(30)					NOT NULL,
	id_empleado			VARCHAR(12)					NOT NULL,
	fec_apartado		DATE						NOT NULL DEFAULT NOW(),
	fec_plazo			DATE						NOT NULL,
	vt_bruto			DECIMAL(10,0)				NOT NULL,
	vt_iva				DECIMAL(10,0)				NOT NULL,
	subtotal			DECIMAL(10,0)				NOT NULL,					-- El mismo campo neto pero sin descuentos
	des_general			SMALLINT					NOT NULL,
	v_des_general		DECIMAL(10,0)				NOT NULL,
	vt_neto				DECIMAL(10,0)				NOT NULL,
	pag_total			DECIMAL(10,0)				NOT NULL,
	sal_total			DECIMAL(10,0)				NOT NULL,
	ind_pago			BOOLEAN						NOT NULL DEFAULT FALSE,		-- T: Pagado F: Pendiente
	ind_factura			BOOLEAN						NOT NULL DEFAULT FALSE,		-- T: Factura generada F: Pendiente
	ind_estado			BOOLEAN						NOT NULL DEFAULT TRUE,		-- T: Vigente F: Cancelado
	usr_insert			VARCHAR(20)					NOT NULL,
	fec_insert			TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update			VARCHAR(20),
	fec_update			TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_consec),
	FOREIGN KEY(id_cliente) REFERENCES tab_clientes(id_cliente),
	FOREIGN KEY(id_empleado) REFERENCES tab_empleados(id_empleado)
);

---------------------------------------------------------------------------------------------------------------

CREATE TABLE tab_apartados_det
(
	id_consec			DECIMAL(10,0) 				NOT NULL,
	id_insumo			DECIMAL(15,0)				NOT NULL,
	tip_insumo			VARCHAR(10)					NOT NULL,
	val_cantidad		DECIMAL(5,0)				NOT NULL,			-- cantidad apartada
	val_cant_act		DECIMAL(5,0)				NOT NULL,			-- cantidad actual apartada
	val_cant_can		DECIMAL(5,0)				NOT NULL DEFAULT 0,	-- cantidad cancelada
	val_unidad			DECIMAL(10,0) 				NOT NULL,
	val_bruto			DECIMAL(10,0) 				NOT NULL,
	iva					DECIMAL(2,0)				NOT NULL,
	val_iva				DECIMAL(10,0) 				NOT NULL,
	val_neto			DECIMAL(10,0)				NOT NULL,
	descuento			SMALLINT					NOT NULL,			--Descuento del producto(se aplica al val_neto)
	v_descuento			DECIMAL(10,0) 				NOT NULL,			--Valor del descuento
	val_kardex			DECIMAL(10,0)				NOT NULL,
	ind_insumo			BOOLEAN						NOT NULL,
	usr_insert			VARCHAR(20)					NOT NULL,
	fec_insert			TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update			VARCHAR(20),
	fec_update			TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_consec, id_insumo),
	FOREIGN KEY(id_consec) REFERENCES tab_apartados_enc(id_consec),
	FOREIGN KEY(id_insumo) REFERENCES tab_insumos(id_insumo)
);

---------------------------------------------------------------------------------------------------------------

CREATE TABLE tab_can_apartados
(
	id_cancel			DECIMAL(10,0) 				NOT NULL,		-- Consecutivo
	id_consec			DECIMAL(10,0) 				NOT NULL,		-- id del apartado
	vt_cancelado		DECIMAL(10,0) 				NOT NULL,
	por_cobro			DECIMAL(3,0) 				NOT NULL,		-- Porcentaje del cobro
	val_cobro			DECIMAL(10,0) 				NOT NULL,		-- Valor del cobro
	pag_cobro			DECIMAL(10,0) 				NOT NULL,		-- Pago del cobro
	sal_cobro			DECIMAL(10,0) 				NOT NULL,		-- Saldo del cobro
	observacion			VARCHAR(200)				NOT NULL,
	usr_insert			VARCHAR(20)					NOT NULL,
	fec_insert			TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update			VARCHAR(20),
	fec_update			TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_cancel),
	FOREIGN KEY(id_consec) REFERENCES tab_apartados_enc(id_consec)
);

---------------------------------------------------------------------------------------------------------------

CREATE TABLE tab_recaudos_enc
(
	id_c_recaudo		DECIMAL(10,0)				NOT NULL,					--Consecutivo(Necesario por si se aplica el mismo sistema que el de facturacion)
	id_recaudo			DECIMAL(10,0)				NOT NULL,					--Identificador del encabezado de los recaudos
	id_recibo			DECIMAL(10,0)				NOT NULL,					--numero de (Factura, Apartaado, Cancelacion de apartados o Gastos
	id_cliente			VARCHAR(30)					NOT NULL,
	pag_total			DECIMAL(10,0)				NOT NULL,					--Pago total de la factura
	fec_recaudo			DATE						NOT NULL DEFAULT NOW(),
	hor_recaudo			CHAR(8)						NOT NULL DEFAULT TO_CHAR(LOCALTIME,'HH12:MI:SS'),
	tip_recibo			CHAR(1)						NOT NULL,					--(1:factura 2:apartado 3:Cancelacion de apartados 4:Gastos)
	inf_factura			BOOLEAN						NOT NULL,					--Indicador para saber si el pago fue hecho al momento de crear la factura(t:si f:no)
	ind_estado			BOOLEAN						NOT NULL DEFAULT TRUE,		--T:Vigente F:Cancelado
	obs_estado			VARCHAR(200),
	usr_insert			VARCHAR(20)					NOT NULL,
	fec_insert			TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update			VARCHAR(20),
	fec_update			TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_c_recaudo),
	FOREIGN KEY(id_cliente) REFERENCES tab_clientes(id_cliente)
);

---------------------------------------------------------------------------------------------------------------

CREATE TABLE tab_recaudos_det
(
	id_consec			DECIMAL(10,0)				NOT NULL,					--Identificador del detalle del recaudo
	id_c_recaudo		DECIMAL(10,0) 				NOT NULL,					--Consecutivo(Necesario por si se aplica el mismo sistema que el de facturacion)
	val_pago			DECIMAL(10,0)				NOT NULL,					--Pago de la factura
	for_pago			VARCHAR(50)					NOT NULL,					--Forma de pago(Efectivo, Credito, Debito)
	med_pago			VARCHAR(50)					NOT NULL,					--Medio de pago(VISA, Mastercard, etc)
	por_cobro			SMALLINT					NOT NULL,					--Porcentaje de cobro(Solo pago con tarjetas)
	id_caja				DECIMAL(10,0),
	usr_insert			VARCHAR(20)					NOT NULL,
	fec_insert			TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update			VARCHAR(20),
	fec_update			TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_consec),
	FOREIGN KEY(id_c_recaudo) REFERENCES tab_recaudos_enc(id_c_recaudo)
);

---------------------------------------------------------------------------------------------------------------
CREATE TABLE tab_serv_clientes
(
	id_consec			DECIMAL(10,0)				NOT NULL,					--Consecutivo
	id_c_factura		DECIMAL(10,0)				NOT NULL,					--Consecutivo(Necesario para la facturacion de regimen comun)
	id_insumo			DECIMAL(15,0)				NOT NULL, 					--Identificador del insumo(codigo de barras)
	id_empleado			VARCHAR(12)					NOT NULL,					--Identificador del empleado
	val_cantidad		DECIMAL(5,0)				NOT NULL,					--Cantidad del servicio
	val_servicio		DECIMAL(10,0)				NOT NULL,					--Valor cobrado del servicio realizado al cliente
	val_total			DECIMAL(10,0)				NOT NULL,					--Valor total
	por_ganancia		SMALLINT					NOT NULL,					--Porcentaje de ganancia para el empleado
	vp_ganancia			DECIMAL(10,0)				NOT NULL,					--Valor del porcentaje de la ganancia para el empleado
	ind_pago			BOOLEAN						NOT NULL DEFAULT FALSE,
	usr_insert			VARCHAR(20)					NOT NULL,
	fec_insert			TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update			VARCHAR(20),
	fec_update			TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_consec),
	FOREIGN KEY(id_c_factura) REFERENCES tab_facturas_enc(id_c_factura),
	FOREIGN KEY(id_insumo) REFERENCES tab_insumos(id_insumo),
	FOREIGN KEY(id_empleado) REFERENCES tab_empleados(id_empleado)
);
---------------------------------------------------------------------------------------------------------------

CREATE TABLE tab_avances
(
	id_consec		DECIMAL(10,0) 				NOT NULL,
	id_empleado		VARCHAR(12)					NOT NULL,
	fec_avance		DATE						NOT NULL DEFAULT NOW(),
	des_avance		VARCHAR(100)				NOT NULL,
	val_avance		DECIMAL(10,0) 				NOT NULL,
	ind_descon		BOOLEAN						NOT NULL DEFAULT TRUE,	-- T: No descontado F: Descontado
	ind_estado		BOOLEAN						NOT NULL DEFAULT TRUE,	-- T: Vigente F: Anulado
	usr_insert		VARCHAR(20)					NOT NULL,
	fec_insert		TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update		VARCHAR(20),
	fec_update		TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_consec),
	FOREIGN KEY (id_empleado) REFERENCES tab_empleados(id_empleado)
);


---------------------------------------------------------------------------------------------------------------

CREATE TABLE tab_devol_enc
(
	id_consec			DECIMAL(10,0)				NOT NULL,
	id_fac_ped			DECIMAL(10,0)				NOT NULL,					--(id_c_factura o id_pedido)
	tip_devol			BOOLEAN						NOT NULL,					--Tipo de devolucion(t:cliente f:proveedor)
	sal_favor			DECIMAL(10,0) 				NOT NULL,					--Saldo a favor del cliente
	fec_devol			DATE						NOT NULL DEFAULT NOW(),
	obs_devol			VARCHAR(200)				NOT NULL,
	usr_insert			VARCHAR(20)					NOT NULL,
	fec_insert			TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update			VARCHAR(20),
	fec_update			TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_consec)
);


CREATE TABLE tab_devol_det
(
	id_consec			DECIMAL(10,0)				NOT NULL,
	id_insumo			DECIMAL(15,0)				NOT NULL,
	val_kardex			DECIMAL(10,0)				NOT NULL,
	val_cantidad		DECIMAL(5,0)				NOT NULL,					--Cantidad devuelta
	sal_favor			DECIMAL(10,0) 				NOT NULL,					--Saldo a favor (cliente, dinamo)
	usr_insert			VARCHAR(20)					NOT NULL,
	fec_insert			TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update			VARCHAR(20),
	fec_update			TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_consec, id_insumo),
	FOREIGN KEY(id_insumo) REFERENCES tab_insumos(id_insumo),
	FOREIGN KEY(id_consec) REFERENCES tab_devol_enc(id_consec)
);

---------------------------------------------------------------------------------------------------------------

CREATE TABLE tab_ing_egr
(
	id_consec			DECIMAL(10,0)				NOT NULL,
	descripcion			VARCHAR(60)					NOT NULL,
	valor				DECIMAL(10,0)				NOT NULL,
	fecha				DATE						NOT NULL DEFAULT NOW(),
	tipo				VARCHAR(7)					NOT NULL,	-- (Ingreso o Egreso)
	id_caja				DECIMAL(10,0),
	estado				BOOLEAN						NOT NULL DEFAULT TRUE,
	usr_insert			VARCHAR(20)					NOT NULL,
	fec_insert			TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update			VARCHAR(20),
	fec_update			TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_consec)
);

---------------------------------------------------------------------------------------------------------------

CREATE TABLE tab_caja
(
	id_consec			DECIMAL(10,0)				NOT NULL,
	val_inicial			DECIMAL(10,0)				NOT NULL,
	fec_inicial			DATE						NOT NULL DEFAULT NOW(),
	vt_factura			DECIMAL(10,0)				NOT NULL DEFAULT 0,		-- Valor total de las facturas vigentes y anuladas
	vt_anulado			DECIMAL(10,0)				NOT NULL DEFAULT 0,		-- Valor total de las facturas anuladas
	vt_facturado		DECIMAL(10,0)				NOT NULL DEFAULT 0,		-- Valor total de las facturas vigentes
	vt_siste			DECIMAL(10,0)				NOT NULL DEFAULT 0,		-- Valor total de Sistecredito
	vt_recaudo			DECIMAL(10,0)				NOT NULL DEFAULT 0,		-- Valor total de los pagos
	vt_ingresos			DECIMAL(10,0)				NOT NULL DEFAULT 0,		-- Valor total de ingresos
	vt_egresos			DECIMAL(10,0)				NOT NULL DEFAULT 0,		-- Valor total de egresos
	val_final			DECIMAL(10,0)				NOT NULL DEFAULT 0,
	fec_final			DATE,
	ind_caja			BOOLEAN						NOT NULL DEFAULT TRUE,		-- T: Caja abierte F: Caja cerrada
	usr_insert			VARCHAR(20)					NOT NULL,
	fec_insert			TIMESTAMP WITHOUT TIME ZONE	NOT NULL DEFAULT NOW(),
	usr_update			VARCHAR(20),
	fec_update			TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY(id_consec)
);

---------------------------------------------------------------------------------------------------------------


CREATE TABLE tab_reportes
(
	id_reporte			DECIMAL(2,0)				NOT NULL,
	reporte				VARCHAR(450)				NOT NULL,
	cont_reporte		VARCHAR(350)				NOT NULL,
	des_reporte			VARCHAR(200)				NOT NULL,
	PRIMARY KEY(id_reporte)
);

-- ALTER TABLE empleados ADD COLUMN nombre_columna BOOLEAN DEFAULT true
 CREATE TABLE tab_cont_invent
(
	id_insumo		DECIMAL(15,0)				NOT NULL,				--Identificador del insumo
	cantidad		DECIMAL(5,0)				NOT NULL,				--Cantidad del insumo	
	precio			DECIMAL(10,0)				NOT NULL DEFAULT 0,		--Precio de costo del insumo
	PRIMARY KEY(id_insumo),
	FOREIGN KEY(id_insumo)REFERENCES tab_insumos(id_insumo)
);							