<?php

namespace Database\Seeders;

use App\Models\Product;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        for ($i = 1; $i <= 20; $i++) {
            Product::create([
                'category_id' => 1,
                'brand_id' => 1,
                'name' => 'Mominul Product ' . $i,
                'sku' => 'mominul-' . $i,
                'description' => 'Development skill product number ' . $i,
                'base_price' => 90000 + ($i * 1000), // Different price for each product
                'stock_quantity' => 10 + $i,         // Slightly increasing stock
                'weight' => 60,
                'is_seasonal' => true,
                'seasonal_start_date' => '2025-01-01',
                'seasonal_end_date' => '2025-12-31',
                'status' => 'active',
            ]);
        }
    }
}
