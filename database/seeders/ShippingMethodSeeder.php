<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\ShippingMethod;

class ShippingMethodSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $methods = [
            ['name' => 'Standard Shipping', 'description' => 'Delivers in 5–7 business days.', 'fee' => 100.00, 'is_free_shipping' => false],
            ['name' => 'Express Shipping', 'description' => 'Delivers in 2–3 business days.', 'fee' => 200.00, 'is_free_shipping' => false],
            ['name' => 'Overnight Shipping', 'description' => 'Delivers by next business day.', 'fee' => 350.00, 'is_free_shipping' => false],
            ['name' => 'Free Standard Shipping', 'description' => 'Free delivery in 7–10 business days.', 'fee' => 0.00, 'is_free_shipping' => true],
            ['name' => 'Local Pickup', 'description' => 'Pick up from our local store.', 'fee' => 0.00, 'is_free_shipping' => true],
            ['name' => 'Same Day Delivery', 'description' => 'Delivery within 24 hours.', 'fee' => 250.00, 'is_free_shipping' => false],
            ['name' => 'International Shipping', 'description' => 'Delivery within 10–15 business days.', 'fee' => 500.00, 'is_free_shipping' => false],
            ['name' => 'Economy Shipping', 'description' => 'Cheapest shipping option.', 'fee' => 80.00, 'is_free_shipping' => false],
            ['name' => 'Weekend Delivery', 'description' => 'Delivery available on weekends.', 'fee' => 150.00, 'is_free_shipping' => false],
            ['name' => 'Drone Delivery', 'description' => 'Fast drone-based delivery.', 'fee' => 400.00, 'is_free_shipping' => false],
        ];

        foreach ($methods as $method) {
            ShippingMethod::create($method);
        }
    }
}
