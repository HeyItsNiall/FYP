<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    @include('admin.css')
    <style type="text/css">
        input[type=text] {
            background: white;
        }

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
                <div class="div_center">
                    <h2 class="h2_font"> Add Category</h2>
                    <form action="{{ url('/add_category') }}" method="POST" class="mt-3 d-flex justify-content-center">
                        @csrf
                        <input type="text" name="category" class="form-control col-4 col-md-2 bg-white"
                            placeholder="Write Category Name">

                        <input type="submit" class="btn btn-primary bg-primary" name="submit" value="Add Category">
                    </form>
                </div>

                <div class="d-flex justify-content-center">
                    <table class="table table-bordered mt-4 col-6">
                        <thead class="table-primary text-light">
                            <tr>
                                <td>Category Name</td>
                                <td>Action</td>
                            </tr>
                        </thead>

                        @foreach ($data as $data)
                            <tr>
                                <td class="text-capitalize">{{ $data->category_name }}</td>
                                <td>
                                    <a onclick="return confirm('Are You Sure To Delete?')" class="btn btn-danger"
                                        href="{{ url('delete_category', $data->id) }}">Delete</a>
                                </td>
                            </tr>
                        @endforeach
                    </table>
                </div>
            </div>
        </div>
        <!-- container-scroller -->
        <!-- plugins:js -->
        @include('admin.script')
        <!-- End custom js for this page -->
</body>

</html>
