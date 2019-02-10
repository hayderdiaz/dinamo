<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabParametrosTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_parametros', function(Blueprint $table)
		{
			$table->char('id_consec', 1)->primary('tab_parametros_pkey');
			$table->string('id_empresa', 20);
			$table->decimal('id_ciudad', 5, 0);
			$table->string('nom_empresa', 100);
			$table->string('dir_empresa', 60)->default('N/A');
			$table->string('tel_empresa', 60)->default('N/A');
			$table->string('cor_empresa', 60)->default('N/A');
			$table->string('pag_empresa', 100)->default('N/A');
			$table->string('rep_legal', 100)->default('N/A');
			$table->char('ind_kardex', 1)->default(1);
			$table->smallInteger('dias_apartado')->default(5);
			$table->boolean('ind_regimen')->default(1);
			$table->string('res_dian', 20);
			$table->decimal('num_fac_ini', 7, 0)->default(1);
			$table->decimal('num_fac_act', 7, 0)->default(1);
			$table->decimal('num_fac_fin', 7, 0)->default(1000);
			$table->string('obs_factura', 500);
			$table->string('gar_factura', 500);
			$table->decimal('num_rec_ini', 7, 0)->default(1);
			$table->decimal('num_rec_act', 7, 0)->default(1);
			$table->decimal('num_rec_fin', 7, 0)->default(1000);
			$table->smallInteger('por_siste')->default(3);
			$table->smallInteger('por_des_siste')->default(5);
			$table->smallInteger('dias_siste')->default(10);
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
		Schema::drop('tab_parametros');
	}

}
