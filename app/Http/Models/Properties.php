<?php

namespace App\Http\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;  //添加软删除

class Properties extends Model
{
    use SoftDeletes;
    protected  $table = 'properties';
    protected $fillable = ['title', 'name']; //批量赋值
    protected  $dates = ['deleted_at'];  //添加软删除

    public function findByTitleAndName($title, $name)
    {
        return $this->where('title', $title)->where('name', $name)->whereNull('deleted_at')->first();
    }
}
