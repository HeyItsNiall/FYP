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
            <div class="content-wrapper">

                @if (session()->has('message'))
                    <div class="alert alert-success">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                        {{ session()->get('message') }}
                    </div>
                @endif

                <h2 class="font_size">View Reservations</h2>
                <table class="center">
                    <tr class="th_color">
                        <th class="th_deg">Name</th>
                        <th class="th_deg">Email</th>
                        <th class="th_deg">Phone Number</th>
                        <th class="th_deg">Furniture Type</th>
                        <th class="th_deg">Repair Details</th>
                        <th class="th_deg">Date</th>
                        <th class="th_deg">Time Slot</th>
                        <th class="th_deg">Images</th>
                    </tr>
                    @foreach ($bookings as $bookings)
                    <tr>
                        <td>{{ $bookings->cust_name }}</td>
                        <td>{{ $bookings->cust_email }}</td>
                        <td>{{ $bookings->cust_phone }}</td>
                        <td>{{ $bookings->furniture_type }}</td>
                        <td>{{ $bookings->repair_details }}</td>
                        <td>{{ $bookings->date }}</td>
                        <td>{{ $bookings->time_slot }}</td>
                        <td>
                            <img class="img_size" src="/booking/{{ $bookings->images }}" alt="">
                        </td>
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
