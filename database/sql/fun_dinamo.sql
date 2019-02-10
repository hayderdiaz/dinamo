DROP FUNCTION fun_id_1() CASCADE;
CREATE FUNCTION fun_id_1() RETURNS TRIGGER AS $$
DECLARE
num_max		INTEGER;
BEGIN
	EXECUTE 'SELECT COALESCE(MAX( ' || TG_ARGV[0] || ' ),0)+1 FROM ' || TG_TABLE_NAME INTO num_max;
	IF TG_TABLE_NAME ='tab_kardex' THEN
		NEW.id_kardex =num_max;
/* 	ELSIF TG_TABLE_NAME ='tab_insumos' THEN
		NEW.id_insumo =num_max; */
	ELSIF TG_TABLE_NAME ='tab_comisiones' THEN
		NEW.id_comision =num_max;
	ELSIF TG_TABLE_NAME ='tab_bon_enc' THEN
		NEW.id_bon_enc =num_max;
	ELSIF TG_TABLE_NAME ='tab_can_apartados' THEN
		NEW.id_cancel =num_max;
	ELSIF TG_TABLE_NAME ='tab_lineas_insumo' THEN
		NEW.id_linea =num_max;
	ELSIF TG_TABLE_NAME ='tab_for_pago' THEN
		NEW.id_for_pago =num_max;
	ELSIF TG_TABLE_NAME ='tab_almacenes' THEN
		NEW.id_almacen =num_max;
	ELSIF TG_TABLE_NAME ='tab_ciudades' THEN
		NEW.id_ciudad =num_max;
	ELSE
		NEW.id_depto =num_max;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER a_id BEFORE INSERT ON tab_kardex FOR EACH ROW EXECUTE PROCEDURE fun_id_1('id_kardex');
/* CREATE TRIGGER a_id BEFORE INSERT ON tab_pedidos_enc FOR EACH ROW EXECUTE PROCEDURE fun_id_1('id_pedido'); */
/* CREATE TRIGGER a_id BEFORE INSERT ON tab_insumos FOR EACH ROW EXECUTE PROCEDURE fun_id_1('id_insumo'); */
CREATE TRIGGER a_id BEFORE INSERT ON tab_comisiones FOR EACH ROW EXECUTE PROCEDURE fun_id_1('id_comision');
CREATE TRIGGER a_id BEFORE INSERT ON tab_bon_enc FOR EACH ROW EXECUTE PROCEDURE fun_id_1('id_bonif');
CREATE TRIGGER a_id BEFORE INSERT ON tab_can_apartados FOR EACH ROW EXECUTE PROCEDURE fun_id_1('id_cancel');
CREATE TRIGGER a_id BEFORE INSERT ON tab_lineas_insumo FOR EACH ROW EXECUTE PROCEDURE fun_id_1('id_linea');
CREATE TRIGGER a_id BEFORE INSERT ON tab_for_pago FOR EACH ROW EXECUTE PROCEDURE fun_id_1('id_for_pago');
CREATE TRIGGER a_id BEFORE INSERT ON tab_almacenes FOR EACH ROW EXECUTE PROCEDURE fun_id_1('id_almacen');
CREATE TRIGGER a_id BEFORE INSERT ON tab_ciudades FOR EACH ROW EXECUTE PROCEDURE fun_id_1('id_ciudad');
CREATE TRIGGER a_id BEFORE INSERT ON tab_departamentos FOR EACH ROW EXECUTE PROCEDURE fun_id_1('id_depto');
CREATE TRIGGER a_id BEFORE INSERT ON tab_avances FOR EACH ROW EXECUTE PROCEDURE fun_id_consec();

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DROP FUNCTION fun_id_2() CASCADE;
CREATE FUNCTION fun_id_2() RETURNS TRIGGER AS $$
DECLARE
num_max		INTEGER;
BEGIN
	EXECUTE 'SELECT COALESCE(MAX( ' || TG_ARGV[0] || ' ),0)+1 FROM ' || TG_TABLE_NAME INTO num_max;
	IF TG_TABLE_NAME ='tab_marcas' THEN
		NEW.id_marca =num_max;
	ELSIF TG_TABLE_NAME ='tab_medidas' THEN
		NEW.id_medida =num_max;
	ELSIF TG_TABLE_NAME ='tab_tipos_productos' THEN
		NEW.id_tipo =num_max;
	ELSIF TG_TABLE_NAME ='tab_colores' THEN
		NEW.id_color =num_max;
	ELSIF TG_TABLE_NAME ='tab_graficos' THEN
		NEW.id_grafico =num_max;
	ELSE
		NEW.id_labrado =num_max;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER a_id BEFORE INSERT ON tab_marcas FOR EACH ROW EXECUTE PROCEDURE fun_id_2('id_marca');
CREATE TRIGGER a_id BEFORE INSERT ON tab_medidas FOR EACH ROW EXECUTE PROCEDURE fun_id_2('id_medida');
CREATE TRIGGER a_id BEFORE INSERT ON tab_tipos_productos FOR EACH ROW EXECUTE PROCEDURE fun_id_2('id_tipo');
CREATE TRIGGER a_id BEFORE INSERT ON tab_colores FOR EACH ROW EXECUTE PROCEDURE fun_id_2('id_color');
CREATE TRIGGER a_id BEFORE INSERT ON tab_graficos FOR EACH ROW EXECUTE PROCEDURE fun_id_2('id_grafico');
CREATE TRIGGER a_id BEFORE INSERT ON tab_labrados FOR EACH ROW EXECUTE PROCEDURE fun_id_2('id_labrado');

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DROP FUNCTION fun_id_consec() CASCADE;
CREATE FUNCTION fun_id_consec() RETURNS TRIGGER AS $$
DECLARE
num_max		INTEGER;
BEGIN
	EXECUTE 'SELECT COALESCE(MAX(id_consec),0)+1 FROM ' || TG_TABLE_NAME INTO num_max;
	NEW.id_consec =num_max;
	RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER a_id BEFORE INSERT ON tab_com_emp FOR EACH ROW EXECUTE PROCEDURE fun_id_consec();
