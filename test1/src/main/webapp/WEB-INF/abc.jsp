<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>첫번째 페이지</title>
	<script src="https://unpkg.com/vue@3"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
		<input type="text" placeholder="학번" v-model="stuNo" >
		<button @click="fnSearch()">검색</button>		
		<template v-if="click === 't'">
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
			
				<tr v-for="item in samelist">
					<template v-if= " item.stuNo === stuNo ">	
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
		</template>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				samelist: [],  // 빈 배열로 초기화
                click: "f",
				stuNo : ""
            };
        },
        methods: {
            fnSearch() {
                if (this.click === "t") {
                    this.click = "f";
                } else {
                    this.click = "t";
                }
            },
            fnGetList() {
                var self = this;
                $.ajax({
                    url: "list.dox", // controller에 주소가 있어야 호출됨
                    dataType: "json",
                    type: "POST",
                    data: {}, // 필요에 따라 수정
                    success: function (data) {
                        console.log(data);
                        self.samelist = data.list; // samelist 배열을 업데이트
                    }
                });
            }
        },
        mounted() {
            this.fnGetList();
        }
    });
	
    app.mount('#app');
</script>
