<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>첫번째 페이지</title>	
	<style>
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
		</style>
</head>
<style>
</style>
<body>
	<div id="app">
			<div>
				검색 : <input type="text" placeholder="제목" v-model="search" @keyup.enter="fnSearch()">
				<button @click="fnSearch()" > 검색 </button>
				<button @click="fnReset()" > 초기화 </button>
				
			</div>
			
		<table>
			<tr> 
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
				<th>삭제</th>
			</tr>
			<tr v-for = "item in searchList">
				<td>{{item.boardNo}}</td>
				<td><a href="#" @click="fnView(item.boardNo)">{{item.TITLE}}</a></td>
				<td><a href="#" @click="fnUserView(item.USERID)">{{item.USERID}}</a></td>
				<td>{{item.HIT}}</td>
				<td>{{item.CDATETIME}}</td>
				<td><button @click="fnRemove(item.boardNo)">삭제</button> </td>
			</tr>
		</table> 
			<button @click="fnAdd()" > 글쓰기</button>			
		
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
				searchList : []
            };
        },
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {};
				$.ajax({
					url:"/board/list.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.boardList = data.list;
					}
				});
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
					self.fnSearch();
					}
				});
            },
			fnSearch(){
				var self = this;
				var nparmap = {search : self.search};
				$.ajax({
					url:"/board/search.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
					self.searchList = data.list;
					}
				});
            },
			fnReset(){
				this.search = ""; 
				this.fnSearch(); 
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
				}	
			},
        mounted() {
            var self = this;
			self.fnSearch();
			
        }
    });
    app.mount('#app');
</script>