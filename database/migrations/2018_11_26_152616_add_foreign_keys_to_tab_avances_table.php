<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToTabAvancesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('tab_avances', function(Blueprint $table)
		{
			$table->foreign('id_empleado', 'tab_avances_id_empleado_fkey')->references('id_empleado')->on('tab_empleados')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('tab_avances', function(Blueprint $table)
		{
			$table->dropForeign('tab_avances_id_empleado_fkey');
		});
	}

}
