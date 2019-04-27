<?php

namespace App\Http\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;  //添加软删除

class Goods extends Model
{
    use SoftDeletes;
    protected  $table = 'goods';
    protected $fillable = ['category', 'name', 'sale_price', 'market_price', 'discount', 'remain_num', 'sale_num', 'is_release', 'is_recommend', 'is_time_buy', 'time_buy_time', 'weight', 'limit_buy_num', 'send_method', 'sort_id', 'merchant_id', 'is_pintuan', 'pintuan_num', 'pintuan_time', 'is_sku']; //批量赋值
    protected  $dates = ['deleted_at'];  //添加软删除

    /**
     * 一对多关系
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function skus(){
        return $this->hasMany('App\Http\Models\Sku', 'goods_id');
    }

    public function images(){
        return $this->hasMany('App\Http\Models\GoodsImages', 'goods_id');
    }

    public function assignImages($goods_images){
        return $this->images()->save($goods_images);
    }

    public function findByMerchantid($merchant_id)
    {
        return $this->where('merchant_id', $merchant_id)->whereNull('deleted_at')->get();
    }
}
