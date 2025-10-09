<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProductVariantSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $data = [];

        for ($i = 1; $i <= 10; $i++) {
            $data[] = [
                'product_id' => rand(1, 5), // assuming product IDs 1–5 exist
                'size_id' => rand(1, 3),    // assuming size IDs 1–3 exist
                'color' => ['Red', 'Blue', 'Green', 'Black', 'White'][array_rand(['Red', 'Blue', 'Green', 'Black', 'White'])],
                'additional_price' => rand(50, 200),
                'stock_quantity' => rand(10, 100),
                'created_at' => now(),
                'updated_at' => now(),
            ];
        }

        DB::table('product_variants')->insert($data);
    }
}
