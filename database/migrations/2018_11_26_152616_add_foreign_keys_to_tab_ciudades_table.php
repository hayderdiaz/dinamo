<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToTabCiudadesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('tab_ciudades', function(Blueprint $table)
		{
			$table->foreign('id_depto', 'tab_ciudades_id_depto_fkey')->references('id_depto')->on('tab_departamentos')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('tab_ciudades', function(Blueprint $table)
		{
			$table->dropForeign('tab_ciudades_id_depto_fkey');
		});
	}

}