CREATE TRIGGER a_id BEFORE INSERT ON tab_bon_det FOR EACH ROW EXECUTE PROCEDURE fun_id_consec();
CREATE TRIGGER a_id BEFORE INSERT ON tab_consignaciones FOR EACH ROW EXECUTE PROCEDURE fun_id_consec();
CREATE TRIGGER a_id BEFORE INSERT ON tab_med_pago FOR EACH ROW EXECUTE PROCEDURE fun_id_consec();
CREATE TRIGGER a_id BEFORE INSERT ON tab_pedidos_det FOR EACH ROW EXECUTE PROCEDURE fun_id_consec();
CREATE TRIGGER a_id BEFORE INSERT ON tab_facturas_det FOR EACH ROW EXECUTE PROCEDURE fun_id_consec();
CREATE TRIGGER a_id BEFORE INSERT ON tab_recaudos_det FOR EACH ROW EXECUTE PROCEDURE fun_id_consec();
CREATE TRIGGER a_id BEFORE INSERT ON tab_serv_clientes FOR EACH ROW EXECUTE PROCEDURE fun_id_consec();
CREATE TRIGGER a_id BEFORE INSERT ON tab_ing_egr FOR EACH ROW EXECUTE PROCEDURE fun_id_consec();
CREATE TRIGGER a_id BEFORE INSERT ON tab_caja FOR EACH ROW EXECUTE PROCEDURE fun_id_consec();

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DROP FUNCTION fun_id_factura()CASCADE;
CREATE FUNCTION fun_id_factura() RETURNS TRIGGER AS $$
DECLARE
fac			RECORD;
BEGIN
	SELECT num_fac_act, num_fac_fin FROM tab_parametros INTO fac;
	IF fac.num_fac_act <= fac.num_fac_fin THEN
		UPDATE tab_parametros SET num_fac_act =fac.num_fac_act+1 WHERE id_consec ='1';
		NEW.id_factura =fac.num_fac_act;
	ELSE
		UPDATE tab_parametros SET num_fac_act =1 WHERE id_consec ='1';
		NEW.id_factura =1;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER a_factura BEFORE INSERT ON tab_facturas_enc FOR EACH ROW EXECUTE PROCEDURE fun_id_factura();

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DROP FUNCTION fun_id_recaudo()CASCADE;
CREATE FUNCTION fun_id_recaudo() RETURNS TRIGGER AS $$
DECLARE
rec			RECORD;
BEGIN
	SELECT num_rec_act, num_rec_fin FROM tab_parametros INTO rec;
	IF rec.num_rec_act <= rec.num_rec_fin THEN
		UPDATE tab_parametros SET num_rec_act =rec.num_rec_act+1 WHERE id_consec ='1';
		NEW.id_recaudo =rec.num_rec_act;
	ELSE
		UPDATE tab_parametros SET num_rec_act =1 WHERE id_consec ='1';
		NEW.id_recaudo =1;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER a_recaudo BEFORE INSERT ON tab_recaudos_enc FOR EACH ROW EXECUTE PROCEDURE fun_id_recaudo();

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- pedido: num_pedido[1], vt_bruto[2], vt_iva[3], subtotal[4], v_descuento[5], vt_neto[6], pag_total[7], sal_total[8]
-- productos: id_insumo[1], val_cantidad[2], val_unidad[3], val_bruto[4], iva[5], val_iva[6], val_neto[7]

CREATE OR REPLACE FUNCTION fun_compras(pedido INTEGER[], productos INTEGER[], fecha DATE, proveedor VARCHAR(30), usuario VARCHAR(20)) RETURNS VOID AS $$
DECLARE
consec		tab_pedidos_enc.id_pedido%TYPE;
BEGIN
	SELECT COALESCE(MAX(id_pedido),0)+1 FROM tab_pedidos_enc INTO consec;
	INSERT INTO tab_pedidos_enc(id_pedido, id_proveedor, num_pedido, fec_pedido, vt_bruto, vt_iva, subtotal, v_descuento, vt_neto, pag_total, sal_total, usr_insert) 
	VALUES(consec, proveedor, pedido[1], fecha, pedido[2], pedido[3], pedido[4], pedido[5], pedido[6], pedido[7], pedido[8], usuario);

	FOR i IN ARRAY_LOWER(productos, 1)..ARRAY_UPPER(productos, 1) LOOP
		INSERT INTO tab_pedidos_det(id_consec, id_pedido, id_insumo, id_almacen, val_cantidad, val_cant_act, val_unidad, val_bruto, iva, val_iva, val_neto, usr_insert) 
		VALUES(0, consec, productos[i][1], 1, productos[i][2], productos[i][2], productos[i][3], productos[i][4], productos[i][5], productos[i][6], productos[i][7], usuario);
	END LOOP;
END;
$$ LANGUAGE PLPGSQL;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- FUNCION PARA ACTUALIZAR EL INVENTARIO TRAS UNA COMPRA
DROP FUNCTION fun_act_inv_compra()CASCADE;
CREATE FUNCTION fun_act_inv_compra() RETURNS TRIGGER AS $$

DECLARE
cant_actual		tab_inventario.val_cantidad%TYPE;
n_cant			tab_inventario.val_cantidad%TYPE;
r_kardex		RECORD;
t_movimiento	tab_kardex.val_total_movim%TYPE;
t_actual		tab_kardex.val_total_actual%TYPE;
p_actual		tab_kardex.val_precio_actual%TYPE;

