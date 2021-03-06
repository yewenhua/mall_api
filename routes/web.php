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

Auth::routes();

Route::get('home', 'HomeController@index')->name('home');
Route::get('fish', 'HomeController@maoxy');
Route::any('wechat/main', 'WechatController@main');
Route::get('wxpay/product', 'WxpayController@product');
Route::get('wxpay/notify', 'WxpayController@notify');
Route::post('wxpay/notify', 'WxpayController@notify');
Route::post('wxpay/prepay', 'WxpayController@prepay');
Route::post('wxpay/password', 'WxpayController@password');

Route::post('maintenance/bind', 'MaintenanceController@bind');
Route::post('admins/apply', 'AdminController@apply');

Route::get('batch/insert', 'BatchController@insert');
Route::get('batch/menu', 'BatchController@menu');
Route::get('batch/migrate', 'BatchController@migrate');
Route::get('batch/straight', 'BatchController@straight');

Route::get('statistics', 'SettingController@statistic');

