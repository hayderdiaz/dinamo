<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToTabFacturasDetTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('tab_facturas_det', function(Blueprint $table)
		{
			$table->foreign('id_c_factura', 'tab_facturas_det_id_c_factura_fkey')->references('id_c_factura')->on('tab_facturas_enc')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('id_insumo', 'tab_facturas_det_id_insumo_fkey')->references('id_insumo')->on('tab_insumos')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('id_almacen', 'tab_facturas_det_id_almacen_fkey')->references('id_almacen')->on('tab_almacenes')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('tab_facturas_det', function(Blueprint $table)
		{
			$table->dropForeign('tab_facturas_det_id_c_factura_fkey');
			$table->dropForeign('tab_facturas_det_id_insumo_fkey');
			$table->dropForeign('tab_facturas_det_id_almacen_fkey');
		});
	}

}
