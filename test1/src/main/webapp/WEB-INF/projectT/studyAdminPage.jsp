<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	 <title>관리자페이지</title>
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
	        .admin-controls {
	            background-color: white;
	            border-radius: 10px;
	            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	            padding: 20px;
	            margin-top: 20px;
	        }
	        .admin-controls h2 {
	            font-size: 1.8em;
	            margin-top: 0;
	            margin-bottom: 20px;
	        }
	        .admin-controls button {
	            background-color: #FF6F61;
	            color: white;
	            padding: 10px 20px;
	            border: none;
	            border-radius: 5px;
	            cursor: pointer;
	            font-size: 1em;
	            margin-right: 10px;
	            margin-bottom: 10px;
	        }
	    </style>
	</head>
	<body>
	    <div class="container">
	        <header>
	            관리자페이지
	        </header>

	        <section class="admin-controls">
	            <h2>사용자 관리</h2>
	            <button>사용자 추가</button>
	            <button>사용자 삭제</button>
	            <button>사용자 수정</button>

	            <h2>스터디 관리</h2>
	            <button>스터디 추가</button>
	            <button>스터디 삭제</button>
	            <button>스터디 수정</button>
	        </section>
	    </div>
	</body>
	</html>