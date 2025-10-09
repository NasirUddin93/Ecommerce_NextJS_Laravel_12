<?php

namespace App\Http\Controllers;

use App\Models\OrderShipping;
use Illuminate\Http\Request;

class OrderShippingController extends Controller
{
    public function index()
    {
        $orderShippings = OrderShipping::with(['order', 'shippingMethod'])->get();

        return response()->json([
            'data' => $orderShippings,
            'status' => 200,
            'message' => 'Order shipping data successfully retrieved',
        ], 200);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'order_id' => 'required|exists:orders,id',
            'shipping_method_id' => 'required|exists:shipping_methods,id',
            'address' => 'required|string',
            'tracking_number' => 'nullable|string|max:100',
        ]);

        $orderShipping = OrderShipping::create($validated);

        return response()->json([
            'data' => $orderShipping,
            'status' => 201,
            'message' => 'Order shipping created successfully',
        ], 201);
    }

    public function show($id)
    {
        $orderShipping = OrderShipping::with(['order', 'shippingMethod'])->findOrFail($id);

        return response()->json([
            'data' => $orderShipping,
            'status' => 200,
            'message' => 'Order shipping record found successfully',
        ], 200);
    }

    public function update(Request $request, $id)
    {
        $orderShipping = OrderShipping::findOrFail($id);

        $validated = $request->validate([
            'order_id' => 'sometimes|exists:orders,id',
            'shipping_method_id' => 'sometimes|exists:shipping_methods,id',
            'address' => 'sometimes|string',
            'tracking_number' => 'nullable|string|max:100',
        ]);

        $orderShipping->update($validated);

        return response()->json([
            'data' => $orderShipping,
            'status' => 200,
            'message' => 'Order shipping updated successfully',
        ], 200);
    }

    public function destroy($id)
    {
        $orderShipping = OrderShipping::findOrFail($id);
        $orderShipping->delete();

        return response()->json([
            'status' => 200,
            'message' => 'Order shipping deleted successfully',
        ], 200);
    }
}
