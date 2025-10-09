<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\OrderShipping;

class OrderShippingSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        for ($i = 1; $i <= 10; $i++) {
            OrderShipping::create([
                'order_id' => rand(1, 5),
                'shipping_method_id' => rand(1, 5),
                'address' => 'House ' . $i . ', Road ' . rand(1, 20) . ', Dhaka, Bangladesh',
                'tracking_number' => 'TRK-' . strtoupper(uniqid()),
            ]);
        }
    }
}
