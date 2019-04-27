<?php

namespace App\Http\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;  //添加软删除

class Logistics extends Model
{
    use SoftDeletes;
    protected  $table = 'logistics';
    protected $fillable = ['name', 'send_list', 'isopen']; //批量赋值
    protected  $dates = ['deleted_at'];  //添加软删除
}
