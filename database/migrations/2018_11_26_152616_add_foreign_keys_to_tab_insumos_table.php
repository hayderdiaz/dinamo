<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToTabInsumosTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('tab_insumos', function(Blueprint $table)
		{
			$table->foreign('id_linea', 'tab_insumos_id_linea_fkey')->references('id_linea')->on('tab_lineas_insumo')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('tab_insumos', function(Blueprint $table)
		{
			$table->dropForeign('tab_insumos_id_linea_fkey');
		});
	}

}
