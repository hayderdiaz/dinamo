<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabApartadosDetTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_apartados_det', function(Blueprint $table)
		{
			$table->decimal('id_consec', 10, 0);
			$table->decimal('id_insumo', 15, 0);
			$table->string('tip_insumo', 10);
			$table->decimal('val_cantidad', 5, 0);
			$table->decimal('val_cant_act', 5, 0);
			$table->decimal('val_cant_can', 5, 0)->default(0);
			$table->decimal('val_unidad', 10, 0);
			$table->decimal('val_bruto', 10, 0);
			$table->decimal('iva', 2, 0);
			$table->decimal('val_iva', 10, 0);
			$table->decimal('val_neto', 10, 0);
			$table->smallInteger('descuento');
			$table->decimal('v_descuento', 10, 0);
			$table->decimal('val_kardex', 10, 0);
			$table->boolean('ind_insumo');
			$table->string('usr_insert', 20);
			$table->dateTime('fec_insert')->default('2018-11-26 15:19:45.909894');
			$table->string('usr_update', 20)->nullable();
			$table->dateTime('fec_update')->nullable();
			$table->primary(['id_consec','id_insumo'], 'tab_apartados_det_pkey');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('tab_apartados_det');
	}

}
