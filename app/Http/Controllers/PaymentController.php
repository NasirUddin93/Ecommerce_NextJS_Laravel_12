<?php

namespace App\Http\Controllers;

use App\Models\Payment;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
   // Get all payments
    public function index()
    {
        $payments = Payment::with('order')->get();

        return response()->json([
            'data' => $payments,
            'status' => 200,
            'message' => 'Payment data retrieved successfully'
        ], 200);
    }

    // Show a single payment
    public function show($id)
    {
        $payment = Payment::with('order')->findOrFail($id);

        return response()->json([
            'data' => $payment,
            'status' => 200,
            'message' => 'Payment retrieved successfully'
        ], 200);
    }

    // Store new payment
    public function store(Request $request)
    {
        $validated = $request->validate([
            'order_id' => 'required|exists:orders,id',
            'payment_method' => 'required|in:card,mobile_banking,COD',
            'transaction_id' => 'required|string|max:150',
            'amount' => 'required|numeric|min:0',
            'status' => 'required|in:pending,success,failed',
        ]);

        $payment = Payment::create($validated);

        return response()->json([
            'data' => $payment,
            'status' => 201,
            'message' => 'Payment created successfully'
        ], 201);
    }

    // Update existing payment
    public function update(Request $request, $id)
    {
        $payment = Payment::findOrFail($id);

        $validated = $request->validate([
            'payment_method' => 'sometimes|in:card,mobile_banking,COD',
            'transaction_id' => 'sometimes|string|max:150',
            'amount' => 'sometimes|numeric|min:0',
            'status' => 'sometimes|in:pending,success,failed',
        ]);

        $payment->update($validated);

        return response()->json([
            'data' => $payment,
            'status' => 200,
            'message' => 'Payment updated successfully'
        ], 200);
    }

    // Soft delete payment
    public function destroy($id)
    {
        $payment = Payment::findOrFail($id);
        $payment->delete();

        return response()->json([
            'data' => null,
            'status' => 200,
            'message' => 'Payment soft deleted successfully'
        ], 200);
    }
}
