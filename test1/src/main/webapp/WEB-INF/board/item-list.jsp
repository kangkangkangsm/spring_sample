<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	
	<title>첫번째 페이지</title>	
	<style>
		#container {
		    display: flex;
		    justify-content: space-between;
			height: 100vh; /* 화면 전체 높이 사용 */
			
		}

		#container #container1 {
			margin: 0 auto;
		    width: 40%; /* 왼쪽 컨테이너의 너비 */
		    background-color: #f0f0f0; /* 배경 색상 (원하는 색상으로 변경 가능) */
		    padding: 10px; /* 패딩 */
		    border-radius: 5px; /* 모서리를 둥글게 */
		    box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1); /* 그림자 */
		}

		#container #container2 {
		    width: 48%; /* 오른쪽 컨테이너의 너비 */
		    background-color: #f0f0f0; /* 배경 색상 (원하는 색상으로 변경 가능) */
		    padding: 10px; /* 패딩 */
		    border-radius: 5px; /* 모서리를 둥글게 */
		    box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1); /* 그림자 */
		}
		div li {
		    display: inline-block;
		    margin-left: 20px;
		}

		div li:first-child {
		    margin-left: 0; /* 첫 번째 li 요소에는 마진을 주지 않음 */
		}
		button {
	       padding: 8px 12px;
	       border: none;
	       border-radius: 4px;
	       background-color: #007bff;
	       color: #fff;
	       cursor: pointer;
	       margin-right: 10px;
	   }
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
	
		<input type="checkbox" v-model="selectItem" :value="1" @change="fnCheckRemove">옷
	    <input type="checkbox" v-model="selectItem" :value="2" @change="fnCheckRemove">신발
	    <input type="checkbox" v-model="selectItem" :value="3" @change="fnCheckRemove">먹거리
	    <input type="checkbox" v-model="selectItem" :value="4" @change="fnCheckRemove">음료
	    <input type="checkbox" v-model="selectItem" :value="5" @change="fnCheckRemove">전자기기
		<input type="checkbox" v-model="selectItem" :value="" @change="fnReset"> 전체보기     
		<table v-if="slist.length > 0">
			<tr>
				<th>제품번호</th>
				<th>제품명</th>
				<th>가격</th>
				<th>종류</th>
			</tr>
			<tr v-for="item2 in slist">
				<td>{{item2.itemNo}}</td>
				<td>{{item2.itemName}}</td>
				<td>{{item2.price}}</td>
				<td>{{item2.codeName}}</td>
			</tr>
		</table>

		<table v-else>
			<tr>
				<th>제품번호</th>
				<th>제품명</th>
				<th>가격</th>
				<th>종류</th>
			</tr>
			<tr v-for="item in List">
				<td>{{item.itemNo}}</td>
				<td>{{item.itemName}}</td>
				<td>{{item.price}}</td>
				<td>{{item.codeName}}</td>
			</tr>
		</table>
			
			
			
	</div>
</body>
</html>
<script>
	
    const app = Vue.createApp({
		
        data() {
            return {
				List : [],
				selectItem: [],
				slist : []
				
				
				
            };
        },
        methods: {
			fnSearch(page){
				var self = this;
				var nparmap = {};
				$.ajax({
					url:"/board/itemList.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
				console.log(data);
					self.List = data.List;
					
					}
				});
            },
			fnCheckRemove() {
              var self = this;
              var fList = JSON.stringify(self.selectItem);
              var nparmap = { selectItem: fList };
              $.ajax({
                  url: "/board/itemCheckList.dox",
                  dataType: "json",
                  type: "POST",
                  data: nparmap,
                  success: function(data) {
					console.log(data);
                      self.slist = data.list;
                  }
              });
		  },			  
		 	 fnReset() {
	      	   var self = this;
	        	    self.selectItem = [];
	        	    self.slist = [];
	        	    self.fnSearch();
            	    },
			},
        mounted() {
            var self = this;
			self.fnSearch();
		
			
			
			
        }
    });
    app.mount('#app');
</script>