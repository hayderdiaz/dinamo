<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabConsignacionesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_consignaciones', function(Blueprint $table)
		{
			$table->decimal('id_consec', 6, 0)->primary('tab_consignaciones_pkey');
			$table->string('id_proveedor', 30);
			$table->decimal('val_consig', 7, 0);
			$table->string('observ', 150);
			$table->date('fec_consig')->default('2018-11-26');
			$table->string('img_consig', 100)->default('/dinamo/images/img_consignaciones/default.jpg');
			$table->string('usr_insert', 20);
			$table->dateTime('fec_insert')->default('2018-11-26 15:19:46.570452');
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
		Schema::drop('tab_consignaciones');
	}

}
