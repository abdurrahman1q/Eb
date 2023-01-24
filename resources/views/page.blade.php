@extends('layouts.app')
@section('title',$page->title)
@section('content')
	<div class="pages pt-5 bg-white"> 
		<div class="container">
			<h3 class="h3 mb-1 heading">{{$page->title}} </h3>
			<hr />	
			<div class="row">
				<div class="col-md-12"> 
				   {!! $page->body !!}
				</div>
			</div>
		</div>
	</div>
@endsection
