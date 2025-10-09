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
        Schema::create('transactions', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->foreignId('order_id')->nullable()->constrained('orders')->onDelete('set null');
            $table->enum('transaction_type', ['debit', 'credit', 'refund', 'chargeback']);
            $table->enum('method', ['card', 'mobile_banking', 'COD', 'wallet']);
            $table->string('transaction_reference', 150);
            $table->decimal('amount', 10, 2);
            $table->string('currency', 10);
            $table->enum('status', ['pending', 'success', 'failed', 'refunded']);
            $table->text('remarks')->nullable();
            $table->timestamp('processed_at');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('transactions');
    }
};
