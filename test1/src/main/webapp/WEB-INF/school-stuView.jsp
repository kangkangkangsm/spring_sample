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
		
			
			<div>학번 : {{viewList.stuNo}}</div>
			<div>이름 : {{viewList.name}}</div>
			<div>학부 : {{viewList.dDName}}</div>
			<div>학과 : {{viewList.d2DName}}</div>
			<div>담당 교수 : {{viewList.pName}}</div>
			
			<button @click="fnBack()">뒤로가기</button>
	</div>
	
</body>
</html>
<script>
	
	   
    const app = Vue.createApp({
        data() {
            return {
           		stuNo : '${stuNo}',
				viewList : {}
				
            };
        },
        methods: {
			fnBack(){
				history.back();
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
					self.viewList = data.list;
					}
				});
	        },
 
        },
        mounted() {
            var self = this;
			self.fnUserView();
        }
    });
    app.mount('#app');
</script>