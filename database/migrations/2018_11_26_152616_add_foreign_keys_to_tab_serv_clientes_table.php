<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToTabServClientesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('tab_serv_clientes', function(Blueprint $table)
		{
			$table->foreign('id_c_factura', 'tab_serv_clientes_id_c_factura_fkey')->references('id_c_factura')->on('tab_facturas_enc')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('id_insumo', 'tab_serv_clientes_id_insumo_fkey')->references('id_insumo')->on('tab_insumos')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('id_empleado', 'tab_serv_clientes_id_empleado_fkey')->references('id_empleado')->on('tab_empleados')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('tab_serv_clientes', function(Blueprint $table)
		{
			$table->dropForeign('tab_serv_clientes_id_c_factura_fkey');
			$table->dropForeign('tab_serv_clientes_id_insumo_fkey');
			$table->dropForeign('tab_serv_clientes_id_empleado_fkey');
		});
	}

}
