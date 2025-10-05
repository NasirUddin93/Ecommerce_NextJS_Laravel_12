<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;   // <-- add this

class SizeSeeder extends Seeder
{
    public function run(): void
    {
        $sizes = ['XS','S','M','L','XL','XXL','3XL','4XL','28','30'];

        $rows = array_map(fn ($name) => [
            'name'       => $name,
            'status'     => 1,
            'created_at' => now(),
            'updated_at' => now(),
        ], $sizes);

        DB::table('sizes')->insert($rows);
    }
}
