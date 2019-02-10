<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabAvancesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_avances', function(Blueprint $table)
		{
			$table->decimal('id_consec', 10, 0)->primary('tab_avances_pkey');
			$table->string('id_empleado', 12);
			$table->date('fec_avance')->default('2018-11-26');
			$table->string('des_avance', 100);
			$table->decimal('val_avance', 10, 0);
			$table->boolean('ind_descon')->default(1);
			$table->boolean('ind_estado')->default(1);
			$table->string('usr_insert', 20);
			$table->dateTime('fec_insert')->default('2018-11-26 15:19:46.010415');
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
		Schema::drop('tab_avances');
	}

}
