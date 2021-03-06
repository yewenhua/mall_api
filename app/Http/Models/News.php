<?php

namespace App\Http\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;  //添加软删除

class News extends Model
{
    use SoftDeletes;

    protected  $table = 'news';
    protected $fillable = ['title', 'description', 'content', 'img']; //批量赋值
    protected  $dates = ['deleted_at'];  //添加软删除
}
