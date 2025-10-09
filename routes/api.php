<?php

use App\Http\Controllers\admin\AuthController;
use App\Http\Controllers\admin\BrandController;
use App\Http\Controllers\admin\CategoryController;
use App\Http\Controllers\admin\CouponController;
use App\Http\Controllers\admin\InventoryLogController;
use App\Http\Controllers\admin\OrderItemController;
use App\Http\Controllers\admin\SizeController;
use App\Http\Controllers\admin\ShippingController;
use App\Http\Controllers\admin\ProductController;
use App\Http\Controllers\admin\ProductVariantController;
use App\Http\Controllers\admin\ReviewController;
use App\Http\Controllers\admin\WishlistController;
use App\Http\Controllers\CouponUsageController;
use App\Http\Controllers\DiscountController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\OrderShippingController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\ShippingMethodController;
use App\Http\Controllers\TransactionController;
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

        // order items
        Route::get('/order-items', [OrderItemController::class, 'index']);
        Route::get('order-items/trashed', [OrderItemController::class, 'trashed']);
        Route::get('order-items/trashed', [OrderItemController::class, 'trashed']);
        Route::post('order-items/{id}/restore', [OrderItemController::class, 'restore']);
        Route::delete('order-items/{id}/force-delete', [OrderItemController::class, 'forceDelete']);

        // Reviews
        Route::get('/reviews',[ReviewController::class,'index']);
        // Inventory Log
        Route::get('/inventory-log',[InventoryLogController::class,'index']);
        Route::get('/discounts',[DiscountController::class,'index']);
        Route::get('/notifications',[NotificationController::class,'index']);
        Route::get('/shipping-methods',[ShippingMethodController::class,'index']);

        Route::get('/coupons',[CouponController::class,'index']);
        Route::get('/coupon-usages',[CouponUsageController::class,'index']);
        Route::get('/order-shippings',[OrderShippingController::class,'index']);
        Route::get('/transactions',[TransactionController::class,'index']);
        Route::get('/payments',[PaymentController::class,'index']);





});












