<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
    <title>커뮤니티 게시판</title>
	  <style>
	        body {
	            font-family: 'Arial', sans-serif;
	            margin: 0;
	            padding: 0;
	            background-color: #f9f9f9;
	        }
	        
	        .container {
	            display: flex;
	            max-width: 1200px;
	            margin: 0 auto;
	            padding: 20px;
	        }
	        
	        /* Sidebar (게시글 목록) */
	        .sidebar {
	            width: 270px;
	            background-color: #fff;
	            padding: 20px;
	            border-right: 1px solid #ddd;
	            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	        }
	        
	        .sidebar h3 {
	            font-size: 18px;
	            margin-bottom: 15px;
	            border-bottom: 1px solid #ddd;
	            padding-bottom: 10px;
	        }

	        .post-item {
	            padding: 10px 0;
	            border-bottom: 1px solid #ddd;
	            cursor: pointer;
	        }

	        .post-item:hover {
	            background-color: #f1f1f1;
	        }

	        .post-title {
	            font-size: 14px;
	            font-weight: bold;
	            color: #333;
	        }

	        .post-info {
	            font-size: 12px;
	            color: #999;
	        }

	        /* Content Section (게시글 상세 내용) */
	        .content {
	            flex: 1;
	            padding: 20px;
	            background-color: #fff;
	            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	            margin-left: 20px;
	        }

	        .content h1 {
	            font-size: 24px;
	            margin-bottom: 20px;
	        }

	        .content p {
	            font-size: 16px;
	            line-height: 1.6;
	        }

	        /* 검색창 및 로그인 섹션 */
	        .top-bar {
	            display: flex;
	            justify-content: space-between;
	            align-items: center;
	            margin-bottom: 20px;
	        }

	        .search-bar input[type="text"] {
	            width: 65%;
	            padding: 10px;
	            border: 1px solid #ddd;
	            border-radius: 5px;
	            font-size: 16px;
	        }

	        .search-bar button {
	            padding: 10px 20px;
	            background-color: #ff8000;
	            color: white;
	            border: none;
	            border-radius: 5px;
	            cursor: pointer;
	            font-size: 13px;
	        }

	        .user-info {
	            font-size: 14px;
	            color: #555;
	        }

	        .user-info span {
	            font-weight: bold;
	        }

	        /* 셀렉션 박스 */
	        .filter-section {
	            margin-bottom: 15px;
	        }

	        .filter-section select {
	            width: 100%;
	            padding: 8px;
	            margin-bottom: 10px;
	            border: 1px solid #ddd;
	            border-radius: 5px;
	        }

	    </style>
	</head>
	<body>

	<div class="container">
	    <!-- Sidebar -->
	    <div class="sidebar">
	        <!-- 로그인 상태 -->
	        <div class="user-info">
	            <span>하유성님</span>이 로그인 중입니다.
	        </div>
	        
	        <!-- 검색창 -->
	        <div class="search-bar">
	            <input type="text" placeholder="검색어를 입력하세요">
	            <button>검색</button>
	        </div>
	        
	        <!-- 필터 섹션 -->
	        <div class="filter-section">
	            <select>
	                <option value="전체">전체 게시글</option>
	                <option value="공지사항">공지사항</option>
	                <option value="자유게시판">자유게시판</option>
	                <option value="질문과답변">질문과 답변</option>
	            </select>
	            <select>
	                <option value="최신순">최신순</option>
	                <option value="조회순">조회순</option>
	                <option value="댓글순">댓글순</option>
	            </select>
	        </div>
	        
	        <h3>게시글 목록
			</h3>
	        
	        <div class="post-item" onclick="showPostDetails(1)">
	            <div class="post-title">AI 혁신과 미래</div>
	            <div class="post-info">2021-05-12 | 조회수: 549</div>
	        </div>
	        
	        <div class="post-item" onclick="showPostDetails(2)">
	            <div class="post-title">경제학: 우리가 놓친 부분</div>
	            <div class="post-info">2021-05-20 | 조회수: 830</div>
	        </div>
	        
	        <div class="post-item" onclick="showPostDetails(3)">
	            <div class="post-title">서울의 맛집 리스트</div>
	            <div class="post-info">2021-06-15 | 조회수: 400</div>
	        </div>
	        
	        <div class="post-item" onclick="showPostDetails(4)">
	            <div class="post-title">IT 자격증 준비하기</div>
	            <div class="post-info">2021-06-22 | 조회수: 590</div>
	        </div>

	        <div class="post-item" onclick="showPostDetails(5)">
	            <div class="post-title">프로그래밍 기초 스터디</div>
	            <div class="post-info">2021-07-02 | 조회수: 420</div>
	        </div>

	        <div class="post-item" onclick="showPostDetails(6)">
	            <div class="post-title">취업 준비 전략</div>
	            <div class="post-info">2021-07-12 | 조회수: 310</div>
	        </div>

	        <div class="post-item" onclick="showPostDetails(7)">
	            <div class="post-title">프로젝트 경험 공유</div>
	            <div class="post-info">2021-07-19 | 조회수: 640</div>
	        </div>

	        <div class="post-item" onclick="showPostDetails(8)">
	            <div class="post-title">AI와 데이터 분석</div>
	            <div class="post-info">2021-07-22 | 조회수: 780</div>
	        </div>

	        <div class="post-item" onclick="showPostDetails(9)">
	            <div class="post-title">문학 토론 그룹</div>
	            <div class="post-info">2021-08-05 | 조회수: 230</div>
	        </div>

	        <div class="post-item" onclick="showPostDetails(10)">
	            <div class="post-title">비즈니스 전략 세미나</div>
	            <div class="post-info">2021-08-20 | 조회수: 950</div>
	        </div>
	    </div>

	    <!-- Content -->
	    <div class="content" id="postDetails">
	        <h1>게시글 상세</h1>
	        <p>게시글을 클릭하면 여기에 상세 내용이 표시됩니다.</p>
	    </div>
	</div>

	<script>
	    // JavaScript to handle content change
	    function showPostDetails(postId) {
	        const postDetails = document.getElementById('postDetails');
	        
	        if (postId === 1) {
	            postDetails.innerHTML = `
	                <h1>AI 혁신과 미래</h1>
	                <p>AI는 우리 사회를 빠르게 변화시키고 있으며, 미래의 기술 혁신을 이끌고 있습니다. 이 글에서는 AI가 어떤 방식으로 일상에 영향을 미치는지 알아보겠습니다.</p>
	            `;
	        } else if (postId === 2) {
	            postDetails.innerHTML = `
	                <h1>경제학: 우리가 놓친 부분</h1>
	                <p>경제학의 중요한 원칙을 이해하는 것은 현대 사회를 이해하는 데 중요한 요소입니다. 이 글에서는 그동안 우리가 놓친 경제학적 시각을 다룹니다.</p>
	            `;
	        } else if (postId === 3) {
	            postDetails.innerHTML = `
	                <h1>서울의 맛집 리스트</h1>
	                <p>서울에서 놓치지 말아야 할 맛집들을 소개합니다. 이 리스트는 서울 곳곳에서 최고의 맛을 제공하는 곳들을 중심으로 작성되었습니다.</p>
	            `;
	        } else if (postId === 4) {
	            postDetails.innerHTML = `
	                <h1>IT 자격증 준비하기</h1>
	                <p>IT 자격증 취득을 목표로 한 스터디 그룹을 모집합니다. 함께 공부하며 실력을 키워보아요.</p>
	            `;
	        } else if (postId === 5) {
	            postDetails.innerHTML = `
	                <h1>프로그래밍 기초 스터디</h1>
	                <p>프로그래밍 기초부터 함께 공부할 그룹을 모집합니다. 매주 만나서 공부해요!</p>
	            `;
	        } else if (postId === 6) {
	            postDetails.innerHTML = `
	                <h1>취업 준비 전략</h1>
	                <p>취업을 위해 준비해야 할 전략과 팁을 공유합니다. 인터뷰 노하우와 이력서 작성법까지!</p>
	            `;
	        } else if (postId === 7) {
	            postDetails.innerHTML = `
	                <h1>프로젝트 경험 공유</h1>
	                <p>성공적인 프로젝트 경험을 공유하며 배울 수 있는 기회를 마련했습니다.</p>
	            `;
	        } else if (postId === 8) {
	            postDetails.innerHTML = `
	                <h1>AI와 데이터 분석</h1>
	                <p>AI를 활용한 데이터 분석 기법을 다룬 포럼의 내용을 공유합니다.</p>
	            `;
	        } else if (postId === 9) {
	            postDetails.innerHTML = `
	                <h1>문학 토론 그룹</h1>
	                <p>문학을 사랑하는 사람들을 위한 토론 그룹에 참여해보세요!</p>
	            `;
	        } else if (postId === 10) {
	            postDetails.innerHTML = `
	                <h1>비즈니스 전략 세미나</h1>
	                <p>비즈니스 전략 세미나에서 논의된 최신 비즈니스 트렌드와 성공 사례를 공유합니다.</p>
	            `;
	        }
	    }
	</script>

	</body>
	</html>