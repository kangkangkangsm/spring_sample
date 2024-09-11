<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <jsp:include page="/layout/menu.jsp"></jsp:include>
	   <title>그룹 스터디 만들기</title>
		<link rel="stylesheet" href="style.css">
		<style>
		    body {
		        font-family: Arial, sans-serif;
		        background-color: #f4f4f4;
		        margin: 0;
		        padding: 0;
		        display: flex;
		        justify-content: center;
		        align-items: center;
		        height: 100vh;
		    }
		    .form-container {
		        width: 400px;
		        background-color: #fff;
		        padding: 30px;
		        border-radius: 10px;
		        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
		    }
		    .form-container h2 {
		        text-align: center;
		        margin-bottom: 20px;
		        color: #333;
		    }
		    .form-group {
		        margin-bottom: 15px;
		    }
		    .form-group label {
		        display: block;
		        margin-bottom: 5px;
		        color: #555;
		    }
		    .form-group input[type="text"],
		    .form-group input[type="password"],
		    .form-group input[type="date"],
		    .form-group input[type="time"],
		    .form-group select {
		        width: calc(100% - 20px);
		        padding: 10px;
		        border: 1px solid #ddd;
		        border-radius: 5px;
		        font-size: 14px;
		    }
		    .form-group input[type="radio"] {
		        margin-right: 10px;
		    }
		    .form-group .inline-radio {
		        display: flex;
		        align-items: center;
		    }
		    .form-group .book-list {
		        display: flex;
		        align-items: center;
		        margin-top: 10px;
		    }
		    .form-group .book-list select,
		    .form-group .book-list input[type="text"] {
		        margin-right: 10px;
		        flex-grow: 1;
		    }
		    .add-book-btn {
		        background-color: #007bff;
		        color: #fff;
		        border: none;
		        padding: 8px 12px;
		        border-radius: 5px;
		        cursor: pointer;
		    }
		    .add-book-btn:hover {
		        background-color: #0056b3;
		    }
		    .submit-btn {
		        width: 100%;
		        padding: 12px;
		        background-color: #ff6700;
		        color: #fff;
		        border: none;
		        border-radius: 5px;
		        cursor: pointer;
		        font-size: 16px;
		        margin-top: 20px;
		    }
		    .submit-btn:hover {
		        background-color: #e55c00;
		    }
		    .note {
		        color: #888;
		        font-size: 12px;
		        margin-left: 10px;
		    }
		</style>
	</head>

	<body>
	    <div class="form-container">
	        <h2>그룹 스터디 만들기</h2>
			<div class="form-group">
	            <label for="field">스터디 영역</label>
	            <select id="field" name="field">
	                <option>전체</option>
	                <!-- 스터디 영역 추가 -->
	            </select>
	        </div>
	        <div class="form-group">
	            <label for="studyName">스터디 이름 (24자 이내)</label>
	            <input type="text" id="studyName" name="studyName" maxlength="24">
	        </div>
	        <div class="form-group">
	            <label for="startDate">스터디 기간 (시작일)</label>
	            <input type="date" id="startDate" name="startDate">
	        </div>
	        <div class="form-group">
	            <label for="endDate">스터디 기간 (종료일)</label>
	            <input type="date" id="endDate" name="endDate">
	        </div>
	        <div class="form-group">
	            <label for="time">스터디 시간 설정</label>
	            <input type="time" id="time" name="time">
	        </div>
	        <div class="form-group">
	            <label for="ageGroup">연령별</label>
	            <select id="ageGroup" name="ageGroup">
	                <option>전체</option>
	                <!-- 연령대 추가 -->
	            </select>
	        </div>
	        <div class="form-group">
	            <label for="studyType">온라인/오프라인</label>
	            <select id="studyType" name="studyType">
	                <option>전체</option>
	                <!-- 온라인/오프라인 추가 -->
	            </select>
	        </div>
	        <div class="form-group">
	            <label for="subject">과목</label>
	            <select id="subject" name="subject">
	                <option>전체</option>
	                <!-- 과목 추가 -->
	            </select>
	        </div>
	        <div class="form-group">
	            <label for="members">모집 인원</label>
	            <select id="members" name="members">
	                <option>1명 (과외)</option>
	                <!-- 모집 인원 추가 -->
	            </select>
	        </div>
	        <div class="form-group">
	            <label for="gender">성별</label>
	            <select id="gender" name="gender">
	                <option>전체</option>
	                <!-- 성별 추가 -->
	            </select>
	        </div>
	        <div class="form-group">
	            <label>그룹 공개 여부</label>
	            <div class="inline-radio">
	                <input type="radio" id="public" name="visibility" value="public">
	                <label for="public">공개</label>
	                <input type="radio" id="private" name="visibility" value="private">
	                <label for="private">비공개</label>
	            </div>
	            <input type="password" placeholder="비밀번호 4자리 (비공개 시 입력)">
	        </div>
	        <div class="form-group">
	            <label for="book">참고 할 교재 </label>
	            <div class="book-list">
	                <select id="book" name="book">
	                    <option>책 선택</option>
	                    <!-- 책 리스트 추가 -->
	                </select>
	                <button class="add-book-btn">추가</button>
	            </div>
	            <input type="text" placeholder="직접 입력 (없으면 안써도됌)" style="margin-top: 10px;">
	        </div>
	        <button class="submit-btn">스터디 생성</button>
	    </div>
	</body>
	</html>