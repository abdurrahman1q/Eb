@extends('voyager::master')

@section('page_title', 'Orders')

@section('page_header')
    <h1 class="page-title hidden-print">
        <i class="{{ $dataType->icon }}"></i> Orders &nbsp;

        @can('edit', $dataTypeContent)
        <a href="{{ route('voyager.'.$dataType->slug.'.edit', $dataTypeContent->getKey()) }}" class="btn btn-info">
            <span class="glyphicon glyphicon-pencil"></span>&nbsp;
            Edit
        </a>
        @endcan
        <a href="{{ route('voyager.'.$dataType->slug.'.index') }}" class="btn btn-warning">
            <span class="glyphicon glyphicon-list"></span>&nbsp;
            Order List
        </a>
        <button onClick="window.print()" class="btn btn-dark">
            <span class="glyphicon glyphicon-list"></span>&nbsp;
            Print
        </button>
    </h1>
    @include('voyager::multilingual.language-selector')
@stop
@section('content')
	<style type="text/css"> 
	table.dataTable tbody td, table.dataTable tbody th {
		padding: 12px 19px;
	}
	.border{
		border: 1px solid #eee;
	}
	.p-2{
		padding:15px;
	}
	</style>
<style>
@page { size: auto;  margin: 0mm; }
</style>
    <div class="page-content read container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered" style="padding-bottom:5px;">					   
				  <div class="card">
						<div class="card-body">
							  <div class="col-md-12 col-sm-12 col-xs-12 border p-2">
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
@stop

@section('javascript')
    @if ($isModelTranslatable)
    <script>
        $(document).ready(function () {
            $('.side-body').multilingual();
        });
    </script>
    <script src="{{ voyager_asset('js/multilingual.js') }}"></script>
    @endif
@stop
