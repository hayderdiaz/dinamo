<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabLineasInsumoTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_lineas_insumo', function(Blueprint $table)
		{
			$table->decimal('id_linea', 5, 0)->primary('tab_lineas_insumo_pkey');
			$table->string('nom_linea', 60);
			$table->boolean('tip_linea');
			$table->decimal('val_iva', 2, 0);
			$table->boolean('ind_marca');
			$table->boolean('ind_medida');
			$table->boolean('ind_tipo');
			$table->boolean('ind_color');
			$table->boolean('ind_grafico');
			$table->boolean('ind_labrado');
			$table->boolean('ind_linea')->default(1);
			$table->string('usr_insert', 20);
			$table->dateTime('fec_insert')->default('2018-11-26 15:19:47.623248');
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
		Schema::drop('tab_lineas_insumo');
	}

}
