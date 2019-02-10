<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabGraficosTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_graficos', function(Blueprint $table)
		{
			$table->decimal('id_linea', 5, 0);
			$table->decimal('id_grafico', 5, 0)->primary('tab_graficos_pkey');
			$table->string('nom_grafico', 50);
			$table->boolean('ind_estado')->default(0);
			$table->string('usr_insert', 20);
			$table->dateTime('fec_insert')->default('2018-11-26 15:19:47.071889');
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
		Schema::drop('tab_graficos');
	}

}
