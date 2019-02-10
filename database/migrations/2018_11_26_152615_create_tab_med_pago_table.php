<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabMedPagoTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_med_pago', function(Blueprint $table)
		{
			$table->smallInteger('id_consec')->primary('tab_med_pago_pkey');
			$table->smallInteger('id_for_pago');
			$table->string('med_pago', 50);
			$table->smallInteger('por_cobro');
			$table->boolean('ind_estado')->default(1);
			$table->string('usr_insert', 20);
			$table->dateTime('fec_insert')->default('2018-11-26 15:19:47.715256');
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
		Schema::drop('tab_med_pago');
	}

}
