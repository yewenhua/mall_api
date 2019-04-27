<?php

namespace App\Http\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;  //添加软删除

class GoodsImages extends Model
{
    use SoftDeletes;
    protected  $table = 'goods_images';
    protected $fillable = ['goods_id', 'type', 'url']; //批量赋值
    protected  $dates = ['deleted_at'];  //添加软删除

    public function findByGoodsImageRow($goods_id, $type, $url)
    {
        return $this->where('goods_id', $goods_id)->where('type', $type)->where('url', $url)->whereNull('deleted_at')->first();
    }
}
