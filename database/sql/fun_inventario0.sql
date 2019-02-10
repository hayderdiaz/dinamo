/* Funcion para actualizar las cantidades iniciales automatico. */
DROP FUNCTION act_inventario0() CASCADE;
CREATE FUNCTION act_inventario0() RETURNS VOID AS $$
DECLARE
c_inventario		REFCURSOR;
r_inventario		RECORD;
cantidad			DECIMAL(10,0)=0;
BEGIN	
	OPEN c_inventario FOR SELECT a.id_insumo, a.val_cantidad FROM tab_inventario AS a, tab_insumos AS b WHERE a.id_insumo=b.id_insumo;		
		FETCH c_inventario INTO r_inventario;
			WHILE FOUND LOOP		
				IF r_inventario.val_cantidad !=0 THEN
				    UPDATE tab_inventario SET val_cantidad=cantidad WHERE id_insumo=r_inventario.id_insumo;
					DELETE FROM tab_kardex WHERE id_insumo=r_inventario.id_insumo;
					ELSE
				END IF;				
		FETCH c_inventario INTO r_inventario;
			END LOOP;
	CLOSE c_inventario;	
END;
$$ LANGUAGE PLPGSQL; 