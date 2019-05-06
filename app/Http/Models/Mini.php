<?php

namespace App\Http\Models;

use Illuminate\Database\Eloquent\Model;

class Mini extends Model
{
    protected  $table = 'miniuser';
    protected $fillable = ['openid', 'nickname', 'avatarurl', 'gender', 'city', 'province', 'country', 'code', 'parent_key', 'router']; //批量赋值

    /**
     * 一对多关系
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function addresses(){
        return $this->hasMany('App\Http\Models\Address', 'mini_id');
    }

    public function lists()
    {
        return $this->get();
    }

    public function findByOpenid($openid)
    {
        return $this->where('openid', $openid)->first();
    }

    public function findParentByOpenid($openid)
    {
        $res = null;
        $self = $this->where('openid', $openid)->first();
        if($self){
            $parent = $this->where('code', $self['parent_key'])->first();
            if($parent){
                $res = $parent;
            }
        }

        return $res;
    }

    public function findChildrenByCode($code)
    {
        return $this->where('parent_key', $code)->get();
    }
}
