<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

//Auth::routes();

// Authentication Routes...
Route::get('login', 'Auth\LoginController@showLoginForm')->name('login');
Route::post('login', 'Auth\LoginController@login');
Route::post('logout', 'Auth\LoginController@logout')->name('logout');
// Registration Routes... 
Route::get('register', 'Auth\RegisterController@showRegistrationForm')->name('register');
Route::post('register', 'Auth\RegisterController@register');

//Home
Route::get('/home', 'HomeController@index')->name('home');
//Profile
Route::resource('profile', 'Profile\ProfileController');
//Configuración del sistema
Route::resource('configuration', 'Profile\ProfileController');
//Route::get('update', 'Profile\ProfileController@edit');
//Route::resource('submenu1', 'Profile\ProfileController');
//Route::resource('submenu2', 'Profile\ProfileController');

