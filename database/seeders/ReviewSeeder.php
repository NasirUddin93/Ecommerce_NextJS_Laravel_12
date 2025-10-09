<?php

namespace Database\Seeders;

use App\Models\Review;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ReviewSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $userIds = [1];
        $productIds = [1, 2];

        for ($i = 1; $i <= 10; $i++) {
            Review::create([
                'user_id' => $userIds[array_rand($userIds)],
                'product_id' => $productIds[array_rand($productIds)],
                'rating' => rand(1, 5),
                'comment' => 'This is a sample review number ' . $i,
            ]);
        }
    }
}
