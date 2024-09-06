<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	
	<title>첫번째 페이지</title>	
	<style>
		#container {
		    display: flex;
		    justify-content: space-between;
			height: 100vh; /* 화면 전체 높이 사용 */
			
		}

		#container #container1 {
			margin: 0 auto;
		    width: 40%; /* 왼쪽 컨테이너의 너비 */
		    background-color: #f0f0f0; /* 배경 색상 (원하는 색상으로 변경 가능) */
		    padding: 10px; /* 패딩 */
		    border-radius: 5px; /* 모서리를 둥글게 */
		    box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1); /* 그림자 */
		}

		#container #container2 {
		    width: 48%; /* 오른쪽 컨테이너의 너비 */
		    background-color: #f0f0f0; /* 배경 색상 (원하는 색상으로 변경 가능) */
		    padding: 10px; /* 패딩 */
		    border-radius: 5px; /* 모서리를 둥글게 */
		    box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1); /* 그림자 */
		}
		div li {
		    display: inline-block;
		    margin-left: 20px;
		}

		div li:first-child {
		    margin-left: 0; /* 첫 번째 li 요소에는 마진을 주지 않음 */
		}
		button {
	       padding: 8px 12px;
	       border: none;
	       border-radius: 4px;
	       background-color: #007bff;
	       color: #fff;
	       cursor: pointer;
	       margin-right: 10px;
	   }
		table{
			th {
			  
			    color: black; /* 텍스트 색상 */
			    padding: 3px 2px;
			    text-align: left;
			}

			/* 테이블 셀 스타일 */
			td {
			    padding: 3px 2px;
			    border: 1px solid #ddd; /* 테두리 색상 */
			}

			/* 테이블 전체 테두리 스타일 */
			table{
				width:100%;
			}
			table, th, td {
			    border: 1px solid #ddd;
			}

			/* 테이블 전체 스타일 조정 */
			th, td {
			    text-align: center;
			}
		}
		select, input[type="text"] {
		            margin: 0 10px 10px 0;
		            padding: 8px;
		            border: 1px solid #ddd;
		            border-radius: 4px;
		            font-size: 1em;
		        }
		div ul li{
			background:#007bff;
			border-radius:5px;
			padding : 5px 10px;
		}
		.pagination {
			    justify-content: center;
			    align-items: center;
			    margin: 20px 0;
			}
			.pagination button {
			    background-color: #f8f9fa;
			    border: 1px solid #dee2e6;
			    color: #007bff;
			    padding: 8px 12px;
			    margin: 0 2px;
			    cursor: pointer;
			    transition: background-color 0.3s, color 0.3s;
			    border-radius: 4px;
			}

			.pagination button:hover {
			    background-color: #007bff;
			    color: white;
			}

			.pagination button.active {
			    background-color: #007bff;
			    color: white;
			    cursor: default;
			}

			.pagination button:disabled {
			    background-color: #e9ecef;
			    color: #6c757d;
			    cursor: not-allowed;
			    border: 1px solid #dee2e6;
			}

			.pagination button:not(.active):not(:disabled):hover {
			    background-color: #0056b3;
			    color: white;
			}
		</style>
