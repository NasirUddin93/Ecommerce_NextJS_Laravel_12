<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Notification;

class NotificationSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $statuses = ['unread', 'read'];

        for ($i = 1; $i <= 10; $i++) {
            Notification::create([
                'user_id' => rand(1,1),
                'message' => "This is a sample notification message number {$i}.",
                'status' => $statuses[array_rand($statuses)],
            ]);
        }
    }
}
