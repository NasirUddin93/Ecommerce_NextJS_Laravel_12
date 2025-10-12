<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function index(){
        $users = User::all();
        return response()->json([
            'status'=> 200,
            'success'=>'Users found successfully',
            'data'=>$users
        ],200);
    }
}
