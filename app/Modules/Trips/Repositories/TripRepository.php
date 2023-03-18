<?php

namespace App\Modules\Trips\Repositories;

use App\Modules\Trips\Models\BookedTripSeat;
use App\Modules\Trips\Models\Station;
use App\Modules\Trips\Models\Trip;
use App\Modules\Trips\Models\TripSeat;

class TripRepository
{
    public function getStationById(int $id): ?Station
    {
        return Station::find($id);
    }

    public function getAvailableTrip(int $startStationId, int $endStationId): ?Trip
    {
        if($startStationId < $endStationId){
            return Trip::where('start_station_id', '<=', $startStationId)
                ->where('end_station_id', '>=', $endStationId)
                ->first();
        }else{
            return Trip::where('start_station_id', '>=', $startStationId)
                ->where('end_station_id', '<=', $endStationId)
                ->first();
        }
    }

    public function getAvailableSeatsOnTrip(int $tripId, int $startStationId, int $endStationId): array
    {
         $tripSeats = TripSeat::select('id', 'trip_id', 'seat_number')->where('trip_id', $tripId)->get();
         $bookedSeats = BookedTripSeat::select('trip_seat_id', 'start_station_id', 'end_station_id')
             ->where('trip_id', $tripId)
             ->get();

         //filter available seats within user start and end station
         $availableSeats = [];
         foreach ($tripSeats as $tripSeat){
             $availability = true;
             foreach ($bookedSeats->where('trip_seat_id', $tripSeat->id) as $bookedSeat){
                 if($startStationId < $endStationId){
                     if(!($bookedSeat->start_station_id >= $endStationId || $bookedSeat->end_station_id <= $startStationId)){
                         $availability = false;
                     }
                 }else{
                     if(!($bookedSeat->start_station_id <= $endStationId || $bookedSeat->end_station_id >= $startStationId)){
                         $availability = false;
                     }
                 }
             }
             if($availability){
                 $availableSeats[] = $tripSeat;
             }
         }

         return $availableSeats;
    }

    public function getTripSeatByNumber($seatNumber): ?TripSeat
    {
        return TripSeat::where('seat_number', $seatNumber)->first();
    }

    public function isTripSeatAvailable(int $tripSeatId, $startStationId, $endStationId): bool
    {
        $availability = true;
        foreach (BookedTripSeat::where('trip_seat_id', $tripSeatId)->get() as $bookedSeat){
            if($startStationId < $endStationId){
                if(!($bookedSeat->start_station_id >= $endStationId || $bookedSeat->end_station_id <= $startStationId)){
                    $availability = false;
                }
            }else{
                if(!($bookedSeat->start_station_id <= $endStationId || $bookedSeat->end_station_id >= $startStationId)){
                    $availability = false;
                }
            }
        }

        return $availability;
    }

    public function bookSeat(array $data): BookedTripSeat
    {
        return BookedTripSeat::create($data);
    }

    public function getStations()
    {
        return Station::select('id','name')->get();
    }
}
