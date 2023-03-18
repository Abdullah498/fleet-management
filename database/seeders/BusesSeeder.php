<?php

namespace Database\Seeders;

use App\Modules\Trips\Models\Bus;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class BusesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        if(!Bus::count()){
            $buses = [
                [
                    'bus_number' => 'ABC10',
                    'number_of_seats' => 12
                ],
                [
                    'bus_number' => 'ABC20',
                    'number_of_seats' => 12,
                ],
                [
                    'bus_number' => 'ABC30',
                    'number_of_seats' => 12,
                ],
            ];

            Bus::insert($buses);
        }
    }
}
