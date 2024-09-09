<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	 <title>모임 참가 신청</title>
	 <style>
	       body {
	           font-family: Arial, sans-serif;
	           background-color: #f4f4f4;
	           margin: 0;
	           padding: 20px;
	       }
	       .container {
	           max-width: 600px;
	           margin: 0 auto;
	           background-color: white;
	           padding: 20px;
	           border-radius: 8px;
	           box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	       }
	       h2 {
	           text-align: center;
	           color: #333;
	       }
	       label {
	           display: block;
	           margin: 15px 0 5px;
	           color: #333;
	       }
	       input[type="text"], textarea {
	           width: 100%;
	           padding: 10px;
	           margin-bottom: 15px;
	           border: 1px solid #ddd;
	           border-radius: 4px;
	           font-size: 16px;
	       }
	       button {
	           display: block;
	           width: 100%;
	           padding: 10px;
	           background-color: #FFA500; /* 주황색으로 변경 */
	           color: white;
	           border: none;
	           border-radius: 4px;
	           font-size: 16px;
	           cursor: pointer;
	       }
	       button:hover {
	           background-color: #e69500;
	       }
	   </style>
	</head>
	<body>

	<div class="container">
	    <h2>고등 국어 [오프라인] 스터디 모임 - 참가 신청</h2>

	    <form action="/submit_form" method="POST">
	        <label for="intro">자기소개:</label>
	        <textarea id="intro" name="intro" rows="4" placeholder="간단한 자기소개를 작성해주세요."></textarea>

	        <label for="goal">학습 목표:</label>
	        <textarea id="goal" name="goal" rows="4" placeholder="학습 목표를 작성해주세요."></textarea>

	        <label for="questions">추가 질문 (선택 사항):</label>
	        <textarea id="questions" name="questions" rows="3" placeholder="궁금한 사항이 있다면 작성해주세요."></textarea>

	        <button type="submit">참가 신청하기</button>
	    </form>
	</div>

	</body>
	</html>

