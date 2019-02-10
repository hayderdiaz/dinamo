<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToTabPedidosDetTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('tab_pedidos_det', function(Blueprint $table)
		{
			$table->foreign('id_pedido', 'tab_pedidos_det_id_pedido_fkey')->references('id_pedido')->on('tab_pedidos_enc')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('id_insumo', 'tab_pedidos_det_id_insumo_fkey')->references('id_insumo')->on('tab_insumos')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('id_almacen', 'tab_pedidos_det_id_almacen_fkey')->references('id_almacen')->on('tab_almacenes')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('tab_pedidos_det', function(Blueprint $table)
		{
			$table->dropForeign('tab_pedidos_det_id_pedido_fkey');
			$table->dropForeign('tab_pedidos_det_id_insumo_fkey');
			$table->dropForeign('tab_pedidos_det_id_almacen_fkey');
		});
	}

}
