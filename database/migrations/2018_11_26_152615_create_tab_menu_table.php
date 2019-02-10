<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabMenuTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_menu', function(Blueprint $table)
		{
			$table->decimal('id_menu', 2, 0)->primary('tab_menu_pkey');
			$table->string('nom_menu', 50);
			$table->string('link_menu', 100);
			$table->string('ico_menu', 50);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('tab_menu');
	}

}
