<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>첫번째 페이지</title>	
	<style>
			     body {
			         font-family: Arial, sans-serif;
			         margin: 0;
			         padding: 0;
			         background-color: #f9f9f9;
			     }

			     .container {
			         display: flex;
			         max-width: 1180px;
			         margin: 0 auto;
			         padding: 20px;
			     }

			     .search-bar {
			         width: 100%;
			         display: flex;
			         justify-content: space-between;
			         align-items: center;
			         margin-bottom: 20px;
			     }

			     .search-bar input[type="text"] {
			         width: 73%;
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
			         font-size: 16px;
			     }

			     .sidebar {
			         width: 270px;
			         background-color: #fff;
			         padding: 20px;
			         border-radius: 8px;
			         box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
			     }

				 .sidebar h3 {
				     margin-top: 20px;
				     font-size: 18px;
				     margin-bottom: 15px;
				     border-bottom: 1px solid #ddd;
				     padding-bottom: 10px;
				 }

			     .sidebar button {
			         margin-right: 5px;
			         margin-bottom: 5px;
			         padding: 10px 15px;
			         background-color: #f8f8f8;
			         border: 1px solid #ddd;
			         border-radius: 5px;
			         cursor: pointer;
			     }

			     .sidebar button.active {
			         background-color: #ff8000;
			         color: white;
			         border-color: #ff8000;
			     }

			     .sidebar .price-filter {
			         margin-top: 20px;
			     }

			     .sidebar input[type="range"] {
			         width: 100%;
			     }

			     .main-content {
			         flex: 1;
			         margin-left: 20px;
			     }

			     .product-grid {
			         display: grid;
			         grid-template-columns: repeat(3, 1fr);
			         gap: 20px;
			     }

			     .product-item {
			         background-color: #fff;
			         padding: 15px;
			         border-radius: 8px;
			         box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
			         text-align: left;
					 position: relative;
			     }

			     .product-item .title {
			         font-size: 16px;
			         margin: 10px 0;
			         font-weight: bold;
			     }

			     .product-item .details {
			         font-size: 12px;
			         color: #777;
					 margin: 5px 0;
			     }

				 .product-item .badge {
			         position: absolute;
			         top: 15px;
			         right: 15px;
			         background-color: #ff5722;
			         color: white;
			         padding: 5px 10px;
			         border-radius: 5px;
			         font-size: 12px;
			     }

				 .product-item:hover {
			         box-shadow: 0 0 15px rgba(0, 0, 0, 0.15);
					 transform: translateY(-5px);
					 transition: all 0.3s ease;
			     }

		</style>
	</head>
	<body>
		<div id="app">
			<div class="container">
			    <!-- 사이드바 -->
			    <div class="sidebar">
					<h3> 연령별 </h3>
							          <div>
							              <button>전체</button>
							              <button>중딩</button>
							              <button>고딩</button>
							              <button>대딩</button>
							              <button>성인</button>
							          </div>
									  <h3>온라인/오프라인</h3>
						  	          <div>
						  	              <button>전체</button>
						  	              <button>온라인</button>
						  	              <button>오프라인</button>
						  	              <button>혼합</button>
						  	          </div>
							          <h3>과목</h3>
							          <div>
							              <button>전체</button>
							              <button>국어</button>
							              <button>수학</button>
							              <button>영어</button>
							              <button>과학</button>
							              <button>역사</button>
							              <button>독서</button>
										  <button>논술</button>
										  <button>어학</button>
							              <button>자격증</button>
										  <button>프로젝트</button>
										  <button>취업준비</button>
							          </div>
									  <h3>성별</h3>
							          <div>
							              <button>전체</button>
							              <button>남자</button>
							              <button>여자</button>
							              <button>혼성</button>
							          </div>
									  <h3>참여자 수</h3>
									  <div class="price-filter">
	  						              <input type="range" min="2" max="30" value="0">
	  						              <p>1명~30명</p>
	  						          </div>
							          <h3>참여기간</h3>
							          <div class="price-filter">
							              <input type="range" min="0" max="200000" value="0">
							              <p>1일~180일</p>
							          </div>
							    </div>

			    <!-- 메인 콘텐츠 -->
			    <div class="main-content">
			        <!-- 검색창 -->
			        <div class="search-bar">
			            <input type="text" placeholder="검색어를 입력하세요">
			            <button>검색</button>
						<button>스터디 등록</button>
			        </div>

			        <!-- 상품 목록 -->
			        <div class="product-grid">
			            <div class="product-item">
			                <div class="title">수학 [오프라인]</div>
			                <div class="details">어디 근처 사시는 분 같이 시험공부해요</div>
			                <div class="details">여자만 | 기간: 6개월 | 인원 2 / 5</div>
							
			            </div>
			            <div class="product-item">
			                <div class="title">영어 토론 [온라인]</div>
			                <div class="details">매주 금요일 저녁 영어 토론 그룹</div>
			                <div class="details">남자만 | 기간: 3개월 | 인원 5 / 5 </div>
			            </div>
			            <div class="product-item">
			                <div class="title">AI 프로그래밍 [혼합]</div>
			                <div class="details">AI 프로젝트 같이 하실 분 모집</div>
			                <div class="details">혼성 | 기간: 5개월 | 인원 3 / 5</div>
			            </div>
			            <div class="product-item">
			                <div class="title">경제 스터디 [오프라인]</div>
			                <div class="details">경제 토론 및 투자 관련 스터디 그룹</div>
			                <div class="details">혼성 | 기간: 4개월 | 인원 2 / 3</div>
			            </div>
			            <div class="product-item">
			                <div class="title">역사 스터디 [온라인]</div>
			                <div class="details">역사책 함께 읽고 토론해요</div>
			                <div class="details">혼성 | 기간: 2개월 | 인원 7 / 10</div>
			            </div>
			            <div class="product-item">
			                <div class="title">자격증 준비 [오프라인]</div>
			                <div class="details">IT 자격증 스터디 그룹 모집</div>
			                <div class="details">남자만 | 기간: 6개월 | 인원 3 / 15</div>
			            </div>
			            <div class="product-item">
			                <div class="title">문학 읽기 [혼합]</div>
			                <div class="details">문학 작품 읽고 생각 나누는 그룹</div>
			                <div class="details">여자만 | 기간: 5개월 | 인원 1 / 2</div>
			            </div>
			            <div class="product-item">
			                <div class="title">프로그래밍 기초 [온라인]</div>
			                <div class="details">프로그래밍 기초 같이 공부하실분</div>
			                <div class="details">혼성 | 기간: 3개월 | 인원 1 / 2</div>
			            </div>
			            <div class="product-item">
			                <div class="title">고등 국어 [오프라인]</div>
			                <div class="details">고등 국어 문제 풀이 그룹</div>
			                <div class="details">여자만 | 기간: 4개월 | 인원 3 / 15</div>
			            </div>
			            <div class="product-item">
			                <div class="title">취업 준비 [혼합]</div>
			                <div class="details">취업 스터디 그룹 모집</div>
			                <div class="details">혼성 | 기간: 6개월 | 인원 7 / 10</div>
			            </div>
			        </div>
			    </div>
			</div>
		</div>
	</body>
</html>
<script>
   
</script>
