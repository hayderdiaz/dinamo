<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabDepartamentosTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_departamentos', function(Blueprint $table)
		{
			$table->decimal('id_depto', 3, 0)->primary('tab_departamentos_pkey');
			$table->string('nom_depto', 50);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('tab_departamentos');
	}

}
