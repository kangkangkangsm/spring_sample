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
		
			<template v-if="BookInfo.bookId != null">
			<div>책 No. : {{BookInfo.bookId}}</div>
			<div>책 이름 : {{BookInfo.bookName}}</div>
			<div>책 종류 : {{BookInfo.publisher}}</div>
			<div>책 가격 : {{BookInfo.price}}</div>
			</template>
		<template v-else>
			<div>책 정보 없음!</div>
		</template>				
		<button @click="fnBack1()">돌아가기</button>
	</div>
</body>
</html>
<script>
	
	   
    const app = Vue.createApp({
        data() {
            return {
           		bookId : '${bookId}',
				BookInfo : {}
				
            };
        },
        methods: {
			fnBack1() {
				location.href ="/book.do"
			},
			fnBookView(){
				var self = this;
				var nparmap = {bookId : self.bookId};
				$.ajax({
					url:"/bookView.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
					self.BookInfo = data.BookInfo;
					//alert(data.message);
					}
				});
	        },
 
        },
        mounted() {
            var self = this;
			self.fnBookView();
        }
    });
    app.mount('#app');
</script>