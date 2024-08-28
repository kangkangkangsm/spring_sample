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
		<button>게시글목록(userController에서 가져오기)</button>
			<div>
			<input placeholder="검색" v-model="search">
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
					<td>{{item.userId}}</td>
					<td>{{item.userName}}</td>
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
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				userList : [],
				search : ""
				
            };
        },
        methods: {
			fnDelete(userId){
				var self = this;
				var nparmap = {userId : userId};
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
					var nparmap = {search : self.search};
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
        },
        mounted() {
			var self = this;
			self.fnSearch(); 
        }
    });
    app.mount('#app');
</script>