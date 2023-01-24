@component('mail::message')
<h1 class="title">Invoice for order #{{ $order->id }}</h1>
<div class="body-section"> 
 Hi {{ $order->first_name }} {{ $order->last_name }} <br>
 Here are the details of your order placed on {{$order->created_at->format('M d, Y')}} <br />
 
 <table class="order-details">
  <tr>
    <th>Product</th>
    <th>Quantity</th>
    <th>Price</th>
  </tr>
@foreach ($order->products as $product)  
  <tr>
    <td>{{ $product->name }}</td>
    <td>{{ $product->pivot->quantity }} </td>
    <td>{{ Shop::price($product->price) }} </td>
  </tr>
@endforeach 
</table> <br />

 <table class="order-details"> 
  <tr>
    <td class="font-weight-bold">Subtotal</td>
    <td>{{Shop::price($order->subtotal) }}</td>
  </tr>
  <tr>
    <td class="font-weight-bold">Tax</td>
    <td>{{Shop::price($order->tax) }}</td>
  </tr>
@if($order->shipping_cost > 0)
  <tr>
    <td class="font-weight-bold">Shipping Cost</td>
    <td>{{Shop::price($order->shipping_cost) }}</td>
  </tr>
@endif
@if($order->discount > 0)
  <tr>
    <td class="font-weight-bold">Discount</td>
    <td>{{Shop::price($order->discount) }}</td>
  </tr>
@endif
  <tr>
    <td class="font-weight-bold">Total</td>
    <td>{{Shop::price($order->total) }}</td>
  </tr>
</table>

<h2 class="heading">Address</h2>
<div class="border">  
   {{ $order->first_name }} {{ $order->last_name }} <br />
   {{ $order->phone }} <br />
   {{ $order->address }} <br />
   {{ $order->city }} <br />
   {{ $order->post_code }} <br />
   {{ $order->state }} <br />
</div>
@php $url = route('orders'); @endphp
@component('mail::button', ['url' => $url, 'color' => 'green'])
Show Details
@endcomponent

Thank you again for choosing us.

Regards,<br>
{{ config('app.name') }}
</div>


@endcomponent
