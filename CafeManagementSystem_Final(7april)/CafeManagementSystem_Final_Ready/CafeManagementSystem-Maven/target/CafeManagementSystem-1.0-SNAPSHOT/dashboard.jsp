<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Restaurant Dashboard</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
        }

        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #c1dfc4, #deecdd);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px;
        }

        .dashboard-wrapper {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 40px;
            width: 100%;
            max-width: 1000px;
        }

        .dashboard-container {
            background: #ffffff;
            border: 2px solid #a5d6a7;
            border-radius: 16px;
            padding: 30px;
            text-align: center;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease-in-out;
        }

        .dashboard-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
        }

        h2 {
            font-size: 24px;
            color: #2e7d32;
            margin-bottom: 25px;
            border-bottom: 2px dashed #a5d6a7;
            padding-bottom: 10px;
        }

        .nav-links {
            display: flex;
            flex-direction: column;
            gap: 15px;
            margin-bottom: 20px;
        }

        .nav-links a {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            background: linear-gradient(90deg, #66bb6a, #43a047);
            color: white;
            font-weight: bold;
            font-size: 16px;
            padding: 12px;
            border-radius: 10px;
            text-decoration: none;
            box-shadow: 0 4px 12px rgba(76, 175, 80, 0.3);
            transition: background 0.3s ease, transform 0.2s ease;
        }

        .nav-links a:hover {
            background: linear-gradient(90deg, #43a047, #2e7d32);
            transform: translateY(-2px);
        }

        .logout {
            display: inline-block;
            background: linear-gradient(90deg, #ef5350, #e53935);
            color: white;
            padding: 10px 20px;
            border-radius: 10px;
            font-size: 16px;
            font-weight: bold;
            text-decoration: none;
            transition: background 0.3s ease, transform 0.2s ease;
            box-shadow: 0 4px 12px rgba(244, 67, 54, 0.3);
        }

        .logout:hover {
            background: linear-gradient(90deg, #e53935, #c62828);
            transform: scale(1.05);
        }

    </style>
</head>
<body>

<div class="dashboard-wrapper">
    <!-- First Restaurant -->
    <div class="dashboard-container">
        <h2>FOOD PLACE CAFE - Restaurant</h2>
        <div class="nav-links">
            <a href="menu.jsp"><i class='bx bxs-food-menu'></i> View Menu</a>
            <a href="order.jsp"><i class='bx bxs-cart'></i> View Orders</a>
        </div>
        <a href="index.jsp" class="logout"><i class='bx bx-log-out'></i> Logout</a>
    </div>


</body>
</html>
