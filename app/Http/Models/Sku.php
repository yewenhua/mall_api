<?php

namespace App\Http\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;  //添加软删除

class Sku extends Model
{

    use SoftDeletes;
    protected  $table = 'sku';
    protected $fillable = ['goods_id', 'first_properties_id', 'second_properties_id', 'num']; //批量赋值
    protected  $dates = ['deleted_at'];  //添加软删除

    /**
     * 属于关系
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function firstProperty(){
        return $this->belongsTo('App\Http\Models\Properties', 'first_properties_id');
    }

    /**
     * 属于关系
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function secondProperty(){
        return $this->belongsTo('App\Http\Models\Properties', 'second_properties_id');
    }

    public function findByGoodsSkuRow($goods_id, $first_properties_id, $second_properties_id)
    {
        return $this->where('goods_id', $goods_id)->where('first_properties_id', $first_properties_id)->where('second_properties_id', $second_properties_id)->whereNull('deleted_at')->first();
    }
}
