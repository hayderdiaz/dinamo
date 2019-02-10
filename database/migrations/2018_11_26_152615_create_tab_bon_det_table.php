<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabBonDetTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_bon_det', function(Blueprint $table)
		{
			$table->decimal('id_consec', 10, 0)->primary('tab_bon_det_pkey');
			$table->decimal('id_bonif', 10, 0);
			$table->string('id_empleado', 12);
			$table->decimal('val_acumulado', 10, 0);
			$table->decimal('val_bonificacion', 10, 0)->default(0);
			$table->string('usr_insert', 20);
			$table->dateTime('fec_insert')->default('2018-11-26 15:19:46.060676');
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
		Schema::drop('tab_bon_det');
	}

}
