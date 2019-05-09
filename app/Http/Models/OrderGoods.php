<?php

namespace App\Http\Models;

use Illuminate\Database\Eloquent\Model;

class OrderGoods extends Model
{
    protected  $table = 'order_goods';
    protected $fillable = ['goods_id', 'num', 'goods_price', 'status', 'order_status', 'goods_img', 'goods_name', 'goods_sku']; //批量赋值

    /**
     * 属于关系
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function order(){
        return $this->belongsTo('App\Order', 'order_id');
    }
}
