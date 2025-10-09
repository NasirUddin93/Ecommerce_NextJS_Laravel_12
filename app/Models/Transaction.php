<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;

class Transaction extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'user_id',
        'order_id',
        // 'payment_id',
        'transaction_type',
        'method',
        'transaction_reference',
        'amount',
        'currency',
        'status',
        'remarks',
        'processed_at',
    ];

    protected $dates = ['processed_at', 'deleted_at'];

    // Relationships
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function order()
    {
        return $this->belongsTo(Order::class);
    }

    // public function payment()
    // {
    //     return $this->belongsTo(Payment::class);
    // }
}
