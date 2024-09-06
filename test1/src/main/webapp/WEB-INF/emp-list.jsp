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
		<input type="checkbox" v-model="selectItem" :value="10">ACOUNTIING
		<input type="checkbox" v-model="selectItem" :value="20">RESEARCH
		<input type="checkbox" v-model="selectItem" :value="30">SALES
		<input type="checkbox" v-model="selectItem" :value="40">OPERATIONS
		<table>
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>직업</th>
				<th>상사</th>
				<th>입사일</th>
				<th>월급</th>
				<th>보너스</th>
				<th>직업코드</th>
			</tr>
			<tr v-for = "item in empList">
				<td>{{item.empNo}}</td>
				<td>{{item.ENAME}}</td>
				<td>{{item.JOB}}</td>
				<td>{{item.MGR}}</td>
				<td>{{item.HIREDATE}}</td>
				<td>{{item.SAL}}</td>
				<td>{{item.COMM}}</td>
				<td>{{item.DEPTNO}}</td>
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
				empList : [],
				cha : '1',
				selectItem : []
            };
        },
        methods: {
			
            fnGetList(){
				var self = this;
				var nparmap = {};
				$.ajax({
					url:"emplist.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.empList = data.list;
					}
				});
            },
			fnCheckRemove(){
							var self = this;
							var fList = JSON.stringify(self.selectItem);
							var nparmap = {selectItem : fList};
							$.ajax({
								url:"/check-remove.dox",
								dataType:"json",	
								type : "POST", 
								data : nparmap,
								success : function(data) { 
								self.fnSearch(1);
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