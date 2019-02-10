<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToTabMedPagoTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('tab_med_pago', function(Blueprint $table)
		{
			$table->foreign('id_for_pago', 'tab_med_pago_id_for_pago_fkey')->references('id_for_pago')->on('tab_for_pago')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('tab_med_pago', function(Blueprint $table)
		{
			$table->dropForeign('tab_med_pago_id_for_pago_fkey');
		});
	}

}
