<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\OrderItem;
use Illuminate\Http\Request;

class OrderItemController extends Controller
{
    public function index()
    {
        $orderItems = OrderItem::with(['order', 'product', 'variant'])->get();
        return response()->json([
                'status'=>200,
                'success'=>'Item data is found successfully',
                'data'=>$orderItems,
        ]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'order_id' => 'required|exists:orders,id',
            'product_id' => 'required|exists:products,id',
            'variant_id' => 'nullable|exists:product_variants,id',
            'quantity' => 'required|integer|min:1',
            'price_at_purchase' => 'required|numeric',
            'discount_applied' => 'nullable|numeric',
        ]);

        $item = OrderItem::create($validated);

        return response()->json([
            'message' => 'Order item created successfully',
            'data' => $item,
        ], 201);
    }

    public function show($id)
    {
        $item = OrderItem::with(['order', 'product', 'variant'])->findOrFail($id);
        return response()->json($item);
    }

    public function update(Request $request, $id)
    {
        $item = OrderItem::findOrFail($id);

        $validated = $request->validate([
            'quantity' => 'sometimes|integer|min:1',
            'price_at_purchase' => 'sometimes|numeric',
            'discount_applied' => 'sometimes|numeric',
        ]);

        $item->update($validated);

        return response()->json([
            'message' => 'Order item updated successfully',
            'data' => $item,
        ]);
    }

    public function destroy($id)
    {
        $item = OrderItem::findOrFail($id);
        $item->delete(); // Soft delete

        return response()->json(['message' => 'Order item soft-deleted successfully']);
    }

    public function trashed()
    {
        $trashed = OrderItem::onlyTrashed()->get();
        return response()->json($trashed);
    }

    public function restore($id)
    {
        $item = OrderItem::onlyTrashed()->findOrFail($id);
        $item->restore();

        return response()->json(['message' => 'Order item restored successfully']);
    }

    public function forceDelete($id)
    {
        $item = OrderItem::onlyTrashed()->findOrFail($id);
        $item->forceDelete();

        return response()->json(['message' => 'Order item permanently deleted']);
    }
}
