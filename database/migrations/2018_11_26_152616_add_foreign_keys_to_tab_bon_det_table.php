<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToTabBonDetTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('tab_bon_det', function(Blueprint $table)
		{
			$table->foreign('id_bonif', 'tab_bon_det_id_bonif_fkey')->references('id_bonif')->on('tab_bon_enc')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('id_empleado', 'tab_bon_det_id_empleado_fkey')->references('id_empleado')->on('tab_empleados')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('tab_bon_det', function(Blueprint $table)
		{
			$table->dropForeign('tab_bon_det_id_bonif_fkey');
			$table->dropForeign('tab_bon_det_id_empleado_fkey');
		});
	}

}
