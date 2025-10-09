<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Container\Attributes\DB;
use App\Models\Coupon;
class CouponSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $coupons = [
            [
                'code' => 'WELCOME10',
                'description' => 'Get 10% off on your first purchase.',
                'discount_type' => 'percentage',
                'discount_value' => 10.00,
                'min_purchase_amount' => 500.00,
                'max_discount_amount' => 200.00,
                'valid_from' => now()->subDays(5),
                'valid_to' => now()->addDays(30),
                'usage_limit' => 100,
                'status' => 'active',
            ],
            [
                'code' => 'FLAT50',
                'description' => 'Flat 50 BDT off on any order.',
                'discount_type' => 'fixed',
                'discount_value' => 50.00,
                'min_purchase_amount' => 0.00,
                'max_discount_amount' => null,
                'valid_from' => now(),
                'valid_to' => now()->addDays(45),
                'usage_limit' => 0,
                'status' => 'active',
            ],
            [
                'code' => 'SUMMER25',
                'description' => '25% discount for summer sale.',
                'discount_type' => 'percentage',
                'discount_value' => 25.00,
                'min_purchase_amount' => 1000.00,
                'max_discount_amount' => 400.00,
                'valid_from' => now()->subDays(10),
                'valid_to' => now()->addDays(20),
                'usage_limit' => 50,
                'status' => 'active',
            ],
            [
                'code' => 'FREESHIP',
                'description' => 'Free shipping on orders over 1500 BDT.',
                'discount_type' => 'fixed',
                'discount_value' => 100.00,
                'min_purchase_amount' => 1500.00,
                'max_discount_amount' => 100.00,
                'valid_from' => now(),
                'valid_to' => now()->addDays(60),
                'usage_limit' => 0,
                'status' => 'active',
            ],
            [
                'code' => 'NEWYEAR2025',
                'description' => 'Celebrate New Year with 20% off.',
                'discount_type' => 'percentage',
                'discount_value' => 20.00,
                'min_purchase_amount' => 800.00,
                'max_discount_amount' => 300.00,
                'valid_from' => '2025-01-01',
                'valid_to' => '2025-01-31',
                'usage_limit' => 200,
                'status' => 'inactive',
            ],
            [
                'code' => 'BUYMORE5',
                'description' => '5% off on purchases above 2000 BDT.',
                'discount_type' => 'percentage',
                'discount_value' => 5.00,
                'min_purchase_amount' => 2000.00,
                'max_discount_amount' => 150.00,
                'valid_from' => now(),
                'valid_to' => now()->addDays(40),
                'usage_limit' => 500,
                'status' => 'active',
            ],
            [
                'code' => 'FLASHSALE',
                'description' => '50 BDT off during flash sale hours.',
                'discount_type' => 'fixed',
                'discount_value' => 50.00,
                'min_purchase_amount' => 300.00,
                'max_discount_amount' => null,
                'valid_from' => now(),
                'valid_to' => now()->addDays(7),
                'usage_limit' => 100,
                'status' => 'active',
            ],
            [
                'code' => 'STUDENT15',
                'description' => 'Exclusive 15% off for students.',
                'discount_type' => 'percentage',
                'discount_value' => 15.00,
                'min_purchase_amount' => 700.00,
                'max_discount_amount' => 250.00,
                'valid_from' => now()->subDays(2),
                'valid_to' => now()->addDays(25),
                'usage_limit' => 300,
                'status' => 'active',
            ],
            [
                'code' => 'BIRTHDAY100',
                'description' => 'Get 100 BDT off on your birthday!',
                'discount_type' => 'fixed',
                'discount_value' => 100.00,
                'min_purchase_amount' => 500.00,
                'max_discount_amount' => 100.00,
                'valid_from' => now(),
                'valid_to' => now()->addDays(365),
                'usage_limit' => 1,
                'status' => 'active',
            ],
            [
                'code' => 'APPONLY10',
                'description' => '10% off for mobile app users only.',
                'discount_type' => 'percentage',
                'discount_value' => 10.00,
                'min_purchase_amount' => 1000.00,
                'max_discount_amount' => 300.00,
                'valid_from' => now()->subDays(1),
                'valid_to' => now()->addDays(90),
                'usage_limit' => 1000,
                'status' => 'active',
            ],
        ];

        foreach ($coupons as $coupon) {
            Coupon::create($coupon);
        }
    }
}
