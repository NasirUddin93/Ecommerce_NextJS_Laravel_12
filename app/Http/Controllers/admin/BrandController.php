<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class BrandController extends Controller
{

    public function index(){
        $brands = Brand::all();
        return response()->json([
            'status' => 200,
            'data' => $brands,
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
        $brand = new Brand();
        $brand->name = $request->input('name');
        $brand->status = $request->input('status');
        $brand->save();

        return response()->json([
            'status' => 200,
            'message' => 'Brand created successfully',
            'data' => $brand,
        ],200);
    }
    // show brand by id
    public function show($id)
    {
        $brand = Brand::find($id);
        if (!$brand) {
            return response()->json([
                'status' => 404,
                'message' => 'Brand not found',
            ]);
        }
        return response()->json([
            'status' => 200,
            'data' => $brand,
        ]);
    }

    // update brand by id
    public function update(Request $request, $id)
    {
        $brand = Brand::find($id);
        if (!$brand) {
            return response()->json([
                'status' => 404,
                'message' => 'Brand not found',
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
        $brand->name = $request->name;
        $brand->status = $request->status;
        $brand->save();

        return response()->json([
            'status' => 200,
            'message' => 'Brand updated successfully',
            'data' => $brand
        ]);
    }

}
