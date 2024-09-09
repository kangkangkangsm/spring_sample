<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	  <title>마이페이지</title>
	    <style>
	        body {
	            font-family: Arial, sans-serif;
	            margin: 0;
	            padding: 0;
	            background-color: #f4f4f9;
	        }
	        .container {
	            width: 90%;
	            margin: 0 auto;
	            padding: 20px;
	        }
	        header {
	            background-color: #4CAF50;
	            color: white;
	            padding: 20px;
	            text-align: center;
	            font-size: 2em;
	            font-weight: bold;
	        }
	        .profile-section, .study-section {
	            background-color: white;
	            border-radius: 10px;
	            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	            padding: 20px;
	            margin: 20px 0;
	        }
	        .profile-section h2, .study-section h2 {
	            margin-top: 0;
	            font-size: 1.8em;
	        }
	        .profile-section p, .study-card p {
	            font-size: 1.2em;
	            margin: 10px 0;
	            color: #555;
	        }
	        .study-card {
	            background-color: #e9e9e9;
	            border-radius: 10px;
	            padding: 20px;
	            margin-bottom: 15px;
	            display: flex;
	            justify-content: space-between;
	            align-items: center;
	        }
	        .study-card h4 {
	            margin: 0;
	            font-size: 1.5em;
	            color: #333;
	        }
	        .study-card button {
	            background-color: #FF6F61;
	            color: white;
	            padding: 10px 15px;
	            border: none;
	            border-radius: 5px;
	            cursor: pointer;
	            font-size: 1em;
	        }
	    </style>
	</head>
	<body>
	    <div class="container">
	        <header>
	            마이페이지
	        </header>

	        <section class="profile-section">
	            <h2>내 프로필</h2>
	            <p>이름: 홍길동</p>
	            <p>이메일: honggildong@example.com</p>
	            <p>가입일: 2023-09-07</p>
	        </section>

	        <section class="study-section">
	            <h2>참여 중인 스터디</h2>

	            <div class="study-card">
	                <div>
	                    <h4>AI 프로그래밍 [온라인]</h4>
	                    <p>참여자 수: 4/5</p>
	                    <p>기간: 4주</p>
	                </div>
	                <button>리뷰 작성</button>
	            </div>

	            <div class="study-card">
	                <div>
	                    <h4>문학 읽기 [혼합]</h4>
	                    <p>참여자 수: 7/10</p>
	                    <p>기간: 5주</p>
	                </div>
	                <button>리뷰 작성</button>
	            </div>

	            <!-- 추가적인 스터디 카드들... -->
	        </section>
	    </div>
	</body>
	</html>