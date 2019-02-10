<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabDevolEncTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_devol_enc', function(Blueprint $table)
		{
			$table->decimal('id_consec', 10, 0)->primary('tab_devol_enc_pkey');
			$table->decimal('id_fac_ped', 10, 0);
			$table->boolean('tip_devol');
			$table->decimal('sal_favor', 10, 0);
			$table->date('fec_devol')->default('2018-11-26');
			$table->string('obs_devol', 200);
			$table->string('usr_insert', 20);
			$table->dateTime('fec_insert')->default('2018-11-26 15:19:46.780055');
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
		Schema::drop('tab_devol_enc');
	}

}
