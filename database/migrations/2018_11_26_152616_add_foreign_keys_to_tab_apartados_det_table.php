<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToTabApartadosDetTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('tab_apartados_det', function(Blueprint $table)
		{
			$table->foreign('id_consec', 'tab_apartados_det_id_consec_fkey')->references('id_consec')->on('tab_apartados_enc')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('id_insumo', 'tab_apartados_det_id_insumo_fkey')->references('id_insumo')->on('tab_insumos')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('tab_apartados_det', function(Blueprint $table)
		{
			$table->dropForeign('tab_apartados_det_id_consec_fkey');
			$table->dropForeign('tab_apartados_det_id_insumo_fkey');
		});
	}

}
