<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('notifications', function (Blueprint $table) {
            $table->id(); // BIGINT PK

            // User dependency
            $table->foreignId('user_id')
                  ->constrained('users')
                  ->onDelete('cascade'); // Delete notifications if the user is deleted

            // Core fields
            $table->text('message');
            $table->enum('status', ['unread', 'read'])->default('unread');

            // Only created_at as per your spec (no updated_at)
            $table->timestamp('created_at')->useCurrent();

            // Helpful indexes
            $table->index(['user_id', 'status']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('notifications');
    }
};
