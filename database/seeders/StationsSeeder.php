<?php

namespace Database\Seeders;

use App\Modules\Trips\Models\Station;
use Illuminate\Database\Seeder;

class StationsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        if(!Station::count()){
            $stations = [
                [
                    'name' => 'Cairo',
                ],
                [
                    'name' => 'Giza',
                ],
                [
                    'name' => 'AlFayyum',
                ],
                [
                    'name' => 'AlMinya',
                ],
                [
                    'name' => 'Asyut',
                ],
                [
                    'name' => 'Suhag',
                ],
                [
                    'name' => 'Qena',
                ],
                [
                    'name' => 'Luxor',
                ],
                [
                    'name' => 'Aswan',
                ]
            ];

            Station::insert($stations);
        }
    }
}