BEGIN
	SELECT val_cantidad FROM tab_inventario WHERE id_insumo =NEW.id_insumo INTO cant_actual;
	IF FOUND THEN
		n_cant = cant_actual + NEW.val_cantidad;
		UPDATE tab_inventario SET val_cantidad = n_cant, usr_update =NEW.usr_insert, fec_update =NOW() WHERE id_insumo = NEW.id_insumo;

		SELECT val_precio_actual, val_total_actual FROM tab_kardex WHERE id_insumo = NEW.id_insumo AND ind_saldo =TRUE INTO r_kardex;

		IF NOT FOUND THEN

			t_movimiento =NEW.val_bruto; t_actual =NEW.val_bruto;
			INSERT INTO tab_kardex(id_kardex, id_insumo, ind_movimiento, val_cant_movim, val_cant_actual, val_precio_movim, val_precio_actual, val_total_movim, val_total_actual, ind_saldo, val_observacion, usr_insert) VALUES
			(0, NEW.id_insumo, 'SI', NEW.val_cantidad, NEW.val_cantidad, NEW.val_unidad, NEW.val_unidad, t_movimiento, t_actual, TRUE, 'Saldo Inicial', NEW.usr_insert);

		ELSE

			UPDATE tab_kardex SET ind_saldo =FALSE, usr_update =NEW.usr_insert, fec_update =NOW() WHERE id_insumo =NEW.id_insumo AND ind_saldo =TRUE;

			p_actual =round(((NEW.val_bruto+r_kardex.val_total_actual)/n_cant));
			t_movimiento =NEW.val_bruto;
			t_actual =(NEW.val_bruto+r_kardex.val_total_actual);
			
			INSERT INTO tab_kardex(id_kardex, id_insumo, ind_movimiento, val_cant_movim, val_cant_actual, val_precio_movim, val_precio_actual, val_total_movim, val_total_actual, ind_saldo, val_observacion, usr_insert) VALUES
			(0, NEW.id_insumo, 'CP', NEW.val_cantidad, n_cant, NEW.val_unidad, p_actual, t_movimiento, t_actual, TRUE, 'Compra al proveedor', NEW.usr_insert);
		END IF;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER a_act_inv AFTER INSERT ON tab_pedidos_det FOR EACH ROW EXECUTE PROCEDURE fun_act_inv_compra();

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DROP FUNCTION fun_act_inv_venta()CASCADE;
CREATE FUNCTION fun_act_inv_venta() RETURNS TRIGGER AS $$
DECLARE
r_kardex		RECORD;
p_actual		tab_kardex.val_precio_actual%TYPE;
c_actual		tab_kardex.val_cant_actual%TYPE;
t_movimiento	tab_kardex.val_total_movim%TYPE;
t_actual		tab_kardex.val_total_actual%TYPE;
BEGIN
	SELECT val_cant_actual, val_precio_actual, val_total_actual FROM tab_kardex WHERE id_insumo =NEW.id_insumo AND ind_saldo =TRUE INTO r_kardex;
	IF FOUND THEN
		c_actual =(r_kardex.val_cant_actual - NEW.val_cantidad);
		p_actual =r_kardex.val_precio_actual;
		t_movimiento =(NEW.val_cantidad*p_actual);
		t_actual =(r_kardex.val_total_actual - t_movimiento);

		UPDATE tab_inventario SET val_cantidad = c_actual, usr_update =NEW.usr_insert, fec_update =NOW() WHERE id_insumo = NEW.id_insumo;
		UPDATE tab_kardex SET ind_saldo =FALSE, usr_update =NEW.usr_insert, fec_update =NOW() WHERE id_insumo =NEW.id_insumo AND ind_saldo =TRUE;
		INSERT INTO tab_kardex(id_kardex, id_insumo, ind_movimiento, val_cant_movim, val_cant_actual, val_precio_movim, val_precio_actual, val_total_movim, val_total_actual, ind_saldo, val_observacion, usr_insert) VALUES
		(0, NEW.id_insumo, TG_ARGV[0], NEW.val_cantidad, c_actual, p_actual, p_actual, t_movimiento, t_actual, TRUE, TG_ARGV[1], NEW.usr_insert);
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER a_act_inv AFTER INSERT ON tab_facturas_det FOR EACH ROW EXECUTE PROCEDURE fun_act_inv_venta('VC', 'Venta al cliente');
CREATE TRIGGER a_act_inv AFTER INSERT ON tab_apartados_det FOR EACH ROW EXECUTE PROCEDURE fun_act_inv_venta('VA', 'Venta Apartado');

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- productos = id_insumo[1], val_kardex[2], cant_actual[3], cant_cancel[4], ind_insumo[5], sal_favor[6],


