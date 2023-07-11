<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    @include('admin.css')

    <style type="text/css">
        input[type=text],
        input[type=number],
        input[type=file],
        select.form-control option {
            background: white;
            color: black;
        }

        select.form-control {
            border: 1px solid black;
            text-transform: capitalize;
        }

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
            <div class="content-wrapper bg-white text-black">

                @if (session()->has('message'))
                    <div class="alert alert-success">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                        {{ session()->get('message') }}
                    </div>
                @endif

                <h1 class="font_size pb-0">Add Product</h1>

                <div class="div_center d-flex justify-content-center">

                    <form action="{{ url('/add_product') }}" method="POST" enctype="multipart/form-data">
                        @csrf

                        <div class="form-group">
                            <label for="title">Product Title:</label>
                            <input class="form-control bg-white" type="text" name="title"
                                placeholder="Write a title" required="">
                        </div>

                        <div class="form-group">
                            <label for="description">Product Description:</label>
                            <input class="form-control bg-white" type="text" name="description"
                                placeholder="Write a description" required="">
                        </div>

                        <div class="form-group">
                            <label for="price">Product Price:</label>
                            <input class="form-control bg-white" type="number" name="price"
                                placeholder="Write a price" required="">
                        </div>

                        <div class="form-group">
                            <label for="dis_price">Discount Price:</label>
                            <input class="form-control bg-white" type="number" name="dis_price"
                                placeholder="Write a discount if apply">
                        </div>

                        <div class="form-group">
                            <label for="quantity">Product Quantity:</label>
                            <input class="form-control bg-white" type="number" name="quantity" min="0"
                                placeholder="Write a quantity" required="">
                        </div>

                        <div class="form-group">
                            <label for="category">Product Category:</label>
                            <select class="form-control bg-white" name="category" id="" required="">
                                <option value="" selected="">Add a category here</option>
                                @foreach ($category as $category)
                                    <option value="{{ $category->category_name }}">{{ $category->category_name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <div class="form-group d-flex justify-content-center items-center gap-4">
                            <label for="image">Product Image Here:</label>
                            <input type="file" name="image" required="" class="form-control col-4">
                        </div>

                        <div class="form-group">
                            <input type="submit" value="Add Product" class="btn btn-primary bg-primary">
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
