<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::post('login', '\App\Modules\Trips\Controllers\TripController@login');

Route::get('stations', '\App\Modules\Trips\Controllers\TripController@getStations');
Route::get('trips/available-seats', '\App\Modules\Trips\Controllers\TripController@getAvailableSeats');

Route::middleware('auth')->post('trips/book-seat', '\App\Modules\Trips\Controllers\TripController@bookSeat');
