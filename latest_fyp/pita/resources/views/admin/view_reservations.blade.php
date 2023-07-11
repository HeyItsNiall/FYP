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
            <div class="content-wrapper bg-white text-black">

                @if (session()->has('message'))
                    <div class="alert alert-success">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                        {{ session()->get('message') }}
                    </div>
                @endif

                <h2 class="font_size mt-0 pt-0 pb-4 d-flex justify-content-start">View Reservations</h2>

                <div class="row">
                    @foreach ($bookings as $booking)
                        <div class="col-md-4 mb-4">
                            <div class="card bg-secondary shadow-sm">
                                <div class="card-body bg-secondary">
                                    <h5 class="card-title text-dark">Name: {{ $booking->cust_name }}</h5>
                                    <p class="card-text">Email: {{ $booking->cust_email }}</p>
                                    <p class="card-text">Address: {{ $booking->address }}</p>
                                    <p class="card-text">Phone Number: {{ $booking->cust_phone }}</p>
                                    <p class="card-text">Furniture Type: {{ $booking->furniture_type }}</p>
                                    <p class="card-text">Repair Details: {{ $booking->repair_details }}</p>
                                    <p class="card-text">Date: {{ $booking->date }}</p>
                                    <p class="card-text">Time Slot: {{ $booking->time_slot }}</p>
                                    <img class="img-fluid img-thumbnail mt-3"
                                        style="width: 100%; height: 250px; object-fit: cover;"
                                        src="/booking/{{ $booking->images }}" alt="">
                                    <div class="mt-3">
                                        @if ($booking->status == 'accepted')
                                            @if (!$booking->price)
                                                <form action="{{ route('enter_price', $booking->id) }}" method="POST">
                                                    @csrf
                                                    <input type="hidden" name="booking_id"
                                                        value="{{ $booking->id }}">
                                                    <input type="number" name="price" class="form-control"
                                                        placeholder="Enter Price" min="0" required>
                                                    <input type="submit" class="btn btn-primary" name="submit"
                                                        value="Enter Price">
                                                </form>
                                            @else
                                                <input type="number" name="price" class="form-control bg-white text-dark"
                                                    placeholder="Enter Price" min="0"
                                                    value="{{ $booking->price }}" readonly>
                                            @endif
                                        @endif
                                        <p class="mt-3">Price: RM {{ $booking->price }}</p>
                                    </div>
                                    <div class="mt-3">
                                        @if ($booking->status == 'processing')
                                            <form action="{{ route('accept_reservation', $booking->id) }}"
                                                method="POST">
                                                @csrf
                                                <input type="submit" class="btn btn-primary" name="submit"
                                                    value="Accept">
                                            </form>
                                        @elseif ($booking->status == 'accepted')
                                            @if ($booking->price)
                                                <p style="color: green;">Status: Accepted</p>
                                            @endif
                                        @endif
                                    </div>
                                    <p>Customer Action: {{ $booking->action }}</p>
                                </div>
                            </div>
                        </div>
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
