<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabFacturasEncTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_facturas_enc', function(Blueprint $table)
		{
			$table->decimal('id_c_factura', 10, 0)->primary('tab_facturas_enc_pkey');
			$table->decimal('id_factura', 10, 0);
			$table->string('id_cliente', 30);
			$table->string('id_empleado', 12);
			$table->date('fec_factura')->default('2018-11-26');
			$table->char('hor_factura', 8)->default('now');
			$table->date('fec_vencimiento')->default('2018-11-26');
			$table->decimal('vt_bruto', 10, 0);
			$table->decimal('vt_iva', 10, 0);
			$table->decimal('subtotal', 10, 0);
			$table->smallInteger('des_general');
			$table->decimal('v_des_general', 10, 0);
			$table->boolean('ind_siste');
			$table->date('fec_siste')->nullable();
			$table->smallInteger('des_siste');
			$table->decimal('v_des_siste', 10, 0);
			$table->decimal('vt_neto', 10, 0);
			$table->decimal('pag_total', 10, 0);
			$table->decimal('val_siste', 10, 0);
			$table->decimal('sal_total', 10, 0);
			$table->boolean('ind_anulacion')->default(1);
			$table->string('obs_anulacion', 200)->nullable();
			$table->decimal('id_comision', 10, 0)->nullable();
			$table->boolean('ind_comision')->default(0);
			$table->date('fec_comision')->nullable();
			$table->decimal('id_caja', 10, 0)->nullable();
			$table->string('usr_insert', 20);
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
		Schema::drop('tab_facturas_enc');
	}

}
