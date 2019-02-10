<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabKardexTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_kardex', function(Blueprint $table)
		{
			$table->decimal('id_kardex', 10, 0)->primary('tab_kardex_pkey');
			$table->decimal('id_insumo', 15, 0);
			$table->char('ind_movimiento', 2);
			$table->decimal('val_cant_movim', 5, 0)->nullable();
			$table->decimal('val_cant_actual', 5, 0)->nullable();
			$table->decimal('val_precio_movim', 10, 0)->nullable();
			$table->decimal('val_precio_actual', 10, 0)->nullable();
			$table->decimal('val_total_movim', 10, 0);
			$table->decimal('val_total_actual', 10, 0);
			$table->boolean('ind_saldo');
			$table->string('val_observacion')->nullable();
			$table->date('fec_movim')->default('2018-11-26');
			$table->char('hor_movim', 8)->default('now');
			$table->string('usr_insert', 20);
			$table->dateTime('fec_insert')->default('2018-11-26 15:19:47.481402');
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
		Schema::drop('tab_kardex');
	}

}
