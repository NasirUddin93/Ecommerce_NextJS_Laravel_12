<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Review;

class ReviewController extends Controller
{
    public function index()
    {
        $reviews = Review::with(['user', 'product'])->get();
        return response()->json([
            'data' => $reviews,
            'status' => 200,
            'message' => 'All reviews data is successfully found'
        ], 200);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'user_id' => 'required|exists:users,id',
            'product_id' => 'required|exists:products,id',
            'rating' => 'required|integer|min:1|max:5',
            'comment' => 'nullable|string',
        ]);

        $review = Review::create($validated);

        return response()->json([
            'data' => $review,
            'status' => 201,
            'message' => 'Review has been created successfully'
        ], 201);
    }

    public function show($id)
    {
        $review = Review::with(['user', 'product'])->findOrFail($id);
        return response()->json([
            'data' => $review,
            'status' => 200,
            'message' => 'Review data successfully found'
        ], 200);
    }

    public function update(Request $request, $id)
    {
        $review = Review::findOrFail($id);

        $validated = $request->validate([
            'rating' => 'sometimes|integer|min:1|max:5',
            'comment' => 'sometimes|string',
        ]);

        $review->update($validated);

        return response()->json([
            'data' => $review,
            'status' => 200,
            'message' => 'Review has been updated successfully'
        ], 200);
    }

    public function destroy($id)
    {
        $review = Review::findOrFail($id);
        $review->delete();

        return response()->json([
            'data' => null,
            'status' => 200,
            'message' => 'Review has been soft-deleted successfully'
        ], 200);
    }

    public function trashed()
    {
        $trashed = Review::onlyTrashed()->get();
        return response()->json([
            'data' => $trashed,
            'status' => 200,
            'message' => 'Soft-deleted reviews data successfully found'
        ], 200);
    }

    public function restore($id)
    {
        $review = Review::onlyTrashed()->findOrFail($id);
        $review->restore();

        return response()->json([
            'data' => $review,
            'status' => 200,
            'message' => 'Review has been restored successfully'
        ], 200);
    }

    public function forceDelete($id)
    {
        $review = Review::onlyTrashed()->findOrFail($id);
        $review->forceDelete();

        return response()->json([
            'data' => null,
            'status' => 200,
            'message' => 'Review has been permanently deleted'
        ], 200);
    }
}
