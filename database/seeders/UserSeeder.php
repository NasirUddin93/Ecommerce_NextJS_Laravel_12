<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
$users = [
            [
                'name' => 'Mominul Islam',
                'email' => 'mominul@gmail.com',
                'password' => Hash::make('asdf1234'),
            ],
            [
                'name' => 'Nasir Uddin',
                'email' => 'nasir@gmail.com',
                'password' => Hash::make('asdf1234'),
            ],
            [
                'name' => 'Shaimum Hasan',
                'email' => 'shaimum@gmail.com',
                'password' => Hash::make('asdf1234'),
            ],
            [
                'name' => 'Rasel Ahmed',
                'email' => 'rasel@gmail.com',
                'password' => Hash::make('asdf1234'),
            ],
            [
                'name' => 'Samiul Islam',
                'email' => 'samiul@gmail.com',
                'password' => Hash::make('asdf1234'),
            ],
            [
                'name' => 'Farhana Akter',
                'email' => 'farhana@gmail.com',
                'password' => Hash::make('asdf1234'),
            ],
            [
                'name' => 'Rafi Khan',
                'email' => 'rafi@gmail.com',
                'password' => Hash::make('asdf1234'),
            ],
            [
                'name' => 'Tania Sultana',
                'email' => 'tania@gmail.com',
                'password' => Hash::make('asdf1234'),
            ],
            [
                'name' => 'Sabbir Hossain',
                'email' => 'sabbir@gmail.com',
                'password' => Hash::make('asdf1234'),
            ],
            [
                'name' => 'Ruhul Amin',
                'email' => 'ruhul@gmail.com',
                'password' => Hash::make('asdf1234'),
            ],
        ];

        foreach ($users as $user) {
            User::create($user);
        }
    }
}
