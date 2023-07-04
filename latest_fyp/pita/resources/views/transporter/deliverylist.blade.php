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
            text-align: center;
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
                <h2 class="h2_font" style="margin-bottom: 20px;">Delivery List</h2>

                @if (session()->has('message'))
                    <div class="alert alert-success">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                        {{ session()->get('message') }}
                    </div>
                @endif

                <table class="center">
                    <tr>
                        <th>Name</th>
                        <th>Phone Number</th>
                        <th>Address</th>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Payment Status</th>
                        <th>Delivery Status</th>
                        <th>Action</th>
                    </tr>
                    @foreach ($processingOrders as $order)
                        <tr>
                            <td>{{ $order->name }}</td>
                            <td>{{ $order->phone }}</td>
                            <td>{{ $order->address }}</td>
                            <td>{{ $order->product_title }}</td>
                            <td>{{ $order->quantity }}</td>
                            <td>{{ $order->price }}</td>
                            <td>{{ $order->payment_status }}</td>
                            <td>{{ $order->delivery_status }}</td>
                            <td>
                                @if ($order->delivery_status == 'processing')
                                    <form action="{{ route('updateDeliveryStatus', $order->id) }}" method="POST">
                                        @csrf
                                        @method('PUT')
                                        <button type="submit" class="btn btn-primary">Mark as Delivered</button>
                                    </form>
                                @else
                                    <p style="color: green;">Delivered</p>
                                @endif
                            </td>
                        </tr>
                    @endforeach
                </table>

                <h2 class="h2_font" style="margin-bottom: 20px;">Delivered List</h2>
                <table class="center">
                    <tr>
                        <th>Name</th>
                        <th>Phone Number</th>
                        <th>Address</th>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Payment Status</th>
                        <th>Delivery Status</th>
                        <th>Action</th>
                    </tr>
                    @foreach ($deliveredOrders as $order)
                        <tr>
                            <td>{{ $order->name }}</td>
                            <td>{{ $order->phone }}</td>
                            <td>{{ $order->address }}</td>
                            <td>{{ $order->product_title }}</td>
                            <td>{{ $order->quantity }}</td>
                            <td>{{ $order->price }}</td>
                            <td>{{ $order->payment_status }}</td>
                            <td>{{ $order->delivery_status }}</td>
                            <td>
                                @if ($order->delivery_status == 'processing')
                                    <form action="{{ route('updateDeliveryStatus', $order->id) }}" method="POST">
                                        @csrf
                                        @method('PUT')
                                        <button type="submit" class="btn btn-primary">Mark as Delivered</button>
                                    </form>
                                @else
                                    <p style="color: green;">Delivered</p>
                                @endif
                            </td>
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
