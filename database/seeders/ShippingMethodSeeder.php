<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\ShippingMethod;

class ShippingMethodSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $shippingMethods = [
            [
                'name' => 'Standard Shipping',
                'description' => 'Delivery within 5–7 business days.',
                'fee' => 5.99,
                'is_free_shipping' => false,
            ],
            [
                'name' => 'Express Shipping',
                'description' => 'Delivery within 2–3 business days.',
                'fee' => 12.99,
                'is_free_shipping' => false,
            ],
            [
                'name' => 'Overnight Shipping',
                'description' => 'Next-day delivery for orders placed before 12 PM.',
                'fee' => 24.99,
                'is_free_shipping' => false,
            ],
            [
                'name' => 'Free Shipping',
                'description' => 'Free shipping for orders over $50.',
                'fee' => 0.00,
                'is_free_shipping' => true,
            ],
        ];

        foreach ($shippingMethods as $method) {
            ShippingMethod::create($method);
        }
    }
}