CREATE OR REPLACE FUNCTION fun_devoluciones(factura DECIMAL(10,0), tsal_favor DECIMAL(10,0), cliente VARCHAR(30), tipo_devol VARCHAR(5), productos INTEGER[], observacion VARCHAR(200), usuario VARCHAR(20)) RETURNS INTEGER AS $$
DECLARE
consec			tab_devol_enc.id_consec%TYPE;
r_kardex		RECORD;
t_costo			tab_kardex.val_total_movim%TYPE;
n_cant			tab_kardex.val_cant_actual%TYPE;
t_actual		tab_kardex.val_total_actual%TYPE;
p_actual		tab_kardex.val_precio_actual%TYPE;
tip_movim		tab_kardex.ind_movimiento%TYPE;
obs_movim		tab_kardex.val_observacion%TYPE;
BEGIN

	SELECT COALESCE(MAX(id_consec),0)+1 FROM tab_devol_enc INTO consec;
	INSERT INTO tab_devol_enc(id_consec, id_fac_ped, tip_devol, sal_favor, obs_devol, usr_insert) VALUES(consec, factura, tipo_devol::boolean, tsal_favor, observacion, usuario);

	FOR i IN ARRAY_LOWER(productos, 1)..ARRAY_UPPER(productos, 1) LOOP
		SELECT val_cant_actual, val_total_actual FROM tab_kardex WHERE id_insumo =productos[i][1] AND ind_saldo =TRUE INTO r_kardex;
		t_costo = productos[i][2]*productos[i][4];
		IF tipo_devol ='TRUE' THEN
			n_cant =r_kardex.val_cant_actual + productos[i][4];
			t_actual =(r_kardex.val_total_actual + t_costo);
			SELECT ROUND(t_actual / n_cant) INTO p_actual;
			tip_movim ='DC';
			obs_movim ='Devolución del cliente';
			UPDATE tab_facturas_det SET val_cant_act =productos[i][3], val_cant_dev =val_cant_dev + productos[i][4], ind_insumo =productos[i][5]::boolean, usr_update =usuario, fec_update =NOW() WHERE id_c_factura =factura AND id_insumo =productos[i][1];
		ELSE
			n_cant =r_kardex.val_cant_actual - productos[i][4];
			t_actual =r_kardex.val_total_actual - t_costo;
			SELECT ROUND(t_actual / n_cant) INTO p_actual;
			tip_movim ='DP';
			obs_movim ='Devolución al proveedor';
			UPDATE tab_pedidos_det SET val_cant_act =productos[i][3], val_cant_dev =val_cant_dev + productos[i][4], usr_update =usuario, fec_update =NOW() WHERE id_pedido =factura AND id_insumo =productos[i][1];
		END IF;
		INSERT INTO tab_devol_det(id_consec, id_insumo, val_kardex, val_cantidad, sal_favor, usr_insert) VALUES(consec, productos[i][1], productos[i][2], productos[i][4], productos[i][6], usuario);
		UPDATE tab_inventario SET val_cantidad =n_cant, usr_update =usuario, fec_update =NOW() WHERE id_insumo = productos[i][1];
		UPDATE tab_kardex SET ind_saldo =FALSE, usr_update =usuario, fec_update =NOW() WHERE id_insumo =productos[i][1] AND ind_saldo =TRUE;
		INSERT INTO tab_kardex(id_kardex, id_insumo, ind_movimiento, val_cant_movim, val_cant_actual, val_precio_movim, val_precio_actual, val_total_movim, val_total_actual, ind_saldo, val_observacion, usr_insert) 
		VALUES(0, productos[i][1], tip_movim, productos[i][4], n_cant, productos[i][2], p_actual, t_costo, t_actual, TRUE, obs_movim, usuario);
	END LOOP;
	IF tsal_favor > 0 THEN
		UPDATE tab_clientes SET sal_favor =sal_favor + tsal_favor, usr_update =usuario, fec_update =NOW()  WHERE id_cliente =cliente;
	END IF;
	RETURN consec;
END;
$$ LANGUAGE PLPGSQL;

/* CREATE TRIGGER a_devolucion AFTER INSERT ON tab_devoluciones FOR EACH ROW EXECUTE PROCEDURE fun_devoluciones(); */

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- factura_n == t_bruto =[1], t_iva =[2], t_neto =[3], t_pago =[4], val_siste =[5], des_gen =[6], v_des_gen =[7], des_siste =[8], v_des_siste =[9], subtotal =[10]
-- factura_t == id_cliente =[1], id_empleado =[2], ind_siste =[3], usuario =[4], tip_ingreso =[5]
-- productos_t == tip_insumo =[1], id_empleado =[2]
-- productos_n == id_insumo =[1], v_unidad =[2], cantidad =[3], v_bruto =[4], iva =[5], v_iva =[6], v_neto =[7], descuento =[8], v_descuento =[9], v_estandar =[10], por_ganancia =[11], val_kardex =[12]

