<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToTabInventarioTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('tab_inventario', function(Blueprint $table)
		{
			$table->foreign('id_insumo', 'tab_inventario_id_insumo_fkey')->references('id_insumo')->on('tab_insumos')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('id_marca', 'tab_inventario_id_marca_fkey')->references('id_marca')->on('tab_marcas')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('id_medida', 'tab_inventario_id_medida_fkey')->references('id_medida')->on('tab_medidas')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('id_tipo', 'tab_inventario_id_tipo_fkey')->references('id_tipo')->on('tab_tipos_productos')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('id_color', 'tab_inventario_id_color_fkey')->references('id_color')->on('tab_colores')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('id_grafico', 'tab_inventario_id_grafico_fkey')->references('id_grafico')->on('tab_graficos')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('id_labrado', 'tab_inventario_id_labrado_fkey')->references('id_labrado')->on('tab_labrados')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('tab_inventario', function(Blueprint $table)
		{
			$table->dropForeign('tab_inventario_id_insumo_fkey');
			$table->dropForeign('tab_inventario_id_marca_fkey');
			$table->dropForeign('tab_inventario_id_medida_fkey');
			$table->dropForeign('tab_inventario_id_tipo_fkey');
			$table->dropForeign('tab_inventario_id_color_fkey');
			$table->dropForeign('tab_inventario_id_grafico_fkey');
			$table->dropForeign('tab_inventario_id_labrado_fkey');
		});
	}

}
