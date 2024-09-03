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
		학번 : <input type="text" placeholder="stuNo" v-model="userList.stuNo" disabled>
		</div>
		<div>	
		아이디 : <input type="text" placeholder="id" v-model="userList.id">	
		</div>
		<div>
		이름 : <input type="text" placeholder="name" v-model="userList.name">
		</div>
		<div>	
		주민 : <input type="text" placeholder="jumin" v-model="userList.jumin">
		</div>
		<button @click="fnSave(userList.stuNo,userList.id,userList.name,userList.jumin)"> 저장 </button>
		<button @click="fnback()"> 돌아가기 </button>
	</div>
</body>
</html>
<script>
	
	   
    const app = Vue.createApp({
        data() {
            return {
				userList : {},
				stuNo : '${stuNo}'
				
            };
        },
        methods: {
			fnback() {
			    history.back();
		},
			fnSave(stuNo,id,name,jumin){
					var self = this;
					var nparmap = {stuNo : stuNo, name : name,
								   id : id, jumin : jumin
							   };
					$.ajax({
					url:"update-list.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
					alert(data.message);
					location.href="/school-stu.do";
					
					
											}
										});
						            },
			fnUserView(){
					var self = this;
					var nparmap = {stuNo : self.stuNo};
					$.ajax({
						url:"studentUser-view.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) { 
						self.userList = data.list;
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