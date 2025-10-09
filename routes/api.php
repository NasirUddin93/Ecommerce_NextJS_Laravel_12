<?php

use App\Http\Controllers\admin\AuthController;
use App\Http\Controllers\admin\BrandController;
use App\Http\Controllers\admin\CategoryController;
use App\Http\Controllers\admin\SizeController;
use App\Http\Controllers\admin\ShippingController;
use App\Http\Controllers\admin\ShippingMethodController;
use App\Http\Controllers\admin\ProductController;
use App\Http\Controllers\admin\ProductVariantController;
use App\Http\Controllers\admin\WishlistController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;









// Route::get('/user', function (Request $request) {
//     return $request->user();
// })->middleware('auth:sanctum');

// Admin Authentication Login
Route::post('/admin/login', [AuthController::class, 'authenticate']);

Route::group(['middleware' => ['auth:sanctum']], function () {
    // Admin Brand Routes
    Route::post('/brands/store', [BrandController::class, 'store']);
    Route::get('/brands', [BrandController::class, 'index']);
    Route::get('/brands/{id}', [BrandController::class, 'show']);
    Route::put('/brands/{id}', [BrandController::class, 'update']);

    // Admin Category Routes
    Route::post('/categories/store', [CategoryController::class, 'store']);
    Route::get('/categories', [CategoryController::class, 'index']);
    Route::get('/categories/{id}', [CategoryController::class, 'show']);
    Route::put('/categories/{id}', [CategoryController::class, 'update']);

    // Admin Sizes Routes
    Route::post('/sizes/store', [SizeController::class, 'store']);
    Route::get('/sizes', [SizeController::class, 'index']);
    Route::get('/sizes/{id}', [SizeController::class, 'show']);
    Route::put('/sizes/{id}', [SizeController::class, 'update']);

    // Admin Shipping Routes
    Route::post('/shippings/store', [ShippingController::class, 'store']);
    Route::get('/shippings', [ShippingController::class, 'index']);
    Route::get('/shippings/{id}', [ShippingController::class, 'show']);
    Route::put('/shippings/{id}', [ShippingController::class, 'update']);

    // 

    //Route::group(['middleware' => ['auth:sanctum']], function () {
    // Admin Shipping Method Routes
    Route::post('/shipping-methods/store', [ShippingMethodController::class, 'store']);
    Route::get('/shipping-methods', [ShippingMethodController::class, 'index']);
    Route::get('/shipping-methods/{id}', [ShippingMethodController::class, 'show']);
    Route::put('/shipping-methods/{id}', [ShippingMethodController::class, 'update']);
    Route::delete('/shipping-methods/{id}', [ShippingMethodController::class, 'destroy']);
    


    // Admin Product Routes
    Route::prefix('products')->group(function () {
        Route::get('/', [ProductController::class, 'index']);
        Route::get('/{id}', [ProductController::class, 'show']);
        Route::post('/', [ProductController::class, 'store']);
        Route::put('/{id}', [ProductController::class, 'update']);
        Route::delete('/{id}', [ProductController::class, 'destroy']);
        Route::post('/restore/{id}', [ProductController::class, 'restore']);
        Route::delete('/force-delete/{id}', [ProductController::class, 'forceDelete']);
    });
    //Product variants
    // Route::prefix('admin')->group(function () {
        Route::get('/product-variants', [ProductVariantController::class, 'index']);
        Route::post('/product-variants', [ProductVariantController::class, 'store']);
        Route::get('/product-variants/{id}', [ProductVariantController::class, 'show']);
        Route::put('/product-variants/{id}', [ProductVariantController::class, 'update']);
        Route::delete('/product-variants/{id}', [ProductVariantController::class, 'destroy']);
    // });

    // Route::prefix('admin')->group(function () {
        Route::get('/wishlists', [WishlistController::class, 'index']);
        Route::post('/wishlists', [WishlistController::class, 'store']);
        Route::get('/wishlists/{id}', [WishlistController::class, 'show']);
        Route::delete('/wishlists/{id}', [WishlistController::class, 'destroy']);
    // });

    // Admin Order Routes
    Route::prefix('orders')->group(function () {
        Route::get('/', [App\Http\Controllers\Admin\OrderController::class, 'index']);
        Route::get('/{id}', [App\Http\Controllers\Admin\OrderController::class, 'show']);
        Route::post('/', [App\Http\Controllers\Admin\OrderController::class, 'store']);
        Route::put('/{id}', [App\Http\Controllers\Admin\OrderController::class, 'update']);
        Route::delete('/{id}', [App\Http\Controllers\Admin\OrderController::class, 'destroy']);
        Route::post('/restore/{id}', [App\Http\Controllers\Admin\OrderController::class, 'restore']);
        Route::delete('/force-delete/{id}', [App\Http\Controllers\Admin\OrderController::class, 'forceDelete']);
    });




});












