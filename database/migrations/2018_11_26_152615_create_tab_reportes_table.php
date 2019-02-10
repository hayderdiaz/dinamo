<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTabReportesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tab_reportes', function(Blueprint $table)
		{
			$table->decimal('id_reporte', 2, 0)->primary('tab_reportes_pkey');
			$table->string('reporte', 450);
			$table->string('cont_reporte', 350);
			$table->string('des_reporte', 200);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('tab_reportes');
	}

}
