<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    @include('supplier.css')
</head>

<body>
    <div class="container-scroller">
        <!-- partial:partials/_sidebar.html -->
        @include('supplier.sidebar')
        <!-- partial -->
        @include('supplier.header')
        <!-- partial -->
        @include('supplier.body')
        <!-- container-scroller -->
        <!-- plugins:js -->
        @include('supplier.script')
        <!-- End custom js for this page -->
</body>

</html>
