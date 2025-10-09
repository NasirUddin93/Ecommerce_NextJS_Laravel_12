<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\OrderItem;

class OrderItemSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
         // You can adjust these IDs based on existing data in your orders/products tables
        $orderIds = [1, 2];
        $productIds = [1, 2];
        $variantIds = [1, 2];

        for ($i = 1; $i <= 10; $i++) {
            OrderItem::create([
                'order_id' => $orderIds[array_rand($orderIds)],
                'product_id' => $productIds[array_rand($productIds)],
                'variant_id' => $variantIds[array_rand($variantIds)],
                'quantity' => rand(1, 5),
                'price_at_purchase' => rand(100, 1000),
                'discount_applied' => rand(0, 100),
            ]);
        }
    }
}
