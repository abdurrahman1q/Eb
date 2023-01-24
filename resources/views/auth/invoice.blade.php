@extends('layouts.app')
@section('title','Invoice')
@section('content')
<div class="container mt-5 mb-5">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card">
                <div class="card-header">
				  <button onclick="printDiv('printableArea')" class="btn btn-inline"><i class="fa fa-print"></i> Print</button>
				</div>
                <div class="card-body" id="printableArea">
					<div class="row">
						<div class="col-md-12">				   
							  <div class="card">
									<div class="card-body">
										  <div class="col-md-12 col-sm-12 col-xs-12">
											 <p><b>Customer Information</b></p>
											 <p><b>First Name:</b> {{ $order->first_name }}</p>
											 <p><b>Last Name:</b>{{ $order->last_name }}</p>
											 <p><b>Address :</b>{{ $order->address  }}</p>
											 <p><b>City :</b>{{ $order->city  }}</p>
											 <p><b>State :</b>{{ $order->state }}</p>
											 <p><b>ZIP:</b>{{ $order->post_code  }}</p>
											 <p><b>Tel:</b>{{ $order->phone }}</p>
											 <p><b>Email:</b>{{ $order->email }}</p>								
										  </div>
									</div> 
							   </div> 	
							  <div class="card">
									<div class="card-body">
										<div class="col-sm-12">
										<h3 class="panel-title">Product Information</h3>
											<table class="table table-hover no-footer">
												<thead>
													<tr role="row">
														<th  class="sorting" colspan="1" rowspan="1" style="width: 15px;" tabindex="0">
															Sku
														</th>
														<th  class="sorting" colspan="1" rowspan="1" style="width: 15px;" tabindex="0">
															Product Name
														</th>
														<th  class="sorting" colspan="1" rowspan="1" style="width: 15px;" tabindex="0">
															Variation
														</th>
														<th  class="sorting" colspan="1" rowspan="1" style="width: 15px;" tabindex="0">
															Qty
														</th>
														<th  class="sorting" colspan="1" rowspan="1" style="width: 15px;" tabindex="0">
															Product Price
														</th>		
														<th  class="sorting" colspan="1" rowspan="1" style="width: 15px;" tabindex="0">
															Total
														</th>
													</tr>
												</thead>
												<tbody>
													@foreach ($products as $product)	
														<tr class="even" role="row">
															<td><div>{{ $product->sku }}</div></td>
															<td><div> {{ $product->name }}</div></td>
															<td><div>  {{json_encode($product->variation)}}</div></td>
															<td><div>{{ $product->pivot->quantity  }}</div></td>												
															<td><div>{{ Shop::price($product->pivot->price)}}</div></td>												
															<td><div>{{ Shop::price($product->pivot->price *  $product->pivot->quantity)}}</div></td>												
														</tr>
													@endforeach	
												</tbody>
											</table>
										</div>							  
									</div> 
							   </div> 

							   <div class="card">
									<div class="card-body">
										<div class="col-sm-12">
										<h3 class="panel-title">Order Information Continue</h3>
											<table class="table table-hover no-footer">
												<thead>
													<tr role="row">
														<th  class="sorting" colspan="1" rowspan="1" style="width: 15px;" tabindex="0">
															Discount Code
														</th>
														<th  class="sorting" colspan="1" rowspan="1" style="width: 15px;" tabindex="0">
															Discount Amount
														</th>
														<th  class="sorting" colspan="1" rowspan="1" style="width: 15px;" tabindex="0">
															Tax
														</th>
														<th  class="sorting" colspan="1" rowspan="1" style="width: 15px;" tabindex="0">
															Shipping
														</th>
														<th  class="sorting" colspan="1" rowspan="1" style="width: 15px;" tabindex="0">
															Subtotal
														</th>
														<th  class="sorting" colspan="1" rowspan="1" style="width: 15px;" tabindex="0">
															Total
														</th>										
													</tr>
												</thead>
												<tbody>	
														<tr class="even" role="row">									
															<td><div> {{ $order->discount_code }}</div></td>												
															<td><div> {{ Shop::price($order->discount) }}</div></td>												
															<td><div> {{ Shop::price($order->tax) }}</div></td>												
															<td><div> {{ Shop::price($order->shipping_cost) }}</div></td>												
															<td><div> {{ Shop::price($order->subtotal) }}</div></td>												
															<td><div> {{ Shop::price($order->total) }}</div></td>												
														</tr>
												</tbody>
											</table>
										</div>							  
									</div> 
							   </div> 
						</div>
					</div>				
				
                </div>

            </div>
        </div>
    </div>
</div>
<script type="text/javascript"> 
function printDiv(divName) {
     var printContents = document.getElementById(divName).innerHTML;
     var originalContents = document.body.innerHTML;

     document.body.innerHTML = printContents;

     window.print();

     document.body.innerHTML = originalContents;
}
</script>
@endsection
