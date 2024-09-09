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

        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .button {
            flex: 1;
            margin-right: 10px;
        }

        .button:last-child {
            margin-right: 0;
        }

        .button button {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        #join-button {
            background-color: #ff8000;
            color: white;
        }

        #join-button:hover {
            background-color: #0056b3;
        }

        #share-button {
            background-color: #4CAF50;
            color: white;
        }

        #share-button:hover {
            background-color: #45a049;
        }

        #back-button {
            background-color: #007bff;
            color: white;
        }

        #back-button:hover {
            background-color: #0056b3;
        }
    </style>
    <script>
        function copyUrl() {
            const url = window.location.href;
            navigator.clipboard.writeText(url).then(() => {
                alert('복사되었습니다 공유하십시오~');
            });
        }

        function goBack() {
            window.history.back();
        }
    </script>
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

            <section class="related-books">
                <h2>그룹 관련 책 정보</h2>
                <ul>
                    <li><strong>책 제목:</strong> 고등 국어 참고서</li>
                    <li><strong>저자:</strong> 홍길동</li>
                    <li><strong>별점:</strong> ⭐⭐⭐⭐☆</li>
                    <li><strong>리뷰:</strong> 이 책은 정말 유용합니다. 좋은 내용과 문제들이 많아요!</li>
                    <li><a href="/bookstore">책 구매하기</a></li>
                </ul>
            </section>

            <section class="apply">
                <h2>참가 신청 방법</h2>
                <ol>
                    <li>우측 상단의 "모임 참가" 버튼 클릭</li>
                    <li>간단한 자기소개 및 학습 목표 작성</li>
                    <li>관리자 승인 후 참여 가능</li>
                </ol>
            </section>

            <div class="button-container">
                <div class="button">
                    <button id="join-button">모임 참가하기</button>
                </div>
                <div class="button">
                    <button id="share-button" onclick="copyUrl()">공유하기</button>
                </div>
                <div class="button">
                    <button id="back-button" onclick="goBack()">돌아가기</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>