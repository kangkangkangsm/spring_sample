<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<!-- Quill CDN -->
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    <script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>
	
	<title>첫번째 페이지</title>	
	<style>
		body {
				margin: 20px auto;
				background-color: #cccccc;
				width:50%;
					
				}
		#app {
				background: #ffffff;
				padding: 20px;
				border-radius: 8px;
				
				}		
	    button{
				padding:5px 10px;	
				width:15%;
				
		}
		</style>
</head>

<body>
	<div id="app">
	
		<div>
			제목  <input type="text" placeholder="제목" v-model="TITLE" >
		</div>
		<div>	
			내용  <div id="editor"></div>
		</div>
	
		<button @click="fnSave()"> 저장 </button>
		<button @click="fnReset()"> 뒤로가기 </button>
	</div>
</body>
</html>
<script>
	
	   
    const app = Vue.createApp({
        data() {
            return {	
				TITLE : "",
				CONTENTS : ""
            };
        },
        methods: {
			fnSave(){
					var self = this;
					var nparmap = {TITLE : self.TITLE, CONTENTS : self.CONTENTS};
					$.ajax({
					url:"/board/add.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
					alert(data.message);
					
					location.href ="/board/list.do"
					
											}
										});
						            },
			fnReset(){
					location.href ="/board/list.do"
			},
        },
		mounted: function () {
		        // Quill 에디터 초기화
		        var quill = new Quill('#editor', {
		            theme: 'snow',
		            modules: {
		                toolbar: [
		                    [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
		                    ['bold', 'italic', 'underline'],
		                    [{ 'list': 'ordered'}, { 'list': 'bullet' }],
		                    ['link', 'image'],
		                    ['clean']
		                ]
		            }
		        });

		        // 에디터 내용이 변경될 때마다 Vue 데이터를 업데이트
		        quill.on('text-change', function() {
		           this.contents = quill.root.innerHTML;
		        });
		    }
    });
    app.mount('#app');
</script>