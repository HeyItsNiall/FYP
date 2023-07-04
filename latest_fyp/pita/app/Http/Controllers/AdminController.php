<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Product;
use App\Models\Order;
use App\Models\Booking;
use App\Models\Stock;
use App\Models\Stocklist;
use PDF;
use Notification;
use App\Notifications\SendEmailNotification;
use Illuminate\Support\Facades\Auth;

class AdminController extends Controller
{
    public function view_category()
    {
        if (Auth::id()) {
            $data = category::all();

            return view('admin.category', compact('data'));
        } else {
            return redirect('login');
        }
    }

    public function add_category(Request $request)
    {

        if (Auth::id()) {
            $data = new category;
            $data->category_name = $request->category;
            $data->save();

            return redirect()->back()->with('message', 'Category Added Successfully');
        } else {
            return redirect('login');
        }
    }

    public function delete_category($id)
    {

        if (Auth::id()) {
            $data = category::find($id);

            $data->delete();

            return redirect()->back()->with('message', 'Category Deleted Successfully');
        } else {
            return redirect('login');
        }
    }

    public function view_product()
    {
        if (Auth::id()) {
            $category = category::all();
            return view('admin.product', compact('category'));
        } else {
            return redirect('login');
        }
    }

    public function add_product(Request $request)
    {

        if (Auth::id()) {

            $product = new product;

            $product->title = $request->title;
            $product->description = $request->description;
            $product->price = $request->price;
            $product->quantity = $request->quantity;
            $product->discount_price = $request->dis_price;
            $product->category = $request->category;

            $image = $request->image;

            $imagename = time() . '.' . $image->getClientOriginalExtension();

            $request->image->move('product', $imagename);

            $product->image = $imagename;


            $product->save();

            return redirect()->back()->with('message', 'Product Added Successfully');
        } else {
            return redirect('login');
        }
    }

    public function show_product()
    {
        if (Auth::id()) {
            $product = product::all();
            return view('admin.show_product', compact('product'));
        } else {
            return redirect('login');
        }
    }

    public function delete_product($id)
    {
        if (Auth::id()) {
            $product = product::find($id);

            $product->delete();

            return redirect()->back()->with('message', 'Product Deleted Successfully');
        } else {
            return redirect('login');
        }
    }

    public function update_product($id)
    {
        if (Auth::id()) {
            $product = product::find($id);
            $category = category::all();
            return view('admin.update_product', compact('product', 'category'));
        } else {
            return redirect('login');
        }
    }

    public function update_product_confirm(Request $request, $id)
    {
        if (Auth::id()) {

            $product = product::find($id);
            $product->title = $request->title;
            $product->description = $request->description;
            $product->price = $request->price;
            $product->quantity = $request->quantity;
            $product->discount_price = $request->dis_price;
            $product->category = $request->category;


            $image = $request->image;

            if ($image) {
                $imagename = time() . '.' . $image->getClientOriginalExtension();

                $request->image->move('product', $imagename);

                $product->image = $imagename;
            }

            $product->save();

            return redirect()->back()->with('message', 'Product Updated Successfully');
        } else {
            return redirect('login');
        }
    }

    public function order()
    {
        if (Auth::id()) {
            $order = order::all();
            return view('admin.order', compact('order'));
        } else {
            return redirect('login');
        }
    }

    public function delivered($id)
    {
        $order = Order::find($id);

        if ($order) {
            $order->delivery_status = 'delivered';
            $order->payment_status = 'paid';
            $order->save();

            return redirect()->back()->with('message', 'Order marked as delivered successfully.');
        } else {
            return redirect('login');
        }
    }


    public function print_pdf($id)
    {

        if (Auth::id()) {
            $order = order::find($id);
            $pdf = PDF::loadView('admin.pdf', compact('order'));
            return $pdf->download('order_details.pdf');
        } else {

            return redirect('login');
        }
    }

    public function send_email($id)
    {

        if (Auth::id()) {
            $order = order::find($id);

            return view('admin.email_info', compact('order'));
        } else {

            return redirect('login');
        }
    }

