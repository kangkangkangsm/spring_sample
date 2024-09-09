<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	    <title>Study Main - 마이페이지</title>
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

	        .my-page-container {
	            margin-top: 100px; /* 헤더 공간 확보 */
	            padding: 20px;
	            max-width: 1200px;
	            margin-left: auto;
	            margin-right: auto;
	        }

	        .user-info, .calendar, .my-activity, .settings {
	            background-color: #fff;
	            padding: 20px;
	            border: 1px solid #ddd;
	            border-radius: 8px;
	            margin-bottom: 20px;
	        }

	        .user-info {
	            display: flex;
	            align-items: center;
	            gap: 20px;
	        }

	        .user-info img {
	            width: 80px;
	            height: 80px;
	            border-radius: 50%;
	            object-fit: cover;
	        }

	        .user-info div {
	            flex: 1;
	        }

	        .user-info h3 {
	            margin: 0;
	            font-size: 20px;
	        }

	        .calendar {
	            margin-top: 20px;
	        }

	        .calendar h3 {
	            margin-bottom: 10px;
	            font-size: 24px;
	            font-weight: bold;
	        }

	        .calendar-table {
	            width: 100%;
	            border-collapse: collapse;
	            margin-top: 10px;
	        }

	        .calendar-table th, .calendar-table td {
	            width: 14.28%;
	            border: 1px solid #ddd;
	            padding: 10px;
	            text-align: center;
	        }

	        .calendar-table th {
	            background-color: #f0f0f0;
	            font-weight: bold;
	        }

	        .calendar-table td:hover {
	            background-color: #fffae6;
	            cursor: pointer;
	        }

	        .my-activity, .settings {
	            margin-top: 20px;
	        }

	        .my-activity h3, .settings h3 {
	            margin-bottom: 10px;
	            font-size: 24px;
	            font-weight: bold;
	        }

	        .activity-list, .settings-list {
	            list-style: none;
	            padding: 0;
	        }

	        .activity-list li, .settings-list li {
	            padding: 10px;
	            border-bottom: 1px solid #ddd;
	        }

	        .activity-list li:last-child, .settings-list li:last-child {
	            border-bottom: none;
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
	            <h1 class="logo"><a href="#">StudyMain</a></h1>
	            <nav class="nav">
	                <ul>
	                    <li><a href="#">studyEvent</a></li>
	                    <li><a href="#">studyCommunity</a></li>
	                    <li><a href="#">studyList</a></li>
	                    <li><a href="#">studyHome</a></li>
	                    <li><a href="#">studyToShop</a></li>
	                </ul>
	            </nav>
	            <div class="header-right">
	                <input type="text" placeholder="Search..." class="search-bar">
	                <a href="#" class="cart-icon"><i class="fas fa-shopping-cart"></i></a>
	                <a href="#" class="cart-icon"><i class="fas fa-bell"></i></a>
	            </div>
	        </div>
	    </header>

	    <!-- My Page Container -->
	    <div class="my-page-container">
	        <!-- User Info Section -->
	        <div class="user-info">
	            <img src="user-profile.jpg" alt="User Profile">
	            <div>
	                <h3>하유성</h3>
	                <p>Email: 유성92@naver.com</p>
	                <p>참여중인 스터디: 3개</p>
	            </div>
	        </div>

	        <!-- Calendar Section -->
	        <div class="calendar">
	            <h3>스케줄 관리 캘린더</h3>
	            <table class="calendar-table">
	                <thead>
	                    <tr>
	                        <th>일</th>
	                        <th>월</th>
	                        <th>화</th>
	                        <th>수</th>
	                        <th>목</th>
	                        <th>금</th>
	                        <th>토</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <!-- Example Week -->
	                    <tr>
	                        <td></td>
	                        <td>1</td>
	                        <td>2</td>
	                        <td>3</td>
	                        <td>4</td>
	                        <td>5</td>
	                        <td>6</td>
	                    </tr>
						<tr>
						                        <td>7</td>
						                        <td>8</td>
						                        <td>9</td>
						                        <td>10</td>
						                        <td>11</td>
						                        <td>12</td>
						                        <td>13</td>
						                    </tr>
											<tr>
											                        <td>14</td>
											                        <td>15</td>
											                        <td>16</td>
											                        <td>17</td>
											                        <td>18</td>
											                        <td>19</td>
											                        <td>20</td>
											                    </tr>
																<tr>
																                        <td>21</td>
																                        <td>22</td>
																                        <td>23</td>
																                        <td>24</td>
																                        <td>25</td>
																                        <td>26</td>
																                        <td>27</td>
																                    </tr>
																					<tr>
																					                        <td>28</td>
																					                        <td>29</td>
																					                        <td>30</td>
																					                        <td>31</td>
																					                        <td></td>
																					                        <td></td>
																					                        <td></td>
																					                    </tr>
	                    <!-- Add more weeks as needed -->
	                </tbody>
	            </table>
	        </div>

	        <!-- My Activity Section -->
	        <div class="my-activity">
	            <h3>내 활동</h3>
	            <ul class="activity-list">
	                <li>내가 작성한 게시글</li>
	                <li>내가 작성한 댓글</li>
	                <li>내가 참여했던 스터디</li>
	                <li>몰라몰라몰라요</li>
	            </ul>
	        </div>

	        <!-- Settings Section -->
	        <div class="settings">
	            <h3>설정</h3>
	            <ul class="settings-list">
	                <li>프로필 수정</li>
	                <li>비밀번호 변경</li>
	                <li>알림</li>
	                <li>로그아웃</li>
	            </ul>
	        </div>
	    </div>

	    <!-- Footer -->
	    <footer class="footer">
	        <div class="container">
	            <p>&copy; 2024 StudyMain. All rights reserved.</p>
	        </div>
	    </footer>

	</body>
	</html>