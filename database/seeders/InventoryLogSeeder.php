<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\InventoryLog;

class InventoryLogSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $productIds = [1,2,3,4,5];  // Replace with your actual product IDs
        $variantIds = [null, 1, 2, null, 3]; // Replace with your actual variant IDs

        for ($i = 1; $i <= 10; $i++) {
            InventoryLog::create([
                'product_id' => $productIds[array_rand($productIds)],
                'variant_id' => $variantIds[array_rand($variantIds)],
                'change_type' => rand(0,1) ? 'in' : 'out',
                'quantity_changed' => rand(1, 50),
                'note' => 'Sample note for inventory log #' . $i,
            ]);
        }
    }
}
