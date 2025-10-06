<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\Category;
use App\Models\Brand;
use App\Models\ProductImage;

class Product extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'category_id',
        'brand_id',
        'name',
        'sku',
        'description',
        'base_price',
        'stock_quantity',
        'weight',
        'is_seasonal',
        'seasonal_start_date',
        'seasonal_end_date',
        'status',
    ];

    // Relationships
    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function brand()
    {
        return $this->belongsTo(Brand::class);
    }
    public function product_images()
    {
        return $this->hasMany(ProductImage::class);
    }

}
