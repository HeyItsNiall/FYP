<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\AdminController;

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

Route::get('/', [HomeController::class, 'index']);

// Route::middleware(['auth:sanctum', config('jetstream.auth_session'),'verified'])->group(function () {
//     Route::get('/dashboard', function () {
//         return view('dashboard');
//     })->name('dashboard');
// });

// User Grouping
Route::group(['middleware' => ['role:0']], function () {
    // Routes accessible only to users with 'admin' role

    // ...
});

// Admin Grouping
Route::group(['middleware' => ['role:1']], function () {
    // Routes accessible only to users with 'admin' role
    Route::get('/order', [AdminController::class, 'order']);

    // ...
});

// Transporter Grouping
Route::group(['middleware' => ['role:2']], function () {
    // Routes accessible only to users with 'admin' role
    Route::get('/deliverylist', [HomeController::class, 'deliverylist'])->name('deliverylist');

    // ...
});

// Supplier Grouping
Route::group(['middleware' => ['role:3']], function () {
    // Routes accessible only to users with 'admin' role

    // ...
});


Route::get('/redirect', [HomeController::class, 'redirect'])->name('dashboard');

Route::get('/view_category', [AdminController::class, 'view_category']);
Route::post('/add_category', [AdminController::class, 'add_category']);
Route::get('/delete_category/{id}', [AdminController::class, 'delete_category']);

Route::get('/view_product', [AdminController::class, 'view_product']);
Route::post('/add_product', [AdminController::class, 'add_product']);
Route::get('/show_product', [AdminController::class, 'show_product']);
Route::get('/delete_product/{id}', [AdminController::class, 'delete_product']);
Route::get('/update_product/{id}', [AdminController::class, 'update_product']);
Route::post('/update_product_confirm/{id}', [AdminController::class, 'update_product_confirm']);

Route::get('/delivered/{id}', [AdminController::class, 'delivered']);
Route::get('/print_pdf/{id}', [AdminController::class, 'print_pdf']);
Route::get('/send_email/{id}', [AdminController::class, 'send_email']);
Route::post('/send_user_email/{id}', [AdminController::class, 'send_user_email']);
Route::get('/search', [AdminController::class, 'searchdata']);


Route::get('/product_details/{id}', [HomeController::class, 'product_details']);
Route::post('/add_cart/{id}', [HomeController::class, 'add_cart']);
Route::get('/show_cart', [HomeController::class, 'show_cart']);
Route::get('/remove_cart/{id}', [HomeController::class, 'remove_cart']);

Route::get('/cash_order', [HomeController::class, 'cash_order']);


Route::get('/stripe/{totalprice}', [HomeController::class, 'stripe']);
Route::post('stripe/{totalprice}', [HomeController::class, 'stripePost'])->name('stripe.post');


Route::get('/show_order', [HomeController::class, 'show_order']);
Route::get('/cancel_order/{id}', [HomeController::class, 'cancel_order']);
Route::post('/add_comment', [HomeController::class, 'add_comment']);
Route::post('/add_reply', [HomeController::class, 'add_reply']);
Route::get('/product_search', [HomeController::class, 'product_search']);

Route::get('/products', [HomeController::class, 'product']);
Route::get('/search_product', [HomeController::class, 'search_product']);

Route::get('/reservations', [HomeController::class, 'reservations']);
Route::post('/add_booking', [HomeController::class, 'add_booking']);
Route::get('/manage_booking', [HomeController::class, 'manage_booking'])->name('manage_booking');

Route::get('/view_reservations', [AdminController::class, 'view_reservations']);
Route::get('/completed_reservations', [AdminController::class, 'completed_reservations'])->name('completed_reservations');
Route::put('/completeBooking/{id}', [AdminController::class, 'completeBooking'])->name('completeBooking');

Route::get('/accept/{id}', [AdminController::class, 'accept']);
Route::get('/stock', [AdminController::class, 'stock']);
Route::post('/add_stock', [AdminController::class, 'add_stock']);
Route::get('/stock_requested', [AdminController::class, 'stock_requested']);

Route::get('/supplier_stock', [HomeController::class, 'supplier_stock']);
Route::get('/stocklist', [HomeController::class, 'stocklist'])->name('stocklist');
Route::post('/add_stocklist', [HomeController::class, 'add_stocklist']);
Route::get('/delete_stock/{id}', [HomeController::class, 'delete_stock']);
Route::get('/update_stock/{id}', [HomeController::class, 'update_stock'])->name('update_stock');
Route::get('/show_stock', [HomeController::class, 'show_stock'])->name('show_stock');
Route::post('/update_stock_confirm/{id}', [HomeController::class, 'update_stock_confirm']);

Route::get('/pickuplist', [HomeController::class, 'pickuplist'])->name('pickuplist');
Route::post('/enter_amount/{id}', [HomeController::class, 'enterAmount'])->name('enter_amount');
Route::post('/pickup.update/{id}', [HomeController::class, 'updatePickupStatus'])->name('pickup.update');
Route::put('/updateDeliveryStatus/{id}', [HomeController::class, 'updateDeliveryStatus'])->name('updateDeliveryStatus');


Route::get('/delivered_reservations', [HomeController::class, 'delivered_Reservation'])->name('delivered_Reservations');
Route::put('/delivered-reservation/{id}', [HomeController::class, 'deliveredReservation'])->name('delivered-reservation');

Route::post('/accept_reservation/{id}', 'App\Http\Controllers\AdminController@acceptReservation')->name('accept_reservation');
Route::post('/enter_price/{id}', 'App\Http\Controllers\AdminController@enterPrice')->name('enter_price');
Route::post('/update_booking_status/{id}', 'App\Http\Controllers\AdminController@updateBookingStatus')->name('update_booking_status');
