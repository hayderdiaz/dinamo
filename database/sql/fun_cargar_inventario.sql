/* Funcion para actualizar las cantidades iniciales automatico. */
DROP FUNCTION act_inventario() CASCADE;
CREATE FUNCTION act_inventario() RETURNS VOID AS $$
DECLARE
c_inventario		REFCURSOR;
r_inventario		RECORD;
cantidad			DECIMAL(10,0)=100;
precio				DECIMAL(10,0)=60000;
t_movimiento		DECIMAL(10,0);
t_actual			DECIMAL(10,0);
BEGIN	
	OPEN c_inventario FOR SELECT a.id_insumo, a.val_cantidad FROM tab_inventario AS a, tab_insumos AS b WHERE a.id_insumo=b.id_insumo;		
		FETCH c_inventario INTO r_inventario;
			WHILE FOUND LOOP		
				IF r_inventario.val_cantidad =0 THEN
				    UPDATE tab_inventario SET val_cantidad=cantidad WHERE id_insumo=r_inventario.id_insumo;
					t_movimiento=cantidad*precio;
					t_actual=t_movimiento;	
					INSERT INTO tab_kardex(id_kardex, id_insumo, ind_movimiento, val_cant_movim, val_cant_actual, val_precio_movim, val_precio_actual,val_total_movim, val_total_actual, ind_saldo, val_observacion, usr_insert) VALUES (0, r_inventario.id_insumo, 'SI', 100, 100, 	precio, precio, t_movimiento, t_actual, TRUE, 'Saldo Inicial', 'Sistema');
				ELSE
				END IF;				
		FETCH c_inventario INTO r_inventario;
			END LOOP;
	CLOSE c_inventario;	
END;
$$ LANGUAGE PLPGSQL; 





