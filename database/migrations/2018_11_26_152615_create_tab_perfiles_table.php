<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabPerfilesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_perfiles', function(Blueprint $table)
		{
			$table->decimal('id_perfil', 2, 0)->primary('tab_perfiles_pkey');
			$table->string('nom_perfil', 20);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('tab_perfiles');
	}

}
