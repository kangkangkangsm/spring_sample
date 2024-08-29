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
		
		
		<div style="margin-left:600px; margin-top:200px;">
			아이디 : <input type="text" placeholder="아이디" v-model="userId" >
		</div>
		<div style="margin-left:600px;">
			비밀번호 : <input type="password" placeholder="비밀번호" v-model="pwd" >
		</div>
		
		<button style="margin-left:600px;" @click="fnJoin">회원가입</button>
		<button style="margin-left:145px;" @click="fnLogin()"> 로그인 </button>
		
	</div>
</body>
</html>
<script>
	
	   
    const app = Vue.createApp({
        data() {
            return {
          		userId : "",
				pwd : "",
            };
        },
        methods: {
			fnLogin(){
					var self = this;
					var nparmap = {userId : self.userId, pwd : self.pwd};
					$.ajax({
					url:"/login.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						if(self.userId == "" || self.pwd == ""){
							alert("아이디 or 비번 입력");
							return;
						}
						if(data.login == undefined){
							console.log(data.message);
							alert("로그인 실패!");
						}else{
							alert("로그인 성공! 게시판으로 이동할게요! ");
							console.log(data.message);
							location.href ="/board/list.do"
						}
					
											}
										});
						            },
			fnJoin(){
				location.href = "join.do";
			}
			
        },	
        mounted() {
            var self = this;
			
        }
    });
    app.mount('#app');
</script>