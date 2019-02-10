<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabCiudadesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_ciudades', function(Blueprint $table)
		{
			$table->decimal('id_ciudad', 5, 0)->primary('tab_ciudades_pkey');
			$table->decimal('id_depto', 3, 0);
			$table->string('nom_ciudad', 50);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('tab_ciudades');
	}

}
