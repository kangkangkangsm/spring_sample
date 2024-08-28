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

<body>
	<div id="app">
		<div>
			No. : <input type="text" placeholder="책넘버" v-model="bookId" >
			<button @click="fnCheck()">중복확인</button>
		</div>
		<div>	
			책이름 : <input type="text" placeholder="책이름" v-model="bookName">	
		</div>
		<div>
			분류 : <input type="text" placeholder="분류" v-model="publisher" >
		</div>
		<div>	
			가격 : <input type="text" placeholder="가격" v-model="price">
		</div>
		<button @click="fnSave()"> 저장 </button>
		<button @click="fnReset()"> 돌아가기 </button>
	</div>
</body>
</html>
<script>
	
	   
    const app = Vue.createApp({
        data() {
            return {
                name : "홍길동",		
				bookId : "",
				bookName : "",
				publisher : "",
				price : ""
            };
        },
        methods: {
			fnSave(){
					var self = this;
					var nparmap = {bookId : self.bookId, bookName : self.bookName,publisher : self.publisher, price : self.price};
					$.ajax({
					url:"insert.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
					alert(data.message);
					location.href ="book.do"
					
											}
										});
						            },
									
			fnReset() {
					location.href ="book.do"
						},
			fnCheck(){
						var self = this;
						var nparmap = {bookId : self.bookId};
						$.ajax({
							url:"/bookView.dox",
							dataType:"json",	
							type : "POST", 
							data : nparmap,
							success : function(data) { 
								if(self.bookId == ""){
									alert("책ID 입력하세요");
									return;
								}
								if(data.BookInfo == undefined){
									alert("책 등록가능!");
								}else{
									alert("중복된아이디!");
								}
							}
						});
			        },			
			
        },	
	 
		
        mounted() {
            var self = this;
			
        }
    });
    app.mount('#app');
</script>