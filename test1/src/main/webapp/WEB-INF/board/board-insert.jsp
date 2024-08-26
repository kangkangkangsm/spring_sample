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
			제목 : <input type="text" placeholder="제목" v-model="TITLE" >
		</div>
		<div>	
			내용 <textarea cols ="30" rows="5" v-model="CONTENTS"></textarea>
		</div>
		<button @click="fnSave()"> 저장 </button>
	</div>
</body>
</html>
<script>
	
	   
    const app = Vue.createApp({
        data() {
            return {
                name : "홍길동",		
				TITLE : "",
				CONTENTS : ""
            };
        },
        methods: {
			fnSave(){
					var self = this;
					var nparmap = {TITLE : self.TITLE, CONTENTS : self.CONTENTS};
					$.ajax({
					url:"/board/add.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
					alert(data.message);
					
					location.href ="/board/list.do"
					
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