<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\User;
use Illuminate\Support\Facades\Validator;

class OrderController extends Controller
{
    /**
     * 🧾 Display all orders
     */
    public function index()
    {
        $orders = Order::with('user')->latest()->get();

        return response()->json([
            'success' => true,
            'status' => 200,
            'data' => $orders
        ], 200);
    }

    /**
     * 🆕 Store a new order
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|exists:users,id',
            'total_amount' => 'required|numeric|min:0',
            'discount_amount' => 'nullable|numeric|min:0',
            'shipping_fee' => 'nullable|numeric|min:0',
            'final_amount' => 'required|numeric|min:0',
            'status' => 'required|in:pending,paid,shipped,delivered,cancelled',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'errors' => $validator->errors(),
            ], 422);
        }

        $order = Order::create($validator->validated());

        return response()->json([
            'success' => true,
            'message' => 'Order created successfully',
            'data' => $order
        ], 201);
    }

    /**
     * 📦 Show a single order
     */
    public function show($id)
    {
        $order = Order::with('user')->find($id);

        if (!$order) {
            return response()->json([
                'success' => false,
                'message' => 'Order not found',
            ], 404);
        }

        return response()->json([
            'success' => true,
            'data' => $order
        ], 200);
    }

    /**
     * ✏️ Update order
     */
    public function update(Request $request, $id)
    {
        $order = Order::find($id);

        if (!$order) {
            return response()->json([
                'success' => false,
                'message' => 'Order not found',
            ], 404);
        }

        $validator = Validator::make($request->all(), [
            'user_id' => 'sometimes|exists:users,id',
            'total_amount' => 'sometimes|numeric|min:0',
            'discount_amount' => 'sometimes|numeric|min:0',
            'shipping_fee' => 'sometimes|numeric|min:0',
            'final_amount' => 'sometimes|numeric|min:0',
            'status' => 'sometimes|in:pending,paid,shipped,delivered,cancelled',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'errors' => $validator->errors(),
            ], 422);
        }

        $order->update($validator->validated());

        return response()->json([
            'success' => true,
            'message' => 'Order updated successfully',
            'data' => $order
        ], 200);
    }

    /**
     * 🗑️ Soft Delete order
     */
    public function destroy($id)
    {
        $order = Order::find($id);

        if (!$order) {
            return response()->json([
                'success' => false,
                'message' => 'Order not found',
            ], 404);
        }

        $order->delete();

        return response()->json([
            'success' => true,
            'message' => 'Order deleted successfully (soft deleted)',
        ], 200);
    }

    /**
     * 🔁 Restore a soft-deleted order
     */
    public function restore($id)
    {
        $order = Order::withTrashed()->find($id);

        if (!$order) {
            return response()->json([
                'success' => false,
                'message' => 'Order not found',
            ], 404);
        }

        $order->restore();

        return response()->json([
            'success' => true,
            'message' => 'Order restored successfully',
            'data' => $order
        ], 200);
    }

    /**
     * 🚮 Permanently delete a soft-deleted order
     */
    public function forceDelete($id)
    {
        $order = Order::withTrashed()->find($id);

        if (!$order) {
            return response()->json([
                'success' => false,
                'message' => 'Order not found',
            ], 404);
        }

        $order->forceDelete();

        return response()->json([
            'success' => true,
            'message' => 'Order permanently deleted',
        ], 200);
    }
}
