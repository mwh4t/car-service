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
        .booking-jumper {
            margin: 40px 0;
            text-align: center;
        }
        .booking-btn {
            background: #007bff;
            color: white;
            padding: 15px 40px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 1.1em;
            transition: background 0.3s;
        }
        .booking-btn:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Our Services</h1>
        <div class="grid">
            <div class="service-box">
                <img src="static/images/fluid_diagnostics.png" alt="Fluid Diagnostics">
                <p>Fluid Diagnostics</p>
            </div>
            <div class="service-box">
                <img src="static/images/electronic_diagnostics.png" alt="Electronic Diagnostics">
                <p>Electronic Diagnostics</p>
            </div>
            <div class="service-box">
                <img src="static/images/chassis_diagnostics.png" alt="Chassis Diagnostics">
                <p>Chassis Diagnostics</p>
            </div>
            <div class="service-box">
                <img src="static/images/chassis_repair.png" alt="Chassis Repair">
                <p>Chassis Repair</p>
            </div>
            <div class="service-box">
                <img src="static/images/electronic_repair.png" alt="Electronic Repair">
                <p>Electronic Repair</p>
            </div>
            <div class="service-box">
                <img src="static/images/body_work.png" alt="Body Work">
                <p>Body Work</p>
            </div>
            <div class="service-box">
                <img src="static/images/tire_service.png" alt="Tire Service">
                <p>Tire Service</p>
            </div>
            <div class="service-box">
                <img src="static/images/headlight_adjustment.png" alt="Headlight Adjustment">
                <p>Headlight Adjustment</p>
            </div>
            <div class="service-box">
                <img src="static/images/tow_truck.png" alt="Tow Truck Services">
                <p>Tow Truck Services</p>
            </div>
        </div>
        <div class="booking-jumper">
            <a href="/#booking" class="booking-btn">Book Inspection Now</a>
        </div>
    </div>
</body>
</html>