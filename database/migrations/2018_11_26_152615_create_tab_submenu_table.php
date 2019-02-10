<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabSubmenuTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_submenu', function(Blueprint $table)
		{
			$table->decimal('id_submenu', 2, 0)->primary('tab_submenu_pkey');
			$table->string('nom_submenu', 50);
			$table->string('link_submenu', 100);
			$table->string('ico_submenu', 50);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('tab_submenu');
	}

}
