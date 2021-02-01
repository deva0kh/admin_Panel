<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Sale extends Model
{
    //
    protected $fillable = [
        'service', 'client', 'address','bio','photo','price','payement'
    ];
}
