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
        .center {
            margin: auto;
            width: 50%;
            border: 2px solid black;
            text-align: center;
            margin-top: 40px;
        }

        .font_size {
            text-align: center;
            font-size: 40px;
            padding-top: 20px;
        }

        .img_size {
            width: 250px;
            height: 250px;
        }

        .th_color {
            background: skyblue;
        }

        .th_deg {
            padding: 30px;
        }

        .btn {
            font-size: 10px;
            margin-bottom: 2px;
        }
    </style>



</head>

<body>

    @include('sweetalert::alert')

    <div class="hero_area">
        <!-- header section strats -->
        @include('home.header')
        <!-- end header section -->

        <div>
            <h2 class="font_size">Manage Reservations</h2>
            <table class="center">
                <tr class="th_color">
                    <th class="th_deg">Name</th>
                    <th class="th_deg">Address</th>
                    <th class="th_deg">Phone Number</th>
                    <th class="th_deg">Furniture Type</th>
                    <th class="th_deg">Repair Details</th>
                    <th class="th_deg">Date</th>
                    <th class="th_deg">Time Slot</th>
                    <th class="th_deg">Images</th>
                    <th class="th_deg">Status</th>
                    <th class="th_deg">Action</th>

                </tr>

                @foreach ($bookings as $booking)
                    <tr>
                        <td>{{ $booking->cust_name }}</td>
                        <td>{{ $booking->address }}</td>
                        <td>{{ $booking->cust_phone }}</td>
                        <td>{{ $booking->furniture_type }}</td>
                        <td>{{ $booking->repair_details }}</td>
                        <td>{{ $booking->date }}</td>
                        <td>{{ $booking->time_slot }}</td>
                        <td>
                            <img class="img_size" src="/booking/{{ $booking->images }}" alt="">
                        </td>
                        <td>
                            @if ($booking->status == 'processing')
                                <p style="color: orange;">Processing - Price Pending</p>
                            @elseif ($booking->status == 'accepted')
                                <p style="color: green;">Accepted - RM{{ $booking->price }}</p>
                            @endif
                        </td>
                        <td>
                            @if ($booking->status == 'processing')
                                <form action="{{ route('update_booking_status', $booking->id) }}" method="POST">
                                    @csrf
                                    <select name="action" class="input_color">
                                        <option value="accept">Accept</option>
                                        <option value="cancel">Cancel</option>
                                        <option value="negotiate">Negotiate Price</option>
                                    </select>
                                    <input type="submit" class="btn btn-primary" name="submit" value="Update">
                                </form>
                            @elseif ($booking->status == 'accepted')
                                <form action="{{ route('update_booking_status', $booking->id) }}" method="POST">
                                    @csrf
                                    <select name="action" class="input_color">
                                        <option value="accept">Accept</option>
                                        <option value="cancel">Cancel</option>
                                        <option value="negotiate">Negotiate Price</option>
                                    </select>
                                    <input type="submit" class="btn btn-primary" name="submit" value="Update">
                                </form>
                            @elseif ($booking->status == 'cancelled')
                                <form action="{{ route('update_booking_status', $booking->id) }}" method="POST">
                                    @csrf
                                    <select name="action" class="input_color">
                                        <option value="accept">Accept</option>
                                        <option value="cancel">Cancel</option>
                                        <option value="negotiate">Negotiate Price</option>
                                    </select>
                                    <input type="submit" class="btn btn-primary" name="submit" value="Update">
                                </form>
                            @elseif ($booking->status == 'negotiate')
                                <form action="{{ route('update_booking_status', $booking->id) }}" method="POST">
                                    @csrf
                                    <input type="hidden" name="action" value="accept">
                                    <input type="submit" class="btn btn-primary" name="submit" value="Accept">
                                </form>
                                <form action="{{ route('update_booking_status', $booking->id) }}" method="POST">
                                    @csrf
                                    <input type="hidden" name="action" value="cancel">
                                    <input type="submit" class="btn btn-primary" name="submit" value="Cancel">
                                </form>
                            @endif
                            {{ $booking->action }}
                        </td>
                    </tr>
                @endforeach
            </table>
        </div>

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

        <script type="text/javascript">
            function reply(caller) {
                document.getElementById('commentId').value = $(caller).attr('data-Commentid');
                $('.replyDiv').insertAfter($(caller));
                $('.replyDiv').show();

            }

            function reply_close(caller) {

                $('.replyDiv').hide();

            }
        </script>
        <script>
            document.addEventListener("DOMContentLoaded", function(event) {
                var scrollpos = localStorage.getItem('scrollpos');
                if (scrollpos) window.scrollTo(0, scrollpos);
            });

            window.onbeforeunload = function(e) {
                localStorage.setItem('scrollpos', window.scrollY);
            };
        </script>
        <!-- jQery -->
        <script src="home/js/jquery-3.4.1.min.js"></script>
        <!-- popper js -->
        <script src="home/js/popper.min.js"></script>
        <!-- bootstrap js -->
        <script src="home/js/bootstrap.js"></script>
        <!-- custom js -->
        <script src="home/js/custom.js"></script>
        <!-- Add Bootstrap 5 JavaScript bundle -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

</body>

</html>
