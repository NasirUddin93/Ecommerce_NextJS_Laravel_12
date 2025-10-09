<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ShippingMethod extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'description',
        'fee',
        'is_free_shipping',
    ];

    // protected $casts = [
    //     'fee'              => 'decimal:2',
    //     'is_free_shipping' => 'boolean',
    // ];
}
