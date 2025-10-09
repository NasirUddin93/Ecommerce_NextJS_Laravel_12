<?php

namespace App\Http\Controllers;

use App\Models\ShippingMethod;
use Illuminate\Http\Request;

class ShippingMethodController extends Controller
{
    public function index()
    {
        $shippingMethods = ShippingMethod::all();

        return response()->json([
            'data' => $shippingMethods,
            'status' => 200,
            'message' => 'Shipping methods successfully retrieved',
        ], 200);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:150',
            'description' => 'nullable|string',
            'fee' => 'required|numeric|min:0',
            'is_free_shipping' => 'boolean',
        ]);

        $shippingMethod = ShippingMethod::create($validated);

        return response()->json([
            'data' => $shippingMethod,
            'status' => 201,
            'message' => 'Shipping method successfully created',
        ], 201);
    }

    public function show($id)
    {
        $shippingMethod = ShippingMethod::findOrFail($id);

        return response()->json([
            'data' => $shippingMethod,
            'status' => 200,
            'message' => 'Shipping method details found',
        ], 200);
    }

    public function update(Request $request, $id)
    {
        $shippingMethod = ShippingMethod::findOrFail($id);

        $validated = $request->validate([
            'name' => 'string|max:150',
            'description' => 'nullable|string',
            'fee' => 'numeric|min:0',
            'is_free_shipping' => 'boolean',
        ]);

        $shippingMethod->update($validated);

        return response()->json([
            'data' => $shippingMethod,
            'status' => 200,
            'message' => 'Shipping method successfully updated',
        ], 200);
    }

    public function destroy($id)
    {
        $shippingMethod = ShippingMethod::findOrFail($id);
        $shippingMethod->delete();

        return response()->json([
            'status' => 200,
            'message' => 'Shipping method successfully deleted',
        ], 200);
    }
}
