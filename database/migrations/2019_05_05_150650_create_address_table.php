<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAddressTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('address', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('mini_id');
            $table->string('userName', 30);
            $table->string('postalCode', 30);
            $table->string('provinceName', 30);
            $table->string('cityName', 30);
            $table->string('countyName', 30);
            $table->string('detailInfo', 30);
            $table->string('nationalCode', 30);
            $table->string('telNumber');
            $table->timestamps();
            $table->softDeletes(); //添加软删除
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('address');
    }
}
