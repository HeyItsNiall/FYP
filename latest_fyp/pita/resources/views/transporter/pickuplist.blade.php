<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    @include('transporter.css')
    <style type="text/css">
        .div_center {
            text-align: center;
            padding-top: 40px;
        }

        .h2_font {
            font-size: 40px;
            padding-block-start: 40px;
        }

        .input_color {

            color: black;
        }

        .center {
            margin: auto;
            width: 50%;
            text-align: center;
            margin-top: 30px;
            border: 3px solid white;
        }

        .div_form {
            margin-bottom: 20px;
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
                <div class="div_center">
                    <h2 class="h2_font" style="margin-bottom: 20px;">Pick Up List</h2>

                    <table class="center">
                        <tr>
                            <th>Name</th>
                            <th>Phone Number</th>
                            <th>Address</th>
                            <th>Furniture Type</th>
                            <th>Date</th>
                            <th>Timeslot</th>
                            <th>Price</th>
                            <th>Amount</th>
                            <th>Status</th>
                        </tr>
                        @foreach ($bookings as $booking)
                            @if ($booking->action == 'accepted')
                                <tr>
                                    <td>{{ $booking->cust_name }}</td>
                                    <td>{{ $booking->cust_phone }}</td>
                                    <td>{{ $booking->address }}</td>
                                    <td>{{ $booking->furniture_type }}</td>
                                    <td>{{ $booking->date }}</td>
                                    <td>{{ $booking->time_slot }}</td>
                                    <td>{{ $booking->price }}</td>
                                    <td>
                                        @if (!$booking->amount)
                                            <form action="{{ route('enter_amount', $booking->id) }}" method="POST">
                                                @csrf
                                                <input type="hidden" name="booking_id" value="{{ $booking->id }}">
                                                <input type="number" name="price" class="input_color" placeholder="Enter Price" min="0" required>

                                                <select name="payment_method" class="input_color">
                                                    <option value="deposit">Deposit</option>
                                                    <option value="full_payment">Full Payment</option>
                                                </select>

                                                <input type="submit" class="btn btn-primary" name="submit" value="Enter Amount">
                                            </form>
                                        @else
                                            <p>Amount already entered</p>
                                            <p>RM {{ $booking->amount }}</p>
                                        @endif
                                    </td>
                                    <td>
                                        @if ($booking->transporter_status == 'pending')
                                            <form action="{{ route('pickup.update', $booking->id) }}" method="POST">
                                                @csrf
                                                <input type="submit" class="btn btn-primary" name="submit"
                                                    value="Pick Up">
                                            </form>
                                        @elseif ($booking->transporter_status == 'picked_up')
                                            <p style="color: green">Picked Up</p>
                                        @else
                                        <p style="color: greenyellow">Delivered</p>
                                        @endif
                                    </td>

                                </tr>
                            @endif
                        @endforeach
                    </table>
                </div>
            </div>
        </div>
        <!-- container-scroller -->
        <!-- plugins:js -->
        @include('transporter.script')
        <!-- End custom js for this page -->
</body>

</html>
