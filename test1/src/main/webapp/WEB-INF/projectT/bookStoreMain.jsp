<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <jsp:include page="/layout/menu.jsp"></jsp:include>
    <title>ShopMain - Combined Design</title>
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- Google Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        .header {
            background-color: #fff;
            color: #333;
            padding: 10px 0;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            border-bottom: 1px solid #ddd;
        }

        .header .container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .header .logo a {
            color: #333;
            text-decoration: none;
            font-size: 24px;
            font-weight: bold;
        }

        .nav ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
        }

        .nav ul li {
            margin: 0 10px;
        }

        .nav ul li a {
            color: #333;
            text-decoration: none;
        }

        .header-right {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .search-bar {
            padding: 5px;
            margin-right: 10px;
        }

        .cart-icon, .login-button {
            color: #333;
            text-decoration: none;
            margin-left: 10px;
            position: relative;
            padding: 10px;
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #444;
            min-width: 160px;
            z-index: 1;
            top: 100%;
            left: 0;
        }

        .dropdown-content a {
            color: #fff;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {
            background-color: #575757;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .main-banner {
            background-image: url('banner.jpg');
            background-size: cover;
            background-position: center;
            color: #fff;
            text-align: center;
            padding: 100px 20px;
            margin-top: 60px;
        }

        .banner h2 {
            font-size: 48px;
            margin-bottom: 10px;
        }

        .banner p {
            font-size: 18px;
            margin-bottom: 20px;
        }

        .banner-btn {
            background-color: #ff6f61;
            color: #fff;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
        }

        .recommended-products {
            padding: 40px 20px;
            background-color: #fff;
            margin-top: 20px;
        }

        .product-grid {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            justify-content: center;
        }

        .product-card {
            background-color: #fff;
            border: 1px solid #ddd;
            padding: 20px;
            text-align: center;
            flex: 1;
            min-width: 250px;
            max-width: 250px;
            margin-bottom: 20px;
        }

        .product-card img {
            width: 100%;
            height: auto;
        }

        .product-card h3 {
            margin: 10px 0;
            font-size: 18px;
        }

        .buy-button {
            background-color: #ff6f61;
            color: #fff;
            border: none;
            padding: 10px;
            cursor: pointer;
            border-radius: 5px;
        }

        .footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 20px 0;
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <!-- Header -->
    <header class="header">
        <div class="container">
            <h1 class="logo"><a href="#">현이의가방끈</a></h1>
            <nav class="nav">
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#">All</a></li>
                    <li><a href="#">New</a></li>
                    <li><a href="#">Best</a></li>
                    <li><a href="#">Sail</a></li>
                    <li><a href="#">Review</a></li>
                </ul>
            </nav>
            <div class="header-right">
                <input type="text" placeholder="Search..." class="search-bar">
                <div class="dropdown">
                    <a href="#" class="login-button">Login</a>
                    <div class="dropdown-content">
                        <a href="#">MyStudy</a>
                        <a href="#">Join</a>
                        <a href="#">MyInfo</a>
                        <a href="#">Logout</a>
                        <a href="#">Admin</a>
                    </div>
                </div>
                <a href="#" class="cart-icon"><i class="fas fa-shopping-cart"></i></a>
                <a href="#" class="cart-icon"><i class="fas fa-bell"></i></a>
            </div>
        </div>
    </header>

    <!-- Main Banner -->
    <section class="main-banner">
        <div class="banner">
            <h2>추천 상품을 만나보세요!</h2>
            <p>최고의 상품과 할인 혜택을 확인하세요.</p>
            <a href="#" class="banner-btn">지금 쇼핑하기</a>
        </div>
    </section>

    <!-- Recommended Products -->
    <section class="recommended-products">
        <div class="container">
            <h2>이달의 도서</h2>
            <div class="product-grid">
                <!-- Example Product Card 1 -->
                <div class="product-card">
                    <img src="book1.jpg" alt="Book 1">
                    <h3>책 제목 A</h3>
                    <p>₩12,000</p>
                    <button class="buy-button">자세히 보기</button>
                </div>
                <!-- Example Product Card 2 -->
                <div class="product-card">
                    <img src="book2.jpg" alt="Book 2">
                    <h3>책 제목 B</h3>
                    <p>₩15,500</p>
                    <button class="buy-button">자세히 보기</button>
                </div>
                <!-- Example Product Card 3 -->
                <div class="product-card">
                    <img src="book3.jpg" alt="Book 3">
                    <h3>책 제목 C</h3>
                    <p>₩18,000</p>
                    <button class="buy-button">자세히 보기</button>
                </div>
                <!-- Example Product Card 4 -->
                <div class="product-card">
                    <img src="book4.jpg" alt="Book 4">
                    <h3>책 제목 D</h3>
                    <p>₩22,000</p>
                    <button class="buy-button">자세히 보기</button>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p>&copy; 2024 ShopMain. All rights reserved.</p>
        </div>
    </footer>

</body>
</html>
