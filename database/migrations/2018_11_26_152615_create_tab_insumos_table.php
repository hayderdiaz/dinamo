<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabInsumosTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_insumos', function(Blueprint $table)
		{
			$table->decimal('id_linea', 5, 0);
			$table->decimal('id_insumo', 15, 0)->primary('tab_insumos_pkey');
			$table->string('ref_producto', 20);
			$table->string('nom_insumo', 100);
			$table->boolean('tip_insumo');
			$table->decimal('val_sistecredito', 10, 0)->default(0);
			$table->decimal('val_cliente_f', 10, 0)->default(0);
			$table->decimal('val_cliente_m', 10, 0)->default(0);
			$table->decimal('val_pag_web', 10, 0)->default(0);
			$table->boolean('ind_iva');
			$table->boolean('tip_precio')->default(1);
			$table->boolean('ind_promocion')->default(0);
			$table->smallInteger('por_ganancia');
			$table->boolean('ind_insumo')->default(1);
			$table->string('img_1', 100)->default('/dinamo/images/img_insumos/default.jpg');
			$table->string('img_2', 100)->default('/dinamo/images/img_insumos/default.jpg');
			$table->string('img_3', 100)->default('/dinamo/images/img_insumos/default.jpg');
			$table->string('img_4', 100)->default('/dinamo/images/img_insumos/default.jpg');
			$table->string('img_5', 100)->default('/dinamo/images/img_insumos/default.jpg');
			$table->integer('val_minimo')->nullable();
			$table->integer('val_reorden')->nullable();
			$table->integer('val_maximo')->nullable();
			$table->string('usr_insert', 20);
			$table->dateTime('fec_insert')->default('2018-11-26 15:19:47.314419');
			$table->string('usr_update', 20)->nullable();
			$table->dateTime('fec_update')->nullable();
			$table->index(['id_linea','id_insumo','nom_insumo','ind_insumo'], 'i_tab_insumos');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('tab_insumos');
	}

}
