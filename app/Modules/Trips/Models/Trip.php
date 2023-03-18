<?php

namespace App\Modules\Trips\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Trip extends Model
{
    protected $guarded = [];
    use HasFactory;

    public function bus(){
        return $this->hasOne(Bus::class, 'id', 'bus_id');
    }
}
