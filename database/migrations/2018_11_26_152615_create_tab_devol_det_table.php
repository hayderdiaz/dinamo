<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabDevolDetTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_devol_det', function(Blueprint $table)
		{
			$table->decimal('id_consec', 10, 0);
			$table->decimal('id_insumo', 15, 0);
			$table->decimal('val_kardex', 10, 0);
			$table->decimal('val_cantidad', 5, 0);
			$table->decimal('sal_favor', 10, 0);
			$table->string('usr_insert', 20);
			$table->dateTime('fec_insert')->default('2018-11-26 15:19:46.7208');
			$table->string('usr_update', 20)->nullable();
			$table->dateTime('fec_update')->nullable();
			$table->primary(['id_consec','id_insumo'], 'tab_devol_det_pkey');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('tab_devol_det');
	}

}
