<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    @include('transporter.css')

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
        @include('transporter.sidebar')
        <!-- partial -->
        @include('transporter.header')
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">

                @if (session()->has('message'))
                    <div class="alert alert-success">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                        {{ session()->get('message') }}
                    </div>
                @endif

                <h2 class="font_size">Completed Reservations</h2>
                @php
                    $user = Auth::user();
                @endphp
                <table class="center">
                    <tr class="th_color">
                        <th class="th_deg">Name</th>
                        <th class="th_deg">Address</th>
                        <th class="th_deg">Phone Number</th>
                        <th class="th_deg">Furniture Type</th>
                        <th class="th_deg">Date</th>
                        <th class="th_deg">Images</th>
                        <th class="th_deg">Price</th>
                        <th class="th_deg">Payment Method</th>
                        <th class="th_deg">Status</th>
                        <th class="th_deg">Action</th>
                    </tr>
                    @foreach ($bookings as $booking)
                        <tr>
                            @if ($booking->transporter_status)
                                <td>{{ $booking->cust_name }}</td>
                                <td>{{ $booking->address }}</td>
                                <td>{{ $booking->cust_phone }}</td>
                                <td>{{ $booking->furniture_type }}</td>
                                <td>{{ $booking->date }}</td>
                                <td>
                                    <img class="img_size" src="/booking/{{ $booking->images }}" alt="">
                                </td>
                                <td>{{ $booking->price }}</td>

                                @if ($booking->payment_method == 'deposit')
                                    <td>
                                        {{ $booking->payment_method }}<br>
                                        {{ $booking->amount }}
                                    </td>
                                @else
                                    <td> </td>
                                @endif
                                <td>{{ $booking->reservations_status }}</td>
                                <td>
                                    @php
                                        $balanceAmount = (int) $booking->price - (int) $booking->amount;
                                    @endphp
                                    <input type="number" name="amount" class="input_color"
                                        value="{{ $balanceAmount }}" min="0" readonly>
                                    @if ($booking->transporter_status == 'delivered')
                                        <p style="color: green">Delivered</p>
                                    @else
                                        <form action="{{ route('delivered-reservation', $booking->id) }}"
                                            method="POST">
                                            @csrf
                                            @method('PUT')
                                            <button type="submit" class="btn btn-primary">Delivered</button>
                                        </form>
                                    @endif
                                </td>
                                @if ($booking->reservations_status === 'in progress')
                                    <form action="{{ route('completeBooking', $booking->id) }}" method="POST">
                                        @csrf
                                        @method('PUT')
                                        <button type="submit" class="btn btn-primary">Complete</button>
                                    </form>
                                @endif
                                </td>
                            @endif
                        </tr>
                    @endforeach
                </table>
            </div>
        </div>
        <!-- container-scroller -->
        <!-- plugins:js -->
        @include('transporter.script')
        <!-- End custom js for this page -->
</body>

</html>
