<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabMarcasTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_marcas', function(Blueprint $table)
		{
			$table->decimal('id_linea', 5, 0);
			$table->decimal('id_marca', 5, 0)->primary('tab_marcas_pkey');
			$table->string('nom_marca', 50);
			$table->boolean('ind_estado')->default(0);
			$table->string('usr_insert', 20);
			$table->dateTime('fec_insert')->default('2018-11-26 15:19:47.67356');
			$table->string('usr_update', 20)->nullable();
			$table->dateTime('fec_update')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('tab_marcas');
	}

}
