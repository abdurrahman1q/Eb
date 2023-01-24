@extends('layouts.app')
@section('title',$post->title)
@section('content')
<div class="container py-4">

					<div class="row ">
						<div class="col-lg-9 mx-auto text-center">
							<div class="blog-posts single-post">
								<article class="post post-large blog-single-post border-0 m-0 p-0">
									<div class="post-content ml-0">
										<h2 class="font-weight-bold titillium "><a href="{{url('/post/'.$post->slug)}}">{{$post->title}}</a></h2>
									
										{!! $post->body !!}
							
									</div>
								</article>
							
							</div>
						</div>					
					</div>

				</div>
@endsection
