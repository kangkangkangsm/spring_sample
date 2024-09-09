<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	 <title>ShopMain - 리뷰 페이지</title>
	    <!-- Font Awesome for Icons -->
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
	    <!-- Google Fonts -->
	    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
	    <style>
	        body {
	            margin: 0;
	            font-family: 'Roboto', sans-serif;
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
	            display: flex;
	            justify-content: center;
	            align-items: center;
	        }

	        .header .container {
	            display: flex;
	            align-items: center;
	            justify-content: space-between;
	            max-width: 1200px;
	            width: 100%;
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
	            margin: 0 15px;
	        }

	        .nav ul li a {
	            color: #333;
	            text-decoration: none;
	            font-weight: 500;
	        }

	        .header-right {
	            display: flex;
	            align-items: center;
	            gap: 15px;
	        }

	        .search-bar {
	            padding: 5px;
	            margin-right: 10px;
	            border: 1px solid #ddd;
	            border-radius: 4px;
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
	            border-radius: 4px;
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

	        .review-page {
	            margin-top: 100px; /* 헤더 공간 확보 */
	            padding: 20px;
	            max-width: 1200px;
	            margin-left: auto;
	            margin-right: auto;
	        }

	        .review-header {
	            display: flex;
	            justify-content: space-between;
	            align-items: center;
	            margin-bottom: 30px;
	        }

	        .review-header h2 {
	            font-size: 28px;
	            font-weight: bold;
	            color: #333;
	        }

	        .review-header button {
	            padding: 10px 20px;
	            background-color: #ff6f61;
	            color: #fff;
	            border: none;
	            border-radius: 5px;
	            cursor: pointer;
	            font-size: 16px;
	        }

	        .review-header button:hover {
	            background-color: #e55a50;
	        }

	        .review-list {
	            display: flex;
	            flex-direction: column;
	            gap: 20px;
	        }

	        .review-card {
	            background-color: #fff;
	            border: 1px solid #ddd;
	            border-radius: 8px;
	            padding: 20px;
	            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	            display: flex;
	            gap: 20px;
	        }

	        .review-card img {
	            width: 80px;
	            height: 80px;
	            border-radius: 50%;
	            object-fit: cover;
	        }

	        .review-content {
	            flex: 1;
	        }

	        .review-content h3 {
	            font-size: 18px;
	            font-weight: bold;
	            margin-bottom: 5px;
	            color: #333;
	        }

	        .review-content p {
	            font-size: 14px;
	            color: #666;
	            margin-bottom: 10px;
	        }

	        .review-content .review-date {
	            font-size: 12px;
	            color: #999;
	        }

	        .stars {
	            color: #ffcc00;
	            margin-bottom: 10px;
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
	            <h1 class="logo"><a href="#">ShopMain</a></h1>
	            <nav class="nav">
	                <ul>
	                    <li><a href="#">Home</a></li>
	                    <li><a href="#">AllBook</a></li>
	                    <li><a href="#">NewBook</a></li>
	                    <li><a href="#">Best</a></li>
	                    <li><a href="#">할인 상품</a></li>
	                    <li><a href="#">리뷰</a></li>
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

	    <!-- Review Page Content -->
	    <div class="review-page">
	        <div class="review-header">
	            <h2>내 구매목록</h2>

	        </div>
	        <div class="review-list">
	            <!-- Example Review Card 1 -->
	            <div class="review-card">
	                <img src="user1.jpg" alt="User 1">
	                <div class="review-content">
	                    <h3>김용준</h3>
	                    <div class="stars">
	                        ★★★★☆
	                    </div>
	                    <p>이 제품 정말 마음에 들어요! 품질도 좋고 배송도 빨라서 좋았습니다. 적극 추천합니다!</p>
	                    <span class="review-date">2024년 9월 9일</span>
	                </div>
	            </div>
				
				<div class="review-card">
				    <img src="default-avatar.jpg" alt="Default Avatar">
				    <div class="review-content">
				        <h3>리뷰 작성이 필요합니다.</h3>
				        <div class="stars" style="color: #ffcc00; font-size: 20px;">
				        
				        </div>
				        <p style="color: #666;">이 제품에 대한 유성씨의 의견을 공유해 주세요!</p>
				        <button style="padding: 10px 15px; background-color: #ff6f61; color: #fff; border: none; border-radius: 5px; cursor: pointer;">
				            리뷰 작성하기
				        </button>
				        <span class="review-date" style="display: block; margin-top: 10px; font-size: 12px; color: #999;">구매 하신 책의 리뷰를 작성해 주세요.</span>
				    </div>
				</div>
							
	            <!-- Example Review Card 2 -->
	            <div class="review-card">
	                <img src="user2.jpg" alt="User 2">
	                <div class="review-content">
	                    <h3>황보현</h3>
	                    <div class="stars">
	                        ★★★★★
	                    </div>
	                    <p>너무 예쁜 디자인이에요. 매일 사용하고 있어요. 꼭 구매해보세요!</p>
	                    <span class="review-date">2024년 9월 8일</span>
	                </div>
	            </div>
	            <!-- Example Review Card 3 -->
	            <div class="review-card">
	                <img src="user3.jpg" alt="User 3">
	                <div class="review-content">
	                    <h3>송태근</h3>
	                    <div class="stars">
	                        ★★★☆☆
	                    </div>
	                    <p>사용하기에는 나쁘지 않지만, 조금 더 개선되면 좋겠습니다. 전반적으로 만족합니다.</p>
	                    <span class="review-date">2024년 9월 7일</span>
	                </div>
	            </div>
	        </div>
	    </div>

	    <!-- Footer -->
	    <footer class="footer">
	        <div class="container">
	            <p>&copy; 2024 ShopMain. All rights reserved.</p>
	        </div>
	    </footer>

	</body>
	</html>