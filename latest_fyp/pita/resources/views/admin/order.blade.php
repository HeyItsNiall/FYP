<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    @include('admin.css')

    <style type="text/css">
        .title_deg {
            text-align: center;
            font-size: 40px;
            padding-top: 20px;
        }

        .table_deg {
            border: 2px solid white;
            width: 100%;
            margin: auto;
            text-align: center;
        }

        .th_deg {
            background-color: skyblue;
        }

        .img_size {
            width: 200px;
            height: 200px;
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
                <h1 class="title_deg justify-content-start d-flex">All Orders</h1>

                <form action="{{ url('search') }}" method="GET" class="d-flex mb-3 mt-3 col-4 m-0 p-0">
                    @csrf
                    <input style="color: black" type="text" class="form-control bg-white" name="search"
                        placeholder="Search for something">
                    <input type="submit" value="Search" class="btn btn-primary bg-primary rounded-0">
                </form>

                <div class="row">
                    @forelse ($order as $order)
                        <div class="col-md-4 mb-4">
                            <div class="card border border-secondary shadow-sm">
                                <div class="card-body bg-secondary text-black">
                                    <h5 class="card-title text-dark">Name: {{ $order->name }}</h5>
                                    <p class="card-text">Email: {{ $order->email }}</p>
                                    <p class="card-text">Address: {{ $order->address }}</p>
                                    <p class="card-text">Phone: {{ $order->phone }}</p>
                                    <p class="card-text">Product Title: {{ $order->product_title }}</p>
                                    <p class="card-text">Quantity: {{ $order->quantity }}</p>
                                    <p class="card-text">Price: {{ $order->price }}</p>
                                    <p class="card-text">Payment Status: {{ $order->payment_status }}</p>
                                    <p class="card-text">Delivery Status: {{ $order->delivery_status }}</p>
                                    <img class="img-fluid img-thumbnail mt-3" style="width: 100%; height: 250px; object-fit: cover;"
                                        src="/product/{{ $order->image }}" alt="">


                                    <div class="mt-3">
                                        @if ($order->delivery_status == 'processing')
                                            <a href="{{ url('delivered', $order->id) }}"
                                                onclick="return confirm('Are you sure this product is delivered?')"
                                                class="btn btn-primary">Delivered</a>
                                        @else
                                            <p style="color: green;">Delivered</p>
                                        @endif
                                        <a href="{{ url('print_pdf', $order->id) }}" class="btn btn-primary">Print
                                            PDF</a>
                                        <a href="{{ url('send_email', $order->id) }}" class="btn btn-info">Send
                                            Email</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @empty
                        <div class="col">
                            <p>No Data Found</p>
                        </div>
                    @endforelse
                </div>

            </div>
        </div>
        <!-- container-scroller -->
        <!-- plugins:js -->
        @include('admin.script')
        <!-- End custom js for this page -->
</body>

</html>
