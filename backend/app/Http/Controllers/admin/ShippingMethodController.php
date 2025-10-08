<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\ShippingMethod;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ShippingMethodController extends Controller
{
    
    public function index()
    {
        $shipping_methods = ShippingMethod::all();

        return response()->json([
            'status' => 200,
            'data'   => $shipping_methods,
        ]);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name'             => 'required|string|max:255',
            'description'      => 'nullable|string',
            'fee'              => 'required|numeric|between:0,99999999.99',
            'is_free_shipping' => 'required|boolean',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->errors(),
            ], 422);
        }

        $shipping_method = ShippingMethod::create($validator->validated());

        return response()->json([
            'status'  => 201,
            'message' => 'Shipping method created successfully',
            'data'    => $shipping_method,
        ], 201);
    }

    public function show($id)
    {
        $shipping_method = ShippingMethod::find($id);

        if (!$shipping_method) {
            return response()->json([
                'status'  => 404,
                'message' => 'Shipping method not found',
            ], 404);
        }

        return response()->json([
            'status' => 200,
            'data'   => $shipping_method,
        ]);
    }

    public function update(Request $request, $id)
    {
        $shipping_method = ShippingMethod::find($id);

        if (!$shipping_method) {
            return response()->json([
                'status'  => 404,
                'message' => 'Shipping method not found',
            ], 404);
        }

        $validator = Validator::make($request->all(), [
            'name'             => 'sometimes|required|string|max:255',
            'description'      => 'sometimes|nullable|string',
            'fee'              => 'sometimes|required|numeric|between:0,99999999.99',
            'is_free_shipping' => 'sometimes|required|boolean',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->errors(),
            ], 422);
        }

        $shipping_method->update($validator->validated());

        return response()->json([
            'status'  => 200,
            'message' => 'Shipping method updated successfully',
            'data'    => $shipping_method,
        ]);
    }
}
