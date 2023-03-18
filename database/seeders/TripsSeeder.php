<?php

namespace Database\Seeders;

use App\Modules\Trips\Models\Trip;
use App\Modules\Trips\Models\TripSeat;
use Carbon\Carbon;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class TripsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        if(!Trip::count()){
            $now = Carbon::now();

            $trips = [
                [
                    'bus_id' => 1,
                    'start_station_id' => 1,
                    'end_station_id' => 9,
                    'created_at' => $now,
                    'updated_at' => $now,
                ],
                [
                    'bus_id' => 2,
                    'start_station_id' => 3,
                    'end_station_id' => 6,
                    'created_at' => $now,
                    'updated_at' => $now,
                ],
                [
                    'bus_id' => 3,
                    'start_station_id' => 5,
                    'end_station_id' => 9,
                    'created_at' => $now,
                    'updated_at' => $now,
                ],
            ];

            Trip::insert($trips);

            //insert trip_seats table with unique seats numbers for each bus
            $trips = Trip::get();
            $tripSeats = [];
            foreach ($trips as $trip){
                if($trip->bus){
                    for($i=0; $i < $trip->bus->number_of_seats; $i++) {
                        $tripSeats[] = [
                            'trip_id' => $trip->id,
                            'seat_number' => $trip->bus->bus_number . '-' . $i+1,
                            'created_at' => $now,
                            'updated_at' => $now,
                        ];
                    }
                }
            }
            TripSeat::insert($tripSeats);
        }
    }
}
