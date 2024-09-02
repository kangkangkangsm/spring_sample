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
		
			<table>
				<tr>
					<th>학번</th>
					<th>이름</th>
					<th>아이디</th>
					<th>학년</th>
					<th>주민번호</th>
					<th>삭제</th>
					<th>O수정</th>
					<th>I수정</th>
			    </tr>
				<tr v-for = "item in userList">
					<td>{{item.stuNo}}</td>
					<template v-if="item.stuNo === updateStuNo">
					<td><input style="width:40px; text-align : center;" type="text" v-model = "item.name"  @keyup.enter="fnSava(item.stuNo,item.name,item.id,item.grade)"></td>	
					<td><input style="width:60px; text-align : center;" type="text" v-model = "item.id" @keyup.enter="fnSava(item.stuNo,item.name,item.id,item.grade)"></td>
					<td>
						<select v-model ="item.grade">
							<option value="item.grade">{{item.grade}}</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
						</select>
					</td>
					</template>
					<template v-else>
	                <td><a href="#" v-else @click="fnView(item.stuNo)">{{item.name}}</a></td>							
					<td>{{item.id}}</td>
					<td>{{item.grade}}</td>	
					</template>	
					<td>{{item.jumin}}</td>
					<td><button @click="fnDelete(item.stuNo)">삭제</button></td>
					<td><button @click="fnUpdate(item.stuNo)">O수정</button></td>
					<template v-if="item.stuNo === updateStuNo">
					<td><button @click="fnSava(item.stuNo,item.name,item.id,item.grade)">IN저장</button></td>
					</template>
					<template v-else>
					<td><button @click="fnUpdate2(item.stuNo)">IN수정</button></td>
					</template>			
					
			</table>
			<button @click="fnAdd()">유저생성</button>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				userList : [],
				updateStuNo : '${updateStuNo}',
				updateList : {}
				
				
            };
        },
        methods: {
			fnSearch() {
					var self = this;
					var nparmap = {};
					$.ajax({
						url: "school-list.dox",
						dataType: "json",
						type: "POST",
						data: nparmap,
						success: function(data) {
						console.log(data);
						self.userList = data.list;
						
						
						
					}
				});
	        },
			fnDelete(stuNo) {
					if(!confirm("삭제하실거?")){
						return;
					}
					var self = this;
					var nparmap = {stuNo : stuNo};
					$.ajax({
						url: "delete-list.dox",
						dataType: "json",
						type: "POST",
						data: nparmap,
						success: function(data) {	
						alert(data.result);
						self.fnSearch();
					}
				});
	        },
			fnSava(stuNo,name,id,grade) {
								if(!confirm("수정합니다?")){
									return;
								}
								var self = this;
								var nparmap = {stuNo : stuNo,name : name,id : id,grade: grade};
								$.ajax({
									url: "update2-list.dox",
									dataType: "json",
									type: "POST",
									data: nparmap,
									success: function(data) {	
									alert(data.message);
									location.href="/school-stu.do";
								}
							});
			},
			fnAdd(){
				location.href="/school-insert.do"
			},
			fnView(stuNo){
				$.pageChange("/school-stuView.do",{stuNo : stuNo});
			},
			fnUpdate(stuNo){
				$.pageChange("/school-update.do",{stuNo : stuNo});
			},
			fnUpdate2(stuNo){
				$.pageChange("/school-stu.do",{updateStuNo : stuNo});
			},
			
        },
        mounted() {
			var self = this;
			self.fnSearch(); 
        }
    });
    app.mount('#app');
</script>