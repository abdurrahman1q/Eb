<?php
namespace App\Shop;
use Cart;
use Voyager;
use App\Shipping;
use Location;
class Shop
{
    public function price($price)
    {
      return "$".$this->round_num($price);
    }
    public function tax(){
		$total =  Cart::getSubTotal() - $this->discount();
		$tax = ((Voyager::setting('admin.tax'))* $total)/100 ;
		return $tax;
	}
	public function discount(){
		if(session()->has('discount')){
			return session()->get('discount');
		}
		return 0;

	}
	public function discount_code(){
		if(session()->has('discount_code')){
			return session()->get('discount_code');
		}
		return null;

	}
	public function shipping_method(){
		if(session()->has('shipping_method')){
			return session()->get('shipping_method');
		}else{
         $shipping = Shipping::first();
         return $shipping->Shipping_method;
		}
	}
	public function shipping(){
		if(session()->has('shipping_method')){
			return session()->get('shipping_cost');
		}else{
         $shipping = Shipping::first();
         return $shipping->shipping_cost;
		}
	}
	public function newSubtotal(){
		return Cart::getSubTotal() + $this->tax() - $this->discount();
	}
	public function newTotal(){
		return ($this->newSubtotal() + $this->shipping());
	}
	public function round_num($price){
		return sprintf('%.2f', $price);
	}
	public function average_rating($ratings){
		if($ratings->count() > 0){
			return $ratings->sum('rating')/$ratings->count();
		}
		return 0.00;
	}

}

?>
