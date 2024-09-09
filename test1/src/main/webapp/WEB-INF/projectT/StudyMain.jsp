<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	  <title>스터디 메인페이지</title>
	    <style>
	        body {
	            font-family: Arial, sans-serif;
	            margin: 0;
	            padding: 0;
				background-color: #f4f4f9;
				          color: #333333;
	        }
	        .container {
	            width: 70%;
	            margin: 0 auto;
	            padding: 20px;
	        }
	        header {
	            background-color: #333;
	            color: white;
	            padding: 20px;
	            text-align: center;
	            font-size: 2.5em;
	            font-weight: bold;
	            border-radius: 10px;
	        }
	        .search-bar-container {
	            display: flex;
	            justify-content: space-between;
	            align-items: center;
	            margin: 30px 0;
	        }
	        .search-bar {
	            width: 88%;
	            padding: 15px;
	            border-radius: 5px;
	            border: 1px solid #ccc;
	            font-size: 1.2em;
	        }
	        .register-button {
	            background-color: #FF6F61;
	            color: white;
	            padding: 15px 30px;
	            border: none;
	            border-radius: 5px;
	            cursor: pointer;
	            font-size: 1.2em;
	        }
	        .highlighted-studies {
	            margin-top: 40px;
	        }
	        .highlighted-studies h2 {
	            font-size: 2em;
	            margin-bottom: 20px;
	            color: #333;
	        }
	        .study-list {
	            display: flex;
	            flex-wrap: wrap;
	            justify-content: space-between;
	        }
	        .study-card {
	            background-color: white;
	            border-radius: 10px;
	            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	            width: 46%;
	            margin-bottom: 20px;
	            padding: 20px;
	        }
	        .study-card h4 {
	            margin-top: 0;
	            font-size: 1.8em;
	            color: #333;
	        }
	        .study-card p {
	            color: #666;
	            font-size: 1.2em;
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
	        .announcement-section {
	            margin-top: 50px;
	        }
	        .announcement-section h2 {
	            font-size: 2em;
	            margin-bottom: 20px;
	        }
	        .announcement {
	            background-color: white;
	            border-radius: 10px;
	            padding: 20px;
	            margin-bottom: 20px;
	            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	        }
	        .announcement h3 {
	            margin-top: 0;
	            font-size: 1.5em;
	            color: #444;
	        }
	        .announcement p {
	            color: #666;
	            font-size: 1.2em;
	        }
	    </style>
	</head>
	<body>
	    <div class="container">
	        <header>
	           헤더 뭐넣을지 상의합시다
	        </header>

	        <div class="search-bar-container">
	            <input type="text" class="search-bar" placeholder="스터디 검색">
	            <button class="register-button">검색</button>
	        </div>
			<section class="announcement-section">
			            <h2>공지사항</h2>
			            <div class="announcement">
			                <h3>새로운 스터디 그룹 추가!</h3>
			                <p>저희 플랫폼에 새로운 스터디 그룹이 추가되었습니다. 최신 AI 기술과 관련된 공부를 원하시면 AI 프로그래밍 스터디에 참여해 보세요.</p>
			            </div>
			            <div class="announcement">
			                <h3>스터디 모집 기간 연장</h3>
			                <p>인기 많은 스터디의 모집 기간이 연장되었습니다. 아직 참여하지 못한 분들은 서둘러 신청해 주세요!</p>
			            </div>
			        </section>
	        <section class="highlighted-studies">
	            <h2>추천 스터디 그룹</h2>
	            <div class="study-list">
	                <div class="study-card">
	                    <h4>AI 프로그래밍 [온라인]</h4>
	                    <p>참여자 수: 4/5</p>
	                    <p>기간: 4주</p>
	                    <button>상세보기</button>
	                </div>
	                <div class="study-card">
	                    <h4>영어 토론 [온라인]</h4>
	                    <p>참여자 수: 8/10</p>
	                    <p>기간: 8주</p>
	                    <button>상세보기</button>
	                </div>
	                <div class="study-card">
	                    <h4>경제 스터디 [오프라인]</h4>
	                    <p>참여자 수: 3/5</p>
	                    <p>기간: 3주</p>
	                    <button>상세보기</button>
	                </div>
	                <div class="study-card">
	                    <h4>문학 읽기 [혼합]</h4>
	                    <p>참여자 수: 7/10</p>
	                    <p>기간: 5주</p>
	                    <button>상세보기</button>
	                </div>
	                <div class="study-card">
	                    <h4>고등 국어 [오프라인]</h4>
	                    <p>참여자 수: 13/15</p>
	                    <p>기간: 4주</p>
	                    <button>상세보기</button>
	                </div>
	                <div class="study-card">
	                    <h4>자격증 준비 [온라인]</h4>
	                    <p>참여자 수: 9/10</p>
	                    <p>기간: 6주</p>
	                    <button>상세보기</button>
	                </div>
	                <div class="study-card">
	                    <h4>수학 [모두]</h4>
	                    <p>참여자 수: 10/15</p>
	                    <p>기간: 6주</p>
	                    <button>상세보기</button>
	                </div>
	                <div class="study-card">
	                    <h4>고등 과학 [혼합]</h4>
	                    <p>참여자 수: 10/15</p>
	                    <p>기간: 6주</p>
	                    <button>상세보기</button>
	                </div>
	                <div class="study-card">
	                    <h4>컴퓨터 기초 [온라인]</h4>
	                    <p>참여자 수: 5/10</p>
	                    <p>기간: 8주</p>
	                    <button>상세보기</button>
	                </div>
	                <div class="study-card">
	                    <h4>취업 준비 [혼합]</h4>
	                    <p>참여자 수: 8/10</p>
	                    <p>기간: 10주</p>
	                    <button>상세보기</button>
	                </div>
	            </div>
	        </section>
			
	       
	    </div>
	</body>
	</html>