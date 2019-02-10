DROP FUNCTION fun_minusculas()CASCADE;
CREATE FUNCTION fun_minusculas() RETURNS TRIGGER AS $$
DECLARE
BEGIN
	IF(TG_TABLE_NAME ='tab_ciudades') THEN
		NEW.nom_ciudad=LTRIM(RTRIM(INITCAP(NEW.nom_ciudad)));
	ELSIF(TG_TABLE_NAME ='tab_departamentos') THEN
		NEW.nom_depto=LTRIM(RTRIM(INITCAP(NEW.nom_depto)));
	ELSIF(TG_TABLE_NAME ='tab_parametros') THEN
		NEW.nom_empresa=LTRIM(RTRIM(INITCAP(NEW.nom_empresa)));
		NEW.dir_empresa=LTRIM(RTRIM(INITCAP(NEW.dir_empresa)));
		NEW.rep_legal=LTRIM(RTRIM(INITCAP(NEW.rep_legal)));
	ELSIF(TG_TABLE_NAME ='tab_empleados') THEN
		NEW.dir_empleado=LTRIM(RTRIM(INITCAP(NEW.dir_empleado)));	
		NEW.nom_empleado=LTRIM(RTRIM(INITCAP(NEW.nom_empleado)));
		NEW.cor_empleado=LTRIM(RTRIM((NEW.cor_empleado)));
		NEW.dir_empleado=LTRIM(RTRIM(INITCAP(NEW.dir_empleado)));		
	ELSIF(TG_TABLE_NAME ='tab_clientes') THEN
		NEW.nom_cliente=LTRIM(RTRIM(INITCAP(NEW.nom_cliente)));
		NEW.dir_cliente=LTRIM(RTRIM(INITCAP(NEW.dir_cliente)));		 
		NEW.cor_cliente=LTRIM(RTRIM(INITCAP(NEW.cor_cliente)));		
	ELSIF(TG_TABLE_NAME ='tab_lineas_insumo') THEN
		NEW.nom_linea=LTRIM(RTRIM(INITCAP(NEW.nom_linea)));
	ELSIF(TG_TABLE_NAME ='tab_insumos') THEN
		NEW.nom_insumo=LTRIM(RTRIM(INITCAP(NEW.nom_insumo)));
	ELSIF(TG_TABLE_NAME ='tab_colores') THEN
		NEW.nom_color=LTRIM(RTRIM(INITCAP(NEW.nom_color)));
	ELSIF(TG_TABLE_NAME ='tab_graficos') THEN
		NEW.nom_grafico=LTRIM(RTRIM(INITCAP(NEW.nom_grafico)));
	ELSIF(TG_TABLE_NAME ='tab_labrados') THEN
		NEW.nom_labrado=LTRIM(RTRIM(INITCAP(NEW.nom_labrado)));
	ELSIF(TG_TABLE_NAME ='tab_medidas') THEN
		NEW.nom_medida=LTRIM(RTRIM(INITCAP(NEW.nom_medida)));		
	ELSIF(TG_TABLE_NAME ='tab_marcas') THEN
		NEW.nom_marca=LTRIM(RTRIM(INITCAP(NEW.nom_marca)));	
	ELSIF(TG_TABLE_NAME ='tab_tipos_productos') THEN
		NEW.nom_tipo=LTRIM(RTRIM(INITCAP(NEW.nom_tipo)));		
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER a_tri_minusculas BEFORE INSERT OR UPDATE ON tab_ciudades FOR EACH ROW EXECUTE PROCEDURE fun_minusculas();
CREATE TRIGGER a_tri_minusculas BEFORE INSERT OR UPDATE ON tab_departamentos FOR EACH ROW EXECUTE PROCEDURE fun_minusculas();
CREATE TRIGGER a_tri_minusculas BEFORE INSERT OR UPDATE ON tab_parametros FOR EACH ROW EXECUTE PROCEDURE fun_minusculas();
CREATE TRIGGER a_tri_minusculas BEFORE INSERT OR UPDATE ON tab_empleados FOR EACH ROW EXECUTE PROCEDURE fun_minusculas();
CREATE TRIGGER a_tri_minusculas BEFORE INSERT OR UPDATE ON tab_clientes FOR EACH ROW EXECUTE PROCEDURE fun_minusculas();
CREATE TRIGGER a_tri_minusculas BEFORE INSERT OR UPDATE ON tab_lineas_insumo FOR EACH ROW EXECUTE PROCEDURE fun_minusculas();
CREATE TRIGGER a_tri_minusculas BEFORE INSERT OR UPDATE ON tab_insumos FOR EACH ROW EXECUTE PROCEDURE fun_minusculas();
CREATE TRIGGER a_tri_minusculas BEFORE INSERT OR UPDATE ON tab_tipos_productos FOR EACH ROW EXECUTE PROCEDURE fun_minusculas();
CREATE TRIGGER a_tri_minusculas BEFORE INSERT OR UPDATE ON tab_colores FOR EACH ROW EXECUTE PROCEDURE fun_minusculas();
CREATE TRIGGER a_tri_minusculas BEFORE INSERT OR UPDATE ON tab_graficos FOR EACH ROW EXECUTE PROCEDURE fun_minusculas();
CREATE TRIGGER a_tri_minusculas BEFORE INSERT OR UPDATE ON tab_labrados FOR EACH ROW EXECUTE PROCEDURE fun_minusculas();
CREATE TRIGGER a_tri_minusculas BEFORE INSERT OR UPDATE ON tab_medidas FOR EACH ROW EXECUTE PROCEDURE fun_minusculas();
CREATE TRIGGER a_tri_minusculas BEFORE INSERT OR UPDATE ON tab_marcas FOR EACH ROW EXECUTE PROCEDURE fun_minusculas();

