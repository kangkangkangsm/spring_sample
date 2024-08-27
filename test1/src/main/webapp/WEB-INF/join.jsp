<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>첫번째 페이지</title>	
	<style>
		
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
			
			a {		
				display: inline-block; /* allows width to be applied */
				width: 90px;
				}
		
		</style>
</head>

<body>
	<div id="app">
		<div>
			<a>아이디  </a><input type="text" placeholder="아이디" v-model="userId" >
			<button @click="fnCheck()">중복체크</button>
		</div>
		<div>
			<a>비밀번호  </a><input type="password" placeholder="비밀번호" v-model="pwd" >
		</div>
		<div>
			<a>이름  </a><input type="text" placeholder="이름" v-model="userName" >
		</div>
		<div>
			<a>이메일  </a><input type="email" placeholder="이메일" v-model="email" >
		</div>
		<div>
			<a>핸드폰번호  </a><input type="text" placeholder="핸드폰번호" v-model="phone" >
		</div>
		<div>
			<a>성별  </a>남 <input type="radio" name="gender" v-model="gender" value="M" >
				 여 <input type="radio" name="gender" v-model="gender" value="F" >
			
		</div>	
		<button @click="fnSave()"> 가입하기 </button>
		
		
	</div>
</body>
</html>
<script>
	
	   
    const app = Vue.createApp({
        data() {
            return {
          		userId : "",
				pwd : "",
				userName : "",
				email : "",
				phone : "",
				gender : "",
				idCheck : {}
            };
        },
        methods: {
		
			fnSave(){
					var self = this;
					var nparmap = {userId : self.userId, pwd : self.pwd ,
								   userName : self.userName, email : self.email,
							   	   phone : self.phone, gender : self.gender};
					$.ajax({
						url:"/join.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) { 
							alert(data.message);
									location.href ="/login.do";									
								
					}
				});
            },
			fnCheck(){
					var self = this;
					var nparmap = {userId : self.userId};
					$.ajax({
						url:"/user.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) { 
							if(self.userId == ""){
								alert("아이디 입력하세요");
								return;
							}
							if(data.idCheck == undefined){
								alert("회원가입 가능!");
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