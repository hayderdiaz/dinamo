<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToTabClientesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('tab_clientes', function(Blueprint $table)
		{
			$table->foreign('id_ciudad', 'tab_clientes_id_ciudad_fkey')->references('id_ciudad')->on('tab_ciudades')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('tab_clientes', function(Blueprint $table)
		{
			$table->dropForeign('tab_clientes_id_ciudad_fkey');
		});
	}

}
