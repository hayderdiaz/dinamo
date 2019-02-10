<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabBonEncTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_bon_enc', function(Blueprint $table)
		{
			$table->decimal('id_bonif', 10, 0)->primary('tab_bon_enc_pkey');
			$table->decimal('val_meta_pro', 10, 0);
			$table->decimal('bon_meta_pro', 7, 0);
			$table->boolean('ind_meta_pro');
			$table->decimal('val_meta_ser', 10, 0);
			$table->decimal('bon_meta_ser', 7, 0);
			$table->boolean('ind_meta_ser');
			$table->string('mes_meta', 10);
			$table->char('ano_meta', 4);
			$table->string('usr_insert', 20);
			$table->dateTime('fec_insert')->default('2018-11-26 15:19:46.110877');
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
		Schema::drop('tab_bon_enc');
	}

}
