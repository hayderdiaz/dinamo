<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabCajaTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_caja', function(Blueprint $table)
		{
			$table->decimal('id_consec', 10, 0)->primary('tab_caja_pkey');
			$table->decimal('val_inicial', 10, 0);
			$table->date('fec_inicial')->default('2018-11-26');
			$table->decimal('vt_factura', 10, 0)->default(0);
			$table->decimal('vt_anulado', 10, 0)->default(0);
			$table->decimal('vt_facturado', 10, 0)->default(0);
			$table->decimal('vt_siste', 10, 0)->default(0);
			$table->decimal('vt_recaudo', 10, 0)->default(0);
			$table->decimal('vt_ingresos', 10, 0)->default(0);
			$table->decimal('vt_egresos', 10, 0)->default(0);
			$table->decimal('val_final', 10, 0)->default(0);
			$table->date('fec_final')->nullable();
			$table->boolean('ind_caja')->default(1);
			$table->string('usr_insert', 20);
			$table->dateTime('fec_insert')->default('2018-11-26 15:19:46.160854');
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
		Schema::drop('tab_caja');
	}

}
