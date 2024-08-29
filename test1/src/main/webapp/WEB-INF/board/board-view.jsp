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
	
			제목 : {{viewList.TITLE}}<br>
			내용 : <div v-html = "viewList.CONTENTS"></div>
	
		<button @click="fnBack()">돌아가기</button>
	</div>
</body>
</html>
<script>
	
	   
    const app = Vue.createApp({
        data() {
            return {
           		boardNo : '${boardNo}',
				viewList : {}
				
            };
        },
        methods: {
			fnBack() {
				history.back();
			},
			fnView(){
				var self = this;
				var nparmap = {boardNo : self.boardNo};
				$.ajax({
					url:"/board/view.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
					self.viewList = data.info;
					}
				});
	        },
 
        },
        mounted() {
            var self = this;
			self.fnView();
			
        }
    });
    app.mount('#app');
</script>