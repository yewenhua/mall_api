<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use UtilService;
use App\Http\Models\Maintenance;
use Illuminate\Support\Facades\Log;
use JWTAuth;
use App\User;
use QrCode;

class MaintenanceController extends Controller
{
    const AJAX_SUCCESS = 0;
    const AJAX_FAIL = -1;
    const AJAX_NO_DATA = 10001;
    const AJAX_NO_AUTH = 99999;

    //绑定为市场维护人员
    public function bind(Request $request){
        $id = session('bind_uid');
        $openid = session('openid');

        if($openid && $id) {
            $u = new User();
            $row = $u->getByOpenid($openid);
            if(!$row) {
                $obj = User::find($id);
                if($obj) {
                    $obj->openid = $openid;
                    $res = $obj->save();
                    if ($res) {
                        return UtilService::format_data(self::AJAX_SUCCESS, '操作成功', $obj);
                    } else {
                        return UtilService::format_data(self::AJAX_FAIL, '操作失败', '');
                    }
                }
                else{
                    return UtilService::format_data(self::AJAX_FAIL, '用户不存在', '');
                }
            }
            else{
                return UtilService::format_data(self::AJAX_FAIL, '已绑定', '');
            }
        }
        else{
            return UtilService::format_data(self::AJAX_FAIL, '参数错误', '');
        }
    }

    public function lists(Request $request){
        $userObj = JWTAuth::parseToken()->authenticate();
        $flag = false;
        if($userObj->parent_id == config('user.admin_id') && $userObj->type != 'agent'){
            $flag = true;
        }

        $page = $request->input('page');
        $limit = $request->input('num');
        $search = $request->input('search');
        $offset = ($page - 1) * $limit;
        $like = '%'.$search.'%';

        $total = User::whereNull('deleted_at')
            ->where('name', 'like', $like)
            ->where('type', 'maintenance');

        $lists = User::whereNull('deleted_at')
            ->where('name', 'like', $like)
            ->where('type', 'maintenance');

        if($flag){
            $total = $total->where('level', 2);
            $lists = $lists->where('level', 2);
        }
        else{
            if($userObj->type == 'agent' || $userObj->type == 'straight') {
                $total = $total->where('parent_id', $userObj->id);
                $lists = $lists->where('parent_id', $userObj->id);
            }
            else{
                Log::info($userObj->owner_id);
                $total = $total->where('parent_id', $userObj->owner_id);
                $lists = $lists->where('parent_id', $userObj->owner_id);
            }
        }

        $total = $total->orderBy('id', 'desc')->get();
        $lists = $lists->orderBy('id', 'desc')
            ->offset($offset)
            ->limit($limit)
            ->get();

        if($lists){
            foreach ($lists as $key=>$list){
                $img = 'maintenance_'.$list->id;
                $this->createimg($list->name, $list->id);
                $lists[$key]->qrimg = config('wechat.api_domain') . '/qrcodes/maintenance/'. $img . '.png';
            }

            $res = array(
                'data'=>$lists,
                'total'=>count($total)
            );
            return UtilService::format_data(self::AJAX_SUCCESS, '获取成功', $res);
        }
        else{
            return UtilService::format_data(self::AJAX_FAIL, '获取失败', '');
        }
    }

    private function createimg($name, $id){
        $img = 'maintenance_'.$id;
        if(!file_exists(public_path('qrcodes/maintenance/' . $img . '.png'))) {
            $url = config('wechat.api_domain') . '/devices/maintenance?id=' . $id;
            $path = public_path('qrcodes/maintenance/' . $img . '.png');
            QrCode::encoding('UTF-8')->format('png')->size(120)->margin(2)->generate($url, $path);
            $qrcode_img = imagecreatefrompng($path);

            if (imageistruecolor($qrcode_img)) {
                //将真彩色图像转换为调色板图像
                imagetruecolortopalette($qrcode_img, false, 65535);
            }

            //设定图像的混色模式并启用
            imagealphablending($qrcode_img, true);

            //为一幅图像分配颜色
            $black = imagecolorallocate($qrcode_img, 0, 0, 0);
            $font_file = public_path('qrcodes/wryh.ttf');
            $fontSize = 8;
            $font_str = '市场维护: '.$id;

            //使用 FreeType 2 字体将文本写入图像
            imagefttext($qrcode_img, $fontSize, 0, 23, 115, $black, $font_file, $font_str);

            //建立 PNG 图型
            imagepng($qrcode_img, $path);

            //销毁图像
            imagedestroy($qrcode_img);
        }
    }

    //名下子商家
    public function agents(Request $request){
        $page = $request->input('page');
        $limit = $request->input('num');
        $mid = $request->input('mid');
        $offset = ($page - 1) * $limit;

        $total = User::where('owner_id', $mid)
            ->orderBy('id', 'desc')
            ->get();

        $lists = User::where('owner_id', $mid)
            ->orderBy('id', 'desc')
            ->offset($offset)
            ->limit($limit)
            ->get();

        if($lists){
            $res = array(
                'data'=>$lists,
                'total'=>count($total)
            );
            return UtilService::format_data(self::AJAX_SUCCESS, '获取成功', $res);
        }
        else{
            return UtilService::format_data(self::AJAX_FAIL, '获取失败', '');
        }
    }

    public function batchdelete(Request $request){
        $userObj = JWTAuth::parseToken()->authenticate();
        $idstring = $request->input('idstring');
        $this->validate(request(), [
            'idstring'=>'required|min:1'
        ]);

        $idarray = explode(',', $idstring);
        $res = User::whereIn('id', $idarray)->where('owner_id', $userObj->id)->delete();;
        if($res){
            return UtilService::format_data(self::AJAX_SUCCESS, '操作成功', $res);
        }
        else{
            return UtilService::format_data(self::AJAX_FAIL, '操作失败', '');
        }
    }
}