CREATE OR REPLACE FUNCTION fun_facturas(factura_t TEXT[], factura_n INTEGER[], productos_t TEXT[], productos_n INTEGER[], pagos TEXT[]) RETURNS INTEGER AS $$
DECLARE
r_cliente		RECORD;
r_empresa		RECORD;
consec			tab_facturas_enc.id_c_factura%TYPE;
saldo			tab_facturas_enc.sal_total%TYPE;
cambio			tab_info_factura.cambio%TYPE;
pag_actual		tab_facturas_enc.pag_total%TYPE;
por_sis			tab_info_factura.por_siste%TYPE;		-- Porcentaje Zonabiker
fec_sis			tab_facturas_enc.fec_siste%TYPE;
vpor_sis		tab_info_factura.vpor_siste%TYPE;
v_total			tab_serv_clientes.val_total%TYPE;
vp_ganancia		tab_serv_clientes.vp_ganancia%TYPE;
dias_apa		tab_parametros.dias_apartado%TYPE;
fec_pla_apa		tab_apartados_enc.fec_plazo%TYPE;
/* val_kardex		tab_kardex.val_precio_actual%TYPE; */
consec_rec		tab_recaudos_enc.id_c_recaudo%TYPE;
BEGIN
	IF factura_n[3] >= factura_n[4] THEN
		saldo =factura_n[3] - factura_n[4]; cambio =0; pag_actual =factura_n[4];
	ELSE
		saldo =0; cambio =factura_n[4] - factura_n[3]; pag_actual =factura_n[3];
	END IF;
	IF factura_t[5] = '1' THEN
		-- Encabezado de la factura
		SELECT a.nom_cliente, b.nom_ciudad, a.dir_cliente, a.tel_cliente, a.cor_cliente FROM tab_clientes AS a, tab_ciudades AS b WHERE a.id_cliente =factura_t[1] AND a.id_ciudad =b.id_ciudad INTO r_cliente;
		SELECT a.id_empresa, b.nom_ciudad, a.nom_empresa, a.dir_empresa, a.tel_empresa, a.cor_empresa, a.pag_empresa, a.por_siste, a.dias_siste, a.dias_apartado, a.res_dian, a.ind_regimen FROM tab_parametros AS a, tab_ciudades AS b WHERE a.id_ciudad =b.id_ciudad AND a.id_consec ='1' INTO r_empresa;
		SELECT COALESCE(MAX(id_c_factura),0)+1 FROM tab_facturas_enc INTO consec;

		/* Sistecredito */
		IF factura_t[3]::boolean = TRUE THEN
			por_sis =r_empresa.por_siste;
			vpor_sis = factura_n[5]*por_sis/100;
			EXECUTE 'SELECT CURRENT_DATE +'|| r_empresa.dias_siste INTO fec_sis;
		ELSE
			por_sis =NULL; vpor_sis =NULL; fec_sis =NULL;
		END IF;

		INSERT INTO tab_facturas_enc (id_c_factura, id_factura, id_cliente, id_empleado, vt_bruto, vt_iva, subtotal, des_general, v_des_general, ind_siste, fec_siste, des_siste, v_des_siste, vt_neto, pag_total, val_siste, sal_total, usr_insert)
		VALUES(consec, 0, factura_t[1], factura_t[2], factura_n[1], factura_n[2], factura_n[10], factura_n[6], factura_n[7], factura_t[3]::boolean, fec_sis, factura_n[8], factura_n[9], factura_n[3], pag_actual, factura_n[5], saldo, factura_t[4]);

		INSERT INTO tab_info_factura (id_c_factura, pago, saldo, cambio, por_siste, vpor_siste, nom_cliente, ciu_cliente, dir_cliente, tel_cliente, cor_cliente, res_dian, ind_regimen, nit_empresa, nom_ciudad, nom_empresa, dir_empresa, tel_empresa, cor_empresa, pag_empresa)
		VALUES(consec, pag_actual, saldo, cambio, por_sis, vpor_sis, r_cliente.nom_cliente, r_cliente.nom_ciudad, r_cliente.dir_cliente, r_cliente.tel_cliente, r_cliente.cor_cliente, r_empresa.res_dian, r_empresa.ind_regimen, r_empresa.id_empresa, r_empresa.nom_ciudad, r_empresa.nom_empresa, r_empresa.dir_empresa, r_empresa.tel_empresa, r_empresa.cor_empresa, r_empresa.pag_empresa);

		-- Detalle de la factura
		FOR i IN ARRAY_LOWER(productos_n, 1)..ARRAY_UPPER(productos_n, 1) LOOP

			INSERT INTO tab_facturas_det (id_consec, id_c_factura, id_insumo, tip_insumo, id_almacen, val_cantidad, val_cant_act, val_unidad, val_bruto, iva, val_iva, val_neto, descuento, v_descuento, val_kardex, ind_insumo, usr_insert) 
			VALUES(0, consec, productos_n[i][1], productos_t[i][1], 1, productos_n[i][3], productos_n[i][3], productos_n[i][2], productos_n[i][4], productos_n[i][5], productos_n[i][6], productos_n[i][7], productos_n[i][8], productos_n[i][9], productos_n[i][12], TRUE, factura_t[4]);

			IF productos_t[i][1] = 'Servicio' THEN
				SELECT productos_n[i][3] * productos_n[i][10] INTO v_total;
				SELECT ROUND(v_total * productos_n[i][11] / 100) INTO vp_ganancia;
				INSERT INTO tab_serv_clientes(id_consec, id_c_factura, id_insumo, id_empleado, val_cantidad, val_servicio, val_total, por_ganancia, vp_ganancia, usr_insert) 
				VALUES(0, consec, productos_n[i][1], productos_t[i][2], productos_n[i][3], productos_n[i][10], v_total, productos_n[i][11], vp_ganancia, factura_t[4]);
			END IF;
		END LOOP;
	ELSE
		-- Encabezado del apartado
		SELECT COALESCE(MAX(id_consec),0)+1 FROM tab_apartados_enc INTO consec;
		SELECT dias_apartado FROM tab_parametros WHERE id_consec ='1' INTO dias_apa;
		EXECUTE 'SELECT CURRENT_DATE +'|| dias_apa INTO fec_pla_apa;
		INSERT INTO tab_apartados_enc(id_consec, id_cliente, id_empleado, fec_plazo, vt_bruto, vt_iva, subtotal, des_general, v_des_general, vt_neto, pag_total, sal_total, usr_insert) VALUES(consec, factura_t[1], factura_t[2], fec_pla_apa, factura_n[1], factura_n[2], factura_n[10], factura_n[6], factura_n[7], factura_n[3], pag_actual, saldo, factura_t[4]);

		-- Detalle del apartado
		FOR i IN ARRAY_LOWER(productos_n, 1)..ARRAY_UPPER(productos_n, 1) LOOP
			/* SELECT val_precio_actual FROM tab_kardex WHERE id_insumo =productos_n[i][1] AND ind_saldo =TRUE INTO val_kardex; */
			INSERT INTO tab_apartados_det (id_consec, id_insumo, tip_insumo, val_cantidad, val_cant_act, val_unidad, val_bruto, iva, val_iva, val_neto, descuento, v_descuento, val_kardex, ind_insumo, usr_insert) 
			VALUES(consec, productos_n[i][1], productos_t[i][1], productos_n[i][3], productos_n[i][3], productos_n[i][2], productos_n[i][4], productos_n[i][5],  productos_n[i][6],  productos_n[i][7], productos_n[i][8], productos_n[i][9], productos_n[i][12], TRUE, factura_t[4]);
		END LOOP;
	END IF;

	IF factura_n[4] > 0 THEN
		-- Encabezado de los pagos de la factura
		SELECT COALESCE(MAX(id_c_recaudo),0)+1 FROM tab_recaudos_enc INTO consec_rec;
		INSERT INTO tab_recaudos_enc (id_c_recaudo, id_recaudo, id_recibo, id_cliente, pag_total, tip_recibo, inf_factura, usr_insert) VALUES(consec_rec, 0, consec, factura_t[1], factura_n[4], factura_t[5], TRUE, factura_t[4]);

		-- Detalle de los pagos de la factura
		FOR i IN ARRAY_LOWER(pagos, 1)..ARRAY_UPPER(pagos, 1) LOOP
			INSERT INTO tab_recaudos_det(id_consec, id_c_recaudo, val_pago, for_pago, med_pago, por_cobro, usr_insert) VALUES(0, consec_rec, pagos[i][1]::integer, pagos[i][2], pagos[i][3], pagos[i][4]::integer, factura_t[4]);
		END LOOP;
	END IF;
	RETURN consec;
