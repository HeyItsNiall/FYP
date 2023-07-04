<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    @include('supplier.css')
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
        @include('supplier.sidebar')
        <!-- partial -->
        @include('supplier.header')
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
                    <h2 class="h2_font" style="margin-bottom: 20px;"> Update Stock</h2>
                    <form action="{{ url('/update_stock_confirm',  $stocklists->id) }}" method="POST">
                        @csrf
                        <div class="div_form">
                            <label for="">Stock Name : </label>
                            <input type="text" name="stock_name" class="input_color" placeholder="Enter Stock Name"  value="{{ $stocklists->stock_name }}">
                        </div>
                        <div class="div_form">
                            <label for="">Description : </label>
                            <input type="text" name="description" class="input_color"
                                placeholder="Enter Description"  value="{{ $stocklists->description }}">
                        </div>
                        <div class="div_form">
                            <label for="">Quantity : </label>
                            <input type="number" name="quantity" class="input_color" placeholder="Enter Quantity"
                            value="{{ $stocklists->quantity }}" min="0">
                        </div>
                        <div class="div_form">
                            <label for="">Price :</label>
                            <input type="text" name="price" class="input_color" placeholder="Enter Price"  value="{{ $stocklists->price }}">
                        </div>
                        <div class="div_form">
                            <input type="submit" class="btn btn-primary" name="submit" value="Update Stock">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- container-scroller -->
        <!-- plugins:js -->
        @include('supplier.script')
        <!-- End custom js for this page -->
</body>

</html>
