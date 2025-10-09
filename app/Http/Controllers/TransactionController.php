<?php

namespace App\Http\Controllers;

use App\Models\Transaction;
use Illuminate\Http\Request;

class TransactionController extends Controller
{
   // List all transactions
    public function index()
    {
        $transactions = Transaction::with(['user', 'order'])->get();

        return response()->json([
            'data' => $transactions,
            'status' => 200,
            'message' => 'Transaction data retrieved successfully'
        ], 200);
    }

    // Show single transaction
    public function show($id)
    {
        $transaction = Transaction::with(['user', 'order'])->findOrFail($id);

        return response()->json([
            'data' => $transaction,
            'status' => 200,
            'message' => 'Transaction retrieved successfully'
        ], 200);
    }

    // Create a transaction
    public function store(Request $request)
    {
        $validated = $request->validate([
            'user_id' => 'required|exists:users,id',
            'order_id' => 'nullable|exists:orders,id',
            'transaction_type' => 'required|in:debit,credit,refund,chargeback',
            'method' => 'required|in:card,mobile_banking,COD,wallet',
            'transaction_reference' => 'required|string|max:150',
            'amount' => 'required|numeric',
            'currency' => 'required|string|max:10',
            'status' => 'required|in:pending,success,failed,refunded',
            'remarks' => 'nullable|string',
            'processed_at' => 'required|date',
        ]);

        $transaction = Transaction::create($validated);

        return response()->json([
            'data' => $transaction,
            'status' => 201,
            'message' => 'Transaction created successfully'
        ], 201);
    }

    // Update a transaction
    public function update(Request $request, $id)
    {
        $transaction = Transaction::findOrFail($id);

        $validated = $request->validate([
            'transaction_type' => 'sometimes|in:debit,credit,refund,chargeback',
            'method' => 'sometimes|in:card,mobile_banking,COD,wallet',
            'transaction_reference' => 'sometimes|string|max:150',
            'amount' => 'sometimes|numeric',
            'currency' => 'sometimes|string|max:10',
            'status' => 'sometimes|in:pending,success,failed,refunded',
            'remarks' => 'nullable|string',
            'processed_at' => 'sometimes|date',
        ]);

        $transaction->update($validated);

        return response()->json([
            'data' => $transaction,
            'status' => 200,
            'message' => 'Transaction updated successfully'
        ], 200);
    }

    // Soft delete a transaction
    public function destroy($id)
    {
        $transaction = Transaction::findOrFail($id);
        $transaction->delete();

        return response()->json([
            'data' => null,
            'status' => 200,
            'message' => 'Transaction soft deleted successfully'
        ], 200);
    }
}