END;
$$ LANGUAGE PLPGSQL;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION fun_guardados(cliente VARCHAR(30), insumos INTEGER[], usuario VARCHAR(20)) RETURNS VOID AS $$
DECLARE
cant_actual		tab_guardados.val_cantidad%TYPE;
BEGIN
	FOR i IN ARRAY_LOWER(insumos, 1)..ARRAY_UPPER(insumos, 1) LOOP
		SELECT val_cantidad FROM tab_guardados WHERE id_cliente =cliente AND id_insumo =insumos[i][1] INTO cant_actual;
		IF NOT FOUND THEN
			INSERT INTO tab_guardados (id_cliente, id_insumo, val_cantidad, val_unidad, usr_insert) VALUES (cliente, insumos[i][1], insumos[i][2], insumos[i][3], usuario);
		ELSE
			UPDATE tab_guardados SET val_cantidad =cant_actual+insumos[i][2], val_unidad =insumos[i][3], usr_update =usuario, fec_update ='NOW()' WHERE id_cliente =cliente AND id_insumo =insumos[i][1];
		END IF;
	END LOOP;
END;
$$ LANGUAGE PLPGSQL;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION fun_recaudos(pagos TEXT[], recibo DECIMAL(10,0), cliente VARCHAR(30), t_pago DECIMAL(10,0), sal_actual DECIMAL(10,0), tipo_recibo CHAR(1), usuario VARCHAR(20)) RETURNS INTEGER AS $$
DECLARE
consec			tab_recaudos_enc.id_c_recaudo%TYPE;
indi_pag		tab_apartados_enc.ind_pago%TYPE;
BEGIN
	SELECT COALESCE(MAX(id_c_recaudo),0)+1 FROM tab_recaudos_enc INTO consec;
	INSERT INTO tab_recaudos_enc(id_c_recaudo, id_recaudo, id_recibo, id_cliente, pag_total, tip_recibo, inf_factura, usr_insert) VALUES(consec, 0, recibo, cliente, t_pago, tipo_recibo, FALSE, usuario);
	FOR i IN ARRAY_LOWER(pagos, 1)..ARRAY_UPPER(pagos, 1) LOOP
		INSERT INTO tab_recaudos_det(id_consec, id_c_recaudo, val_pago, for_pago, med_pago, por_cobro, usr_insert) VALUES(0, consec, pagos[i][1]::integer, pagos[i][2], pagos[i][3], pagos[i][4]::integer, usuario);
	END LOOP;
	IF tipo_recibo ='1' THEN
		UPDATE tab_facturas_enc SET pag_total =pag_total+t_pago, sal_total =sal_total-t_pago, usr_update =usuario, fec_update =NOW() WHERE id_c_factura =recibo;
	ELSIF tipo_recibo ='2' THEN
		IF sal_actual = 0 THEN
			indi_pag =TRUE;
		ELSE
			indi_pag =FALSE;
		END IF;
		UPDATE tab_apartados_enc SET pag_total =pag_total+t_pago, sal_total =sal_total-t_pago, ind_pago =indi_pag, usr_update =usuario, fec_update =NOW() WHERE id_consec =recibo;
	ELSIF tipo_recibo ='3' THEN
		UPDATE tab_can_apartados SET pag_cobro =pag_cobro+t_pago, sal_cobro =sal_cobro-t_pago, usr_update =usuario, fec_update =NOW() WHERE id_cancel =recibo;
	ELSE
		-- UPDATE tab_gastos_enc SET pag_gasto =pag_gasto+t_pago, sal_gasto =sal_gasto-t_pago, usr_update =usuario, fec_update =NOW() WHERE id_gasto_enc =recibo;
	END IF;
	RETURN consec;
END;
$$ LANGUAGE PLPGSQL;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION fun_insumos(t_insumo TEXT[], n_insumo INTEGER[], esp INTEGER[], usuario VARCHAR(20)) RETURNS VOID AS $$
DECLARE
consec			tab_insumos.id_insumo%TYPE;
BEGIN
	SELECT COALESCE(MAX(id_insumo),0)+1 FROM tab_insumos INTO consec;

	INSERT INTO tab_insumos(id_linea, id_insumo, ref_producto, nom_insumo, tip_insumo, ind_iva, por_ganancia, val_minimo, val_reorden, val_maximo, usr_insert) 
	VALUES(n_insumo[1], consec, t_insumo[1], t_insumo[2], t_insumo[3]::boolean, t_insumo[4]::boolean, n_insumo[2], n_insumo[3], n_insumo[4], n_insumo[5], usuario);

	INSERT INTO tab_inventario(id_insumo, id_marca, id_medida, id_tipo, id_color, id_grafico, id_labrado, val_cantidad, usr_insert) 
	VALUES(consec, esp[1], esp[2], esp[3], esp[4], esp[5], esp[6], 0, usuario);
END;
$$ LANGUAGE PLPGSQL;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- val_apartado = id_apartado[1], vt_bruto[2], vt_iva[3], subtotal[4], v_des_general[5], vt_neto[6], pag_actual[7], sal_total[8], vt_cancelado[9], por_cobro[10], val_cobro[11], sal_favor[12]
-- productos = id_insumo[1], cant_actual[2], cant_cancel[3], val_bruto[4], val_iva[5], val_neto[6], v_descuento[7], val_kardex[8], est_insumo[9]

