<?php

namespace App\Modules\Trips\Controllers;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Modules\Trips\Services\TripService;
use App\Modules\Trips\Validations\TripRequestRules;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class TripController extends Controller
{

    private TripService $tripService;

    public function __construct(TripService $tripService)
    {
        $this->tripService = $tripService;
    }

    public function getAvailableSeats(Request $request): JsonResponse
    {
        $this->validate($request, TripRequestRules::getAvailableSeats());
        $availableSeats = $this->tripService->getAvailableSeats($request->start_station_id, $request->end_station_id);
        return response()->json($availableSeats);
    }

    public function bookSeat(Request $request): JsonResponse
    {
        $this->validate($request, TripRequestRules::bookSeat());
        $this->tripService->bookSeat($request->seat_number, $request->start_station_id, $request->end_station_id, $request->user_id);
        return response()->json(["data"=>["status"=> true, "message"=> "Congrats your seat booked successfully!"]]);
    }

    public function getStations(): JsonResponse
    {
        $stations = $this->tripService->getStations();
        return response()->json($stations);
    }

    /*todo: method should be moved to users module with whole api attachments*/
    public function login(Request $request)
    {
        $this->validate($request, TripRequestRules::login());
        $user = User::where(['email'=> $request->email])->first();
        if($user && Hash::check($request->password, $user->password))
        {
            auth()->guard('web')->login($user);
            $token = $user->createToken('', [])->plainTextToken;
            return response()->json([
                "data"=>[
                    "status" => true,
                    "message" => "Successfully logged in!",
                    "token" => $token
                ]
            ]);
        }else{
            return response()->json(["data"=>["status"=> false, "message"=> "Wrong email or password!"]]);
        }
    }
}
