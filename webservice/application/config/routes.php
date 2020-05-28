<?php
defined('BASEPATH') OR exit('No direct script access allowed');

$route['default_controller'] = 'ApiLoginController/users';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;

$route['api/login'] = 'ApiLoginController/users';