CREATE OR REPLACE FUNCTION fun_apartados(val_apartado INTEGER[], productos INTEGER[], cliente VARCHAR(30), observ VARCHAR(200), estado BOOLEAN, usuario VARCHAR(20)) RETURNS VOID AS $$
DECLARE
est_pago			tab_apartados_enc.ind_pago%TYPE;
r_kardex			RECORD;
p_actual			tab_kardex.val_precio_actual%TYPE;
n_cant				tab_kardex.val_cant_actual%TYPE;
t_costo				tab_kardex.val_total_movim%TYPE;
t_actual			tab_kardex.val_total_actual%TYPE;
tip_movim			tab_kardex.ind_movimiento%TYPE;
obs_movim			tab_kardex.val_observacion%TYPE;
BEGIN
	IF val_apartado[8] = 0 AND val_apartado[6] > 0 THEN
		est_pago =TRUE;
	ELSE
		est_pago =FALSE;
	END IF;

	UPDATE tab_apartados_enc SET 
	vt_bruto =val_apartado[2], 
	vt_iva =val_apartado[3], 
	subtotal =val_apartado[4], 
	v_des_general =val_apartado[5], 
	vt_neto =val_apartado[6], 
	pag_total =val_apartado[7], 
	sal_total =val_apartado[8], 
	ind_pago =est_pago, 
	ind_estado =estado, 
	usr_update =usuario, fec_update =NOW() WHERE id_consec =val_apartado[1];

	FOR i IN ARRAY_LOWER(productos, 1)..ARRAY_UPPER(productos, 1) LOOP
		IF productos[i][3] > 0 THEN
			UPDATE tab_apartados_det SET 
			val_cant_act =productos[i][2], 
			val_cant_can =val_cant_can + productos[i][3], 
			val_bruto =productos[i][4], 
			val_iva =productos[i][5], 
			val_neto =productos[i][6], 
			v_descuento =productos[i][7], 
			ind_insumo =productos[i][9]::boolean, 
			usr_update =usuario, fec_update =NOW() WHERE id_consec =val_apartado[1] AND id_insumo =productos[i][1];

			SELECT val_cant_actual, val_total_actual FROM tab_kardex WHERE id_insumo =productos[i][1] AND ind_saldo =TRUE INTO r_kardex;
			IF FOUND THEN
				-- Cantidad actual mas la cantidad cancelada
				n_cant =r_kardex.val_cant_actual + productos[i][3];
				-- Costo total del producto cuando fue apartado multiplicado por la cantidad cancelada
				t_costo = productos[i][8]*productos[i][3];
				-- Costo total del producto mas el costo actual del producto en el kardex
				t_actual =(t_costo + r_kardex.val_total_actual);
				-- Promedio del costo actual del producto
				SELECT ROUND(t_actual / n_cant) INTO p_actual;
				tip_movim ='DA';
				obs_movim ='Devolución de apartado';
				UPDATE tab_inventario SET val_cantidad =n_cant, usr_update =usuario, fec_update =NOW() WHERE id_insumo = productos[i][1];
				UPDATE tab_kardex SET ind_saldo =FALSE, usr_update =usuario, fec_update =NOW() WHERE id_insumo =productos[i][1] AND ind_saldo =TRUE;

				INSERT INTO tab_kardex(id_kardex, id_insumo, ind_movimiento, val_cant_movim, val_cant_actual, val_precio_movim, val_precio_actual, val_total_movim, val_total_actual, ind_saldo, val_observacion, usr_insert) 
				VALUES(0, productos[i][1], tip_movim, productos[i][3], n_cant, productos[i][8], p_actual, t_costo, t_actual, TRUE, obs_movim, usuario);
			END IF;
		END IF;
	END LOOP;

	INSERT INTO tab_can_apartados(id_cancel, id_consec, vt_cancelado, por_cobro, val_cobro, pag_cobro, sal_cobro, observacion, usr_insert) 
	VALUES(0, val_apartado[1], val_apartado[9], val_apartado[10], val_apartado[11], 0, val_apartado[11], observ, usuario);

	IF val_apartado[12] > 0 THEN
		UPDATE tab_clientes SET sal_favor =sal_favor + val_apartado[12] WHERE id_cliente =cliente;
	END IF;
END;
$$ LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION fun_anulacion(factura DECIMAL(10,0), observ VARCHAR(200), usuario VARCHAR(20)) RETURNS VOID AS $$
DECLARE
c_productos			REFCURSOR;
r_productos			RECORD;
n_cant				tab_kardex.val_cant_actual%TYPE;
t_costo				tab_kardex.val_total_movim%TYPE;
t_actual			tab_kardex.val_total_actual%TYPE;
p_actual			tab_kardex.val_precio_actual%TYPE;
tip_movim			tab_kardex.ind_movimiento%TYPE;
obs_movim			tab_kardex.val_observacion%TYPE;
BEGIN
	OPEN c_productos FOR SELECT a.id_insumo, a.val_cant_act, a.val_kardex, b.val_cant_actual, b.val_total_actual FROM tab_facturas_det AS a, tab_kardex AS b WHERE a.id_insumo =b.id_insumo AND a.id_c_factura =factura AND b.ind_saldo =TRUE;
	FETCH c_productos INTO r_productos;
	WHILE FOUND LOOP
		n_cant =r_productos.val_cant_actual + r_productos.val_cant_act;
		t_costo = r_productos.val_kardex*r_productos.val_cant_act;
		t_actual =(t_costo + r_productos.val_total_actual);
		SELECT ROUND(t_actual / n_cant) INTO p_actual;
		tip_movim ='AF';
		obs_movim ='Anulación Factura';
		
		UPDATE tab_inventario SET val_cantidad =n_cant, usr_update =usuario, fec_update =NOW() WHERE id_insumo = r_productos.id_insumo;
		UPDATE tab_kardex SET ind_saldo =FALSE, usr_update =usuario, fec_update =NOW() WHERE id_insumo =r_productos.id_insumo AND ind_saldo =TRUE;
		INSERT INTO tab_kardex(id_kardex, id_insumo, ind_movimiento, val_cant_movim, val_cant_actual, val_precio_movim, val_precio_actual, val_total_movim, val_total_actual, ind_saldo, val_observacion, usr_insert) 
		VALUES(0, r_productos.id_insumo, tip_movim, r_productos.val_cant_act, n_cant, r_productos.val_kardex, p_actual, t_costo, t_actual, TRUE, obs_movim, usuario);
		UPDATE tab_facturas_det SET val_cant_act =0, val_cant_dev =val_cant_dev + r_productos.val_cant_act, usr_update =usuario, fec_update =NOW() WHERE id_c_factura =factura AND id_insumo = r_productos.id_insumo;
		
		RAISE NOTICE 'insumo: %', r_productos.id_insumo;
		RAISE NOTICE 'can_anu: % can_kardex: % =n_cant: % val_kardex: % t_costo: % t_kardex: % t_actual: % p_actual: %', r_productos.val_cant_act, r_productos.val_cant_actual, n_cant, r_productos.val_kardex, t_costo, r_productos.val_total_actual, t_actual, p_actual;
		FETCH c_productos INTO r_productos;
	END LOOP;
	CLOSE c_productos;
	UPDATE tab_facturas_enc SET ind_anulacion =FALSE, obs_anulacion =observ, usr_update =usuario, fec_update =NOW() WHERE id_c_factura =factura;
	UPDATE tab_recaudos_enc SET ind_estado =FALSE, obs_estado =observ, usr_update =usuario, fec_update =NOW() WHERE id_recibo =factura AND tip_recibo ='1';
