<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToTabComEmpTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('tab_com_emp', function(Blueprint $table)
		{
			$table->foreign('id_empleado', 'tab_com_emp_id_empleado_fkey')->references('id_empleado')->on('tab_empleados')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('id_comision', 'tab_com_emp_id_comision_fkey')->references('id_comision')->on('tab_comisiones')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('tab_com_emp', function(Blueprint $table)
		{
			$table->dropForeign('tab_com_emp_id_empleado_fkey');
			$table->dropForeign('tab_com_emp_id_comision_fkey');
		});
	}

}
