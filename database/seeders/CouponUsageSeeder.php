<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\CouponUsage;

class CouponUsageSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        for ($i = 1; $i <= 10; $i++) {
            CouponUsage::create([
                'coupon_id' => rand(1, 5),
                'user_id' => rand(1, 5),
                'order_id' => rand(1, 5),
                'used_at' => now()->subDays(rand(1, 30)),
            ]);
        }
    }
}