END;
$$ LANGUAGE PLPGSQL;

/* SELECT fun_anulacion(1, 'dsfsd', 'dgred'); */

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION fun_reajuste(producto DECIMAL(15,0), cantidad DECIMAL(10,0), observacion VARCHAR(255), usuario VARCHAR(20)) RETURNS VOID AS $$
DECLARE
r_kardex		RECORD;
cant_mov		tab_kardex.val_cant_movim%TYPE;
t_movimiento	tab_kardex.val_total_movim%TYPE;
t_actual		tab_kardex.val_total_actual%TYPE;
BEGIN
	SELECT val_cant_actual, val_precio_actual FROM tab_kardex WHERE id_insumo = producto AND ind_saldo =TRUE INTO r_kardex;
	IF cantidad > r_kardex.val_cant_actual THEN
		cant_mov =cantidad - r_kardex.val_cant_actual;
	ELSE
		cant_mov =r_kardex.val_cant_actual - cantidad;
	END IF;
	t_movimiento =cant_mov*r_kardex.val_precio_actual;
	t_actual =cantidad*r_kardex.val_precio_actual;

	UPDATE tab_inventario SET val_cantidad = cantidad, usr_update =usuario, fec_update =NOW() WHERE id_insumo = producto;
	UPDATE tab_kardex SET ind_saldo =FALSE, usr_update =usuario, fec_update =NOW() WHERE id_insumo =producto AND ind_saldo =TRUE;
	INSERT INTO tab_kardex(id_kardex, id_insumo, ind_movimiento, val_cant_movim, val_cant_actual, val_precio_movim, val_precio_actual, val_total_movim, val_total_actual, ind_saldo, val_observacion, usr_insert) VALUES
	(0, producto, 'RI', cant_mov, cantidad, r_kardex.val_precio_actual, r_kardex.val_precio_actual, t_movimiento, t_actual, TRUE, observacion, usuario);
END;
$$ LANGUAGE PLPGSQL;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--caja: id_consec[1], vt_factura[2], vt_anulado[3], vt_facturado[4], vt_siste[5], vt_recaudo[6], vt_ingresos[7], vt_egresos[8], val_final[9]

CREATE OR REPLACE FUNCTION fun_caja(caja INTEGER[], fecha DATE, usuario VARCHAR(20)) RETURNS VOID AS $$
BEGIN
	UPDATE tab_facturas_enc SET id_caja =caja[1], usr_update =usuario, fec_update =NOW() WHERE id_caja IS NULL;
	UPDATE tab_recaudos_det SET id_caja =caja[1], usr_update =usuario, fec_update =NOW() WHERE id_caja IS NULL;
	UPDATE tab_ing_egr SET id_caja =caja[1], usr_update =usuario, fec_update =NOW() WHERE id_caja IS NULL;
	UPDATE tab_caja SET vt_factura =caja[2], vt_anulado =caja[3], vt_facturado =caja[4], vt_siste =caja[5], vt_recaudo =caja[6], vt_ingresos =caja[7], vt_egresos =caja[8], val_final =caja[9], fec_final =fecha, ind_caja =FALSE, usr_update =usuario, fec_update =NOW() WHERE id_consec =caja[1];
END;
$$ LANGUAGE PLPGSQL;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--productos: tipo[1], descripcion[2], valor[3]

CREATE OR REPLACE FUNCTION fun_ing_egr(productos TEXT[], usuario VARCHAR(20)) RETURNS VOID AS $$
BEGIN
	FOR i IN ARRAY_LOWER(productos, 1)..ARRAY_UPPER(productos, 1) LOOP
		INSERT INTO tab_ing_egr(id_consec, descripcion, valor, tipo, usr_insert) VALUES(0, productos[i][2], productos[i][3]::integer, productos[i][1], usuario);
	END LOOP;
END;
$$ LANGUAGE PLPGSQL;


--FUNCION PARA CONTAR LAS CANTIDADES DE UN PRODUCTO CON CODIGO DE BARRAS.
DROP FUNCTION fun_cont(id INTEGER) CASCADE;
CREATE FUNCTION fun_cont(id INTEGER) RETURNS VOID AS $$
DECLARE
num_max		tab_cont_invent.cantidad%TYPE;											
BEGIN
	SELECT COALESCE(MAX(cantidad),0)+1 FROM tab_cont_invent WHERE id_insumo=id INTO num_max;	
	IF num_max=1 THEN
		INSERT INTO tab_cont_invent (id_insumo, cantidad) VALUES (id, num_max);		 
	ELSE
		UPDATE tab_cont_invent SET cantidad =num_max WHERE id_insumo =id;							   
	END IF;																													
END;
$$ LANGUAGE PLPGSQL;					