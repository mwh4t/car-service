% rebase('layout.tpl', title='Home Page', year=year)

<style>
    .hero-section {
        background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)), url('/static/images/hero-bg.jpg');
        background-size: cover;
        background-position: center;
        color: white;
        padding: 60px 0;
    }

    .hero-content {
        display: flex;
        align-items: center;
        gap: 50px;
        max-width: 1200px;
        margin: 0 auto;
    }

    .mechanic-img {
        width: 400px;
        height: auto;
        object-fit: contain;
    }

    .hero-text {
        text-align: center;
        flex: 1;
        display: flex;
        flex-direction: column;
        align-items: flex-start;
    }

    .hero-text h1 {
        font-size: 2.5rem;
        margin-bottom: 30px;
        line-height: 1.2;
    }

    .button-wrapper {
        text-align: center;
        margin-top: 20px;
    }

    .features-section {
        padding: 80px 0;
        background: #f8f9fa;
    }
    
    .feature-card {
        padding: 30px;
        background: white;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        margin: 15px;
    }
    
    .booking-form {
        max-width: 500px;
        margin: 0 auto;
        padding: 30px;
        background: white;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
    }
    
    .form-input {
        width: 100%;
        padding: 12px;
        margin: 10px 0;
        border: 1px solid #ddd;
        border-radius: 5px;
    }
    
    .submit-btn {
        background: #007bff;
        color: white;
        padding: 12px 30px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: 0.3s;
    }
    
    .submit-btn:hover {
        background: #0056b3;
    }

</style>

<div class="hero-section">
    <div class="container">
        <div class="hero-content">
            <img src="static/images/mechanic.png" class="mechanic-img">
            <div class="hero-text">
                <h1>Your  Car  in </h1>
                <h1> Safe Hands </h1>
                <div class="button-wrapper">
                    <a href="#booking" class="btn btn-primary btn-lg">Book Inspection</a>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="features-section">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="feature-card">
                    <h3>Expertise and Reliability</h3>
                    <p>State-of-the-art equipment and certified professionals</p>
                </div>
            </div>
            <div class="col-md-6">
                <div class="feature-card">
                    <h3>Quality Assurance</h3>
                    <p>Warranty on all services and use of genuine parts</p>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container py-5" id="booking">
    <div class="booking-form">
        <h2 class="text-center mb-4">Schedule an Inspection</h2>
        <form>
            <input type="text" class="form-input" placeholder="Name" required>
            <input type="tel" class="form-input" placeholder="Phone Number" required>
            <button type="submit" class="submit-btn w-100">Book Now</button>
        </form>
    </div>
</div>

<div class="container text-center py-4">
    <p class="text-muted">Pilot key combination</p>
</div>