<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Payment;
use Illuminate\Support\Str;

class PaymentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $orders = \App\Models\Order::pluck('id')->toArray();

        for ($i = 1; $i <= 10; $i++) {
            Payment::create([
                'order_id' => $orders ? $orders[array_rand($orders)] : null,
                'payment_method' => ['card', 'mobile_banking', 'COD'][array_rand(['card', 'mobile_banking', 'COD'])],
                'transaction_id' => 'PAY' . strtoupper(Str::random(10)),
                'amount' => rand(500, 5000) / 10,
                'status' => ['pending', 'success', 'failed'][array_rand(['pending', 'success', 'failed'])],
            ]);
        }
    }
}
