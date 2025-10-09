<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\InventoryLog;

class InventoryLogController extends Controller
{
    public function index()
    {
        $logs = InventoryLog::with(['product', 'variant'])->get();
        return response()->json([
            'data' => $logs,
            'status' => 200,
            'message' => 'Inventory logs successfully retrieved'
        ], 200);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'product_id' => 'required|exists:products,id',
            'variant_id' => 'nullable|exists:product_variants,id',
            'change_type' => 'required|in:in,out',
            'quantity_changed' => 'required|integer',
            'note' => 'nullable|string',
        ]);

        $log = InventoryLog::create($validated);

        return response()->json([
            'data' => $log,
            'status' => 201,
            'message' => 'Inventory log created successfully'
        ], 201);
    }

    public function show($id)
    {
        $log = InventoryLog::with(['product', 'variant'])->findOrFail($id);
        return response()->json([
            'data' => $log,
            'status' => 200,
            'message' => 'Inventory log successfully retrieved'
        ], 200);
    }

    public function update(Request $request, $id)
    {
        $log = InventoryLog::findOrFail($id);

        $validated = $request->validate([
            'change_type' => 'sometimes|in:in,out',
            'quantity_changed' => 'sometimes|integer',
            'note' => 'sometimes|string',
        ]);

        $log->update($validated);

        return response()->json([
            'data' => $log,
            'status' => 200,
            'message' => 'Inventory log updated successfully'
        ], 200);
    }

    public function destroy($id)
    {
        $log = InventoryLog::findOrFail($id);
        $log->delete();

        return response()->json([
            'data' => null,
            'status' => 200,
            'message' => 'Inventory log soft-deleted successfully'
        ], 200);
    }

    public function trashed()
    {
        $trashed = InventoryLog::onlyTrashed()->get();
        return response()->json([
            'data' => $trashed,
            'status' => 200,
            'message' => 'Soft-deleted inventory logs retrieved'
        ], 200);
    }

    public function restore($id)
    {
        $log = InventoryLog::onlyTrashed()->findOrFail($id);
        $log->restore();

        return response()->json([
            'data' => $log,
            'status' => 200,
            'message' => 'Inventory log restored successfully'
        ], 200);
    }

    public function forceDelete($id)
    {
        $log = InventoryLog::onlyTrashed()->findOrFail($id);
        $log->forceDelete();

        return response()->json([
            'data' => null,
            'status' => 200,
            'message' => 'Inventory log permanently deleted'
        ], 200);
    }
}
