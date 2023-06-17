<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    @include('transporter.css')
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
        @include('transporter.sidebar')
        <!-- partial -->
        @include('transporter.header')
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
                    <h2 class="h2_font" style="margin-bottom: 20px;">Pick Up List</h2>

                    <table class="center">
                        <tr>
                            <th>Name</th>
                            <th>Phone Number</th>
                            <th>Furniture Type</th>
                            <th>Date</th>
                            <th>Timeslot</th>
                        </tr>
                        @foreach ($bookings as $bookings)
                        <tr>
                            <td>{{ $bookings->cust_name }}</td>
                            <td>{{ $bookings->cust_phone }}</td>
                            <td>{{ $bookings->furniture_type }}</td>
                            <td>{{ $bookings->date }}</td>
                            <td>{{ $bookings->time_slot }}</td>
                        </tr>

                        @endforeach
                    </table>
                </div>
            </div>
        </div>
        <!-- container-scroller -->
        <!-- plugins:js -->
        @include('transporter.script')
        <!-- End custom js for this page -->
</body>

</html>
