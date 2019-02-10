<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabProveedoresTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_proveedores', function(Blueprint $table)
		{
			$table->string('id_proveedor', 30)->primary('tab_proveedores_pkey');
			$table->string('nom_proveedor', 100);
			$table->decimal('id_ciudad', 5, 0);
			$table->string('dir_proveedor', 50)->default('N/A');
			$table->string('tel_proveedor', 50)->default('N/A');
			$table->string('cor_proveedor', 60)->default('N/A');
			$table->string('rep_legal', 70)->default('N/A');
			$table->decimal('sal_favor', 10, 0)->default(0);
			$table->boolean('ind_estado')->default(1);
			$table->string('usr_insert', 20);
			$table->dateTime('fec_insert')->default('2018-11-26 15:19:48.18457');
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
		Schema::drop('tab_proveedores');
	}

}
