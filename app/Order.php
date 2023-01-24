<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Order extends Model
{
   protected $guarded = [];
   
    public function user()
    {
        return $this->belongsTo('App\User');
    }

    public function products()
    {
        return $this->belongsToMany('App\Product')->withPivot('quantity','price','variation');
    }
	
	public function orderProduct()
	{
		return $this->hasMany(OrderProduct::class);
	}
}
