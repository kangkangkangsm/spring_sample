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
		<!--
		<template v-if="viewList.length>0">
			{{viewList[0].boardNo}}
		</template>
		-->
			<div> 책No. : {{viewList.bookId}}</div>
			<div> 책이름 : {{viewList.bookName}}</div>
			<div> 책종류 : {{viewList.publisher}}</div>
			<div> 가격 : {{viewList.price}}</div>
			
	
		
	</div>
</body>
</html>
<script>
	
	   
    const app = Vue.createApp({
        data() {
            return {
           		bookId : '${bookId}',
				viewList : {}
				
            };
        },
        methods: {
			
			fnView(){
				var self = this;
				var nparmap = {bookId : self.bookId};
				$.ajax({
					url:"/bookView.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
					self.viewList = data.BookInfo;
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