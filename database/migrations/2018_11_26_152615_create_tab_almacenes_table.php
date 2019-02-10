<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabAlmacenesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_almacenes', function(Blueprint $table)
		{
			$table->decimal('id_almacen', 2, 0)->primary('tab_almacenes_pkey');
			$table->string('nom_almacen', 50);
			$table->boolean('ind_almacen')->default(1);
			$table->string('usr_insert', 20);
			$table->dateTime('fec_insert')->default('2018-11-26 15:19:45.868137');
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
		Schema::drop('tab_almacenes');
	}

}
