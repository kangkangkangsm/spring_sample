<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <jsp:include page="/layout/menu.jsp"></jsp:include>
    <title>첫번째 페이지</title>  
    <style>>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #E0E0E0;
            padding: 20px;
            text-align: left;
            font-size: 18px;
            font-weight: bold;
        }
        .header button {
            float: right;
            padding: 10px;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .container {
            display: flex;
            flex-wrap: wrap;
            margin: 20px;
        }
        .sidebar {
            width: 30%;
            padding: 20px;
            background-color: #FFE080;
            border-radius: 10px;
            margin-right: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .sidebar h3 {
            font-size: 14px;
            margin-bottom: 15px;
            color: #333;
        }
        .sidebar button, .sidebar input {
            width: 100%;
            margin-bottom: 10px;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #FFA800;
            color: white;
            font-size: 14px;
            cursor: pointer;
        }
        .sidebar input[type="range"] {
            background-color: transparent;
        }
        .sidebar button:hover {
            background-color: #ff8000;
        }
        .sidebar .age-group,
        .sidebar .subject-group,
        .sidebar .gender-group {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }
        .sidebar .age-group button, 
        .sidebar .subject-group button, 
        .sidebar .gender-group button {
            flex: 1;
            min-width: 70px;
        }
        .main-content {
            flex-grow: 1;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .search-bar {
            display: flex;
            margin-bottom: 20px;
        }
        .search-bar input {
            flex-grow: 1;
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ddd;
            margin-right: 10px;
        }
        .search-bar button {
            padding: 10px 20px;
            background-color: #FFA800;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .study-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }
        .study-item {
            background-color: #FFF3E0;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .study-item h4 {
            margin: 0 0 10px 0;
            color: #FFA800;
            font-size: 18px;
        }
        .study-item p {
            margin: 5px 0;
            font-size: 14px;
            color: #666;
        }
        .register-button {
            margin-top: 20px;
            padding: 15px;
            font-size: 16px;
            background-color: #FFA800;
            color: white;
            border-radius: 10px;
            text-align: center;
            cursor: pointer;
        }
        .register-button:hover {
            background-color: #ff8000;
        }
    </style>
</head>
<body>

<div class="header">
    바로가기 누르면 나올 창
    <button>로그인</button>
</div>

<div class="container">
    <!-- Sidebar -->
    <div class="sidebar">
        <h3>연령</h3>
        <div class="age-group">
            <button>중학생</button>
            <button>고등학생</button>
            <button>20대</button>
            <button>30대</button>
            <button>시니어</button>
        </div>
        
        <h3>과목</h3>
        <div class="subject-group">
            <button>수학</button>
            <button>영어</button>
            <button>과학/공부</button>
            <button>사회과목</button>
            <button>미술</button>
            <button>경영</button>
            <button>코딩</button>
            <button>금융</button>
        </div>

        <h3>인원</h3>
        <input type="range" min="1" max="8" value="1">
        
        <h3>참여 기간</h3>
        <input type="range" min="1" max="100" value="10">
        
        <h3>성별</h3>
        <div class="gender-group">
            <button>남성</button>
            <button>여성</button>
            <button>혼성</button>
        </div>
        
        <div class="register-button">
            나만의 스터디 만들러가기
        </div>
    </div>
    
    <!-- Main Content (unchanged as requested) -->
    <div class="main-content">
        <div class="search-bar">
            <input type="text" placeholder="검색어를 입력하세요">
            <button>검색</button>
        </div>
        
        <!-- Study Grid -->
        <div class="study-grid">
            <div class="study-item">
                <h4>스터디 1</h4>
                <p>설명: Lorem ipsum dolor sit amet.</p>
            </div>
            <div class="study-item">
                <h4>스터디 2</h4>
                <p>설명: Lorem ipsum dolor sit amet.</p>
            </div>
            <!-- Add more study items as needed -->
        </div>
    </div>
</div>

</body>
</html>
