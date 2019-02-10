<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabRecaudosEncTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_recaudos_enc', function(Blueprint $table)
		{
			$table->decimal('id_c_recaudo', 10, 0)->primary('tab_recaudos_enc_pkey');
			$table->decimal('id_recaudo', 10, 0);
			$table->decimal('id_recibo', 10, 0);
			$table->string('id_cliente', 30);
			$table->decimal('pag_total', 10, 0);
			$table->date('fec_recaudo')->default('2018-11-26');
			$table->char('hor_recaudo', 8)->default('now');
			$table->char('tip_recibo', 1);
			$table->boolean('inf_factura');
			$table->boolean('ind_estado')->default(1);
			$table->string('obs_estado', 200)->nullable();
			$table->string('usr_insert', 20);
			$table->dateTime('fec_insert')->default('2018-11-26 15:19:48.28525');
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
		Schema::drop('tab_recaudos_enc');
	}

}
