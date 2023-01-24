@extends('layouts.app')
@section('title','checkout')
@section('css')
   <link rel="stylesheet" href="{{asset('css/custom/checkout.css')}}">
@endsection
@section('content')
@php 
 if(Auth::check()){
	 $user = Auth::user();
 }else{
	$userarray = [
	  "first_name"=>"",
	  "last_name"=>"",
	  "email"=>"",
	  "phone"=>"",
	  "address"=>"",
	  "city"=>"",
	  "post"=>"",
	  "state"=>"",
	  "country"=>"",
	];
	$user = (object)$userarray;	 
 }

@endphp
<section class="single-banner">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="single-content">
                            <h2>Checkout</h2>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{route('home')}}">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Checkout</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </section>
<section class="checkout-part">
		<div class="container">
			<div class="row">
			@guest
				<div class="col-lg-12">
					<div class="checkout-action">
						<i class="fas fa-external-link-alt"></i>
						<span>Returning customer? <a href="{{route('login')}}">Click here to login</a></span>
					</div>
				</div>	
             @endguest	
				<div class="col-lg-12">
					<div class="check-form-title">
						<h3>Checkout</h3>
					</div>
				</div>			 
				<div class="col-md-12"> 
                    <form method="POST" action="{{ route('checkout.store') }}">
					@csrf
						<div class="row"> 
							<div class="col-md-6"> 
							   <div class="form-group">
								<label for="first_name">First Name</label>
								<input value="{{old('first_name',$user->first_name)}}" type="text" class="form-control @error('first_name') is-invalid @enderror" id="first_name" placeholder="First Name" name="first_name" required>
                                @error('first_name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror							 
							 </div>					
							</div>
							<div class="col-md-6"> 
							   <div class="form-group">
								<label for="last_name">Last Name</label>
								<input value="{{old('last_name',$user->last_name)}}" type="text" class="form-control @error('last_name') is-invalid @enderror" id="last_name" placeholder="Last Name" name="last_name"  required>
                                @error('last_name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror							  
							  </div>					
							</div>
							<div class="col-md-12"> 
							   <div class="form-group">
								<label for="email">Email</label>
								<input value="{{old('email',$user->email)}}" name="email"  type="text" class="form-control @error('email') is-invalid @enderror" id="email" placeholder="email" required >
                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror							  
							  </div>					
							</div>						
							<div class="col-md-12"> 
							   <div class="form-group">
								<label for="address">Address</label>
								<input value="{{old('address',$user->address) }}" type="text" class="form-control @error('address') is-invalid @enderror" id="address" placeholder="address" name="address"required >
                                @error('address')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror							  
							  </div>					
							</div>
							<div class="col-md-6"> 
							   <div class="form-group">
								<label for="phone">Phone</label>
								<input value="{{old('phone',$user->phone) }}" type="number" minlength="6" class="form-control @error('phone') is-invalid @enderror" id="phone" placeholder="phone" name="phone" required>
                                @error('phone')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror							  
							  </div>					
							</div>								
							<div class="col-md-6"> 
							   <div class="form-group">
								<label for="city">City</label>
								<input value="{{old('city',$user->city) }}" type="text" class="form-control @error('city') is-invalid @enderror" id="city" placeholder="city" name="city" required>
                                @error('city')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror							 
							 </div>					
							</div>
							<div class="col-md-6"> 
							   <div class="form-group">
								<label for="state">State</label>
								<input value="{{old('state',$user->state) }}" type="text" class="form-control @error('state') is-invalid @enderror" id="state" placeholder="state" name="state" required>
                                @error('state')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror							 
							 </div>					
							</div>
							<div class="col-md-6"> 
							   <div class="form-group">
								<label for="post_code">Post Code</label>
								<input value="{{old('post_code',$user->post) }}" type="number" step="1" class="form-control @error('post_code') is-invalid @enderror" id="post_code" placeholder="post code" name="post_code"required >
                                @error('post_code')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror							 
							 </div>					
							</div>
							<div class="col-md-6"> 
							   <div class="form-group">
								<button class="btn btn-inline" type="submit"> Place Order</button>
							  </div>					
							</div>
						</div>
                    </form>			
				</div>
			</div>
		@if(Cart::getTotalQuantity() > 0)
			<div class="row mb-4">
			  <div class="col-md-12"> 
					<div class="check-form-title">
						<h3>Confirm Order</h3>
					</div>
			  </div>
			  <div class="table-scroll"> 
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
									  <input name="quantity" class="form-control" min="1" step="1" type="number" value="{{$product->quantity}}" style="width:80px">
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
		    </div>	
            @endif			
			<div class="row">
				<div class="col-lg-12">
					<div class="checkout-charge">
						<ul>
							<li><span>Tax</span><span>{{Shop::price(Shop::tax())}}</span></li>
							@if(session()->has('discount'))
							<li><span>Discount <a href="{{route('coupon.destroy')}}"> ( Remove )</a></span><span>{{Shop::price(session()->get('discount'))}}</span></li>
							@endif								
						{{--<li>
								<span>Shipping Cost</span>
								<span>{{Shop::price(Shop::shipping())}}</span>
						    </li>		--}}				
							<li>
								<span>Subtotal</span>
								<span>{{Shop::price(Cart::getSubTotal())}}</span>
							</li>
							<li>
								<span>Total</span>
								<span>{{Shop::price(Shop::newTotal())}}</span>
							</li>
						</ul>
					</div>
				</div>
			</div>			
		</div>
        </section>

@endsection
@section('javascript')
<script type="text/javascript"> 
	function shipping() {
		var shipping_id = $('#shipping_method :selected').val();
        // console.log(shipping_id);
		$.ajax({
			url: "/shipping",
			method: "post",
			data: {
				shipping_id: shipping_id,
				_token: '{{csrf_token()}}'
			},
			success: function(response) {
				location.reload();
			}
		});
	}
</script>

@endsection