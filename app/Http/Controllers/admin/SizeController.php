<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Size;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class SizeController extends Controller
{

    public function index(){
        $sizes = Size::all();
            return response()->json([
            'status' => 200,
            'data' => $sizes,
            ]);
    }
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'status' => 'required|integer|in:0,1',
        ]);
        if ($validator->fails()) {
            return redirect()->json([
                'status' => 400,
                'errors' => $validator->errors(),
            ],400);
        }
        // Create and save the new brand
        $size = new Size();
        $size->name = $request->input('name');
        $size->status = $request->input('status');
        $size->save();

        return response()->json([
            'status' => 200,
            'message' => 'Size created successfully',
        ],200);
    }
    // show brand by id
    public function show($id)
    {
        $size = Size::find($id);
        if (!$size) {
            return response()->json([
                'status' => 404,
                'message' => 'Size not found',
            ]);
        }
        return response()->json([
            'status' => 200,
            'data' => $size,
        ]);
    }

    // update brand by id
    public function update(Request $request, $id)
    {
        $size = Size::find($id);
        if (!$size) {
            return response()->json([
                'status' => 404,
                'message' => 'Size not found',
            ]);
        }
        $validator = Validator::make($request->all(), [
            'name' => 'sometimes|required|string|max:255',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => 400,
                'errors' => $validator->errors(),
            ]);
        }
        // Update the brand
        $size->name = $request->name;
        $size->status = $request->status;
        $size->save();

        return response()->json([
            'status' => 200,
            'message' => 'Size updated successfully',
            'data' => $size
        ]);
    }

}
