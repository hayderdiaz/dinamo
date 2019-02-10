<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabServClientesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_serv_clientes', function(Blueprint $table)
		{
			$table->decimal('id_consec', 10, 0)->primary('tab_serv_clientes_pkey');
			$table->decimal('id_c_factura', 10, 0);
			$table->decimal('id_insumo', 15, 0);
			$table->string('id_empleado', 12);
			$table->decimal('val_cantidad', 5, 0);
			$table->decimal('val_servicio', 10, 0);
			$table->decimal('val_total', 10, 0);
			$table->smallInteger('por_ganancia');
			$table->decimal('vp_ganancia', 10, 0);
			$table->boolean('ind_pago')->default(0);
			$table->string('usr_insert', 20);
			$table->dateTime('fec_insert')->default('2018-11-26 15:19:48.418824');
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
		Schema::drop('tab_serv_clientes');
	}

}
