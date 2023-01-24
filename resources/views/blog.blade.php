@extends('layouts.app')
@section('title','blog')
@section('content')
<div class="shop bg-white pt-3 pb-3" >
 <div class="container">
    <div class="row">
         <x-posts :posts="$posts"/>
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