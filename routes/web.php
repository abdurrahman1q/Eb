<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\PageController;
use App\Http\Controllers\ShopController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\CheckoutController;
use App\Http\Controllers\CouponController;
use App\Http\Controllers\ProductVariationController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/




Route::get('/', [PageController::class, 'home'])->name('home');
Route::get('product/{slug}', [PageController::class, 'product'])->name('product');
Route::post('add-cart', [CartController::class,'add'])->name('cart.store');


Route::get('shop', [PageController::class,'shop'])->name('shop');
Route::get('/blog', [PageController::class,'blog'])->name('blog');
Route::get('/post/{slug}', [PageController::class,'post_details'])->name('post_details');
Route::get('/cart', [PageController::class,'cart'])->name('cart');
Route::get('/checkout', [PageController::class,'checkout'])->name('checkout');
Route::get('/thankyou', [PageController::class,'thankyou'])->name('thankyou');
Route::get('/page/{slug}', [PageController::class,'page'])->name('page');
Route::get('/contact', [PageController::class,'contact'])->name('contact');
Route::post('/contact-store', [PageController::class,'contact_store'])->name('contact.store');


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
Auth::routes();



//cart routes
Route::post('/add-cart',[CartController::class,'add'])->name('cart.store');
Route::post('/add-update',[CartController::class,'update'])->name('cart.update');
Route::get('/cart-destroy/{id}', [CartController::class,'destroy'])->name('cart.destroy');

//checkout routes
Route::post('/store-checkout',[CheckoutController::class,'store'])->name('checkout.store');

//shipping routes
Route::post('/shipping', [ShopController::class,'shipping'])->name('shipping');


//coupon routes
Route::post('/add-coupon', [CouponController::class,'add'])->name('coupon');
Route::get('/delete-coupon', [CouponController::class,'destroy'])->name('coupon.destroy');

//rating routes
Route::post('rating/{product_id}', [PageController::class,'rating'])->name('rating');
//search routes
Route::get('search', [PageController::class,'search'])->name('search');

//user routes
Route::get('dashboard', [HomeController::class,'dashboard'])->name('dashboard');
Route::get('orders', [HomeController::class,'orders'])->name('orders');
Route::get('invoice/{order}', [HomeController::class,'invoice'])->name('invoice');
Route::post('user-update', [HomeController::class,'update'])->name('user.update');
Route::post('change-password', [HomeController::class,'ChangePassword'])->name('change.password');




