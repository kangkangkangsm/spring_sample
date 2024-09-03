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
		
			<template v-if="viewList.userId != null">
			<div>아이디 : {{viewList.userId}}</div>
			<div>이름 : {{viewList.userName}}</div>
			<div>이메일 : {{viewList.email}}</div>
			<div>전화번호 : {{viewList.phone}}</div>
			<div>성별 : {{viewList.gender}}</div>
			</template>
		<template v-else>
			<div>유저 정보 없음!</div>
		</template>				
		<button @click="fnBack1()">유저리스트 돌아가기</button>
		<button @click="fnBack2()">게시판 돌아가기</button>
		<button @click="fnDelete(viewList.userId)">삭제</button>
	</div>
</body>
</html>
<script>
	
	   
    const app = Vue.createApp({
        data() {
            return {
           		userId : '${userId}',
				viewList : {}
				
            };
        },
        methods: {
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
						location.href ="user-list.do"
						
						
						
					}
				});
			},
			fnBack1() {
				location.href ="/user-list.do"
			},
			fnBack2() {
				location.href ="/board/list.do"
			},
			fnUserView(){
				var self = this;
				var nparmap = {userId : self.userId};
				$.ajax({
					url:"/user-view.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
					self.viewList = data.info;
					}
				});
	        },
 
        },
        mounted() {
            var self = this;
			self.fnUserView();
        }
    });
    app.mount('#app');
</script>