<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Models\Logistics;
use UtilService;

class LogisticsController extends Controller
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

        $total = Logistics::select(['id']);
        $lists = Logistics::select(['*']);
        if($search){
            $total = $total->where('name', 'like', $like);
            $lists= $lists->where('name', 'like', $like);
        }

        $total = $total->count();
        $lists= $lists->orderBy('id', 'desc')
            ->offset($offset)
            ->limit($limit)
            ->get();

        if($lists){
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

    public function store(Request $request){
        $id = $request->input('id');
        $name = $request->input('name');
        $isopen = $request->input('isopen');
        $send_list = $request->input('send_list');
        $this->validate(request(), [
            'name'=>'required',
            'isopen'=>'required',
            'send_list'=>'required'
        ]);

        if($id){
            $obj = Logistics::find($id);
            $obj->name = $name;
            $obj->isopen = $isopen;
            $obj->send_list = $send_list;
            $res = $obj->save();
        }
        else{
            $res = Logistics::create(request(['name', 'isopen', 'send_list']));
        }

        if($res){
            return UtilService::format_data(self::AJAX_SUCCESS, '操作成功', $res);
        }
        else{
            return UtilService::format_data(self::AJAX_FAIL, '操作失败', '');
        }
    }

    public function batchdelete(Request $request){
        $idstring = $request->input('idstring');
        $this->validate(request(), [
            'idstring'=>'required|min:1'
        ]);

        $idarray = explode(',', $idstring);
        $res = Logistics::whereIn('id', $idarray)->delete();;
        if($res){
            return UtilService::format_data(self::AJAX_SUCCESS, '操作成功', $res);
        }
        else{
            return UtilService::format_data(self::AJAX_FAIL, '操作失败', '');
        }
    }

    public function lists(Request $request){
        $lists = Logistics::select(['*'])->orderBy('id', 'desc')->get();

        if($lists){
            return UtilService::format_data(self::AJAX_SUCCESS, '获取成功', $lists);
        }
        else{
            return UtilService::format_data(self::AJAX_FAIL, '获取失败', '');
        }
    }
}
