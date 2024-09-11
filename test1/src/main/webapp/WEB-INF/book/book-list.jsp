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

	

				#app {
				    max-width: 800px;
				    margin: 0 auto;
				    background: #fff;
				    padding: 20px;
				    border-radius: 8px;
				    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
				<h1>주말과제</h1>
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
						<th>수정</th>
					</tr>
					<template v-if="updateMode == '1'">
						<tr v-for="item in booklist">
						     <td><a href="#" @click="fnView(item.bookId)">{{ item.bookId }}</a></td>
							 <td>{{ item.bookName }}</td>
							 <td>{{ item.publisher }}</td>
						     <td>{{ item.price }}</td>
						     <td><button @click="fnRemove(item.bookId)">삭제</button></td>
							 <td><button @click="fnUpdate()">수정</button></td> 
						</tr>
					</template>
					<template v-if="updateMode == '2'">
						<tr v-for="item in booklist">
						     <td><a href="#" @click="fnView(item.bookId)">{{ item.bookId }}</a></td>
							 <td><input type="text" v-model="item.bookName"></td>
							 <td><input type="text" v-model="item.publisher"></td>
						     <td><input type="text" v-model="item.price"></td>
						     <td><button @click="fnRemove(item.bookId)">삭제</button></td>
							 <td><button @click="fnSave(item)">저장</button></td> 
						</tr>
					</template>
				</table>
				<button @click="fnAdd()"> 글쓰기 </button>
			</div>
		</body>
		</html>

		<script>
		const app = Vue.createApp({
		    data() {
		        return {
		            name: "홍길동",
					booklist: [],
					search: "",
					updateMode: '1'
		        };
		    },
		    methods: {
				fnView(bookId) {
					$.pageChange("/bookView.do", {bookId : bookId});
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
				fnRemove(bookId) {
					var self = this;
					var nparmap = {bookId : bookId};
					$.ajax({
						url: "remove.dox",
						dataType: "json",	
						type: "POST", 
						data: nparmap,
						success: function(data) { 
							alert(data.message);
							self.fnSearch();
						}
					});
			    },					
				fnReset() {
					this.search = ""; // 검색어 초기화
					this.fnSearch(); // 초기화 후 다시 검색 (전체 리스트를 불러옴)
				},
				fnAdd() {
				    location.href = "list.do";
				},
				fnUpdate() { // 수정 모드로 변경하는 함수
					this.updateMode = '2';
				},
				fnSave(item) { // 수정된 내용을 저장하는 함수
					var self = this;
					var nparmap = {bookId: item.bookId, bookName: item.bookName, publisher: item.publisher, price: item.price};
					$.ajax({
						url: "update.dox",
						dataType: "json",	
						type: "POST", 
						data: nparmap,
						success: function(data) { 
							alert(data.message);
							self.updateMode = '1';
							self.fnSearch();
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