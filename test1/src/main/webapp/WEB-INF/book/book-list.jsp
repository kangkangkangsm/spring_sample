<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>첫번째 페이지</title>	
	<style>
		body {
				    font-family: Arial, sans-serif;
				    background-color: #f4f4f9;
				    margin: 0;
				    padding: 20px;
				    color: #333;
				}

				h1 {
				    text-align: center;
				    color: #4CAF50;
				}

				#app {
				    max-width: 800px;
				    margin: 0 auto;
				    background: #fff;
				    padding: 20px;
				    border-radius: 8px;
				    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
				}

				input[type="text"] {
				    width: calc(78% - 82px);
				    padding: 10px;
				    margin-right: 10px;
				    border: 1px solid #ccc;
				    border-radius: 4px;
				    box-sizing: border-box;
				}

				button {
				    padding: 10px 3px;
					margin-right:10px;
					width:80px;
				    border: none;
				    background-color: #4CAF50;
				    color: white;
				    cursor: pointer;
				    border-radius: 4px;
				    transition: background-color 0.3s ease;
				}

				button:hover {
				    background-color: #45a049;
				}

				hr {
				    margin: 20px 0;
				    border: none;
				    border-top: 1px solid #ddd;
				}

				table {
				    width: 100%;
				    border-collapse: collapse;
				    margin-top: 20px;
				}

				th, td {
				    padding: 12px;
				    text-align: center;
				    border: 1px solid #ddd;
				}

				th {
				    background-color: #f2f2f2;
				    color: #333;
				    font-weight: bold;
				}

				tr:nth-child(even) {
				    background-color: #f9f9f9;
				}

				tr:hover {
				    background-color: #f1f1f1;
				}
			</style>
		</head>
		<body>
			<div id="app">
				<h1>책 검색 페이지</h1>
				<div>
					책 이름 : <input type="text" placeholder="책이름" v-model="search" @keyup.enter="fnSearch()">
					<button @click="fnSearch()"> 검색 </button>
					<button @click="fnReset()"> 초기화 </button>
				</div>
				<hr>
				<table>
					<tr> 
						<th>No.</th>
						<th>책이름</th>
						<th>분야</th>
						<th>가격</th>
						<th>삭제</th>
					
					</tr>
					<tr v-for="item in booklist">
			             <td><a href="#" @click="fnView(item.bookId)">{{ item.bookId }}</a></td>
						 <td>{{ item.bookName }}</td>
						 <td>{{ item.publisher }}</td>
			             <td>{{ item.price }}</td>
			             <td><button @click="fnRemove(item.bookId)">삭제</button></td>
					</tr>
				</table>
				<button @click="fnAdd()" > 글쓰기 </button>
			</div>
		</body>
		</html>
		<script>
		    const app = Vue.createApp({
		        data() {
		            return {
		                name: "홍길동",
						booklist: [],
						search: ""
						
		            };
		        },
		        methods: {
					fnView(bookId){
							$.pageChange("/bookView.do",{bookId : bookId});
							},
		            fnSearch() {
							var self = this;
							var nparmap = {search : self.search};
							$.ajax({
							url: "list.dox",
							dataType: "json",
							type: "POST",
							data: nparmap,
							success: function(data) {
								console.log(data);
								self.booklist = data.list;
							}
						});
		            },
					fnRemove(bookId){
							var self = this;
							var nparmap = {bookId : bookId};
							$.ajax({
							url: "remove.dox",
							dataType:"json",	
							type : "POST", 
							data : nparmap,
							success : function(data) { 
							alert(data.message);
							self.fnSearch();
								}
						});
				    },					
					fnReset() {
							this.search = ""; // 검색어 초기화
							this.fnSearch(); // 초기화 후 다시 검색 (전체 리스트를 불러옴)
					},
					fnAdd(){
						    location.href ="list.do"
					},
					
		        },
		        mounted() {
		            var self = this;
					self.fnSearch();
		        }
		    });
		    app.mount('#app');
		</script>