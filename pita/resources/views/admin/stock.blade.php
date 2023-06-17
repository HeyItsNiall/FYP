<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    @include('admin.css')

    <style type="text/css">
        .div_center {

            text-align: center;
            padding-top: 40px;
        }

        .font_size {

            font-size: 40px;
            padding-bottom: 40px;
        }

        .text_color {

            color: black;
            padding-bottom: 20px;
        }

        label {

            display: inline-block;
            width: 200px;
        }

        .div_design {
            padding-bottom: 15px;
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
            <div class="content-wrapper">

                @if (session()->has('message'))
                    <div class="alert alert-success">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                        {{ session()->get('message') }}
                    </div>
                @endif

                <div class="div_center">
                    <h1 class="font_size">Request Stock</h1>

                    <form action="{{ url('/add_stock') }}" method="POST" enctype="multipart/form-data">
                        @csrf

                        <div class="div_design">
                            <label for="">Materials Name :</label>
                            <input class="text_color" type="text" name="material_name"
                                placeholder="Write a materials name" required="">
                        </div>

                        <div class="div_design">
                            <label for="">Materials Quantity :</label>
                            <input class="text_color" type="text" name="quantity" placeholder="Write a quantity"
                                required="">
                        </div>
                        <div class="div_design">
                            <input type="submit" value="Request Stock" class="btn btn-primary">
                        </div>
                    </form>

                </div>

            </div>
        </div>
        <!-- container-scroller -->
        <!-- plugins:js -->
        @include('admin.script')
        <!-- End custom js for this page -->
</body>

</html>
