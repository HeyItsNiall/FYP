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
        .kotak {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .font_size {
            text-align: center;
        }

        /* Remove file input box outline */
        .div_design input[type="file"] {
            border: none;
            outline: none;
            background: none;
            padding: 0;
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

            @if (session()->has('message'))
                <div class="alert alert-success">

                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>

                    {{ session()->get('message') }}

                </div>
            @endif
            <h1 class="font_size">Add Reservations</h1>
            <div class="kotak">
                <form action="{{ url('add_booking') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <div>
                        <label>Name</label>
                        <input type="text" name="cust_name" placeholder="Name" required="">
                    </div>
                    <div>
                        <label>Email</label>
                        <input type="email" name="cust_email" placeholder="Emails" required="">
                    </div>
                    <div>
                        <label>Address</label>
                        <input type="text" name="address" placeholder="Address" required="">
                    </div>
                    <div>
                        <label>Phone Number</label>
                        <input type="text" name="cust_phone" placeholder="Phone Number" required="">
                    </div>
                    <div>
                        <label>Type of Furniture</label>
                    </div>
                    <!--<input type="text" name="furniture_type" placeholder="Type of Furniture" required="">-->
                    <select name="furniture_type" id="">
                        <option value="">Select Options</option>
                        <option value="home living">Home Living</option>
                        <option value="office">Office</option>
                    </select>
                    <div>
                        <label>Furniture</label>
                    </div>
                    <select name="furniture" id="">
                        <option value="">Select Options</option>
                        <option value="sofa">Sofa</option>
                        <option value="kitchen chair">Kitchen Chair</option>
                    </select>
                    <br>
                    <div>
                        <label>Repair Details</label>
                        <input type="text" name="repair_details" placeholder="Repairs Details" required="">
                    </div>
                    <div>
                        <label>Date</label>
                        <input type="date" name="date" placeholder="" min="{{ date('Y-m-d') }}">
                    </div>

                    <div>
                        <label>Time Slot</label>
                        <input type="time" name="time_slot" placeholder="">
                    </div>
                    <div>
                        <label>Images</label>
                        <input style="border: 0" type="file" name="images[]" placeholder="" multiple
                            accept=".jpg, .jpeg, .png">
                    </div>
                    <div>
                        <input type="hidden" name="user_id" value="{{ auth()->user()->id }}">
                        <input type="submit" value="Add Booking" btn btn-primary>
                    </div>
                </form>
            </div>
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
</body>

</html>
