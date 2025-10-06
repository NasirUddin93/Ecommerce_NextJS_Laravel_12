<?php

use App\Http\Controllers\admin\AuthController;
use App\Http\Controllers\admin\BrandController;
use App\Http\Controllers\admin\CategoryController;
use App\Http\Controllers\admin\SizeController;
// use App\Http\Controllers\admin\ShippingController;
use App\Http\Controllers\admin\ShippingController;
use App\Http\Controllers\admin\ProductController;
use App\Http\Controllers\admin\ProductImageController;
use App\Http\Controllers\admin\CouponController;
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
    // Admin Product Image Routes


    Route::prefix('product-images')->group(function () {
        Route::get('/', [ProductImageController::class, 'index']);
        Route::post('/', [ProductImageController::class, 'store']);
        Route::get('/{id}', [ProductImageController::class, 'show']);
        Route::put('/{id}', [ProductImageController::class, 'update']);
        Route::delete('/{id}', [ProductImageController::class, 'destroy']);
        Route::post('/restore/{id}', [ProductImageController::class, 'restore']);
    });

    // Admin Shipping Routes

    Route::prefix('shippings')->group(function () {
    Route::get('/', [ShippingController::class, 'index']);
    Route::post('/', [ShippingController::class, 'store']);
    Route::get('/{id}', [ShippingController::class, 'show']);
    Route::put('/{id}', [ShippingController::class, 'update']);
});

    // Admin Coupon Routes
    Route::prefix('coupons')->group(function () {
        Route::get('/', [CouponController::class, 'index']);
        Route::post('/', [CouponController::class, 'store']);
        Route::get('/{id}', [CouponController::class, 'show']);
        Route::put('/{id}', [CouponController::class, 'update']);
    }); 





});












