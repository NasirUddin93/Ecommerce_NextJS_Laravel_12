<?php

namespace App\Http\Controllers;

use App\Models\Discount;
use Illuminate\Http\Request;

class DiscountController extends Controller
{
    public function index()
    {
        $discounts = Discount::with(['product', 'category'])->get();

        return response()->json([
            'data' => $discounts,
            'status' => 200,
            'message' => 'Discount data successfully retrieved',
        ], 200);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'product_id' => 'nullable|exists:products,id',
            'category_id' => 'nullable|exists:categories,id',
            'discount_type' => 'required|in:percentage,fixed',
            'discount_value' => 'required|numeric|min:0',
            'valid_from' => 'required|date',
            'valid_to' => 'required|date|after_or_equal:valid_from',
        ]);

        $discount = Discount::create($validated);

        return response()->json([
            'data' => $discount,
            'status' => 201,
            'message' => 'Discount successfully created',
        ], 201);
    }

    public function show($id)
    {
        $discount = Discount::with(['product', 'category'])->findOrFail($id);

        return response()->json([
            'data' => $discount,
            'status' => 200,
            'message' => 'Discount details found',
        ], 200);
    }

    public function update(Request $request, $id)
    {
        $discount = Discount::findOrFail($id);

        $validated = $request->validate([
            'product_id' => 'nullable|exists:products,id',
            'category_id' => 'nullable|exists:categories,id',
            'discount_type' => 'in:percentage,fixed',
            'discount_value' => 'numeric|min:0',
            'valid_from' => 'date',
            'valid_to' => 'date|after_or_equal:valid_from',
        ]);

        $discount->update($validated);

        return response()->json([
            'data' => $discount,
            'status' => 200,
            'message' => 'Discount successfully updated',
        ], 200);
    }

    public function destroy($id)
    {
        $discount = Discount::findOrFail($id);
        $discount->delete();

        return response()->json([
            'status' => 200,
            'message' => 'Discount successfully deleted',
        ], 200);
    }
}
