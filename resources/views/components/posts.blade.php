@foreach($posts as $post)
	  <div class="col-md-4 mt-3">
		  <div class="card">
			<img class="card-img-top" src="{{Voyager::image($post->image)}}" alt="Card image cap">
			<div class="card-body">
			  <h5 class="card-title"><a href="{{route('post_details',$post->slug)}}">{{$post->title}}</a></h5>
				<p class="post-meta">
						<span class="post-meta-author"><i class="fa fa-user"></i> <a href="#" title="">{{$post->user->name}} </a></span>
						<span class="tie-date"><i class="fa fa-clock"></i> {{ $post->created_at->diffForHumans() }}</span>
						<span class="post-cats"><i class="fa fa-folder"></i> <a href="" rel="category tag">{{$post->category->name}} </a></span>
				 </p>						  
			  <p class="card-text">
			  {!! Str::limit(strip_tags($post->body), $limit = 200, $end = '...') !!}
			  </p>
			</div>
		  </div>
	  </div>
  @endforeach
