<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddDeletedAtToShippingMethodsTable extends Migration
{
    public function up()
    {
        Schema::table('shipping_methods', function (Blueprint $table) {
            $table->softDeletes(); // This adds the deleted_at column
        });
    }

    public function down()
    {
        Schema::table('shipping_methods', function (Blueprint $table) {
            $table->dropSoftDeletes(); // This removes the deleted_at column
        });
    }
}