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
            <div class="content-wrapper">

                @if (session()->has('message'))
                    <div class="alert alert-success">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                        {{ session()->get('message') }}
                    </div>
                @endif

                <h2 class="font_size">Stock Requested</h2>

                <table class="center">
                    <tr class="th_color">
                        <th clas="th_deg">Materials Name</th>
                        <th clas="th_deg">Quantity</th>
                    </tr>

                    @foreach ($stock as $stock)
                        <tr>
                            <td>{{ $stock->materials_name }}</td>
                            <td>{{ $stock->quantity }}</td>
                        </tr>
                    @endforeach
                </table>


            </div>
        </div>
        <!-- container-scroller -->
        <!-- plugins:js -->
        @include('admin.script')
        <!-- End custom js for this page -->
</body>

</html>
