% rebase('layout.tpl', title=title, year=year)

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



    <div class="container partners-container">
        <h2>Наши партнеры</h2>

        <!-- Display existing partners -->
        <div class="partners-list">
            % if defined('partners') and partners:
                % for partner in partners:
                    <div class="partner-card">
                        <h3>{{!partner['author']}}</h3>
                        <p class="partner-description">{{!partner['description']}}</p>
                        <div class="partner-meta">
                            <span class="partner-date">Дата: {{!partner['date']}}</span>
                            <span class="partner-phone">Телефон: {{!partner['phone']}}</span>
                        </div>
                    </div>
                % end
            % else:
                <p class="no-partners">Пока нет партнеров</p>
            % end
        </div>

        <!-- Partner submission form -->
        <div class="partner-form-container">
            <h3>Стать партнером</h3>
            <form action="/add_partner" method="post" class="partner-form">
                <div class="form-group">
                    <label for="partner_author">Наименование компании:</label>
                    <input type="text" name="partner_author" id="partner_author"
                           value="{{!form_data.get('author', '') if defined('form_data') else ''}}"
                           class="form-control {{'is-invalid' if defined('errors') and 'author' in errors else ''}}">
                    % if defined('errors') and 'author' in errors:
                        <div class="invalid-feedback">{{!errors['author']}}</div>
                    % end
                </div>

                <div class="form-group">
                    <label for="partner_description">Описание:</label>
                    <textarea name="partner_description" id="partner_description"
                              class="form-control {{'is-invalid' if defined('errors') and 'description' in errors else ''}}"
                              rows="4">{{!form_data.get('description', '') if defined('form_data') else ''}}</textarea>
                    % if defined('errors') and 'description' in errors:
                        <div class="invalid-feedback">{{!errors['description']}}</div>
                    % end
                </div>

                <div class="form-group">
                    <label for="partner_phone">Номер телефона:</label>
                    <input type="tel" name="partner_phone" id="partner_phone"
                           value="{{!form_data.get('phone', '') if defined('form_data') else ''}}"
                           class="form-control {{'is-invalid' if defined('errors') and 'phone' in errors else ''}}"
                           placeholder="+7 (999) 123-45-67">
                    % if defined('errors') and 'phone' in errors:
                        <div class="invalid-feedback">{{!errors['phone']}}</div>
                    % end
                </div>

                <button type="submit" class="btn btn-primary">Добавить партнера</button>
            </form>
        </div>
    </div>

    <style>
    /* CSS styles for partners section */
    .partners-container {
        margin-top: 50px;
        margin-bottom: 50px;
    }

    .partners-list {
        margin-bottom: 40px;
    }

    .partner-card {
        background: #f9f9f9;
        border-left: 4px solid #4b8bf4;
        padding: 20px;
        margin-bottom: 20px;
        border-radius: 4px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }

    .partner-card h3 {
        margin-top: 0;
        color: #333;
    }

    .partner-description {
        margin: 10px 0;
    }

    .partner-meta {
        display: flex;
        justify-content: space-between;
        color: #777;
        font-size: 0.9em;
    }

    .partner-form-container {
        background: #f5f5f5;
        padding: 25px;
        border-radius: 5px;
    }

    .partner-form .form-group {
        margin-bottom: 20px;
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-bottom: 20px;
    }

    .partner-form label {
    margin-bottom: 8px;
    align-self: center;
    }

    .partner-form .form-control {
    width: 100%;
    max-width: 350px;
    box-sizing: border-box;
    }

    .partner-form textarea {
    resize: none;
    }

    .is-invalid {
        border-color: #dc3545;
    }

    .invalid-feedback {
        color: #dc3545;
        font-size: 0.85em;
        margin-top: 5px;
    }

    .no-partners {
        font-style: italic;
        color: #666;
    }
    </style>
</body>
</html>