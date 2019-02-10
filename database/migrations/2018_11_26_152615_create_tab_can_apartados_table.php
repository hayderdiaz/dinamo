<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabCanApartadosTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_can_apartados', function(Blueprint $table)
		{
			$table->decimal('id_cancel', 10, 0)->primary('tab_can_apartados_pkey');
			$table->decimal('id_consec', 10, 0);
			$table->decimal('vt_cancelado', 10, 0);
			$table->decimal('por_cobro', 3, 0);
			$table->decimal('val_cobro', 10, 0);
			$table->decimal('pag_cobro', 10, 0);
			$table->decimal('sal_cobro', 10, 0);
			$table->string('observacion', 200);
			$table->string('usr_insert', 20);
			$table->dateTime('fec_insert')->default('2018-11-26 15:19:46.211241');
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
		Schema::drop('tab_can_apartados');
	}

}
