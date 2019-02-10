<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToTabRecaudosEncTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('tab_recaudos_enc', function(Blueprint $table)
		{
			$table->foreign('id_cliente', 'tab_recaudos_enc_id_cliente_fkey')->references('id_cliente')->on('tab_clientes')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('tab_recaudos_enc', function(Blueprint $table)
		{
			$table->dropForeign('tab_recaudos_enc_id_cliente_fkey');
		});
	}

}
