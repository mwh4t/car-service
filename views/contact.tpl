% rebase('layout.tpl', title=title, year=year)

<h3>{{ message }}</h3>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Services - KorAb Group</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            text-align: center;
        }
        .container {
            width: 80%;
            margin: auto;
            background: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
        }
        .grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            padding: 20px;
        }
        .service-box {
            border: 2px solid red;
            padding: 15px;
            text-align: center;
            background: #fff;
        }
        .service-box img {
            width: 50px;
            height: 50px;
        }
        .menu {
            display: flex;
            justify-content: center;
            background: black;
            padding: 10px;
        }
        .menu a {
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            font-size: 18px;
        }
        .menu a:hover {
            background: red;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Our Services</h1>
        <div class="grid">
            <div class="service-box">
                <img src="fluid_diagnostics.png" alt="Fluid Diagnostics">
                <p>Fluid Diagnostics</p>
            </div>
            <div class="service-box">
                <img src="electronic_diagnostics.png" alt="Electronic Diagnostics">
                <p>Electronic Diagnostics</p>
            </div>
            <div class="service-box">
                <img src="chassis_diagnostics.png" alt="Chassis Diagnostics">
                <p>Chassis Diagnostics</p>
            </div>
            <div class="service-box">
                <img src="chassis_repair.png" alt="Chassis Repair">
                <p>Chassis Repair</p>
            </div>
            <div class="service-box">
                <img src="electronic_repair.png" alt="Electronic Repair">
                <p>Electronic Repair</p>
            </div>
            <div class="service-box">
                <img src="body_work.png" alt="Body Work">
                <p>Body Work</p>
            </div>
            <div class="service-box">
                <img src="tire_service.png" alt="Tire Service">
                <p>Tire Service</p>
            </div>
            <div class="service-box">
                <img src="headlight_adjustment.png" alt="Headlight Adjustment">
                <p>Headlight Adjustment</p>
            </div>
            <div class="service-box">
                <img src="tow_truck.png" alt="Tow Truck Services">
                <p>Tow Truck Services</p>
            </div>
        </div>
    </div>
</body>
</html>