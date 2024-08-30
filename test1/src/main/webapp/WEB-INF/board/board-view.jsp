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
		
			<table>
			<tr>
				<th>제목</th>
				<td>{{viewList.TITLE}}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><div v-html = "viewList.CONTENTS"></div></td>
			</tr>	
			</table>
		<button @click="fnBack()">돌아가기</button>
		<template v-if="viewList.USERID == sessionId || sessionStatus == 'A'">
		<button @click="fnRemove(viewList.boardNo)">삭제</button>
		</template>
	</div>
</body>
</html>
<script>
	
	   
    const app = Vue.createApp({
        data() {
            return {
           		boardNo : '${boardNo}',
				viewList : {},
				sessionId : '${sessionId}',
				sessionStatus : '${sessionStatus}'
				
            };
        },
        methods: {
			fnBack() {
				history.back();
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
					location.href="/board/list.do"
					}
				});
            },
			fnView(){
				var self = this;
				var nparmap = {boardNo : self.boardNo};
				$.ajax({
					url:"/board/view.dox",
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
			self.fnView();
			
        }
    });
    app.mount('#app');
</script>