% rebase('layout.tpl', title=title, year=year)

<h3>{{ message }}</h3>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KorAb Group - Modern Auto Service</title>
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
        p {
            font-size: 18px;
            color: #555;
        }
        .contact {
            margin-top: 20px;
            font-size: 16px;
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
        <h1><strong>KorAb Group</strong> - one of the new, modern auto services in Saint Petersburg</h1>
        <img src="static\images\Niva.png" alt="Car Repair Process">
        <p>KorAb Group is a next-generation auto repair shop offering repair and diagnostic services for all vehicles.</p>
        <p>Our service center is ready to accept cars of any make and complexity.</p>
        <p>We have all the necessary equipment and specialists who can work with both internal combustion engine cars and hybrid or electric vehicles.</p>
        
        <h2>What makes our service unique?</h2>
        <p>Although we are not official dealers, we are ready to take on any work at any level of complexity.</p>
        <p>We guarantee high quality and transparency in our work.</p>
        <p>We are one of the few who can handle electric and hybrid cars, perform factory assembly, and ensure safety in electrical systems.</p>
        
        <div class="contact">
            <h3>Contact Us</h3>
            <p><strong>Support:</strong> <a href="mailto:Support@example.com">ab4shevD@mail.ru</a></p>
            <p><strong>Marketing:</strong> <a href="mailto:Marketing@example.com">mwh4t@yandex.ru</a></p>
        </div>

        <div class="booking-jumper">
            <a href="/#booking" class="booking-btn">Book Inspection Now</a>
        </div>
    </div>
</body>
</html>
