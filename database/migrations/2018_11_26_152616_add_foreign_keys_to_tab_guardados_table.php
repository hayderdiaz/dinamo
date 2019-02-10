<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToTabGuardadosTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('tab_guardados', function(Blueprint $table)
		{
			$table->foreign('id_cliente', 'tab_guardados_id_cliente_fkey')->references('id_cliente')->on('tab_clientes')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('id_insumo', 'tab_guardados_id_insumo_fkey')->references('id_insumo')->on('tab_insumos')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('tab_guardados', function(Blueprint $table)
		{
			$table->dropForeign('tab_guardados_id_cliente_fkey');
			$table->dropForeign('tab_guardados_id_insumo_fkey');
		});
	}

}
