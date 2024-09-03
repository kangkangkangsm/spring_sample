<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>user 리스트 출력</title>
</head>
<style>
	
	
	div li {
		    display: inline-block;
		    margin-left: 20px;
			background-color:yellow;
		}

		div li:first-child {
		    margin-left: 30px; /* 첫 번째 li 요소에는 마진을 주지 않음 */
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
	</style>
<body>
	<div id="app">
		
			<div>
					<ul>
						<a style="color:red;">성별 선택>></a>
						<li><a href="#" @click="fnGender('')">전체</a></li>
						<li><a href="#" @click="fnGender('M')">남자</a></li>
						<li><a href="#" @click="fnGender('F')">여자</a></li>
					</ul>
					<select v-model="boardType">
						<option value="all">전체</option>
						<option value="userId">아이디</option>
						<option value="email">이메일</option>
					</select>	
				<input tpye="text" placeholder="검색" v-model="search" @keyup.enter="fnSearch()">
				<button @click="fnSearch()">검색</button>		
			</div>
			<table>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>성별</th>
					<th>삭제</th>
			    </tr>
				<tr v-for = "item in userList">
					<td><a href="#" @click="fnUserV(item.userId)">{{item.userId}}</a></td>
					<td><a href="#" @click="fnUserV(item.userId)">{{item.userName}}</a></td>
					<td>{{item.email}}</td>
					<td>{{item.phone}}</td>
				<template v-if ="item.gender == 'M'">	
					<td>남자</td>
				</template>
				<template v-if ="item.gender == 'F'">	
					<td>여자</td>
				</template>
				<template v-if ="item.gender == null">	
					<td>불명</td>
				</template>
					<td><button @click="fnDelete(item.userId)">삭제</button></td>
				</tr>
			</table>
			<button @click="fnAdd">유저만들기</button>
			<button @click="fnMoveBoard">게시판 이동</button>
			<template v-if="sessionId">
				<button @click="fnLogout">로그아웃</button>
			</template>
			<template v-if="!sessionId">
				<button @click="fnLogin">로그인</button>
			</template>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				userList : [],
				search : "",
				boardType : "all",
				sessionId : '${sessionId}',
				gender : ""
				
            };
        },
        methods: {
			fnLogin(){
				location.href="login.do";
			},
			fnLogout(){
				location.href="login.do";
			},
			fnGender(gender){
				var self = this;
				self.gender = gender;
				self.fnSearch();
			},
			fnDelete(userId){
				var self = this;
				var nparmap = {userId : userId};
				if(!confirm("삭제하실래요?")){
					return;	
				}
				$.ajax({
					url: "user-delete.dox",
					dataType: "json",
					type: "POST",
					data: nparmap,
					success: function(data) {
					alert(data.message);
					self.fnSearch();
					
					
				}
			});
        },
			fnSearch() {
					var self = this;
					var nparmap = {search : self.search, boardType : self.boardType, gender : self.gender};
					$.ajax({
						url: "user-list.dox",
						dataType: "json",
						type: "POST",
						data: nparmap,
						success: function(data) {
						console.log(data);
						self.userList = data.list;
						
						
					}
				});
	        },
			fnUserV(userId){
					$.pageChange("/view.do",{userId : userId});
					},
			fnAdd(){
				location.href ="join.do"
			},
			fnMoveBoard(){
				location.href ="/board/list.do"
			},
        },
        mounted() {
			var self = this;
			self.fnSearch(); 
        }
    });
    app.mount('#app');
</script>