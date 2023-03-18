<?php

namespace App\Modules\Trips\Services;

use App\Modules\Trips\Models\BookedTripSeat;
use App\Modules\Trips\Repositories\TripRepository;

class TripService
{
    private TripRepository $tripRepository;

    public function __construct(TripRepository $tripRepository)
    {
        $this->tripRepository = $tripRepository;
    }

    public function getAvailableSeats(int $startStationId, int $endStationId): array
    {
        //make sure if stations ids actually exist
        $startStation = $this->tripRepository->getStationById($startStationId);
        $endStation = $this->tripRepository->getStationById($endStationId);
        if(!$startStation){
            throw new \RuntimeException('Not found start station id');
        }
        if(!$endStation){
            throw new \RuntimeException('Not found end station id');
        }

        //get available trip and its available seat
        $availableTrip = $this->tripRepository->getAvailableTrip($startStationId, $endStationId);
        if($availableTrip){
            return $this->tripRepository->getAvailableSeatsOnTrip($availableTrip->id, $startStationId, $endStationId);
        }else{
            throw new \RuntimeException('Sorry there is no available trip right now!');
        }
    }

    public function bookSeat(string $seatNumber, int $startStationId, int $endStationId, int $userId): BookedTripSeat
    {
        //make sure if stations ids actually exist
        $startStation = $this->tripRepository->getStationById($startStationId);
        $endStation = $this->tripRepository->getStationById($endStationId);
        if(!$startStation){
            throw new \RuntimeException('Not found start station id');
        }
        if(!$endStation){
            throw new \RuntimeException('Not found end station id');
        }

        //book the seat for the user if available
        $tripSeat = $this->tripRepository->getTripSeatByNumber($seatNumber);
        if($tripSeat){
            $availableTrip = $this->tripRepository->getAvailableTrip($startStationId, $endStationId);
            $seatIsAvailable = $this->tripRepository->isTripSeatAvailable($tripSeat->id, $startStationId, $endStationId);
            if($availableTrip && $seatIsAvailable){
                $data = [
                    'seat_number' => $seatNumber,
                    'trip_id' => $tripSeat->trip_id,
                    'user_id' => $userId,
                    'start_station_id' => $startStationId,
                    'end_station_id' => $endStationId,
                    'trip_seat_id' => $tripSeat->id
                ];
                return $this->tripRepository->bookSeat($data);
            }else{
                throw new \RuntimeException('Sorry the selected seat is un available right now!');
            }
        }else{
            throw new \RuntimeException('Not found seat number');
        }
    }

    public function getStations()
    {
        return $this->tripRepository->getStations();
    }
}
