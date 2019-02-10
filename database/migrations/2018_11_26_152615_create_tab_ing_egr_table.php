<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabIngEgrTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_ing_egr', function(Blueprint $table)
		{
			$table->decimal('id_consec', 10, 0)->primary('tab_ing_egr_pkey');
			$table->string('descripcion', 60);
			$table->decimal('valor', 10, 0);
			$table->date('fecha')->default('2018-11-26');
			$table->string('tipo', 7);
			$table->decimal('id_caja', 10, 0)->nullable();
			$table->boolean('estado')->default(1);
			$table->string('usr_insert', 20);
			$table->dateTime('fec_insert')->default('2018-11-26 15:19:47.2391');
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
		Schema::drop('tab_ing_egr');
	}

}
