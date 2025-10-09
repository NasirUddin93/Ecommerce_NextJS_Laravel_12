<?php

namespace App\Http\Controllers;

use App\Models\CouponUsage;
use Illuminate\Http\Request;

class CouponUsageController extends Controller
{
     // Get all coupon usages
    public function index()
    {
        $couponUsages = CouponUsage::with(['coupon', 'user', 'order'])->get();

        return response()->json([
            'data' => $couponUsages,
            'status' => 200,
            'message' => 'Coupon usage data retrieved successfully'
        ], 200);
    }

    // Store new usage
    public function store(Request $request)
    {
        $validated = $request->validate([
            'coupon_id' => 'required|exists:coupons,id',
            'user_id' => 'required|exists:users,id',
            'order_id' => 'required|exists:orders,id',
            'used_at' => 'nullable|date',
        ]);

        $couponUsage = CouponUsage::create($validated);

        return response()->json([
            'data' => $couponUsage,
            'status' => 201,
            'message' => 'Coupon usage created successfully'
        ], 201);
    }

    // Show single usage
    public function show($id)
    {
        $couponUsage = CouponUsage::with(['coupon', 'user', 'order'])->findOrFail($id);

        return response()->json([
            'data' => $couponUsage,
            'status' => 200,
            'message' => 'Coupon usage found successfully'
        ], 200);
    }

    // Update usage
    public function update(Request $request, $id)
    {
        $couponUsage = CouponUsage::findOrFail($id);

        $validated = $request->validate([
            'coupon_id' => 'sometimes|exists:coupons,id',
            'user_id' => 'sometimes|exists:users,id',
            'order_id' => 'sometimes|exists:orders,id',
            'used_at' => 'nullable|date',
        ]);

        $couponUsage->update($validated);

        return response()->json([
            'data' => $couponUsage,
            'status' => 200,
            'message' => 'Coupon usage updated successfully'
        ], 200);
    }

    // Soft delete usage
    public function destroy($id)
    {
        $couponUsage = CouponUsage::findOrFail($id);
        $couponUsage->delete();

        return response()->json([
            'status' => 200,
            'message' => 'Coupon usage deleted successfully'
        ], 200);
    }
}
