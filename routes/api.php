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
use App\Http\Controllers\admin\UserController;
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
use App\Http\Controllers\Admin\OrderController;




// Route::get('/user', function (Request $request) {
//     return $request->user();
// })->middleware('auth:sanctum');

// Admin Authentication Login
Route::post('/admin/login', [AuthController::class, 'authenticate']);

Route::group(['middleware' => ['auth:sanctum']], function () {

    Route::get('/users', [UserController::class, 'index']);

    // Admin Brand Routes
    Route::post('/brands', [BrandController::class, 'store']);
    Route::get('/brands', [BrandController::class, 'index']);
    Route::get('/brands/{id}', [BrandController::class, 'show']);
    Route::put('/brands/{id}', [BrandController::class, 'update']);

    // Admin Category Routes
    Route::post('/categories/', [CategoryController::class, 'store']);
    Route::get('/categories', [CategoryController::class, 'index']);
    Route::get('/categories/{id}', [CategoryController::class, 'show']);
    Route::put('/categories/{id}', [CategoryController::class, 'update']);

    // Admin Sizes Routes
    Route::post('/sizes/', [SizeController::class, 'store']);
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
        Route::get('/', [OrderController::class, 'index']);
        Route::get('/{id}', [OrderController::class, 'show']);
        Route::post('/', [OrderController::class, 'store']);
        Route::put('/{id}', [OrderController::class, 'update']);
        Route::delete('/{id}', [OrderController::class, 'destroy']);
        Route::post('/restore/{id}', [OrderController::class, 'restore']);
        Route::delete('/force-delete/{id}', [OrderController::class, 'forceDelete']);
    });

        // order items
        Route::get('/order-items', [OrderItemController::class, 'index']);
        Route::get('order-items/trashed', [OrderItemController::class, 'trashed']);
        Route::get('order-items/trashed', [OrderItemController::class, 'trashed']);
        Route::post('order-items/{id}/restore', [OrderItemController::class, 'restore']);
        Route::delete('order-items/{id}/force-delete', [OrderItemController::class, 'forceDelete']);

        // Reviews
        Route::get('/reviews',[ReviewController::class,'index']);
        Route::post('/reviews',[ReviewController::class,'store']);
        Route::get('/reviews/{id}',[ReviewController::class,'show']);
        Route::put('/reviews/{id}',[ReviewController::class,'update']);
        Route::delete('/reviews/{id}',[ReviewController::class,'destroy']); 



        // Inventory Log
        Route::get('/inventory-log',[InventoryLogController::class,'index']);
        Route::post('/inventory-log',[InventoryLogController::class,'store']);
        Route::get('/inventory-log/{id}',[InventoryLogController::class,'show']);
        Route::put('/inventory-log/{id}',[InventoryLogController::class,'update']);
        Route::delete('/inventory-log/{id}',[InventoryLogController::class,'destroy']); 



        // Discounts
        Route::get('/discounts',[DiscountController::class,'index']);
        Route::post('/discounts',[DiscountController::class,'store']);
        Route::get('/discounts/{id}',[DiscountController::class,'show']);
        Route::put('/discounts/{id}',[DiscountController::class,'update']);
        Route::delete('/discounts/{id}',[DiscountController::class,'destroy']);

        // Notifications
        Route::get('/notifications',[NotificationController::class,'index']);
        Route::post('/notifications',[NotificationController::class,'store']);
        Route::get('/notifications/{id}',[NotificationController::class,'show']);
        Route::put('/notifications/{id}',[NotificationController::class,'update']);
        Route::delete('/notifications/{id}',[NotificationController::class,'destroy']);

        // Shipping Methods
        Route::get('/shipping-methods',[ShippingMethodController::class,'index']);
        Route::post('/shipping-methods',[ShippingMethodController::class,'store']);

        // Coupons
        Route::get('/coupons',[CouponController::class,'index']);
        Route::post('/coupons',[CouponController::class,'store']);
        // Route::get('/coupons/{id}',[CouponController::class,'show']);
        Route::put('/coupons/{id}',[CouponController::class,'update']);
        Route::delete('/coupons/{id}',[CouponController::class,'destroy']);

        Route::get('/coupon-usages',[CouponUsageController::class,'index']);

        // Order Shippings  
        Route::get('/order-shippings',[OrderShippingController::class,'index']);
        Route::post('/order-shippings',[OrderShippingController::class,'store']);
        Route::get('/order-shippings/{id}',[OrderShippingController::class,'show']);
        Route::put('/order-shippings/{id}',[OrderShippingController::class,'update']);
        Route::delete('/order-shippings/{id}',[OrderShippingController::class,'destroy']);  

        // Transactions
        Route::get('/transactions',[TransactionController::class,'index']);

        // Payments Routes  
        Route::get('/payments',[PaymentController::class,'index']);
        Route::post('/payments',[PaymentController::class,'store']);
        Route::get('/payments/{id}',[PaymentController::class,'show']);
        Route::put('/payments/{id}',[PaymentController::class,'update']);
        Route::delete('/payments/{id}',[PaymentController::class,'destroy']);       





});












