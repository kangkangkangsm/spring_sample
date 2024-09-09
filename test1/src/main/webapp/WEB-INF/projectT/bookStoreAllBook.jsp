<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	 <title>ShopMain - Filter and Selection Page</title>
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

		        .main-content {
		            display: flex;
		            padding: 100px 20px;
		            gap: 20px;
		        }

		        .sidebar {
		            width: 250px;
		            background-color: #fff;
		            padding: 20px;
		            border: 1px solid #ddd;
		            border-radius: 8px;
		            margin-right: 20px;
		        }

		        .sidebar h3 {
		            font-size: 18px;
		            margin-bottom: 10px;
		            border-bottom: 2px solid #f0f0f0;
		            padding-bottom: 5px;
		        }

		        .sidebar .filter-group {
		            margin-bottom: 20px;
		        }

		        .sidebar button, .sidebar input[type="range"] {
		            margin: 5px 0;
		            width: 100%;
		            padding: 10px;
		            border: 1px solid #ddd;
		            background-color: #fff;
		            cursor: pointer;
		            border-radius: 4px;
		            transition: background-color 0.3s, color 0.3s;
		        }

		        .sidebar button:hover {
		            background-color: #ff6f61;
		            color: #fff;
		        }

		        .sidebar input[type="range"] {
		            -webkit-appearance: none;
		            width: 100%;
		            height: 5px;
		            background: #ddd;
		            border-radius: 5px;
		            outline: none;
		            padding: 0;
		        }

		        .content-area {
		            flex: 1;
		            background-color: #f9f9f9;
		            padding: 20px;
		            border-radius: 8px;
		        }

		        .content-area .search-bar {
		            width: calc(100% - 160px);
		            margin-right: 10px;
		            padding: 10px;
		            border: 1px solid #ddd;
		            border-radius: 4px;
		        }

		        .content-area .search-button {
		            padding: 10px 20px;
		            background-color: #ff6f61;
		            color: #fff;
		            border: none;
		            cursor: pointer;
		            border-radius: 4px;
		            transition: background-color 0.3s;
		        }

		        .content-area .search-button:hover {
		            background-color: #e55a50;
		        }

		        .content-area .items-grid {
		            display: flex;
		            flex-wrap: wrap;
		            gap: 20px;
		            margin-top: 20px;
		        }

		        .content-area .item-card {
		            background-color: #fff;
		            border: 1px solid #ddd;
		            padding: 20px;
		            text-align: center;
		            flex: 1;
		            min-width: 250px;
		            max-width: 250px;
		            margin-bottom: 20px;
		            border-radius: 8px;
		            transition: box-shadow 0.3s;
		        }

		        .content-area .item-card:hover {
		            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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

		    <!-- Main Content -->
		    <div class="main-content">
		        <!-- Sidebar Filters -->
		        <div class="sidebar">
		            <h3>필터링 옵션</h3>
		            <!-- Example Filters -->
		            <div class="filter-group">
		                <h4>연령별</h4>
		                <button>초등</button>
		                <button>중등</button>
		                <button>고등</button>
		            </div>
		            <div class="filter-group">
		                <h4>온라인/오프라인</h4>
		                <button>온라인</button>
		                <button>오프라인</button>
		            </div>
		            <div class="filter-group">
		                <h4>과목</h4>
		                <button>수학</button>
		                <button>영어</button>
		                <button>코딩</button>
		            </div>
		            <div class="filter-group">
		                <h4>가격대</h4>
		                <input type="range" min="0" max="200000" value="50000">
		            </div>
		        </div>

		        <!-- Content Area -->
		        <div class="content-area">
		            <div>
		                <input type="text" class="search-bar" placeholder="검색어를 입력하세요">
		                <button class="search-button">검색</button>
		            </div>
		            <div class="items-grid">
		                <!-- Example Item Card -->
		                <div class="item-card">
		                    <h3>수학 [오프라인]</h3>
		                    <p>중등 수학, 화목반</p>
		                    <p>참여기간: 6주</p>
		                </div>
		                <div class="item-card">
		                    <h3>영어 토론 [온라인]</h3>
		                    <p>고등 영어, 토론반</p>
		                    <p>참여기간: 8주</p>
		                </div>
		                <div class="item-card">
		                    <h3>AI 프로그래밍 [혼합]</h3>
		                    <p>AI 코딩 기초반</p>
		                    <p>참여기간: 10주</p>
		                </div>
		                <div class="item-card">
		                    <h3>독서 스터디 [오프라인]</h3>
		                    <p>고전 독서, 소모임</p>
		                    <p>참여기간: 4주</p>
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