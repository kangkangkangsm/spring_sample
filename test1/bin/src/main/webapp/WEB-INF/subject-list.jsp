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
		<table>
			<tr> 
				<th>과목번호</th>
				<th>과목이름</th>
				<th>교수이름</th>
				<th>수강등급</th>
				<th>학과</th>
			</tr>
			<tr v-for = "item in subList">
				<td>{{item.SUBNO}}</td>	
				<td>{{item.SUBNAME}}</td>	
				<td>{{item.SUBPROF}}</td>	
				<td>{{item.SUBGRADE}}</td>	
				<td>{{item.SUBDEPT}}</td>		
			</tr>
		</table>
		
		
		<table>
			<tr>
			  	<th> 학번 </th>
			  	<th> 이름 </th>
			  	<th> 학과 </th>
			  	<th> 학년 </th>
			  	<th> 등급 </th>
			  	<th> 성별 </th>
			 	<th> 키 </th>
			  	<th> 몸무게 </th>
			  </tr>
				<tr v-for="item in stuList">
					<td>{{ item.stuNo }} </td>
			  		<td>{{ item.stuName }}</td>
			 		<td>{{ item.stuDept }} </td>
			  	    <td>{{ item.stuGrade }}</td>
			  		<td>{{ item.stuClass }}</td>
			  		<td>{{ item.stuGender }}</td>
			  		<td>{{ item.stuHeight }}</td>
			  		<td>{{ item.stuWeight }}</td>	
			  </tr>
		</table>		
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                name : "홍길동",
				subList : [],
				stuList : []
            };
        },
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {};
				$.ajax({
					url:"sub-list.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.subList = data.subList;
						self.stuList = data.stuList;
					}
				});
            },
        },
        mounted() {
            var self = this;
			self.fnGetList();
        }
    });
    app.mount('#app');
</script>