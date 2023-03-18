<?php

namespace App\Modules\Trips\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bus extends Model
{
    protected $guarded = [];
    protected $table = 'Buses';
    use HasFactory;
}
