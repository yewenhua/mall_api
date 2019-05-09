<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected  $table = 'orders';
    protected $fillable = [
        'orderid', 'address_id', 'money', 'pay_no', 'pay_time', 'mini_id'
    ];

    /**
     * 一对多关系
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function goods(){
        return $this->hasMany('App\Http\Models\OrderGoods', 'order_id');
    }

    public function findByOrderid($orderid)
    {
        return $this->where('orderid', $orderid)->whereNull('deleted_at')->first();
    }

    public function findByStatus($status)
    {
        return $this->where('status', $status)->whereNull('deleted_at')->get();
    }

    public function chnageStatus($status, $orderid)
    {
        return $this->where('orderid', $orderid)->whereNull('deleted_at')
            ->update([
                "status"=>$status
            ]);
    }

    public function findByDid($did)
    {
        return $this->where('device_id', $did)->whereNull('deleted_at')->get();
    }

    public function findTakeStatus($status)
    {
        return $this->where('cash_status', $status)->whereNull('deleted_at')->get();
    }
}
