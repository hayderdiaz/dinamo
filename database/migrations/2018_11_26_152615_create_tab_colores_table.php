<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabColoresTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_colores', function(Blueprint $table)
		{
			$table->decimal('id_linea', 5, 0);
			$table->decimal('id_color', 5, 0)->primary('tab_colores_pkey');
			$table->string('nom_color', 50);
			$table->boolean('ind_estado')->default(0);
			$table->string('usr_insert', 20);
			$table->dateTime('fec_insert')->default('2018-11-26 15:19:46.378251');
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
		Schema::drop('tab_colores');
	}

}
