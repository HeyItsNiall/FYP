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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
        integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <style>
        detail-box {
        }
    </style>
</head>

<body>
    <div class="hero_area">
        <!-- header section strats -->
        @include('home.header')
        <!-- end header section -->
        <div class="col-sm-6 col-md-4 col-lg-4" style="margin: auto; width:50% padding: 30px;">
            <div class="box">
                <div class="img-box" style="padding: 20px;">
                    <img src="/product/{{ $product->image }}" alt="">
                </div>
                <div class="detail-box">
                    <h5>
                        {{ $product->title }}
                    </h5>

                    @if ($product->discount_price != null)
                        <h6 style="color: red;">
                            Discount price
                            <br>
                            RM{{ $product->discount_price }}
                        </h6>

                        <h6 style="text-decoration: line-through; color:blue">
                            Price
                            <br>
                            RM{{ $product->price }}
                        </h6>
                    @else
                        <h6 style="color: blue;">
                            Price
                            <br>
                            RM{{ $product->price }}
                        </h6>
                    @endif

                    <h6>
                        Product Category : {{ $product->category }}
                    </h6>
                    <h6>
                        Product Details : {{ $product->description }}
                    </h6>
                    <h6>
                        Available : {{ $product->quantity }}
                    </h6>

                    <form action="{{ url('add_cart', $product->id) }}" method="POST">
                        @csrf
                        <div class="row">
                            <div class="col-md-4">
                                <input type="submit" value="Add to Cart">
                            </div>

                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- end product section -->
        <!-- footer start -->
        @include('home.footer')
        <!-- footer end -->
        <div class="cpy_">
            <p class="mx-auto">© 2023 All Rights Reserved By <a href="https://html.design/">Dr Sofa | Furniture
                    Repairing
                    Reservation System</a><br>

                Developed By <a href="https://themewagon.com/" target="_blank">Dannial Dzulkarnain | PokDin Entreprise
                    Junior Developer </a>

            </p>
        </div>
</body>

</html>
