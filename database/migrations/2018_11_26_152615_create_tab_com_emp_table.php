<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabComEmpTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_com_emp', function(Blueprint $table)
		{
			$table->decimal('id_consec', 10, 0)->primary('tab_com_emp_pkey');
			$table->decimal('id_comision', 10, 0);
			$table->string('id_empleado', 12);
			$table->decimal('val_comision', 10, 0);
			$table->decimal('val_facturas', 10, 0);
			$table->date('fec_comision')->default('2018-11-26');
			$table->boolean('ind_pago')->default(0);
			$table->string('usr_insert', 20);
			$table->dateTime('fec_insert')->default('2018-11-26 15:19:46.428594');
			$table->string('usr_update', 20)->nullable();
			$table->dateTime('fec_update')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('tab_com_emp');
	}

}
