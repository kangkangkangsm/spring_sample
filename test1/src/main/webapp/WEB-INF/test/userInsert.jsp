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
		이름 : <input type="text" placeholder="userName" v-model="userName">
		</div>
		<div>	
		비밀번호 : <input type="text" placeholder="password" v-model="password">	
		</div>
		<div>
		이메일 : <input type="text" placeholder="email" v-model="email">
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
				userName : "",
				password : "",
				email : ""
				
            };
        },
        methods: {
			fnSave(){
					var self = this;
					var nparmap = {userName : self.userName, password : self.password,
								   email : self.email};
					$.ajax({
					url:"/testUser-insert.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
					alert(data.message);
					;
					
					
											}
										});
						            },
        },
			
        mounted() {
            var self = this;
			self.fnUserView()
			
        }
    });
    app.mount('#app');
</script>