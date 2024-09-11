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

			.content .title {
			    font-size: 24px;
			    margin-bottom: 10px;
			    color: #5c2d91;
			}

			.post-info {
			    display: flex;
			    align-items: center;
			    margin-bottom: 20px;
			}

			.post-info img {
			    width: 40px;
			    height: 40px;
			    border-radius: 50%;
			    margin-right: 10px;
			}

			.post-info .author {
			    font-weight: bold;
			}

			.post-info .date {
			    color: #777;
			    font-size: 12px;
			    margin-left: 10px;
			}

			.post-content {
			    margin-bottom: 20px;
			    line-height: 1.6;
			}

			.btn-group {
			    margin-top: 20px;
			}

			.btn-group button {
			    padding: 5px 10px;
			    margin-right: 5px;
			    border: 1px solid #ddd;
			    background-color: #f8f8f8;
			    cursor: pointer;
			}

			.comment-box {
			    margin-top: 20px;
			}

			.comment-box textarea {
			    width: 100%;
			    padding: 10px;
			    border: 1px solid #ddd;
			    border-radius: 5px;
			}

			.comment-box button {
			    margin-top: 10px;
			    padding: 10px 20px;
			    background-color: #007bff;
			    color: #fff;
			    border: none;
			    cursor: pointer;
			}

			.comment-section {
			    margin-top: 40px;
			}

			.comment {
			    border-top: 1px solid #ddd;
			    padding: 10px 0;
			}

			.comment .comment-author {
			    font-weight: bold;
			}

			.comment .comment-date {
			    color: #777;
			    font-size: 12px;
			    margin-left: 10px;
			}

			.comment .comment-text {
			    margin-top: 5px;
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
			 <div class="content">
			            <div class="board-type">studyCommunityBoardType</div>
			            <div class="post-title">다음주 스프링 수업 계획 안내</div>
			            <div class="post-info">
			                <img src="profile.png" alt="프로필 사진">
			                <span>이재승</span>
			                <span>2024.08.30. 12:37</span>
			                <span>조회 68</span>
			                <span>댓글 4</span>
			                <span>URL 복사</span>
			            </div>
			            <div class="post-content">
			                다음주 할 내용의 계획은 일단 다음과 같습니다. 상황에 따라 달라질 수 있습니다.<br>
			                이번주에 진행한 CRUD를 명확히 다룰 수 있는 분들은 미리 참고해보시면 좋을거 같습니다.<br><br>
			                1. API(결제, 지도, 차트, 문서 등)<br>
			                2. 파일업로드, 다운로드<br>
			                3. 댓글, 대댓글<br>
			                4. 아이콘, 이미지, 폰트 등<br>
			                5. JWT, cookie, sessionStorage 등<br>
			                6. 예외처리 세분화 및 에러 객체, 트랜잭션 등
			            </div>

			            <!-- 댓글 영역 -->
			            <div class="post-comments">
			                <div class="comment-item">
			                    <img src="profile.png" alt="프로필 사진">
			                    <div class="comment-content">
			                        <div class="comment-header">
			                            <span>정병철</span>
			                            <span>2024.08.31. 13:23</span>
			                        </div>
			                        <div class="comment-text">
			                            강사님, git으로 팀프로젝트 진행하는 방법도 프로젝트 시작 전에 알려주시나요?
			                        </div>
			                    </div>
			                </div>
			                <div class="comment-item">
			                    <img src="profile.png" alt="프로필 사진">
			                    <div class="comment-content">
			                        <div class="comment-header">
			                            <span>이재승</span>
			                            <span>2024.08.31. 13:27</span>
			                        </div>
			                        <div class="comment-text">
			                            네 답주중에 같이 해볼겁니다~
			                        </div>
			                    </div>
			                </div>
			            </div>

			            <!-- 댓글 작성 -->
			            <div class="write-comment">
			                <textarea placeholder="댓글을 입력하세요..."></textarea>
			                <button>등록</button>
			            </div>
			        </div>
			    </div>
			</body>
			</html>