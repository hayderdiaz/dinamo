<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabEmpleadosTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_empleados', function(Blueprint $table)
		{
			$table->string('id_empleado', 12)->primary('tab_empleados_pkey');
			$table->string('nom_empleado', 100);
			$table->string('dir_empleado', 50)->default('N/A');
			$table->string('tel_empleado', 40)->default('N/A');
			$table->string('cor_empleado', 80)->default('N/A');
			$table->string('usr_insert', 20);
			$table->dateTime('fec_insert')->default('2018-11-26 15:19:46.829386');
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
		Schema::drop('tab_empleados');
	}

}
