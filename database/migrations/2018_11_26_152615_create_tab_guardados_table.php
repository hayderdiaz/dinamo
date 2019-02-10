<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabGuardadosTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_guardados', function(Blueprint $table)
		{
			$table->string('id_cliente', 30);
			$table->decimal('id_insumo', 15, 0);
			$table->decimal('val_cantidad', 5, 0);
			$table->decimal('val_unidad', 10, 0);
			$table->string('usr_insert', 20);
			$table->dateTime('fec_insert')->default('2018-11-26 15:19:47.138791');
			$table->string('usr_update', 20)->nullable();
			$table->dateTime('fec_update')->nullable();
			$table->primary(['id_cliente','id_insumo'], 'tab_guardados_pkey');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('tab_guardados');
	}

}
