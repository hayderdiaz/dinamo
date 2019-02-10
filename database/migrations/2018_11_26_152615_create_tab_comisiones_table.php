<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabComisionesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_comisiones', function(Blueprint $table)
		{
			$table->decimal('id_comision', 10, 0)->primary('tab_comisiones_pkey');
			$table->decimal('val_comision_ini', 10, 0);
			$table->decimal('val_comision_fin', 10, 0);
			$table->decimal('val_porcentaje', 4, 0);
			$table->decimal('val_comision', 10, 0);
			$table->boolean('tip_pago');
			$table->boolean('ind_comision')->default(1);
			$table->string('usr_insert', 20);
			$table->dateTime('fec_insert')->default('2018-11-26 15:19:46.503618');
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
		Schema::drop('tab_comisiones');
	}

}
