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
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            display: flex;
            height: 100vh;
        }

        .sidebar {
            width: 250px;
            background-color: #fff;
            padding: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            overflow-y: auto;
        }

        .profile {
            display: flex;
            align-items: center;
            margin-bottom: 30px;
        }

        .profile-img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .profile-info {
            flex-grow: 1;
        }

        .profile-info p {
            margin: 0;
            padding: 0;
        }

        .user-activity {
            margin-top: 10px;
        }

        .activity-item {
            display: flex;
            align-items: center;
            margin-bottom: 5px;
        }

        .activity-icon {
            margin-right: 5px;
        }

        .activity-item a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
            margin-right: 10px;
        }

        .activity-count {
            color: #666;
        }

        .menu {
            margin-top: 20px;
        }

        .menu button {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
        }

        .menu ul {
            list-style: none;
            padding: 0;
        }

        .menu li {
            display: flex;
            justify-content: space-between;
            margin: 10px 0;
        }

        .menu a {
            text-decoration: none;
            color: #007bff;
        }

        .recent-comments {
            margin-top: 30px;
        }

        .recent-comments h3 {
            margin-bottom: 10px;
            font-size: 14px;
            font-weight: bold;
        }

        .recent-comments ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .recent-comments li {
            margin-bottom: 5px;
        }

        .pagination {
            margin-top: 10px;
        }

        .pagination a {
            text-decoration: none;
            color: #007bff;
            margin: 0 5px;
        }

        .pagination span {
            color: #666;
            margin: 0 5px;
        }

        .content {
            flex-grow: 1;
            padding: 20px;
            background-color: #fff;
            overflow-y: auto;
        }

        .posts-control {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .posts-control label {
            margin-right: 10px;
        }

        .search-filter {
            margin-top: 20px;
        }

        .search-filter select, .search-filter input, .search-filter button {
            margin-right: 10px;
            padding: 5px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f8f8f8;
        }

        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- 사이드바 -->
        <aside class="sidebar">
            <div class="profile">
                <img src="profile.png" alt="프로필 사진" class="profile-img">
                <div class="profile-info">
                    <p><strong>강선민</strong> <span> [등급] </span></p>
                </div>
            </div>

            <!-- 내가 쓴 게시글, 댓글 -->
            <div class="user-activity">
                <div class="activity-item">
                    <span class="activity-icon">💬</span>
                    <a href="#">내가 쓴 게시글</a>
                    <span class="activity-count">0개</span>
                </div>
                <div class="activity-item">
                    <span class="activity-icon">💬</span>
                    <a href="#">내가 쓴 댓글</a>
                    <span class="activity-count">2개</span>
                </div>
            </div>

            <nav class="menu">
                <button>카페 글쓰기</button>
                <ul>
                    <li><a href="#">전체글보기</a> <span>239</span></li>
                    <li><a href="#">인기글</a></li>
                    <li><a href="#">공지사항</a></li>
                    <li><a href="#">자유게시판</a></li>
					<li><a href="#">질문게시판</a></li>
					<hr>
					<li><a href="#">국어</a></li>
					<li><a href="#">영어</a></li>
					<li><a href="#">수학</a></li>
					<li><a href="#">과학</a></li>
					<li><a href="#">역사</a></li>
					<li><a href="#">독서</a></li>
					<li><a href="#">논술</a></li>
					<li><a href="#">어학</a></li>
					<li><a href="#">자격증</a></li>
					<li><a href="#">프로젝트</a></li>
					<li><a href="#">취업준비</a></li>
					<hr>
					<li><a href="#">[이벤트]노트필기 경쟁대회</a></li>
					<li><a href="#">[이벤트]오답노트</a></li>
					
                </ul>
            </nav>

            <!-- 최근 댓글 -->
            <div class="recent-comments">
                <h3>최근 게시글 · 댓글</h3>
                <ul>
                    <li><a href="#">join.jsp</a></li>
                    <li><a href="#">압축파일 입니다.</a></li>
                    <li><a href="#">다음주 스프링 수업 계획...</a></li>
                    <li><a href="#">스프링 부트 설정 파일...</a></li>
                    <li><a href="#">읽기 쉬운 코드 작성하기</a></li>
                </ul>
                <div class="pagination">
                    <a href="#">이전</a>
                    <a href="#">다음</a>
                </div>
            </div>
        </aside>

        <!-- 메인 콘텐츠 -->
        <main class="content">
            <h1>전체글보기</h1>
            <!-- 게시물 수 선택 -->
            <div class="posts-control">
                <label for="posts-count">게시물 수:</label>
                <select id="posts-count">
                    <option value="10">10개씩</option>
                    <option value="15" selected>15개씩</option>
                    <option value="20">20개씩</option>
                </select>
            </div>
            <!-- 게시판 테이블 -->
            <table>
                <thead>
                    <tr>
                        <th>카테고리</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- 예시 데이터 -->
                    <tr>
                        <td>Spring</td>
                        <td>ITEM 목록 및 체크 박스 활용 샘플 코드</td>
                        <td>이재승</td>
                        <td>2024.09.06</td>
                        <td>23</td>
                    </tr>
                    <tr>
                        <td>JSP</td>
                        <td>join.jsp 파일 설명</td>
                        <td>허현수</td>
                        <td>2024.09.04</td>
                        <td>15</td>
                    </tr>
                    <tr>
                        <td>Java</td>
                        <td>3초 프로젝트 노션 제공입니다.</td>
                        <td>장병철</td>
                        <td>2024.09.04</td>
                        <td>18</td>
                    </tr>
                    <tr>
                        <td>Database</td>
                        <td>테스트 테이블 및 프로젝트 기본 세팅 파일</td>
                        <td>이재승</td>
                        <td>2024.09.05</td>
                        <td>62</td>
                    </tr>
                </tbody>
            </table>
            <!-- 페이지 네비게이션 -->
            <div class="pagination">
                <a href="#">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#">5</a>
                <span>...</span>
                <a href="#">10</a>
                <a href="#">다음 ></a>
            </div>
            <!-- 검색 필터 -->
            <div class="search-filter">
                <select>
                    <option>전체기간</option>
                    <option>최근 1주일</option>
                    <option>최근 1개월</option>
                </select>
                <select>
                    <option>게시글 + 댓글</option>
                    <option>게시글</option>
                    <option>댓글</option>
                </select>
                <input type="text" placeholder="검색어를 입력해주세요">
                <button>검색</button>
            </div>
        </main>
    </div>
</body>
</html>
