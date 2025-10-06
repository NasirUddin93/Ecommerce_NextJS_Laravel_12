<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ProductImage;
use Illuminate\Support\Facades\Validator;


class ProductImageController extends Controller
{
     /**
     * Display a listing of product images.
     */
    public function index()
    {
        return response()->json(ProductImage::with('product')->get(), 200);
    }

    /**
     * Store a newly created product image.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'product_id' => 'required|exists:products,id',
            'image_url'  => 'required|string|max:255',
            'is_primary' => 'boolean',
        ]);

        $image = ProductImage::create($validated);

        return response()->json($image, 201);
    }

    /**
     * Display the specified product image.
     */
    public function show($id)
    {
        $image = ProductImage::with('product')->findOrFail($id);

        return response()->json($image, 200);
    }

    /**
     * Update the specified product image.
     */
    public function update(Request $request, $id)
    {
        $image = ProductImage::findOrFail($id);

        $validated = $request->validate([
            'image_url'  => 'sometimes|string|max:255',
            'is_primary' => 'sometimes|boolean',
        ]);

        $image->update($validated);

        return response()->json($image, 200);
    }

    /**
     * Soft delete the specified product image.
     */
    public function destroy($id)
    {
        $image = ProductImage::findOrFail($id);
        $image->delete();

        return response()->json(['message' => 'Product image deleted successfully'], 200);
    }

    /**
     * Restore a soft deleted product image.
     */
    public function restore($id)
    {
        $image = ProductImage::withTrashed()->findOrFail($id);

        if ($image->trashed()) {
            $image->restore();
            return response()->json(['message' => 'Product image restored successfully'], 200);
        }

        return response()->json(['message' => 'Product image is not deleted'], 400);
    }
}
