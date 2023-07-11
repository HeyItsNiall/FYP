<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    @include('admin.css')

    <style type="text/css">
        .center {
            margin: auto;
            width: 50%;
            border: 2px solid white;
            text-align: center;
            margin-top: 40px;
        }

        .font_size {
            text-align: center;
            font-size: 40px;
            padding-top: 20px;
        }

        .img_size {
            width: 150px;
            height: 150px;
        }

        .th_color {
            background: lightblue;
        }

        .th_deg {
            padding: 30px;
        }

        .input_color {
            color: black;
        }
    </style>
</head>

<body>
    <div class="container-scroller">
        <!-- partial:partials/_sidebar.html -->
        @include('admin.sidebar')
        <!-- partial -->
        @include('admin.header')
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper bg-white text-dark">

                @if (session()->has('message'))
                    <div class="alert alert-success">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                        {{ session()->get('message') }}
                    </div>
                @endif

                <h2 class="font_size mt-0 pt-0 pb-4 d-flex justify-content-start text-black">Completed Reservations</h2>
                @php
                    $user = Auth::user();
                @endphp
                <div class="row">
                    @foreach ($bookings as $booking)
                        @if ($booking->transporter_status == 'picked_up')
                            <div class="col-md-4 mb-4">
                                <div class="card border-secondary">
                                    <div class="card-body bg-secondary shadow-sm">
                                        <h5 class="card-title text-dark">Name: {{ $booking->cust_name }}</h5>
                                        <p class="card-text">Address: {{ $booking->address }}</p>
                                        <p class="card-text">Phone Number: {{ $booking->cust_phone }}</p>
                                        <p class="card-text">Furniture Type: {{ $booking->furniture_type }}</p>
                                        <p class="card-text">Date: {{ $booking->date }}</p>
                                        <img class="img-fluid img-thumbnail mt-3 mb-3"
                                            style="width: 100%; height: 250px; object-fit: cover;"
                                            src="/booking/{{ $booking->images }}" alt="">
                                        <p class="card-text">Price: {{ $booking->price }}</p>
                                        @if ($booking->payment_method == 'deposit')
                                            <p class="card-text">Payment Method: {{ $booking->payment_method }}</p>
                                            <p class="card-text">Amount: {{ $booking->amount }}</p>
                                        @else
                                            <p class="card-text">Payment Method:</p>
                                            <p class="card-text">Amount:</p>
                                        @endif
                                        <p class="card-text">Status: {{ $booking->reservations_status }}</p>
                                        @if ($user->usertype == '2')
                                            @php
                                                $balanceAmount = (int) $booking->price - (int) $booking->amount;
                                            @endphp
                                            <p class="card-text">Balance Amount: {{ $balanceAmount }}</p>
                                            <form action="{{ route('deliveredReservation', $booking->id) }}"
                                                method="POST">
                                                @csrf
                                                @method('PUT')
                                                <button type="submit" class="btn btn-primary">Delivered</button>
                                            </form>
                                        @endif
                                        @if ($booking->reservations_status === 'in progress')
                                            <form action="{{ route('completeBooking', $booking->id) }}" method="POST">
                                                @csrf
                                                @method('PUT')
                                                <button type="submit"
                                                    class="btn btn-primary bg-primary mt-3">Complete</button>
                                            </form>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        @endif
                    @endforeach
                </div>
            </div>

            <!-- yg ni buat display balik je yg dah 'delivered' dkt transporter_status -->

            <div class="content-wrapper bg-white text-dark">

                @if (session()->has('message'))
                    <div class="alert alert-success">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                        {{ session()->get('message') }}
                    </div>
                @endif

                <h2 class="font_size mt-0 pt-0 pb-4 d-flex justify-content-start text-black">Delivered Reservations</h2>
                @php
                    $user = Auth::user();
                @endphp
                <div class="row">
                    @foreach ($bookings as $booking)
                        @if ($booking->transporter_status == 'delivered')
                            <div class="col-md-4 mb-4">
                                <div class="card border-secondary">
                                    <div class="card-body bg-secondary shadow-sm">
                                        <h5 class="card-title text-dark">Name: {{ $booking->cust_name }}</h5>
                                        <p class="card-text">Address: {{ $booking->address }}</p>
                                        <p class="card-text">Phone Number: {{ $booking->cust_phone }}</p>
                                        <p class="card-text">Furniture Type: {{ $booking->furniture_type }}</p>
                                        <p class="card-text">Date: {{ $booking->date }}</p>
                                        <img class="img-fluid img-thumbnail mt-3 mb-3"
                                            style="width: 100%; height: 250px; object-fit: cover;"
                                            src="/booking/{{ $booking->images }}" alt="">
                                        <p class="card-text">Price: {{ $booking->price }}</p>
                                        @if ($booking->payment_method == 'deposit')
                                            <p class="card-text">Payment Method: {{ $booking->payment_method }}</p>
                                            <p class="card-text">Amount: {{ $booking->amount }}</p>
                                        @endif
                                        <p class="card-text">Status: {{ $booking->reservations_status }}</p>
                                    </div>
                                </div>
                            </div>
                        @endif
                    @endforeach
                </div>
            </div>
        </div>
        <!-- container-scroller -->
        <!-- plugins:js -->
        @include('admin.script')
        <!-- End custom js for this page -->
</body>

</html>
