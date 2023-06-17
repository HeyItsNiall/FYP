<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\Product;
use App\Models\Cart;
use App\Models\Order;
use App\Models\Comment;
use App\Models\Reply;
use App\Models\Stock;
use App\Models\Stocklist;
use Session;
use Stripe;
use RealRashid\SweetAlert\Facades\Alert;
use App\Models\Booking;
use DB;

class HomeController extends Controller
{

    public function index()
    {

        $product = Product::paginate(10);
        $comment = comment::orderby('id', 'desc')->get();
        $reply = reply::all();

        return view('home.userpage', compact('product', 'comment', 'reply'));
    }

    public function redirect()
    {

        $usertype = Auth::user()->usertype;

        if ($usertype == '1') {

            $total_product = product::all()->count();
            $total_order = order::all()->count();
            $total_user = user::all()->count();
            $order = order::all();
            $total_revenue = 0;
            foreach ($order as $order) {

                $total_revenue = $total_revenue + $order->price;
            }

            $total_delivered = order::where('delivery_status', '=', 'delivered')->get()->count();
            $total_processing = order::where('delivery_status', '=', 'processing')->get()->count();


            return view('admin.home', compact('total_product', 'total_order', 'total_user', 'total_revenue', 'total_delivered', 'total_processing'));
        } elseif ($usertype == '2') {
            return view('transporter.home');
        } elseif ($usertype == '3') {
            return view('supplier.home');
        } else {

            $product = Product::paginate(10);
            $comment = comment::orderby('id', 'desc')->get();
            $reply = reply::all();
            return view('home.userpage', compact('product', 'comment', 'reply'));
        }
    }

    public function product_details($id)
    {
        $product = product::find($id);

        return view('home.product_details', compact('product'));
    }

    public function add_cart(Request $request, $id)
    {
        if (Auth::id()) {

            $user = Auth::user(); //this will get the specific user

            $userid = $user->id;

            $product = product::find($id);

            $product_exist_id = cart::where('product_id', '=', $id)->where('user_id', '=', $userid)->get('id')->first();

            if ($product_exist_id) {

                $cart = cart::find($product_exist_id)->first();

                $quantity = $cart->quantity;

                $cart->quantity = $quantity + $request->quantity;

                if ($product->discount_price != null) {

                    $cart->price = $product->discount_price * $cart->quantity;
                } else {
                    $cart->price = $product->price * $cart->quantity;
                }

                $cart->save();

                Alert::success('Product Added Successfully', 'We have added product to the cart');

                return redirect()->back()->with('message', 'Product Added Successfully');
            } else {
                $cart = new cart;

                $cart->name = $user->name;
                $cart->email = $user->email;
                $cart->phone = $user->phone;
                $cart->address = $user->address;
                $cart->user_id = $user->id;

                $cart->product_title = $product->title;

                if ($product->discount_price != null) {

                    $cart->price = $product->discount_price * $request->quantity;
                } else {
                    $cart->price = $product->price * $request->quantity;
                }

                $cart->image = $product->image;
                $cart->product_id = $product->id;

                $cart->quantity = $request->quantity;

                $cart->save();

                return redirect()->back()->with('message', 'Product Added Successfully');
            }
        } else {
            return redirect('login');
        }
    }

    public function show_cart()
    {

        if (Auth::id()) {
            $id = Auth::user()->id;

            $cart = cart::where('user_id', '=', $id)->get();
            return view('home.showcart', compact('cart'));
        } else {
            return redirect('login');
        }
    }

    public function remove_cart($id)
    {

        $cart = cart::find($id);
        $cart->delete();
        return redirect()->back();
    }

    public function cash_order()
    {
        $user = Auth::user(); /* getting the user log in data */

        $userid = $user->id;

        $data = cart::where('user_id', '=', $userid)->get(); /* this will search the userid from the order table and list it all out */

        foreach ($data as $data) { /* using foreach to sending multiple datatype */

            $order = new order;

            $order->name /* name from the order table */ = $data->name /* name from the cart table */;
            $order->email = $data->email;
            $order->phone = $data->phone;
            $order->address = $data->address;
            $order->user_id = $data->user_id;
            $order->product_title = $data->product_title;
            $order->price = $data->price;
            $order->quantity = $data->quantity;
            $order->image = $data->image;
            $order->product_id = $data->product_id;

            $order->payment_status = 'cash on delivery';
            $order->delivery_status = 'processing';

            $order->save();

            $cart_id = $data->id;
            $cart = cart::find($cart_id);
            $cart->delete();
        }

        return redirect()->back()->with('message', 'Orders Successfully Made! ');
    }

    public function stripe($totalprice)
    {
        return view('home.stripe', compact('totalprice'));
    }