    public function send_user_email(Request $request, $id)
    {

        if (Auth::id()) {
            $order = order::find($id);

            $details = [
                'greeting' => $request->greeting,
                'firstline' => $request->firstline,
                'body' => $request->body,
                'button' => $request->button,
                'url' => $request->url,
                'lastline' => $request->lastline,
            ];

            Notification::send($order, new SendEmailNotification($details));

            return redirect()->back();
        } else {
            return redirect('login');
        }
    }

    public function searchdata(Request $request)
    {
        if (Auth::id()) {
            $searchText = $request->search;

            $order = order::where('name', 'LIKE', "%$searchText%")
                ->orWhere('phone', 'LIKE', "%$searchText%")
                ->orWhere('product_title', 'LIKE', "%$searchText%")
                ->get();
            return view('admin.order', compact('order'));
        } else {
            return redirect('login');
        }
    }

    public function view_reservations()
    {

        if (Auth::id()) {
            $bookings = Booking::all();
            return view('admin.view_reservations', compact('bookings'));
        } else {
            return redirect('login');
        }
    }

    public function completed_reservations()
    {

        if (Auth::id()) {
            $bookings = Booking::get();
            return view('admin.completed_reservations', compact('bookings'));
        } else {
            return redirect('login');
        }
    }

    public function completeBooking($id)
    {
        $booking = Booking::findOrFail($id);

        // Update the booking's status to "Complete"
        $booking->reservations_status = 'Complete';
        $booking->save();

        // Redirect back to the completed reservations list
        return redirect()->route('completed_reservations')->with('success', 'Reservation status updated to Complete.');
    }

    public function accept($id)
    {

        if (Auth::id()) {
            $bookings = Booking::find($id);
            $bookings->status = "accepted";
            $bookings->save();

            return redirect()->back();
        } else {
            return redirect('login');
        }
    }

    public function stock()
    {

        if (Auth::id()) {
            return view('admin.stock');
        } else {
            return redirect('login');
        }
    }

    public function add_stock(Request $request)
    {
        if (Auth::id()) {
            $stock = new Stock;
            $stock->materials_name = $request->material_name;
            $stock->quantity = $request->quantity;
            $stock->save();

            // Deduct the requested quantity from the stocklist
            $stocklist = Stocklist::where('stock_name', $request->material_name)->first();
            $stocklist->quantity -= $request->quantity;
            $stocklist->save();

            return redirect()->back()->with('message', 'Stock Request Has Been Successfully Made');
        } else {
            return redirect('login');
        }
    }


    public function stock_requested()
    {

        if (Auth::id()) {
            $stock = stock::all();
            return view('admin.stock_requested', compact('stock'));
        } else {
            return redirect('login');
        }
    }



    public function acceptReservation($id)
    {
        $bookings = Booking::findOrFail($id);
        $bookings->status = 'accepted';
        $bookings->save();

        return redirect()->back()->with('message', 'Reservation Accepted Successfully');
    }

    public function enterPrice(Request $request)
    {
        $validatedData = $request->validate([
            'booking_id' => 'required|integer',
            'price' => 'required|numeric|min:0',
        ]);

        $bookingId = $validatedData['booking_id'];
        $price = $validatedData['price'];

        $bookings = Booking::findOrFail($bookingId);
        $bookings->price = $price;
        $bookings->save();

        return redirect()->back()->with('message', 'Price Entered Successfully');
    }

    public function updateBookingStatus(Request $request, $id)
    {

        if (Auth::id()) {
            $bookings = Booking::findOrFail($id);
            $action = $request->input('action');

            if ($action == 'accept') {
                $bookings->action = 'accepted';
            } elseif ($action == 'cancel') {
                $bookings->action = 'cancelled';
            } elseif ($action == 'negotiate') {
                // Handle price negotiation logic here
            }

            $bookings->save();

            return redirect()->back()->with('message', 'Booking status updated successfully.');
        } else {
            return redirect('login');
        }
    }
}