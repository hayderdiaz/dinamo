<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToTabCanApartadosTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('tab_can_apartados', function(Blueprint $table)
		{
			$table->foreign('id_consec', 'tab_can_apartados_id_consec_fkey')->references('id_consec')->on('tab_apartados_enc')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('tab_can_apartados', function(Blueprint $table)
		{
			$table->dropForeign('tab_can_apartados_id_consec_fkey');
		});
	}

}
