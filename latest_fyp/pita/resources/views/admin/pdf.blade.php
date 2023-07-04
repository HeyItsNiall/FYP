<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Product Details | Furniture Repairing Reservation System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            font-size: 16px;
            line-height: 1.5;
        }

        h2 {
            text-align: center;
            font-size: 2.5em;
            margin-top: 50px;
        }

        h3 {
            font-size: 1.5em;
            margin: 10px 0;
        }

        img {
            display: block;
            margin: 50px auto;
            max-width: 100%;
            height: auto;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 50px;
            border: 1px solid #ccc;
            box-shadow: 0px 0px 10px #ccc;
            background-color: #f8f8f8;
        }

        .label {
            font-weight: bold;
        }

        .title{
            text-align: center;
        }
    </style>
</head>

<body>
    <div class="container">
        <h3 class="title">Furniture Repairing Reservation System</h3>
        <h2>Order Details</h2>

        <div class="customer-details">
            <h3>Customer Information</h3>
            <div class="label">Name:</div>
            <div>{{ $order->name }}</div>
            <div class="label">Email:</div>
            <div>{{ $order->email }}</div>
            <div class="label">Phone:</div>
            <div>{{ $order->phone }}</div>
            <div class="label">Address:</div>
            <div>{{ $order->address }}</div>
            <div class="label">Customer Id:</div>
            <div>{{ $order->user_id }}</div>
        </div>

        <div class="product-details">
            <h3>Product Information</h3>
            <div class="label">Product Name:</div>
            <div>{{ $order->product_title }}</div>
            <div class="label">Product Price:</div>
            <div>{{ $order->price }}</div>
            <div class="label">Product Quantity:</div>
            <div>{{ $order->quantity }}</div>
            <div class="label">Payment Status:</div>
            <div>{{ $order->payment_status }}</div>
            <div class="label">Product Id:</div>
            <div>{{ $order->product_id }}</div>
        </div>

        <img src="product/{{ $order->image }}" alt="Product Image">
    </div>
</body>

</html>
