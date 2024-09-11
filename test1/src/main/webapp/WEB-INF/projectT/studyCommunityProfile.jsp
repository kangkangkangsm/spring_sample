<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <jsp:include page="/layout/menu.jsp"></jsp:include>
	 <title>이재승 프로필</title>
	    <link rel="stylesheet" href="style.css">
	    <style>
	        body {
	            font-family: Arial, sans-serif;
	            margin: 0;
	            padding: 0;
	            background-color: #f4f4f4;
	        }

	        .profile-container {
	            width: 80%;
	            max-width: 800px;
	            margin: 40px auto;
	            background-color: #fff;
	            padding: 20px;
	            border-radius: 10px;
	            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	        }

	        .profile-header {
	            display: flex;
	            align-items: center;
	            margin-bottom: 20px;
	        }

	        .profile-img-large {
	            width: 100px;
	            height: 100px;
	            border-radius: 50%;
	            margin-right: 20px;
	        }

	        .profile-info {
	            flex-grow: 1;
	        }

	        .profile-info h2 {
	            margin: 0;
	            padding: 0;
	        }

	        .profile-info p {
	            margin: 5px 0;
	            color: #777;
	        }

	        .profile-stats {
	            display: flex;
	            justify-content: space-around;
	            margin-top: 20px;
	            padding: 10px 0;
	            border-top: 1px solid #ddd;
	        }

	        .profile-stats div {
	            text-align: center;
	        }

	        .profile-stats div p {
	            margin: 5px 0;
	        }

	        .activity-section {
	            margin-top: 30px;
	        }

	        .activity-section h3 {
	            margin-bottom: 20px;
	            font-size: 18px;
	        }

	        .activity-item {
	            display: flex;
	            align-items: center;
	            margin-bottom: 10px;
	        }

	        .activity-item img {
	            width: 40px;
	            height: 40px;
	            border-radius: 50%;
	            margin-right: 10px;
	        }

	        .activity-item .activity-content {
	            flex-grow: 1;
	        }

	        .activity-item a {
	            text-decoration: none;
	            color: #007bff;
	            font-weight: bold;
	        }
	    </style>
	</head>

	<body>
	    <div class="profile-container">
	        <div class="profile-header">
	            <img src="profile_large.png" alt="이재승 프로필 사진" class="profile-img-large">
	            <div class="profile-info">
	                <h2>이재승</h2>
	                <p>[등급]</p>
	            </div>
	        </div>
	        <div class="profile-stats">
	            <div>
	                <p><strong>게시글</strong></p>
	                <p>34</p>
	            </div>
	            <div>
	                <p><strong>댓글</strong></p>
	                <p>68</p>
	            </div>
	            <div>
	                <p><strong>좋아요</strong></p>
	                <p>120</p>
	            </div>
	        </div>

	        <div class="activity-section">
	            <h3>최근 활동</h3>
	            <div class="activity-item">
	                <img src="profile_small.png" alt="프로필 사진">
	                <div class="activity-content">
	                    <a href="#">다음주 스프링 수업 계획 안내</a>
	                    <p>2024.08.30 작성</p>
	                </div>
	            </div>
	            <div class="activity-item">
	                <img src="profile_small.png" alt="프로필 사진">
	                <div class="activity-content">
	                    <a href="#">REST API 설계의 기초</a>
	                    <p>2024.08.25 작성</p>
	                </div>
	            </div>
	        </div>
			<div class="activity-section">
			            <h3>참여중인 스터디</h3>
			            <div class="activity-item">
			                <img src="profile_small.png" alt="프로필 사진">
			                <div class="activity-content">
			                    <a href="#">국어 스터디 </a>
			                    <p>2024.08.30 부터 ~ </p>
			                </div>
			            </div>
			            <div class="activity-item">
			                <img src="profile_small.png" alt="프로필 사진">
			                <div class="activity-content">
			                    <a href="#">api 프로젝트</a>
			                    <p>2024.08.25 부터 ~</p>
			                </div>
			            </div>
			        </div>
	    </div>
	</body>

	</html>