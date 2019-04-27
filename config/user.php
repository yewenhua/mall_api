<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/9/27
 * Time: 13:21
 */

return [
    'admin_id' => env('ADMIN_ID',"2"),
    'role_operate_id' => env('ROLE_OPERATE_ID',"2"),
    'role_maintenance_id' => env('ROLE_MAINTENANCE_ID',"7"),
    'role_child_id' => env('ROLE_CHILD_ID',"6"),
    'role_agent_id' => env('ROLE_AGENT_ID',"4"),
    'role_straight_id' => env('ROLE_STRAIGHT_ID',"5"),
    'role_operate_name' => env('ROLE_OPERATE_NAME',"运营"),
    'role_maintenance_name' => env('ROLE_MAINTENANCE_NAME',"市场维护"),
    'role_child_name' => env('ROLE_CHILD_NAME',"入住商家分店"),
    'role_agent_name' => env('ROLE_AGENT_NAME',"入住商家"),
    'role_straight_name' => env('ROLE_STRAIGHT_NAME',"直营商家"),
    'role_finance_name' => env('ROLE_FINANCE_NAME',"财务"),
];