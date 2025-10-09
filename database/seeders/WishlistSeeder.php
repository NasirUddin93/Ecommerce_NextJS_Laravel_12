<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class WishlistSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $data = [];

        for ($i = 1; $i <= 10; $i++) {
            $data[] = [
                'user_id' => 1,       // assuming 5 users exist
                'product_id' => rand(1, 10),   // assuming 10 products exist
                'created_at' => now(),
                'updated_at' => now(),
            ];
        }

        DB::table('wishlists')->insert($data);
    }
}
