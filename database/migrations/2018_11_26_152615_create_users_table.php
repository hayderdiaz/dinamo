<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateUsersTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('users', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->string('id_usuario', 12)->unique();
			$table->decimal('id_perfil', 5, 0);
			$table->string('name');
			$table->string('email')->unique();
			$table->boolean('ind_estado')->default(1);
			$table->dateTime('email_verified_at')->nullable();
			$table->string('password');
			$table->string('slug')->unique();
			$table->string('remember_token', 100)->nullable();
			$table->timestamps();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('users');
	}

}
