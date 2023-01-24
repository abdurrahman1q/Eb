<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
	<meta name="description"          content="{{setting('site.description')}}">
	<meta property="og:url"           content="{{url('/')}}" />
	<meta property="og:type"          content="website" />
	<meta property="og:title"         content="{{setting('site.title')}}" />
	<meta property="og:description"   content="{{setting('site.description')}}" />
	<meta property="og:image"         content="{{Voyager::image(setting('site.facebook_image'))}}" />
    <title>@yield('title')</title>
	<link rel="stylesheet" href="{{asset('fonts/flaticon/flaticon.css')}}">
	<link rel="stylesheet" href="{{asset('fonts/font-awesome/fontawesome.css')}}">
	<link rel="stylesheet" href="{{asset('css/vendor/slick.css')}}">
	<link rel="stylesheet" href="{{asset('css/vendor/bootstrap.min.css')}}">
	<link rel="stylesheet" href="{{asset('css/custom/main.css')}}">
	<link rel="stylesheet" href="{{asset('css/custom/index.css')}}">
	<style type="text/css"> 
	 {!! setting('code.style') !!}
	</style>
@yield('css')
</head>
<body>
    <div id="app">
        <!--=====================================
                    HEADER PART START
        =======================================-->
        <header class="header-part">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 col-md-6 col-lg-6">
                        <ul class="header-info">
                            <li>
                                <i class="fas fa-envelope"></i>
                                <p> {{setting('site.email')}}</p>
                            </li>
                            <li>
                                <i class="fas fa-phone-alt"></i>
                                <p> {{setting('site.phone')}}</p>
                            </li>
                        </ul>
                    </div>
                    <div class="col-sm-12 col-md-6 col-lg-6">
                        <div class="header-option">
							<div class="header-curr">
								<nav class="navbar navbar-expand-lg navbar-expand-md navbar-expand-sm navbar-expand-xs">
									<!-- Right Side Of Navbar -->
									<ul class="navbar-nav">
										<!-- Authentication Links -->
										@guest
											<li class="nav-item dropdown">
												<a id="navbarDropdown" class="nav-top dropdown-toggle ml-2 text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
													My Account <span class="caret"></span>
												</a>
												<div class="dropdown-menu" aria-labelledby="navbarDropdown">
													<a class="dropdown-item border-bottom" href="{{ route('login') }}">
													  Login
													</a>	
													@if (Route::has('register'))
													<a class="dropdown-item border-bottom" href="{{ route('register') }}">
													  Signup
													</a>	
                                                    @endif													
												</div>
											</li>											
										@else
											<li class="nav-item dropdown">
												<a id="navbarDropdown" class="nav-top dropdown-toggle ml-2 text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
													{{ Auth::user()->name }} <span class="caret"></span>
												</a>
												<div class="dropdown-menu" aria-labelledby="navbarDropdown">
													<a class="dropdown-item border-bottom" href="{{ route('dashboard') }}">
													   Dashboard
													</a>	
													<a class="dropdown-item border-bottom" href="{{ route('orders') }}">
													   Orders
													</a>									
													<a class="dropdown-item border-bottom" href="{{ route('logout') }}"
													   onclick="event.preventDefault();
																	 document.getElementById('logout-form').submit();">
														{{ __('Logout') }}
													</a>

													<form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
														@csrf
													</form>
													
												</div>
											</li>
										@endguest
									</ul>
								</nav>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <nav class="navbar-part">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="navbar-element pb-2">
                            <ul class="left-widget">
                                <li><a class="icon icon-inline menu-bar" href="#"><i class="fas fa-align-left"></i></a></li>
                            </ul>
                            <a class="navbar-logo" href="{{route('home')}}">
                                <img src="{{Voyager::image(setting('site.logo'))}}" alt="logo">
                            </a>
                            <form class="search-form navbar-src" action="{{route('search')}}" method="get">
                                <input type="text" placeholder="Search anything...">
                                <button class="btn btn-inline">
                                    <i class="fas fa-search"></i>
                                    <span>search</span>
                                </button>
                            </form>
                            <ul class="right-widget">
                                <li><a class="icon icon-inline" href="{{ route('dashboard') }}"><i class="fas fa-user"></i></a></li>
                                <li><a class="icon icon-inline" href="{{route('cart')}}"><i class="fas fa-shopping-cart"></i><sup>{{Cart::getTotalQuantity()}}</sup></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="navbar-slide">
                            <div class="navbar-content">
                                {{-- <div class="navbar-slide-cross">
                                    <a class="icon icon-inline cross-btn" href="#"><i class="fas fa-times"></i></a>
                                </div> --}}
                                {{-- <form class="search-form mb-4 navbar-slide-src" action="{{route('search')}}" method="get" >
                                    <input type="text" placeholder="Search anything...">
                                    <button class="btn btn-inline">
                                        <i class="fas fa-search"></i>
                                        <span>searche</span>
                                    </button>
                                </form>  --}}
                                {!! menu('main','menus.bootstrap') !!}
                              
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </nav>		
        @yield('content')	
    </div>
	
        <!--=====================================
                     FOOTER PART START
        =======================================-->
        <footer class="footer-part">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-lg-4">
                        <div class="footer-content">
                            <a href="#"><img src="{{Voyager::image(setting('site.logo'))}}" alt="logo"></a>
							<p class="mb-1"> <i class="fa fa-map-marker"></i> {!!setting('site.address')!!}</p>
							<p class="mb-1"> <i class="fa fa-phone"></i>  {!!setting('site.phone')!!} </p>
							<p class="mb-1"><i class="fa fa-envelope"></i>  {!!setting('site.email')!!} </p>

						   <ul class="footer-icon">
                                <li><a class="icon icon-inline" href="#"><i class="fab fa-facebook-f"></i></a></li>
                                <li><a class="icon icon-inline" href="#"><i class="fab fa-twitter"></i></a></li>
                                <li><a class="icon icon-inline" href="#"><i class="fab fa-linkedin-in"></i></a></li>
                                <li><a class="icon icon-inline" href="#"><i class="fab fa-instagram"></i></a></li>
                                <li><a class="icon icon-inline" href="#"><i class="fab fa-pinterest-p"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4">
                        <div class="footer-content">
                            <h3 class="title">Useful Links</h3>
                            <div class="footer-widget">
                                <ul>
                                    <li><a href="{{route('home')}}">Home</a></li>
                                    <li><a href="{{route('dashboard')}}">My Account</a></li>
                                    <li><a href="{{route('orders')}}">Order History</a></li>
                                    <li><a href="{{route('cart')}}">Cart</a></li>
                                    <li><a href="{{route('shop')}}">Shop</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-4">
                        <div class="footer-content">
                            <h3 class="title">About us</h3>
                            <p> {!! setting('site.about') !!}</p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!--=====================================
                      FOOTER PART END
        =======================================-->
        

        <!--=====================================
                 FOOTER BOTTOM PART START
        =======================================-->
        <div class="footer-bottom">
            <div class="container">
                <p>&copy; {{setting('site.copyright')}}</p>
                <ul class="pay-card">
                    <li><a href="#"><img src="{{asset('images/pay-card/02.jpg')}}" alt="payment-2"></a></li>
                    <li><a href="#"><img src="{{asset('images/pay-card/03.jpg')}}" alt="payment-3"></a></li>
                    <li><a href="#"><img src="{{asset('images/pay-card/04.jpg')}}" alt="payment-4"></a></li>
                </ul>
            </div>
        </div>
        <!--=====================================
                 FOOTER BOTTOM PART END
        =======================================-->	
 <x-alert />
        <!-- FOR BOOTSTRAP -->
        <script src="{{asset('js/vendor/jquery-1.12.4.min.js')}}"></script>
        <script src="{{asset('js/vendor/popper.min.js')}}"></script>
        <script src="{{asset('js/vendor/bootstrap.min.js')}}"></script>

        <!-- FOR SLICK SLIDER -->
        <script src="{{asset('js/vendor/slick.min.js')}}"></script>
        <script src="{{asset('js/custom/slick.js')}}"></script>

        <!-- FOR COMMON SCRIPT -->
        <script src="{{asset('js/custom/main.js')}}"></script> 
        <!--=====================================
                    JS LINK PART END
        =======================================-->
   @yield('javascript')
   <script type="text/javascript"> 
   $('.toast').toast('show')
   </script>

 </body>
</body>
</html>
