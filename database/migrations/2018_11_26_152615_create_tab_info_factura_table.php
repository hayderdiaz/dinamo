<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabInfoFacturaTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_info_factura', function(Blueprint $table)
		{
			$table->decimal('id_c_factura', 10, 0)->primary('tab_info_factura_pkey');
			$table->decimal('pago', 10, 0);
			$table->decimal('saldo', 10, 0);
			$table->decimal('cambio', 10, 0);
			$table->smallInteger('por_siste')->nullable();
			$table->decimal('vpor_siste', 10, 0)->nullable();
			$table->string('nom_cliente', 100);
			$table->string('ciu_cliente', 50);
			$table->string('dir_cliente', 50);
			$table->string('tel_cliente', 60);
			$table->string('cor_cliente', 60);
			$table->string('res_dian', 20);
			$table->boolean('ind_regimen');
			$table->string('nit_empresa', 20);
			$table->string('nom_ciudad', 50);
			$table->string('nom_empresa', 100);
			$table->string('dir_empresa', 60);
			$table->string('tel_empresa', 60);
			$table->string('cor_empresa', 60);
			$table->string('pag_empresa', 100);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('tab_info_factura');
	}

}
