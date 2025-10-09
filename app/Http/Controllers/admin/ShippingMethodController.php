<?php

namespace App\Http\Controllers\admin;
// use App\Http\Controllers\admin\ShippingMethodController;
use App\Http\Controllers\Controller;
use App\Models\ShippingMethod;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ShippingMethodController extends Controller
{
    public function index()
    {
        $methods = ShippingMethod::all();
        return response()->json([
            'status' => 200,
            'data' => $methods,
        ],200);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:150',
            'description' => 'nullable|string',
            'fee' => 'required|numeric|min:0',
            'is_free_shipping' => 'required|boolean',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 400,
                'errors' => $validator->errors(),
            ]);
        }

        $method = ShippingMethod::create($validator->validated());

        return response()->json([
            'status' => 200,
            'message' => 'Shipping method created successfully',
            'data' => $method,
        ]);
    }

    public function show($id)
    {
        $method = ShippingMethod::find($id);
        if (!$method) {
            return response()->json([
                'status' => 404,
                'message' => 'Shipping method not found',
            ]);
        }

        return response()->json([
            'status' => 200,
            'data' => $method,
        ]);
    }

    public function update(Request $request, $id)
    {
        $method = ShippingMethod::find($id);
        if (!$method) {
            return response()->json([
                'status' => 404,
                'message' => 'Shipping method not found',
            ]);
        }

        $validator = Validator::make($request->all(), [
            'name' => 'sometimes|required|string|max:150',
            'description' => 'nullable|string',
            'fee' => 'sometimes|required|numeric|min:0',
            'is_free_shipping' => 'sometimes|required|boolean',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 400,
                'errors' => $validator->errors(),
            ]);
        }

        $method->update($validator->validated());

        return response()->json([
            'status' => 200,
            'message' => 'Shipping method updated successfully',
            'data' => $method,
        ]);
    }

    public function destroy($id)
    {
        $method = ShippingMethod::find($id);
        if (!$method) {
            return response()->json([
                'status' => 404,
                'message' => 'Shipping method not found',
            ]);
        }

        $method->delete();

        return response()->json([
            'status' => 200,
            'message' => 'Shipping method deleted successfully',
        ]);
    }
}
