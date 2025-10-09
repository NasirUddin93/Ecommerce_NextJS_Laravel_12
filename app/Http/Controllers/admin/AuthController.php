<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    public function authenticate(Request $request){
        // Step-1: Validate the incoming request data
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required'
        ]);
        // Step-2: If validation fails, return errors
        if($validator->fails()){
            return response()->json([
                'status' => 400,
                'errors' => $validator->errors()
            ], 400);
        }
        // Step-3: Attempt to authenticate the user
        if(Auth::attempt(['email' => $request->email, 'password' => $request->password])){
            $user = User::find(Auth::id());
            if($user->role == 'admin'){
                $token = $user->createToken('token')->plainTextToken;
                return response()->json([
                    'status' => 200,
                    'token' => $token,
                    'id' => $user->id,
                    'name' => $user->name,
                    'email' => $user->email,
                    'role' => $user->role,
                ], 200);
            }else{
                return response()->json([
                    'status' => 401,
                    'message' => 'You are not authorized to access admin panel'
                ], 401);
            }
        } else {
            return response()->json([
                'status' => 401,
                'message' => 'Email or Password is incorrect'
            ], 401);
        }

    }
}
