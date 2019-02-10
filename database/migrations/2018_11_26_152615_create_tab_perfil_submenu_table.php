<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabPerfilSubmenuTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_perfil_submenu', function(Blueprint $table)
		{
			$table->decimal('id_perfil', 2, 0);
			$table->decimal('id_menu', 2, 0);
			$table->decimal('id_submenu', 2, 0);
			$table->string('usr_insert', 20);
			$table->dateTime('fec_insert')->default('2018-11-26 15:19:48.092853');
			$table->string('usr_update', 20)->nullable();
			$table->dateTime('fec_update')->nullable();
			$table->primary(['id_perfil','id_menu','id_submenu'], 'tab_perfil_submenu_pkey');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('tab_perfil_submenu');
	}

}
