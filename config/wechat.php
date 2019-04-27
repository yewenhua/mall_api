<?php

/*
 * wxpay
 */

return [
    'appid' => env('APPID',"wx71cc2de74794ade8"),
    'appsecret' => env('APPSECRET',"58d671c294af16e312132e588563fa4a"),
    'api_domain' => 'http://www.mall.com',
    'wechat_menu' => array(
        'button'=>array(
            array(
                "type"=>"click",
                "name"=>"使用帮助",
                "key"=> "V1004_HELP"
            ),
            array(
                "type"=>"scancode_push",
                "name"=>"扫码充电",
                "key" => "scancode_push"
            ),
            array(
                'name'=>"更多",
                'sub_button'=>array(
                    array(
                        "type"=>"view",
                        "name"=>"代理商登录",
                        "url"=> "http://admin.junbao518.com"
                    ),
                    array(
                        "type"=>"view",
                        "name"=>"商家登录",
                        "url"=> "http://admin.junbao518.com"
                    ),
                    array(
                        "type"=>"view",
                        "name"=>"业务员登录",
                        "url"=> "http://wx.junbao518.com/devices/add"
                    ),
                    array(
                        "type" => "click",
                        "name" => "在线客服",
                        "key" => "V3003_SERVICE"
                    )
                )
            )
        )
    )
];