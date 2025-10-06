<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    // 📌 Get all products
    public function index()
    {
        $products = Product::with(['category', 'brand', 'product_images'])->get();
        return response()->json([
            'status' => 200,
            'message' => 'Products retrieved successfully',
            'data' => $products
        ], 200);
    }

    // 📌 Get single product
    public function show($id)
    {
        $product = Product::with(['category', 'brand', 'product_images'])->find($id);

        if (!$product) {
            return response()->json([
                'message' => 'Product not found',
                'status' => 404
            ], 404);
        }

        return response()->json($product);
    }

    // 📌 Store new product
    public function store(Request $request)
    {
        $validated = $request->validate([
            'category_id' => 'required|exists:categories,id',
            'brand_id'    => 'required|exists:brands,id',
            'name'        => 'required|string|max:255',
            'sku'         => 'required|string|max:100|unique:products,sku',
            'description' => 'nullable|string',
            'base_price'  => 'required|numeric',
            'stock_quantity' => 'required|integer',
            'weight'      => 'nullable|numeric',
            'is_seasonal' => 'boolean',
            'seasonal_start_date' => 'nullable|date',
            'seasonal_end_date'   => 'nullable|date',
            'status'      => 'in:active,inactive',
        ]);

        $product = Product::create($validated);

        return response()->json([
            'message' => 'Product created successfully',
            'status' => 201,
            'data' => $product
        ], 201);
    }

    // 📌 Update product
    public function update(Request $request, $id)
    {
        $product = Product::find($id);

        if (!$product) {
            return response()->json(['message' => 'Product not found'], 404);
        }

        $validated = $request->validate([
            'category_id' => 'sometimes|exists:categories,id',
            'brand_id'    => 'sometimes|exists:brands,id',
            'name'        => 'sometimes|string|max:255',
            'sku'         => 'sometimes|string|max:100|unique:products,sku,' . $product->id,
            'description' => 'nullable|string',
            'base_price'  => 'sometimes|numeric',
            'stock_quantity' => 'sometimes|integer',
            'weight'      => 'nullable|numeric',
            'is_seasonal' => 'boolean',
            'seasonal_start_date' => 'nullable|date',
            'seasonal_end_date'   => 'nullable|date',
            'status'      => 'in:active,inactive',
        ]);

        $product->update($validated);

        return response()->json([
            'message' => 'Product updated successfully',
            'status' => 200,
             'data' => $product
            ]);
    }

    // 📌 Soft delete product
    public function destroy($id)
    {
        $product = Product::find($id);

        if (!$product) {
            return response()->json([
                'message' => 'Product not found',
                'status' => 404
            ], 404);
        }

        $product->delete();

        return response()->json([
            'message' => 'Product deleted successfully',
            'status' => 200
        ]);
    }

    // 📌 Restore soft deleted product
    public function restore($id)
    {
        $product = Product::withTrashed()->find($id);

        if (!$product) {
            return response()->json(['message' => 'Product not found'], 404);
        }

        $product->restore();

        return response()->json(['message' => 'Product restored successfully']);
    }

    // 📌 Permanently delete product
    public function forceDelete($id)
    {
        $product = Product::withTrashed()->find($id);

        if (!$product) {
            return response()->json(['message' => 'Product not found'], 404);
        }

        $product->forceDelete();

        return response()->json(['message' => 'Product permanently deleted']);
    }
}
