<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    @include('transporter.css')
</head>

<body>
    <div class="container-scroller">
        <!-- partial:partials/_sidebar.html -->
        @include('transporter.sidebar')
        <!-- partial -->
        @include('transporter.header')
        <!-- partial -->
        @include('transporter.body')
        <!-- container-scroller -->
        <!-- plugins:js -->
        @include('transporter.script')
        <!-- End custom js for this page -->
</body>

</html>
