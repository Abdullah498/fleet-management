<?php

namespace App\Modules\Trips\Validations;

class TripRequestRules
{

    public static function getAvailableSeats(): array
    {
        return [
            'start_station_id' => 'required|integer',
            'end_station_id' => 'required|integer|different:start_station_id',
        ];
    }

    public static function bookSeat(): array
    {
        return [
            'start_station_id' => 'required|integer',
            'end_station_id' => 'required|integer|different:start_station_id',
            'seat_number' => 'required|string',
        ];
    }

    public static function login(): array
    {
        return[
            'email' => 'required|email',
            'password' => 'required|string'
        ];
    }
}
