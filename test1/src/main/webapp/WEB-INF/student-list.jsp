<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>첫번째 페이지</title>
	<script src="https://unpkg.com/vue@3"></script>
</head>
<style>
</style>
<body>
	<div id="app">
	       <input type="text" placeholder="학번" v-model="stuNo">
	       <button @click="fnSearch">검색</button>
	      <hr>
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
		  		
		  		<tr v-for="item in a">
		  				<template>	
		  					<td><div> {{ item.stuNo }} </div></td>
		  					<td><div> {{ item.stuName }}</div></td>
		  					<td><div> {{ item.stuDept }} </div></td>
		  				    <td><div> {{ item.stuGrade }}</div></td>
		  					<td><div> {{ item.stuClass }} </div></td>
		  					<td><div> {{ item.stuGender }}</div></td>
		  					<td><div> {{ item.stuHeight }} </div></td>
		  					<td><div> {{ item.stuWeight }}</div></td>
		  				</template>
		  			</tr>
		  		
		  		</table>		
		  
	   </div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                name: "홍길동",
                a: [],
				stuNo :""  // 빈 객체로 초기화
            
            };
        },
        methods: {
			fnSearch(){
				
			var self = this;
			var nparmap = {stuNo : self.stuNo};

			 $.ajax({
			 url: "abc.dox", 
			 dataType: "json",
			 type: "POST",
			 data: nparmap,
			 success: function (data) {
			 console.log(data);
			 alert(data.message);
			 self.a = data.info;
			                }
			            });
			        }
     
        },
        mounted() {
            var self = this;
            self.fnSearch();
        }
    });
	
    app.mount('#app');
</script>
