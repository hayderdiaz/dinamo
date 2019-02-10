<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabPedidosEncTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_pedidos_enc', function(Blueprint $table)
		{
			$table->decimal('id_pedido', 10, 0)->primary('tab_pedidos_enc_pkey');
			$table->string('id_proveedor', 30);
			$table->decimal('num_pedido', 10, 0)->nullable();
			$table->date('fec_pedido');
			$table->decimal('vt_bruto', 10, 0);
			$table->decimal('vt_iva', 10, 0);
			$table->decimal('subtotal', 10, 0);
			$table->decimal('v_descuento', 10, 0);
			$table->decimal('vt_neto', 10, 0);
			$table->decimal('pag_total', 10, 0);
			$table->decimal('sal_total', 10, 0);
			$table->string('img_pedido', 100)->default('/dinamo/images/img_compras/default.jpg');
			$table->string('usr_insert', 20);
			$table->dateTime('fec_insert')->default('2018-11-26 15:19:47.984281');
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
		Schema::drop('tab_pedidos_enc');
	}

}
