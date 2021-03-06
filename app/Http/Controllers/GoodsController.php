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

class GoodsController extends Controller
{
    const AJAX_SUCCESS = 0;
    const AJAX_FAIL = -1;
    const AJAX_NO_DATA = 10001;
    const AJAX_NO_AUTH = 99999;

    public function index(Request $request){
        $page = $request->input('page');
        $limit = $request->input('num');
        $category = $request->input('category');
        $search = $request->input('search');
        $offset = ($page - 1) * $limit;
        $like = '%'.$search.'%';

        $total = Goods::select(['id']);
        $lists = Goods::select(['*']);
        if($search){
            $total = $total->where('name', 'like', $like);
            $lists= $lists->where('name', 'like', $like);
        }

        if($category){
            $category_like = $category. '%';
            $total = $total->where('category', 'like', $category_like);
            $lists= $lists->where('category', 'like', $category_like);
        }

        $total = $total->count();
        $lists= $lists->orderBy('id', 'desc')
            ->offset($offset)
            ->limit($limit)
            ->get();

        if($lists){
            foreach ($lists as $key=>$item){
                $item->images;
                if($item->is_sku) {
                    $skus = $item->skus;
                    foreach ($skus as $sku){
                        $sku->firstProperty;
                        if($sku->second_properties_id){
                            $sku->secondProperty;
                        }
                    }
                }
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

    public function singlefile(Request $request)
    {
        $file = $request->file('file');
        $name = 'goods/'.date('Ymd');
        $path = $file->store($name,'uploads');
        $path = '/uploads/'.$path;

        $bool = true;
        if($bool) {
            return UtilService::format_data(self::AJAX_SUCCESS, '保存成功', [
                "path" => $path
            ]);
        }
        else{
            return UtilService::format_data(self::AJAX_FAIL, '保存失败', []);
        }
    }

    public function store(Request $request){
        $userObj = JWTAuth::parseToken()->authenticate();
        if($userObj) {
            $id = $request->input('id');
            $name = $request->input('name');
            $is_release = $request->input('is_release');
            $sku = json_decode($request->input('sku'), true);
            $properties = json_decode($request->input('properties'), true);
            $category = $request->input('category');
            $send_method = $request->input('send_method');
            $sale_price = $request->input('sale_price');
            $remain_num = $request->input('remain_num');
            $isSku = $request->input('isSku');
            $images = $request->input('images');
            $detailImages = $request->input('detailImages');
            $this->validate(request(), [
                'name' => 'required',
                'sku' => 'required',
                'properties' => 'required',
                'send_method' => 'required',
                'images' => 'required',
                'detailImages' => 'required'
            ]);

            DB::beginTransaction();
            try {
                if($isSku){
                    $num = 0;
                    foreach ($sku as $item){
                        $num = $num + $item['num'];
                    }
                    $remain_num = $num;
                }

                if ($id) {
                    $id = UtilService::aesdecrypt($id);
                    $goodObj = Goods::find($id);
                    $goodObj->name = $name;
                    $goodObj->is_release = $is_release ? 1 : 0;
                    $goodObj->category = $category;
                    $goodObj->sale_price = $sale_price;
                    $goodObj->send_method = $send_method;
                    $goodObj->remain_num = $remain_num;
                    $goodObj->is_sku = $isSku ? 1 : 0;
                    $goodObj->save();
                }
                else {
                    $params = request(['name', 'is_release', 'send_method']);
                    $params['category'] = $category;
                    $params['sale_price'] = $sale_price;
                    $params['market_price'] = '80.8';
                    $params['discount'] = '9.5';
                    $params['remain_num'] = $remain_num;
                    $params['sale_num'] = 50;
                    $params['is_release'] = $is_release;
                    $params['is_recommend'] = 1;
                    $params['limit_buy_num'] = 10;
                    $params['sort_id'] = 10;
                    $params['merchant_id'] = $userObj->id;
                    $params['is_pintuan'] = 0;
                    $params['pintuan_num'] = 2;
                    $params['is_sku'] = $isSku;
                    $params['is_time_buy'] = 0;
                    $goodObj = Goods::create($params); //save 和 create 的不同之处在于 save 接收整个 Eloquent 模型实例而 create 接收原生 PHP 数组
                }

                //保存商品属性
                foreach ($properties as $item){
                    foreach ($item['list'] as $pro){
                        $proObj = new Properties();
                        $row = $proObj->findByTitleAndName($item['title'], $pro['name']);
                        if(!$row){
                            //新增商品属性
                            $proObj->title = $item['title'];
                            $proObj->name = $pro['name'];
                            $proObj->save();
                        }
                    }
                }

                //保存sku
                $now_skus = array();
                foreach ($sku as $item){
                    $skuObj = new Sku();
                    $proObj = new Properties();
                    $pro = $proObj->findByTitleAndName($item['first_properties_title'], $item['first_properties']);

                    $first_properties_id = $pro ? $pro->id : '';
                    $second_properties_id = '';
                    $flag = false;
                    if($item['second_properties_title'] && $item['second_properties']){
                        $flag = true;
                        $proObj = new Properties();
                        $pro = $proObj->findByTitleAndName($item['second_properties_title'], $item['second_properties']);
                        $second_properties_id = $pro ? $pro->id : '';
                    }
                    $row = $skuObj->findByGoodsSkuRow($goodObj->id, $first_properties_id, $second_properties_id);
                    if($row){
                        //已经存在，更新库存
                        $row->num = $item['num'];
                        $row->save();
                        $now_skus[] = $row;
                    }
                    else{
                        //还没有，新增
                        $skuObj->num = $item['num'];
                        $skuObj->first_properties_id = $first_properties_id;
                        if($flag){
                            $skuObj->second_properties_id = $second_properties_id;
                        }

                        $skuObj->goods_id = $goodObj->id;
                        $skuObj->save();
                        $now_skus[] = $skuObj;
                    }
                }

                //保存商品主图图片
                $mainArr = explode(',', $images);
                foreach ($mainArr as $item) {
                    $imgObj = new GoodsImages();
                    $row = $imgObj->findByGoodsImageRow($goodObj->id, 'main', $item);
                    if(!$row) {
                        $imgObj->type = 'main';
                        $imgObj->url = $item;
                        $goodObj->assignImages($imgObj);
                    }
                }

                //保存商品详情图图片
                $detailArr = explode(',', $detailImages);
                foreach ($detailArr as $item) {
                    $imgObj = new GoodsImages();
                    $row = $imgObj->findByGoodsImageRow($goodObj->id, 'detail', $item);
                    if(!$row) {
                        $imgObj->type = 'detail';
                        $imgObj->url = $item;
                        $goodObj->assignImages($imgObj);
                    }
                }

                if ($id){
                    //修改商品信息时，删除要删除的sku和图片
                    $all_images = $goodObj->images;
                    foreach ($all_images as $image) {
                        if(!in_array($image->url, array_merge($mainArr, $detailArr))){
                            $image->delete();
                        }
                    }

                    $all_skus = $goodObj->skus;
                    foreach ($all_skus as $sku) {
                        $flag = false;
                        foreach ($now_skus as $now){
                            if($now->id == $sku->id){
                                $flag = true;
                                break;
                            }
                        }

                        if(!$flag){
                            //内循环不存在的删除
                            $sku->delete();
                        }
                    }
                }

                DB::commit();
                return UtilService::format_data(self::AJAX_SUCCESS, '操作成功', '');
            } catch (QueryException $ex) {
                DB::rollback();
                return UtilService::format_data(self::AJAX_FAIL, '操作失败', '');
            }
        }
        else{
            return UtilService::format_data(self::AJAX_FAIL, '没有权限', '');
        }
    }

    public function deleteimg(Request $request){
        $goodsId = $request->input('goodsId');
        $imageName = $request->input('imageName');
        $imageType = $request->input('imageType');
        if($goodsId) {
            return UtilService::format_data(self::AJAX_SUCCESS, '操作成功', null);

            $good = Goods::find($goodsId);
            //$res = $good->delete();
            if ($good && $res) {
                return UtilService::format_data(self::AJAX_SUCCESS, '操作成功', $res);
            } else {
                return UtilService::format_data(self::AJAX_FAIL, '操作失败', '');
            }
        }
        else{
            return UtilService::format_data(self::AJAX_SUCCESS, '操作成功', null);
        }
    }
}
