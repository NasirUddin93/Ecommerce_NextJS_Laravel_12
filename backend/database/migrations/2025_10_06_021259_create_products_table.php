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
        Schema::create('products', function (Blueprint $table) {
            $table->id();

            // Foreign keys
            $table->unsignedBigInteger('category_id');
            $table->unsignedBigInteger('brand_id');

            // Product info
            $table->string('name', 255);
            $table->string('sku', 100)->unique();
            $table->text('description')->nullable();
            $table->decimal('base_price', 10, 2);
            $table->integer('stock_quantity')->default(0);
            $table->decimal('weight', 8, 2)->nullable();

            // Seasonal fields
            $table->boolean('is_seasonal')->default(false);
            $table->date('seasonal_start_date')->nullable();
            $table->date('seasonal_end_date')->nullable();

            // Status
            $table->enum('status', ['active', 'inactive'])->default('active');

            // Soft deletes + timestamps
            $table->softDeletes();
            $table->timestamps();

            // Foreign key constraints
            $table->foreign('category_id')->references('id')->on('categories')->onDelete('cascade');
            $table->foreign('brand_id')->references('id')->on('brands')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
