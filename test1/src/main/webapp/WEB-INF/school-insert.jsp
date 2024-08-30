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
		{{userList}}
		<div>
		학번 : <input type="text" placeholder="stuNo" v-model="stuNo" value="userList.stuNo"  >
		</div>
		<div>	
		아이디 : <input type="text" placeholder="id" v-model="id">	
		</div>
		<div>
		이름 : <input type="text" placeholder="name" v-model="name" >
		</div>
		<div>	
		주민 : <input type="text" placeholder="jumin" v-model="jumin">
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
				stuNo : "",
				name : "",
				id : "",
				jumin : "",
				userList : {}
				
            };
        },
        methods: {
			fnback() {
			    history.back();
		},
			fnSave(){
					var self = this;
					var nparmap = {stuNo : self.stuNo, name : self.name,
								   id : self.id, jumin : self.jumin
							   };
					$.ajax({
					url:"insert-list.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
					alert(data.message);
					location.href="/school-stu.do";
					
					
											}
										});
						            },
			fnSearch() {
					var self = this;
					var nparmap = {};
					$.ajax({
						url: "/indexx.dox",
						dataType: "json",
						type: "POST",
						data: nparmap,
						success: function(data) {
						console.log(data);
						self.userList = data.list;
						
						
						
					}
				});
	        },
        },
			
        mounted() {
            var self = this;
			self.fnSearch()
			
        }
    });
    app.mount('#app');
</script>