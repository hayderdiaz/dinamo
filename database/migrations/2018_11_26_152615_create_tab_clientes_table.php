<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabClientesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_clientes', function(Blueprint $table)
		{
			$table->string('id_cliente', 30)->primary('tab_clientes_pkey');
			$table->decimal('id_ciudad', 5, 0);
			$table->string('nom_cliente', 100)->index('i_nom_cliente');
			$table->string('dir_cliente', 50)->default('N/A');
			$table->string('tel_cliente', 60)->default('N/A');
			$table->string('cor_cliente', 60)->default('N/A');
			$table->char('tip_cliente', 1);
			$table->decimal('sal_favor', 10, 0)->default(0);
			$table->boolean('fid_cliente')->default(0);
			$table->boolean('ind_estado')->default(1);
			$table->string('usr_insert', 20);
			$table->dateTime('fec_insert')->default('2018-11-26 15:19:46.311341');
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
		Schema::drop('tab_clientes');
	}

}
