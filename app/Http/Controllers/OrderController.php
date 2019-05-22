<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use UtilService;
use JWTAuth;
use Illuminate\Support\Facades\Log;
use App\Http\Models\Goods;
use App\Http\Models\Properties;
use App\Http\Models\Sku;
use App\Http\Models\GoodsImages;
use Illuminate\Support\Facades\DB;
use App\Order;

class OrderController extends Controller
{
    const AJAX_SUCCESS = 0;
    const AJAX_FAIL = -1;
    const AJAX_NO_DATA = 10001;
    const AJAX_NO_AUTH = 99999;

    public function index(Request $request){
        $page = $request->input('page');
        $limit = $request->input('num');
        $search = $request->input('search');
        $offset = ($page - 1) * $limit;
        $like = '%'.$search.'%';

        $total = Order::select(['id']);
        $lists = Order::select(['*']);
        if($search){
            $total = $total->where('orderid', 'like', $like);
            $lists= $lists->where('orderid', 'like', $like);
        }

        $total = $total->count();
        $lists= $lists->orderBy('id', 'desc')
            ->offset($offset)
            ->limit($limit)
            ->get();

        if($lists){
            foreach ($lists as $key=>$item){
                $lists[$key]->goods = $item->goods;
                $lists[$key]->idstr = UtilService::aesencrypt($item->id);
                unset($lists[$key]->id);
            }
            $res = array(
                'data'=>$lists,
                'total'=>$total
            );
            return UtilService::format_data(self::AJAX_SUCCESS, '获取成功', $res);
        }
        else{
            return UtilService::format_data(self::AJAX_FAIL, '获取失败', '');
        }
    }

    public function detail(Request $request){
        $idstr = $request->input('idstr');
        $id = UtilService::aesdecrypt($idstr);
        $data = Order::find($id);
        if($data){
            return UtilService::format_data(self::AJAX_SUCCESS, '获取成功', $data);
        }
        else{
            return UtilService::format_data(self::AJAX_FAIL, '获取失败', '');
        }
    }
}
