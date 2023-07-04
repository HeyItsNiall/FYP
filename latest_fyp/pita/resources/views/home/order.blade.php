<!DOCTYPE html>
<html>

<head>
    <!-- Basic -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <!-- Site Metas -->
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="shortcut icon" href="images/drsofa.png" type="">
    <title> Dr Sofa | Furniture Repairing Reservation System</title>
    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="{{ asset('home/css/bootstrap.css') }}" />
    <!-- font awesome style -->
    <link href="{{ asset('home/css/font-awesome.min.css') }}" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="{{ asset('home/css/style.css') }}" rel="stylesheet" />
    <!-- responsive style -->
    <link href="{{ asset('home/css/responsive.css') }}" rel="stylesheet" />

    <style type="text/css">
        .center {
            margin: auto;
            width: 50%;
            text-align: center;
            padding: 30px;

        }

        table,
        th,
        td {
            border: 1px solid grey;
        }

        .th_deg {
            font-size: 30px;
            padding: 5px;
            background: skyblue;
        }

        .img_deg {
            height: 150px;
            width: 150px;

        }

        .total_deg {
            font-size: 20px;
            padding: 40px;
        }
    </style>


</head>

<body>
    <div class="hero_area">
        <!-- header section strats -->
        @include('home.header')
        <!-- end header section -->

        @if (session()->has('message'))
            <div class="alert alert-success">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                {{ session()->get('message') }}
            </div>
        @endif

        <div class="center">
            <table>
                <tr>
                    <th class="th_deg">Product Title</th>
                    <th class="th_deg">Product Quantity</th>
                    <th class="th_deg">Price</th>
                    <th class="th_deg">Payment Status</th>
                    <th class="th_deg">Delivery Status</th>
                    <th class="th_deg">Image</th>
                    <th class="th_deg">Cancel Order</th>
                </tr>
                @foreach ($order as $order)
                    <tr>
                        <td>{{ $order->product_title }}</td>
                        <td>{{ $order->quantity }}</td>
                        <td>{{ $order->price }}</td>
                        <td>{{ $order->payment_status }}</td>
                        <td>{{ $order->delivery_status }}</td>
                        <td>
                            <img height="100" width="180" src="product/{{ $order->image }}" alt="">
                        </td>
                        <td>
                            @if ($order->delivery_status == 'processing')
                                <a href="{{ url('cancel_order', $order->id) }}" class="btn btn-danger"
                                    onclick="return confirm('Are You Sure To Cancel This Order ?')">Cancel Order</a>
                            @else
                                <p style="color: blue">Not Allowed</p>
                            @endif
                        </td>
                    </tr>
                @endforeach
            </table>
        </div>

        <div class="cpy_">
            <p class="mx-auto">© 2023 All Rights Reserved By <a href="https://html.design/">Dr Sofa | Furniture
                    Repairing
                    Reservation System</a><br>

                Developed By <a href="https://themewagon.com/" target="_blank">Dannial Dzulkarnain | PokDin Entreprise
                    Junior Developer </a>

            </p>
        </div>
        <!-- jQery -->
        <script src="home/js/jquery-3.4.1.min.js"></script>
        <!-- popper js -->
        <script src="home/js/popper.min.js"></script>
        <!-- bootstrap js -->
        <script src="home/js/bootstrap.js"></script>
        <!-- custom js -->
        <script src="home/js/custom.js"></script>
</body>

</html>
