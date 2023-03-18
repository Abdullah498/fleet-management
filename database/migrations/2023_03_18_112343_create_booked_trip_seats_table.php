<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('booked_trip_seats', function (Blueprint $table) {
            $table->id();
            $table->string('seat_number');
            $table->unsignedBigInteger('trip_id');
            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('start_station_id');
            $table->unsignedBigInteger('end_station_id');
            $table->unsignedBigInteger('trip_seat_id');
            $table->foreign('trip_id')->references('id')->on('trips')->onDelete('cascade');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('start_station_id')->references('id')->on('stations');
            $table->foreign('end_station_id')->references('id')->on('stations');
            $table->foreign('trip_seat_id')->references('id')->on('trip_seats')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('booked_trip_seats');
    }
};
