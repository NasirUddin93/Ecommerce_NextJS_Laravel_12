<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Coupon extends Model
{
    use HasFactory;

    protected $fillable = [
        'code',
        'description',
        'discount_type',
        'discount_value',
        'min_purchase_amount',
        'max_discount_amount',
        'valid_from',
        'valid_to',
        'usage_limit',
        'status',
    ];

    // protected $casts = [
    //     'discount_value' => 'decimal:2',
    //     'min_purchase_amount' => 'decimal:2',
    //     'max_discount_amount' => 'decimal:2',
    //     'valid_from' => 'date',
    //     'valid_to' => 'date',
    // ];
}
