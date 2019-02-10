<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToTabFacturasEncTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('tab_facturas_enc', function(Blueprint $table)
		{
			$table->foreign('id_cliente', 'tab_facturas_enc_id_cliente_fkey')->references('id_cliente')->on('tab_clientes')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('id_empleado', 'tab_facturas_enc_id_empleado_fkey')->references('id_empleado')->on('tab_empleados')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('tab_facturas_enc', function(Blueprint $table)
		{
			$table->dropForeign('tab_facturas_enc_id_cliente_fkey');
			$table->dropForeign('tab_facturas_enc_id_empleado_fkey');
		});
	}

}
