<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabInventarioTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_inventario', function(Blueprint $table)
		{
			$table->decimal('id_insumo', 15, 0)->primary('tab_inventario_pkey');
			$table->decimal('id_marca', 5, 0);
			$table->decimal('id_medida', 5, 0);
			$table->decimal('id_tipo', 5, 0);
			$table->decimal('id_color', 5, 0);
			$table->decimal('id_grafico', 5, 0);
			$table->decimal('id_labrado', 5, 0);
			$table->decimal('val_cantidad', 5, 0);
			$table->string('usr_insert', 20);
			$table->dateTime('fec_insert')->default('2018-11-26 15:19:47.431455');
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
		Schema::drop('tab_inventario');
	}

}
