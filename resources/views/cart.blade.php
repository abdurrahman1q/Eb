@extends('layouts.app')
@section('title','cart')
@section('css')
<link rel="stylesheet" href="{{asset('css/custom/cartlist.css')}}">
@endsection
@section('content')
<section class="single-banner">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="single-content">
                            <h2>Cartlist</h2>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{route('home')}}">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Cartlist</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </section>

<div class="cart-part pt-3 pb-3">
		<div class="container">
		<div class="row justify-content-center mb-2"> 
			@if(Cart::getTotalQuantity() > 0)

			@else
			   <div class="col-md-6"> 
				    <a class="btn btn-inline btn-block" href="{{route('shop')}}">Continue Shopping</a>		   
			   </div>
			 @endif
		</div>
		@if(Cart::getTotalQuantity() > 0)
			<div class="row">
				<table class="table-list">
					<thead>
						<tr>
							<th scope="col"></th>
							<th scope="col">Product</th>
							<th scope="col">Price</th>
							<th scope="col">Quantity</th>
							<th scope="col">Total</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
					@foreach(Cart::getContent() as $product)
						<tr>
							<td> 
							  <a href="{{$product->model->path()}}" class="text-secondary"> 
							    <img src=" {{Voyager::image($product->model->image)}}" alt="" style="width:50px" />
							  </a>
							</td>						
							<td> 
							  <a href="{{$product->model->path()}}" class="text-secondary">{{$product->model->name}}</a> <br />
							   @if($product->model->variation)
								 {{json_encode($product->model->variation)}}
							   @endif
							</td>
							<td>{{Shop::price($product->price)}}</td>
							<td>
								<form action="{{route('cart.update')}}" method="post">
									@csrf
									<input type="hidden" name="product_id" value="{{$product->id}}" />				
									<div class="input-group mb-3">
									  <input name="quantity" class="form-control" min="1" step="1" type="number" value="{{$product->quantity}}" style="width:50px">
									  <div class="input-group-append">
										<input type="submit" class="btn btn-inline py-0 px-2" value="update">
									  </div>
									</div>									
								</form>			
							</td>
							<td>{{Shop::price($product->getPriceSum())}}</td>
							<td class="table-action"> 
								<a href="{{url('/cart-destroy/'.$product->id)}}"><i class="fas fa-trash-alt"></i></a>
							</td>

						</tr>
					@endforeach
					</tbody>
				</table>
			</div>
	<div class="row mt-3">
		<div class="col-md-6 col-lg-6">
			<div class="cart-back">
				<a class="btn btn-inline" href="{{route('shop')}}"><i class="fas fa-undo-alt"></i><span>Back to Shop</span></a>
			</div>
		</div>
		@if(!session()->has('discount'))
		<div class="col-md-6 col-lg-6">
			<div class="cart-cupon">
				<form action="{{route('coupon')}}" method="post">
				@csrf
					<input placeholder="Coupon Code"name="coupon_code" type="text"><button class="btn btn-inline" type="submit"><i class="fas fa-cut"></i><span>Apply Now</span></button>
				</form>
			</div>
		</div>
		@endif
	</div>	
	<div class="row">
		<div class="col-lg-12">
			<div class="cart-totals">
				<h2 class="title">Cart Totals</h2>
				<ul>
					<li><span>Tax</span><span>{{Shop::price(Shop::tax())}}</span></li>
					@if(session()->has('discount'))
					<li><span>Discount <a href="{{route('coupon.destroy')}}"> ( Remove )</a></span><span>{{Shop::price(session()->get('discount'))}}</span></li>
					@endif
					<li><span>Subtotal</span><span>{{Shop::price(Cart::getSubTotal())}}</span></li>
					<li><span>Total</span><span>{{Shop::price(Shop::newSubtotal())}}</span></li>
				</ul>
			</div>
			<div class="cart-proceed">
				<a class="btn btn-inline" href="{{route('checkout')}}"><i class="fas fa-check"></i><span>Proceed to Checkout</span></a>
			</div>
		</div>
	</div>	
		@else
		<div class="row"> 
		   <div class="col-md-12"> 
		      <h3 class="m-4 poppins text-center "> No items in cart</h3>
		   </div>
		</div>
		@endif
		
			<div class="row mt-5 poppins"> 
				<div class="col-md-12">
					<h3 class="border-bottom pb-2">Product you may like</h3>
				</div>
				 <x-products :products="$products"/>
			</div>
		</div>
	</div>

@endsection
@section('javascript')
<script type="text/javascript"> 
$(document).ready(function() {

});
</script>

@endsection