<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateGoodsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('goods', function (Blueprint $table) {
            $table->increments('id');
            $table->string('category', 30);
            $table->string('name', 50);
            $table->decimal('sale_price');
            $table->decimal('market_price');
            $table->decimal('discount');
            $table->integer('remain_num')->comment('剩余库存');
            $table->integer('sale_num')->comment('销量');
            $table->integer('is_release')->comment('是否上架');
            $table->integer('is_recommend')->comment('是否推荐');
            $table->integer('is_time_buy')->comment('是否限时购');
            $table->dateTime('time_buy_time')->default(null)->nullable();
            $table->string('weight', 30)->default(null)->nullable();
            $table->integer('limit_buy_num');
            $table->integer('send_method')->default(null)->nullable();
            $table->integer('sort_id');
            $table->integer('merchant_id');
            $table->integer('is_pintuan')->comment('是否拼团');
            $table->integer('pintuan_num')->comment('达到拼团数量');
            $table->dateTime('pintuan_time')->default(null)->nullable();
            $table->integer('is_sku');
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
        Schema::dropIfExists('goods');
    }
}