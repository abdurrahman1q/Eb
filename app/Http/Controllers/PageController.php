<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use App\Prodcat;
use App\Brand;
use App\Post;
use App\Page;
use Cart;
use App\Shipping;
use App\Contact;
use App\Rating;
use App\Slider;

class PageController extends Controller
{
    public function home()
    {
        $sliders = Slider::all();
        $new_products = Product::with('ratings')->Published()->where("status", 1)->latest()->limit(8)->whereNull('parent_id')->get();
        $bestsaleproducts = Product::with('ratings')->Published()->orderBy('sale_count', 'desc')->latest()->limit(8)->whereNull('parent_id')->get();
        $saleproducts = Product::with('ratings', 'categories')->Published()->whereNotNull('saleprice')->limit(8)->latest()->whereNull('parent_id')->get();
        return view('home', compact('new_products', 'sliders', 'bestsaleproducts', 'saleproducts'));
    }
    public function product($slug)
    {
        $product = Product::where('slug', $slug)->firstOrFail();
        $related_products = Product::limit(10)->get();
        return view('product', compact('product','related_products'));
    }
    public function shop()
    {
        $categories = Prodcat::with('childrens')->where('parent_id', null)->get();
        $products = Product::with('ratings')->Published()->where("featured", 1)->latest()->limit(24)->whereNull('parent_id')->get();
        return view('shop', compact('products', 'categories'));
    }
    public function blog()
    {
        $posts = Post::all();
        return view('blog', compact('posts'));
    }
    public function post_details($slug)
    {
        $popular_posts = Post::latest()->limit(10)->where('status', 'published')->get();
        $post = Post::with('user', 'category')->where('slug', $slug)->where('status', 'published')->firstOrFail();
        return view('post_details', compact('post', 'popular_posts'));
    }
    public function cart()
    {
        $products = Product::inRandomOrder()->where('status', 1)->limit(4)->whereNull('parent_id')->get();
        return view('cart', compact('products'));
    }
    public function checkout()
    {
        if (Cart::isEmpty()) {
            return redirect('/shop');
        }
        $shippings = Shipping::all();
        return view('checkout', compact('shippings'));
    }
    public function thankyou()
    {
        if (!session()->has('thank')) {
            return redirect('/shop');
        }
        return view('thankyou');
    }
    public function search()
    {
        $search = request()->search;
        $products = Product::where('name', 'LIKE', "%{$search}%")->where('status', 1)->limit(24)->whereNull('parent_id')->latest()->get();
        return view('search', compact('products'));
    }
    public function contact()
    {
        return view('contact');
    }
    public function contact_store(Request $request)
    {
        $request->validate([
            'name' => ['required', 'max:40'],
            'email' => ['required', 'max:100', 'email'],
            'subject' => ['required', 'max:100'],
            'message' => ['required', 'max:2000'],
        ]);
        Contact::create([
            'name' => $request->name,
            'email' => $request->email,
            'subject' => $request->subject,
            'message' => $request->message,
        ]);
        return back()->with('success_msg', 'Message sent successfully');
    }
    public function page($slug)
    {
        $page = Page::where('slug', '=', $slug)->where('status', 'ACTIVE')->firstOrFail();
        return view('page', compact('page'));
    }
    public function rating(Request $request)
    {
        //return $request->all();
        Rating::create([
            "name" => $request->name,
            "email" => $request->email,
            "rating" => $request->rating,
            "review" => $request->comment,
            "product_id" => $request->product_id,
        ]);
        return back()->with('success_msg', 'Thanks for your review');
        //return back()->withErrors('Sorry! One of the items in your cart is no longer Available!');
    }
}
