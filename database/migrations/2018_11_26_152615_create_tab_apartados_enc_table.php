<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabApartadosEncTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_apartados_enc', function(Blueprint $table)
		{
			$table->decimal('id_consec', 10, 0)->primary('tab_apartados_enc_pkey');
			$table->string('id_cliente', 30);
			$table->string('id_empleado', 12);
			$table->date('fec_apartado')->default('2018-11-26');
			$table->date('fec_plazo');
			$table->decimal('vt_bruto', 10, 0);
			$table->decimal('vt_iva', 10, 0);
			$table->decimal('subtotal', 10, 0);
			$table->smallInteger('des_general');
			$table->decimal('v_des_general', 10, 0);
			$table->decimal('vt_neto', 10, 0);
			$table->decimal('pag_total', 10, 0);
			$table->decimal('sal_total', 10, 0);
			$table->boolean('ind_pago')->default(0);
			$table->boolean('ind_factura')->default(0);
			$table->boolean('ind_estado')->default(1);
			$table->string('usr_insert', 20);
			$table->dateTime('fec_insert')->default('2018-11-26 15:19:45.96024');
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
		Schema::drop('tab_apartados_enc');
	}

}