    public function stripePost(Request $request, $totalprice)
    {

        Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));

        Stripe\Charge::create([
            "amount" => $totalprice * 100,
            "currency" => "myr",
            "source" => $request->stripeToken,
            "description" => "Test payment from itsolutionstuff.com."
        ]);

        $user = Auth::user(); /* getting the user log in data */

        $userid = $user->id;

        $data = cart::where('user_id', '=', $userid)->get(); /* this will search the userid from the order table and list it all out */

        foreach ($data as $data) { /* using foreach to sending multiple datatype */

            $order = new order;

            $order->name /* name from the order table */ = $data->name /* name from the cart table */;
            $order->email = $data->email;
            $order->phone = $data->phone;
            $order->address = $data->address;
            $order->user_id = $data->user_id;
            $order->product_title = $data->product_title;
            $order->price = $data->price;
            $order->quantity = $data->quantity;
            $order->image = $data->image;
            $order->product_id = $data->product_id;

            $order->payment_status = 'Paid';
            $order->delivery_status = 'processing';

            $order->save();

            $cart_id = $data->id;
            $cart = cart::find($cart_id);
            $cart->delete();
        }


        Session::flash('success', 'Payment successful!');

        return back();
    }

    public function show_order()
    {

        if (Auth::id()) {

            $user = Auth::user();
            $userid = $user->id;

            $order = order::where('user_id', '=', $userid = $userid)->get();

            return view('home.order', compact('order'));
        } else {
            return redirect('login');
        }
    }

    public function cancel_order($id)
    {

        $order = order::find($id);
        $order->delivery_status = 'You cancelled the order';

        $order->save();

        return redirect()->back();
    }

    public function add_comment(Request $request)
    {

        if (Auth::id()) {

            $comment = new comment;

            $comment->name = Auth::user()->name;
            $comment->user_id = Auth::user()->id;
            $comment->comment = $request->comment;

            $comment->save();

            return redirect()->back();
        } else {
            return redirect('login');
        }
    }

    public function add_reply(Request $request)
    {

        if (Auth::id()) {

            $reply = new reply;

            $reply->name = Auth::user()->name;
            $reply->user_id = Auth::user()->id;
            $reply->comment_id = $request->commentId;
            $reply->reply = $request->reply;

            $reply->save();

            return redirect()->back();
        } else {
            return redirect('login');
        }
    }

    public function product_search(Request $request)
    {
        $comment = comment::orderby('id', 'desc')->get();
        $reply = reply::all();
        $search_text = $request->search;
        $product = product::where('title', 'LIKE', "%$search_text%")->orWhere('category', 'LIKE', "%$search_text%")->paginate(10);

        return view('home.userpage', compact('product', 'comment', 'reply'));
    }

    public function product()
    {

        $product = Product::paginate(10);
        $comment = comment::orderby('id', 'desc')->get();
        $reply = reply::all();
        return view('home.all_product', compact('product', 'comment', 'reply'));
    }
    public function search_product(Request $request)
    {
        $comment = comment::orderby('id', 'desc')->get();
        $reply = reply::all();
        $search_text = $request->search;
        $product = product::where('title', 'LIKE', "%$search_text%")->orWhere('category', 'LIKE', "%$search_text%")->paginate(10);

        return view('home.all_product', compact('product', 'comment', 'reply'));
    }

    public function reservations()
    {
        if (Auth::id()) {
            return view('home.reservations');
        } else {
            return redirect('login');
        }
    }

    public function add_booking(Request $request)
    {
        if (Auth::id()) {
            $bookings = new Booking;

            $bookings->cust_name = $request->cust_name;
            $bookings->cust_email = $request->cust_email;
            $bookings->cust_phone = $request->cust_phone;
            $bookings->furniture_type = $request->furniture_type;
            $bookings->repair_details = $request->repair_details;
            $bookings->date = $request->date;
            $bookings->time_slot = $request->time_slot;
            $bookings->user_id = $request->user_id;
            $images = $request->file('images');

            foreach ($images as $image) {
                $imagename = time() . '.' . $image->getClientOriginalExtension();
                $image->move('booking', $imagename);

                $bookings->images = $imagename;
            }
            $bookings->save();

            return redirect()->back()->with('message', 'Booking Made Successfully');
        } else {
            return redirect('login');
        }
    }

    public function manage_booking()
    {

        $user = Auth::user(); //logged user data will get

        $userid = $user->id;

        $bookings = Booking::where('user_id', '=', $userid)->get();

        return view('home.manage_booking', compact('bookings'));
    }

    public function supplier_stock()
    {
        if (Auth::id()) {
            $stock = Stock::all();
            return view('supplier.supplier_stock', compact('stock'));
        } else {
            return redirect('login');
        }
    }

    public function stocklist()
    {

        if (Auth::id()) {
            $stocklists = stocklist::all();
            return view('supplier.stocklist', compact('stocklists'));
        } else {
            return redirect('login');
        }
    }

    public function add_stocklist(Request $request)
    {
        if (Auth::id()) {

            $stocklists = new stocklist;
            $stocklists->stock_name = $request->stock_name;
            $stocklists->description = $request->description;
            $stocklists->quantity = $request->quantity;
            $stocklists->price = $request->price;
            $stocklists->save();

            return redirect()->back()->with('message', 'Stocklist Added Successfully');
        } else {
            return redirect('login');
        }
    }

    public function delete_stock($id)
    {

        if (Auth::id()) {

            $stocklists = stocklist::find($id);
            $stocklists->delete();

            return redirect()->back()->with('message', 'Stock Deleted Successfully');
        } else {
            return redirect('login');
        }
    }

    public function update_stock(Request $request, $id)
    {

        if (Auth::id()) {
            $stocklists = stocklist::find($id);
            return view('supplier.stocklist', compact('stocklists'));
        } else {
            return redirect('login');
        }
    }

    public function pickuplist()
    {
        if (Auth::id()) {
            $bookings = Booking::all();
            return view('transporter.pickuplist', compact('bookings'));
        } else {
            return redirect('login');
        }
    }

    public function deliverylist()
    {
        if (Auth::id()) {
            $orders = DB::table('orders')
            ->where('delivery_status', 'processing')
            ->get();
            return view('transporter.deliverylist', compact('orders'));
        } else {
            return redirect('login');
        }
    }
}
