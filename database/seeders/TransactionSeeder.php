<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Transaction;
use Illuminate\Support\Carbon;
use Illuminate\Support\Str;

class TransactionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $users = \App\Models\User::pluck('id')->toArray();
        $orders = \App\Models\Order::pluck('id')->toArray();

        for ($i = 1; $i <= 10; $i++) {
            Transaction::create([
                'user_id' => $users[array_rand($users)],
                'order_id' => $orders ? $orders[array_rand($orders)] : null,
                'transaction_type' => ['debit', 'credit', 'refund', 'chargeback'][array_rand(['debit', 'credit', 'refund', 'chargeback'])],
                'method' => ['card', 'mobile_banking', 'COD', 'wallet'][array_rand(['card', 'mobile_banking', 'COD', 'wallet'])],
                'transaction_reference' => 'TXN' . strtoupper(Str::random(10)),
                'amount' => rand(100, 10000) / 10,
                'currency' => 'BDT',
                'status' => ['pending', 'success', 'failed', 'refunded'][array_rand(['pending', 'success', 'failed', 'refunded'])],
                'remarks' => 'Dummy transaction record ' . $i,
                'processed_at' => Carbon::now()->subDays(rand(0, 30)),
            ]);
        }
    }
}
