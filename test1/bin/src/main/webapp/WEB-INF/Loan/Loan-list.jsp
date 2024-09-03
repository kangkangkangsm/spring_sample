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
				<h1>책 리스트</h1>
				<input type="text" v-model="bookSearch"  @keyup.enter="fnBookSearch()">
				<button @click="fnBookSearch()">검색</button>
				<button @click="fnBookAdd()">책 추가</button>
				<hr>
				<table>
					<tr> 
						<th>No.</th>
						<th>이름</th>
						<th>저자</th>
						<th>출판사</th>
						<th>가격</th>
						<th>몰라</th>
						<th>삭제</th>
					</tr>
					<tr v-for="item in booklist">
			             <td>{{ item.bookId }}</td>
						 <td><a href="#" @click="fnDetails(item.bookId)">{{ item.title }}</a></td>
						 <td>{{ item.author }}</td>
			             <td>{{ item.publisher }}</td>
						 <td>{{ item.price }}</td>
						 <td>{{ item.stockQuantity }}</td>
			             <td><button @click="fnBookDelete(item.bookId)">삭제</button></td>
					</tr>
				</table>
				<h1 style="margin-top:10px;">멤버 리스트</h1>
				<input type="text" v-model="memberSearch"  @keyup.enter="fnMemberSearch()">
				<button @click="fnMemberSearch()">검색</button>
				<hr>
				<table>
					<tr> 
						<th>No.</th>
						<th>이름</th>
						<th>이메일</th>
						<th>연락처</th>
						<th>가입일</th>
						<th>삭제</th>
					
					</tr>
					<tr v-for="item in memberlist">
			             <td>{{ item.memberId }}</td>
						 <td>{{ item.lastName }}{{ item.firstName }}</td>
			             <td>{{ item.email }}</td>
						 <td>{{ item.phone }}</td>
						 <td>{{ item.joinDate }}</td>
			             <td><button @click="fnMemberDelete(item.memberId)">삭제</button></td>
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
						booklist: [],
						bookSearch: "",
						memberlist : [],
						memberSearch : ""
						
		            };
		        },
		        methods: {
					fnDetails(bookId){
						$.pageChange("/Loan/bookView.do",{bookId : bookId});
					},
					fnBookAdd(){
						location.href="insert.do"
					},
		            fnMemberSearch() {
							var self = this;
							var nparmap = {search : self.memberSearch};
							$.ajax({
							url: "members-list.dox",
							dataType: "json",
							type: "POST",
							data: nparmap,
							success: function(data) {
								console.log(data);
								self.memberlist = data.list;
							}
						});
		            },
					fnBookSearch() {
							var self = this;
							var nparmap = {search : self.bookSearch};
							$.ajax({
							url: "books-list.dox",
							dataType: "json",
							type: "POST",
							data: nparmap,
							success: function(data) {
								console.log(data);
								self.booklist = data.list;
							}
						});
		            },
					fnMemberDelete(memberId) {
							var self = this;
							var nparmap = {memberId : memberId};
							if(!confirm("삭제 하시겠습니까?")){
								return;
							}
							$.ajax({
							url: "members-delete.dox",
							dataType: "json",
							type: "POST",
							data: nparmap,
							success: function(data) {
								alert(data.result);
								self.fnMemberSearch();
							}
						});
		            },
					fnBookDelete(bookId) {
							var self = this;
							var nparmap = {bookId : bookId};
							if(!confirm("삭제 하시겠습니까?")){
								return;
							}
							$.ajax({
							url: "books-delete.dox",
							dataType: "json",
							type: "POST",
							data: nparmap,
							success: function(data) {
								alert(data.message);
								self.fnBookSearch();
							}
						});
		            },
					
		        },
		        mounted() {
		            var self = this;
					self.fnMemberSearch();
					self.fnBookSearch();
		        }
		    });
		    app.mount('#app');
		</script>