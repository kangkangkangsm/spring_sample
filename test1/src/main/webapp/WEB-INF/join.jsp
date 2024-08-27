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
			아이디 : <input type="text" placeholder="아이디" v-model="userId" >
		</div>
		<div>
			비밀번호 : <input type="password" placeholder="비밀번호" v-model="pwd" >
		</div>
		<div>
			이름 : <input type="text" placeholder="이름" v-model="userName" >
		</div>
		<div>
			이메일 : <input type="email" placeholder="이메일" v-model="email" >
		</div>
		<div>
			핸드폰번호 : <input type="text" placeholder="핸드폰번호" v-model="phone" >
		</div>
		<div>
			성별 : 남 <input type="radio" name="gender" v-model="gender" value="M" >
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
				gender : ""
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
			
        },	
        mounted() {
            var self = this;
			
        }
    });
    app.mount('#app');
</script>