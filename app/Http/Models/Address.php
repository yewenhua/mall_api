<?php

namespace App\Http\Models;

use Illuminate\Database\Eloquent\Model;

class Address extends Model
{
    protected  $table = 'address';
    protected $fillable = ['mini_id', 'userName', 'postalCode', 'provinceName', 'cityName', 'countyName', 'detailInfo', 'nationalCode', 'telNumber']; //批量赋值

    /**
     * 属于关系
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function mini(){
        return $this->belongsTo('App\Http\Models\Mini', 'mini_id');
    }
}
