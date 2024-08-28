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
			책NO. : <input type="text" placeholder="책넘버" v-model="bookId" >
			<button @click="fnCheck()">중복확인</button>
		</div>
		<div>	
			책이름 : <input type="text" placeholder="책이름" v-model="title">	
		</div>
		<div>
			저자 : <input type="text" placeholder="저자" v-model="author" >
		</div>
		<div>	
			출판사 : <input type="text" placeholder="출판사" v-model="publisher">
		</div>
		<div>	
			가격 : <input type="text" placeholder="가격" v-model="price">
		</div>		
		<div>	
			이게뭐야? : <input type="text" placeholder="이게뭐야" v-model="stockQuantity">
		</div>
		<button @click="fnSave()"> 저장 </button>
		<button @click="fnback()"> 돌아가기 </button>
	</div>
</body>
</html>
<script>
	
	   
    const app = Vue.createApp({
        data() {
            return {
                name : "홍길동",		
				bookId : "",
				title : "",
				author : "",
				publisher : "",
				price : "",
				stockQuantity : ""
            };
        },
        methods: {
			fnback() {
			    history.back();
			},
			fnSave(){
					var self = this;
					var nparmap = {bookId : self.bookId, title : self.title,
								   author : self.author, publisher : self.publisher,
							   	   price : self.price, stockQuantity : self.stockQuantity
							   };
					$.ajax({
					url:"/books-insert.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
					alert(data.message);
					location.href ="Loan.do"
					
											}
										});
						            },
			fnCheck() {
					var self = this;
					var nparmap = {bookId : self.bookId};
					$.ajax({
					url: "book-check.dox",
					dataType: "json",
					type: "POST",
					data: nparmap,
					success: function(data) {
						if(data.list){
							alert("중복된 번호 입니다.");
						}else{
							alert("사용할수있는 번호 입니다.")
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