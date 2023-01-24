<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Order;
use Shop;
use Cart;
use App\OrderProduct;
use App\Product;
use App\Mail\OrderPlaced;
use Illuminate\Support\Facades\Mail;
use Auth;
use App\User;
class CheckoutController extends Controller
{
   public function store(Request $request){
        $request->validate([
            'first_name' => ['required','max:40'],
            'last_name' => ['required','max:40'],
            'email' => ['required','max:40','email'],
            'address' =>['required','max:200'],
            'city' =>['required','max:50'],
            'post_code' =>['required','max:10'],
            'state' =>['required','max:20'],
            'phone' =>['required','max:15'],
        ]);
		if (Auth::check()) {
		   User::where('id',Auth::id())->update([
					'name' => $request->first_name,
					'last_name' => $request->last_name,
					'address' =>$request->address,
					'city' =>$request->city,
					'post_code' =>$request->post_code,
					'state' =>$request->state,
					'phone' =>$request->phone,
		   ]);
		}
        if($this->productsAreNoLongerAvailable()){
            return back()->withErrors('Sorry! One of the items in your cart is no longer Available!');
        }		
   $order = Order::create([
           'user_id' => auth()->user() ? auth()->user()->id : null,
		   'first_name'=> $request->first_name,
		   'last_name'=> $request->last_name,
		   'email'=> $request->email,
		   'address'=> $request->address,
		   'city'=> $request->city,
		   'post_code'=> $request->post_code,
		   'state'=> $request->state,
		   'phone'=> $request->phone,
		   'subtotal'=> Shop::round_num(Cart::getSubTotal()),
		   'discount'=> Shop::round_num(Shop::discount()),
		   'discount_code'=> Shop::discount_code(),
		   'tax'=> Shop::round_num(Shop::tax()),
		   'shipping_cost'=> Shop::round_num(Shop::shipping()),
		   'shipping_method'=> Shop::shipping_method(),
		   'total'=> Shop::round_num(Shop::newTotal()),
		]);	
        foreach (Cart::getContent() as $item) {
			$variations =  json_encode($item->model->variation);
            OrderProduct::create([
                'order_id' => $order->id,
                'product_id' => $item->model->id,
                'quantity' => $item->quantity,
                'price' => $item->price,
                'variation' =>$variations,
            ]);
        }
        $this->decreaseQuantities();
        Cart::clear();
		session()->forget('discount');
		session()->forget('discount_code');
	    Mail::send(new OrderPlaced($order));		
	    return redirect('/thankyou')->with('thank', 'Order Created successfully!');
   }
   
    protected function decreaseQuantities(){
        foreach (Cart::getContent() as $item) {
            $product = Product::find($item->model->id);
			$product->increment('sale_count');
            $product->update(['quantity' => $product->quantity - $item->quantity]);
        }
    }

    protected function productsAreNoLongerAvailable(){
        foreach (Cart::getContent() as $item) {
            $product = Product::find($item->model->id);
            if ($product->quantity < $item->quantity){
                return true;
            }
        }
        return false;
    }
}
