<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>

    <style>
        body {
            margin: 0;
            background-color: #ffffff;

            background-size: cover;
        }

        header {
            backdrop-filter: blur(10px);
            background-color: black;
            color: white;
            padding: 15px;
            text-align: center;
        }
        .container {
            display: flex;
            flex-wrap: wrap;
            padding: 20px;
        }

        .card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: 15px;
            flex: 1;
            min-width: 300px;
            max-width: 400px;
            padding: 20px;
        }
        .card h2 {
            margin-top: 0;
            color: white;
        }

        .btn {
            background-color: #506651;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #45a049;
        }

        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px 0;
            position: relative;
            margin-top: 20px;
        }

        footer a {
            color: #4CAF50;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<header>
    <h1>Welcome Sir!</h1>
</header>

<div class="container">
    <div class="card">
        <form method="get" action="approve">
            <h2>Check Requests</h2>
            <p>View and manage pending requests from Customers.</p>
            <button class="btn">View Requests</button>
        </form>
    </div>
    <div class="card" >
        <form action="view_rent" method="post">
            <h2>Available Properties</h2>
            <p>See all properties available for sale and rent.</p>
            <button class="btn" >View Properties</button>
        </form>

    </div>
    <div class="card">
        <form action="add" method="get" >
            <h2>Add Property</h2>
            <p>Add new properties for sale or rent.</p>
            <button class="btn">Add Property</button>
        </form>
    </div>

    <div class="card" >
        <form action="remove" method="get">
            <h2>Remove Sold Property</h2>
            <p>Delete properties that have been sold.</p>
            <button class="btn">Remove Property</button>
        </form>
    </div>

</div>

<footer>
    <p>&copy; 2024 RealEstate Broacker <a href="">About us</a></p>
</footer>
</body>
</html>
