<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabContInventTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_cont_invent', function(Blueprint $table)
		{
			$table->decimal('id_insumo', 15, 0)->primary('tab_cont_invent_pkey');
			$table->decimal('cantidad', 5, 0);
			$table->decimal('precio', 10, 0)->default(0);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('tab_cont_invent');
	}

}