</head>
<style>
</style>
<body>
	<div id="app">
	<div id="container">
	<div id="container1">
	<div>로그인 아이디 : {{sessionId}} </div>
		<div>
		   <ul style="margin: 20px;">
		     <li><a href="#" @click="fnCategory('')">전체</a></li>
		     <li><a href="#" @click="fnCategory('1')">공지사항</a></li>
		     <li><a href="#" @click="fnCategory('3')">질문게시판</a></li>
		     <li><a href="#" @click="fnCategory('2')">자유게시판</a></li>
		   </ul>
		 </div>	
		
			<div>
				<select v-model="boardType">
					<option value="all">전체</option>
					<option value="title">제목</option>
					<option value="userName">작성자</option>
				</select>
				검색 : <input type="text" placeholder="제목" v-model="search" @keyup.enter="fnSearch(1)">
				<button @click="fnSearch()" > 검색 </button>
				<button @click="fnReset()" > 초기화 </button>
				<select v-model="pageSize" @change="fnSearch(1)">
					<option value='5'>5개</option>
					<option value='10'>10개</option>
					<option value='15'>15개</option>
				</select>
				
			</div>
			
		<table>
			<tr> 
				<th></th>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
				<th>게시글종류</th>
				<th>삭제</th>
				
			</tr>
			<tr v-for = "item in searchList">
				<td><input type="checkbox" v-model="selectItem" :value="item.boardNo"></td>
				<td>{{item.boardNo}}</td>
				<td><a href="#" @click="fnView(item.boardNo)">{{item.TITLE}}</a></td>
				<td><a href="#" @click="fnUserView(item.USERID)">{{item.userName}}</a></td>
				<td>{{item.HIT}}</td>
				<td>{{item.CDATETIME}}</td>
				
				<template v-if ="item.CATEGORY == '1'">	
				<td>공지사항</td>
				</template>
				<template v-if ="item.CATEGORY == '2'">	
				<td>자유게시판</td>
				</template>
				<template v-if ="item.CATEGORY == '3'">	
				<td>질문게시판</td>
				</template>
				<template v-if ="item.CATEGORY == null">	
				<td>구분없음</td>
				</template>
				<template v-if="item.email == sessionEmail || sessionStatus == 'A'">
				<td><button @click="fnRemove(item.boardNo)">삭제</button> </td>
				</template>
				<template v-else>
				<td> X </td>
				</template>
			</tr>
		</table> 
		<button @click="fnCheckRemove">선택 삭제</button>
			<button style="margin-left:3%; margin-top:15px;"@click="fnAdd()" > 글쓰기</button>			
			<button @click="fnMoveBoard">유저 리스트이동</button>
			<button @click="requestCert()">인증하기</button>
			<div class="pagination">
			    <button @click="fnSearch(currentPage - 1)" :disabled="currentPage <= 1">이전</button>
			    <button v-for="page in totalPages" :class="{active: page == currentPage}" @click="fnSearch(page)">
			        {{ page }}
			    </button>
			    <button @click="fnSearch(currentPage + 1)" :disabled="currentPage >= totalPages">다음</button>
				
			</div>
	
		<div>
	</div>
</body>
</html>
<script>
	
    const app = Vue.createApp({
		
        data() {
            return {
                name : "홍길동",
				boardList : [],
				search : "",
				searchList : [],
				boardType: "all",
				category : "",
				sessionId : '${sessionId}',
				sessionEmail : '${sessionEmail}',
				sessionStatus : '${sessionStatus}',
				currentPage: 1,      
				pageSize: 5,        
				totalPages: 5,
				cnt :'',
				selectItem : []
				
				
            };
        },
        methods: {
		
			requestCert() {
			  IMP.certification({
			    pg: "inicis_unified.INIpayTest",
			    merchant_uid: "test_m0lu83vo",
			  });
			},
			fnCategory(category){
				var self = this;	
				self.category = category;
				self.fnSearch(1);		
			},
			fnRemove(num){
				var self = this;
				var nparmap = {boardNo : num};
				$.ajax({
					url:"/board/remove.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
					alert(data.message);
					self.fnSearch(1);
					}
				});
            },
			fnSearch(page){
				var self = this;
				var startIndex = (page-1) * self.pageSize;
				var outputNumber = self.pageSize;
				self.currentPage = page;
				var nparmap = {search : self.search, boardType : self.boardType, category : self.category,
								startIndex : startIndex, outputNumber : outputNumber};
				$.ajax({
					url:"/board/search.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
					self.searchList = data.list;
					self.cnt = data.cnt;
					self.totalPages = Math.ceil(self.cnt/self.pageSize);
					}
				});
            },
			fnReset(){
				this.search = ""; 
				this.fnSearch(1); 
			},
			fnAdd() {
				location.href ="/board/insert.do"
			},
			fnView(boardNo){
				//key : boardNo, value : 내가 누른 게시글의 boardNo(pk)
				$.pageChange("/board/view.do",{boardNo : boardNo});
				},
			fnUserView(USERID){
				$.pageChange("/board/userView.do",{userId : USERID});
				},
			fnMoveBoard(){
				location.href ="/user-list.do"
			},	
			fnCheckRemove(){
				var self = this;
				// js
				var fList = JSON.stringify(self.selectItem);
				var nparmap = {selectItem : fList};
				$.ajax({
					url:"/check-remove.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
					self.fnSearch(1);
					}
				});
            },
			
			},
        mounted() {
            var self = this;
			self.fnSearch(1);
			IMP.init("imp29272276");
			
			
			
        }
    });
    app.mount('#app');
</script>