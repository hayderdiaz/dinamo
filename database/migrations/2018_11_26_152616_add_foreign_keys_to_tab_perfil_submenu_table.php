<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToTabPerfilSubmenuTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('tab_perfil_submenu', function(Blueprint $table)
		{
			$table->foreign('id_perfil', 'tab_perfil_submenu_id_perfil_fkey')->references('id_perfil')->on('tab_perfiles')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('id_menu', 'tab_perfil_submenu_id_menu_fkey')->references('id_menu')->on('tab_menu')->onUpdate('RESTRICT')->onDelete('RESTRICT');
			$table->foreign('id_submenu', 'tab_perfil_submenu_id_submenu_fkey')->references('id_submenu')->on('tab_submenu')->onUpdate('RESTRICT')->onDelete('RESTRICT');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('tab_perfil_submenu', function(Blueprint $table)
		{
			$table->dropForeign('tab_perfil_submenu_id_perfil_fkey');
			$table->dropForeign('tab_perfil_submenu_id_menu_fkey');
			$table->dropForeign('tab_perfil_submenu_id_submenu_fkey');
		});
	}

}
