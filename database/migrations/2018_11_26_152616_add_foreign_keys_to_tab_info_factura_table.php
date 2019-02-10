<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToTabInfoFacturaTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('tab_info_factura', function(Blueprint $table)
		{
			$table->foreign('id_c_factura', 'tab_info_factura_id_c_factura_fkey')->references('id_c_factura')->on('tab_facturas_enc')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('tab_info_factura', function(Blueprint $table)
		{
			$table->dropForeign('tab_info_factura_id_c_factura_fkey');
		});
	}

}
