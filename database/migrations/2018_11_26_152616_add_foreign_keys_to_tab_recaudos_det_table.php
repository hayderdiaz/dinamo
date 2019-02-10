<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToTabRecaudosDetTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('tab_recaudos_det', function(Blueprint $table)
		{
			$table->foreign('id_c_recaudo', 'tab_recaudos_det_id_c_recaudo_fkey')->references('id_c_recaudo')->on('tab_recaudos_enc')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('tab_recaudos_det', function(Blueprint $table)
		{
			$table->dropForeign('tab_recaudos_det_id_c_recaudo_fkey');
		});
	}

}
