<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <jsp:include page="/layout/menu.jsp"></jsp:include>
    <title>그룹 스터디 만들기</title>    
    <style>
		body {
		    font-family: Arial, sans-serif;
		    background-color: #f4f4f4;
		    color: #333;
		    margin: 0;
		    padding: 0;
		}

		.container {
		    width: 30%;
		    margin: 20px auto;
		    background-color: #fff;
		    padding: 20px;
		    border-radius: 8px;
		    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		}

		header h1 {
		    text-align: center;
		    color: #333;
		    margin-bottom: 20px;
		}

		section {
		    margin-bottom: 20px;
		}

		h2 {
		    color: #007bff;
		    margin-bottom: 10px;
		}

		ul, ol {
		    margin: 0;
		    padding-left: 20px;
		}

		#join-button {
		    display: block;
		    width: 100%;
		    padding: 10px;
		    background-color: #ff8000;
		    color: white;
		    border: none;
		    border-radius: 4px;
		    cursor: pointer;
		    font-size: 16px;
		    text-align: center;
		    margin-top: 20px;
		}

		#join-button:hover {
		    background-color: #0056b3;
		}
    </style>
</head>
<body>
    <div id="app">
		<div class="container">
		        <header>
		            <h1>고등 국어 [오프라인] 스터디 모임</h1>
		        </header>

		        <section class="study-details">
		            <h2>모임 소개</h2>
		            <p>고등 국어 과목을 집중적으로 공부하기 위한 스터디 모임입니다. 교과서 및 주요 참고서를 기반으로 다양한 주제를 다루며, 문제 풀이 및 토론을 통해 국어 실력을 향상시킵니다.</p>
		            <ul>
		                <li><strong>모임 종류:</strong> 오프라인</li>
		                <li><strong>모임 기간:</strong> 3개월</li>
		                <li><strong>현재 참가 인원:</strong> 3명 / 15명</li>
		            </ul>
		        </section>

		        <section class="study-goals">
		            <h2>스터디 목표</h2>
		            <ul>
		                <li>고등 국어 시험 대비</li>
		                <li>주요 국어 개념 및 문법 이해</li>
		                <li>다양한 유형의 문제 풀이 연습</li>
		                <li>논술 및 독해 능력 강화</li>
		            </ul>
		        </section>

		        <section class="study-schedule">
		            <h2>스터디 일정</h2>
		            <ul>
		                <li><strong>모임 시간:</strong> 매주 토요일 오후 2시 ~ 5시</li>
		                <li><strong>모임 장소:</strong> [스터디 장소 주소 입력]</li>
		                <li><strong>참가비:</strong> 무료 / 유료 (금액 입력)</li>
		            </ul>
		        </section>

		        <section class="participant-requirements">
		            <h2>모임 참가자 요구 사항</h2>
		            <ul>
		                <li>고등학생 또는 해당 학력 수준 이상</li>
		                <li>국어 과목에 대한 기본 지식 필요</li>
		                <li>스터디 전 준비 자료 확인 필수</li>
		            </ul>
		        </section>

		        <section class="apply">
		            <h2>참가 신청 방법</h2>
		            <ol>
		                <li>우측 상단의 "모임 참가" 버튼 클릭</li>
		                <li>간단한 자기소개 및 학습 목표 작성</li>
		                <li>관리자 승인 후 참여 가능</li>
		            </ol>
		            <button id="join-button">모임 참가하기</button>
		        </section>

		      
</body>
</html>