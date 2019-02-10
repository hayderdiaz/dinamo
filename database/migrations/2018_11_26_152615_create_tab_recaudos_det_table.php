<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabRecaudosDetTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_recaudos_det', function(Blueprint $table)
		{
			$table->decimal('id_consec', 10, 0)->primary('tab_recaudos_det_pkey');
			$table->decimal('id_c_recaudo', 10, 0);
			$table->decimal('val_pago', 10, 0);
			$table->string('for_pago', 50);
			$table->string('med_pago', 50);
			$table->smallInteger('por_cobro');
			$table->decimal('id_caja', 10, 0)->nullable();
			$table->string('usr_insert', 20);
			$table->dateTime('fec_insert')->default('2018-11-26 15:19:48.234972');
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
		Schema::drop('tab_recaudos_det');
	}

}
