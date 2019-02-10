<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToTabContInventTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('tab_cont_invent', function(Blueprint $table)
		{
			$table->foreign('id_insumo', 'tab_cont_invent_id_insumo_fkey')->references('id_insumo')->on('tab_insumos')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('tab_cont_invent', function(Blueprint $table)
		{
			$table->dropForeign('tab_cont_invent_id_insumo_fkey');
		});
	}

}
