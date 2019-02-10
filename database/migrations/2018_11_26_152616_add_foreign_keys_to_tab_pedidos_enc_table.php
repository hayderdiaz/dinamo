<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToTabPedidosEncTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('tab_pedidos_enc', function(Blueprint $table)
		{
			$table->foreign('id_proveedor', 'tab_pedidos_enc_id_proveedor_fkey')->references('id_proveedor')->on('tab_proveedores')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('tab_pedidos_enc', function(Blueprint $table)
		{
			$table->dropForeign('tab_pedidos_enc_id_proveedor_fkey');
		});
	}

}
