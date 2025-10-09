<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Wishlist;

class WishlistController extends Controller
{
    /**
     * Display a listing of all wishlists.
     */
    public function index()
    {
        $wishlists = Wishlist::with(['user', 'product'])->get();
        return response()->json([
            'data'=>$wishlists,
            'status'=>200,
            'success'=>'data is found successfully',
        ], 200);
    }

    /**
     * Store a new wishlist record.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'user_id' => 'required|exists:users,id',
            'product_id' => 'required|exists:products,id',
        ]);

        $wishlist = Wishlist::create($validated);

        return response()->json([
            'message' => 'Wishlist item added successfully.',
            'data' => $wishlist,
        ], 201);
    }

    /**
     * Show a specific wishlist record.
     */
    public function show($id)
    {
        $wishlist = Wishlist::with(['user', 'product'])->findOrFail($id);
        return response()->json($wishlist, 200);
    }

    /**
     * Delete a wishlist record (soft delete).
     */
    public function destroy($id)
    {
        $wishlist = Wishlist::findOrFail($id);
        $wishlist->delete();

        return response()->json(['message' => 'Wishlist item removed successfully.'], 200);
    }
}
