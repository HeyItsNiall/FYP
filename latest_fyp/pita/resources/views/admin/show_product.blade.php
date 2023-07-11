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
            <div class="content-wrapper bg-white">

                @if (session()->has('message'))
                    <div class="alert alert-success">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                        {{ session()->get('message') }}
                    </div>
                @endif

                <h2 class="font_size mt-0 pt-0 pb-4 d-flex justify-content-start text-black">All Products</h2>

                <div class="row">
                    @foreach ($product as $product)
                        <div class="col-md-3 mb-4">
                            <div class="card bg-secondary text-black">
                                <img src="/product/{{ $product->image }}" class="card-img-top" alt="Product Image">
                                <div class="card-header">
                                    <h5 class="card-title p-0 m-0" style="color: black;">{{ $product->title }}</h5>
                                </div>
                                <div class="card-body bg-white">
                                    <p class="card-text">{{ $product->description }}</p>
                                    <p class="card-text">Quantity: {{ $product->quantity }}</p>
                                    <p class="card-text">Category: {{ $product->category }}</p>
                                    <p class="card-text">Price: {{ $product->price }}</p>
                                    <p class="card-text">Discount Price: {{ $product->discount_price }}</p>
                                </div>
                                <div class="card-footer pt-3 pb-3">
                                    <a href="{{ url('update_product', $product->id) }}" class="btn btn-primary">Edit</a>
                                    <a href="{{ url('delete_product', $product->id) }}" class="btn btn-danger"
                                        onclick="return confirm('Are You Sure To Delete This?')">Delete</a>
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
