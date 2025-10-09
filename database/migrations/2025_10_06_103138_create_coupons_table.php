<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('coupons', function (Blueprint $table) {
            $table->id();
            $table->string('code', 50)->unique(); // Coupon code, unique
            $table->text('description')->nullable(); // Coupon details

            $table->enum('discount_type', ['percentage', 'fixed']); // Type of discount
            $table->decimal('discount_value', 10, 2); // Discount amount

            $table->decimal('min_purchase_amount', 10, 2)->default(0.00); // Minimum order amount
            $table->decimal('max_discount_amount', 10, 2)->nullable(); // Max discount (optional)

            $table->date('valid_from')->nullable(); // Start date
            $table->date('valid_to')->nullable();   // End date

            $table->integer('usage_limit')->default(0); // Max number of uses (0 = unlimited)

            $table->enum('status', ['active', 'inactive'])->default('active'); // Coupon status
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('coupons');
    }
};
