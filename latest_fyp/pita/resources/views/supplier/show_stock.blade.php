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

            text-align: center;
            font-size: 40px;
            padding-top: 20px;
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

                <h2 class="h2_font" style="margin-bottom: 20px" > All Stock</h2>
                <table class="center">
                    <tr>
                        <td>Stock Name</td>
                        <td>Description</td>
                        <td>Quantity (per qty / per set)</td>
                        <td>Price (RM)</td>
                        <td>Delete</td>
                        <td>Edit</td>
                    </tr>
                    @foreach ($stocklists as $stocklists)
                        <tr>
                            <td>{{ $stocklists->stock_name }}</td>
                            <td>{{ $stocklists->description }}</td>
                            <td>{{ $stocklists->quantity }}</td>
                            <td>{{ $stocklists->price }}</td>
                            <td>
                                <a onclick="return confirm('Are You Sure To Delete?')" class="btn btn-danger"
                                    href="{{ url('delete_stock', $stocklists->id) }}">Delete</a>
                            </td>
                            <td>
                                <a href="{{ url('update_stock', $stocklists->id) }}" class="btn btn-success">Edit</a>
                            </td>
                        </tr>
                    @endforeach
                </table>
            </div>
        </div>
        <!-- container-scroller -->
        <!-- plugins:js -->
        @include('supplier.script')
        <!-- End custom js for this page -->
</body>

</html>
