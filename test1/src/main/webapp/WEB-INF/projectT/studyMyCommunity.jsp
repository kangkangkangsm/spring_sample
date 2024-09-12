<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <jsp:include page="/layout/menu.jsp"></jsp:include>
	 <title>커뮤니티 게시판</title>
	    <link rel="stylesheet" href="style.css">
	    <style>
	        body {
	            font-family: 'Arial', sans-serif;
	            background-color: #f4f4f4;
	            margin: 0;
	            padding: 0;
	            color: #333;
	        }

	        .container {
	            width: 80%;
	            margin: 20px auto;
	            background-color: #fff;
	            padding: 20px;
	            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	        }

	        table {
	            width: 100%;
	            border-collapse: collapse;
	            margin-top: 20px;
	        }

	        table, th, td {
	     
	        }

	        th, td {
	            padding: 10px;
	            text-align: left;
	        }

	        th {
	            background-color: #eeeeee;
	        }

	        h1 {
	            color: #333;
	            margin-top: 40px;
	            border-bottom: 2px solid #ccc;
	            padding-bottom: 10px;
	        }

	        .section-header {
	            margin-top: 50px;
	        }
	    </style>
	</head>
	<body>
	    <div class="container">
	        <h1>내가 쓴 게시글</h1>
	        <table>
	            <thead>
	                <tr>
	                    <th>제목</th>
	                    <th>작성일</th>
	                    <th>조회</th>
	                    <th>댓글 수</th>
	                </tr>
	            </thead>
	            <tbody>
	                <tr>
	                    <td>웹사이트 리뉴얼 공지</td>
	                    <td>2024-09-12</td>
	                    <td>150</td>
	                    <td>5</td>
	                </tr>
	                <tr>
	                    <td>새로운 CSS 프레임워크 소개</td>
	                    <td>2024-09-10</td>
	                    <td>98</td>
	                    <td>3</td>
	                </tr>
	                <tr>
	                    <td>[오프라인] 국어 스터디 </td>
	                    <td>2024-09-08 부터 ~ </td>
	                    <td>204</td>
	                    <td>12</td>
	                </tr>
	                <tr>
	                    <td>[온라인] jsp 프로젝트 </td>
	                    <td>2024-09-07 부터 ~</td>
	                    <td>134</td>
	                    <td>7</td>
	                </tr>
	                <tr>
	                    <td>Vue.js vs React 실전 비교</td>
	                    <td>2024-09-05</td>
	                    <td>165</td>
	                    <td>9</td>
	                </tr>
	                <tr>
	                    <td>백엔드 개발자를 위한 SQL 팁</td>
	                    <td>2024-09-03</td>
	                    <td>187</td>
	                    <td>6</td>
	                </tr>
	            </tbody>
	        </table>

	        <h1 class="section-header">내가 쓴 댓글</h1>
	        <table>
	            <thead>
	                <tr>
	                    <th>댓글 내용</th>
	                    <th>작성일</th>
	                    <th>원문 제목</th>
	                </tr>
	            </thead>
	            <tbody>
	                <tr>
	                    <td>정말 유익한 글 감사합니다!</td>
	                    <td>2024-09-10</td>
	                    <td>새로운 CSS 프레임워크 소개</td>
	                </tr>
	                <tr>
	                    <td>정보가 많이 부족한 것 같아요.</td>
	                    <td>2024-09-08</td>
	                    <td>JavaScript 최적화 기법</td>
	                </tr>
	                <tr>
	                    <td>이 부분에 대해 더 설명해주실 수 있나요?</td>
	                    <td>2024-09-07</td>
	                    <td>HTML5 새로운 기능</td>
	                </tr>
	                <tr>
	                    <td>동의하기 어렵네요. 다른 관점도 있습니다.</td>
	                    <td>2024-09-05</td>
	                    <td>Vue.js vs React 실전 비교</td>
	                </tr>
	                <tr>
	                    <td>좋은 정보 감사합니다!</td>
	                    <td>2024-09-03</td>
	                    <td>백엔드 개발자를 위한 SQL 팁</td>
	                </tr>
	                <tr>
	                    <td>더 자세한 예시가 필요할 것 같습니다.</td>
	                    <td>2024-09-01</td>
	                    <td>웹사이트 리뉴얼 공지</td>
	                </tr>
	            </tbody>
	        </table>
	    </div>
	</body>
	</html>