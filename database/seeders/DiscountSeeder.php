<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Discount;
use Illuminate\Support\Carbon;

class DiscountSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $types = ['percentage', 'fixed'];

        for ($i = 1; $i <= 10; $i++) {
            Discount::create([
                'product_id' => rand(1, 2),
                'category_id' => rand(1, 3),
                'discount_type' => $types[array_rand($types)],
                'discount_value' => rand(5, 50),
                'valid_from' => Carbon::now()->subDays(rand(0, 10)),
                'valid_to' => Carbon::now()->addDays(rand(10, 30)),
            ]);
        }
    }
}
