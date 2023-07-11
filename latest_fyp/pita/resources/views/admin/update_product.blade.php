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

        .label {

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

                <h1 class="font_size pb-0">Update Product</h1>

                <div class="div_center d-flex justify-content-center">

                    <form action="{{ url('/update_product_confirm', $product->id) }}" method="POST"
                        enctype="multipart/form-data" class="col-md-6">
                        @csrf

                        <div class="form-group">
                            <label for="title">Product Title:</label>
                            <input class="form-control bg-white" type="text" name="title"
                                placeholder="Write a title" required="" value="{{ $product->title }}">
                        </div>

                        <div class="form-group">
                            <label for="description">Product Description:</label>
                            <input class="form-control bg-white" type="text" name="description"
                                placeholder="Write a description" required="" value="{{ $product->description }}">
                        </div>

                        <div class="form-group">
                            <label for="price">Product Price:</label>
                            <input class="form-control bg-white" type="number" name="price" placeholder="Write a price"
                                required="" value="{{ $product->price }}">
                        </div>

                        <div class="form-group">
                            <label for="dis_price">Discount Price:</label>
                            <input class="form-control bg-white" type="number" name="dis_price"
                                placeholder="Write a discount if apply" value="{{ $product->discount_price }}">
                        </div>

                        <div class="form-group">
                            <label for="quantity">Product Quantity:</label>
                            <input class="form-control bg-white" type="number" name="quantity" min="0"
                                placeholder="Write a quantity" required="" value="{{ $product->quantity }}">
                        </div>

                        <div class="form-group">
                            <label for="category">Product Category:</label>
                            <select class="form-control bg-white" name="category" id="" required="">
                                <option value="{{ $product->category }}" selected>{{ $product->category }}
                                </option>
                                @foreach ($category as $category)
                                    <option value="{{ $category->category_name }}">{{ $category->category_name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="current_image">Current Product Image Here:</label>
                            <img style="margin: auto" height="100" width="100"
                                src="/product/{{ $product->image }}">
                        </div>

                        <div class="form-group d-flex justify-content-center items-center gap-4">
                            <label for="image">Change Product Image Here:</label>
                            <input type="file" name="image" class="form-control col-4">
                        </div>

                        <div class="form-group">
                            <input type="submit" value="Update Product" class="btn btn-primary bg-primary">
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
