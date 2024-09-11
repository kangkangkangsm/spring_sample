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
		<button @click="fnApi()">클릭</button>
		
		
	</div>
</body>
</html>
<script>
	
	   
    const app = Vue.createApp({
        data() {
            return {
				
            };
        },
        methods: {
         fnApi(){
			var xhr = new XMLHttpRequest();
			var url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst'; /*URL*/
			var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'EOazpFyjvggWrA1MakzjdNfHJ3HCxiGTAy%2BrWOEPoUhyXpQgHemblWzEJ0f6tQk4EInoS3Q%2FylXLuRWFNb3PVA%3D%3D'; /*Service Key*/
			queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
			queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('1000'); /**/
			queryParams += '&' + encodeURIComponent('dataType') + '=' + encodeURIComponent('JSON'); /**/
			queryParams += '&' + encodeURIComponent('base_date') + '=' + encodeURIComponent('20240911'); /**/
			queryParams += '&' + encodeURIComponent('base_time') + '=' + encodeURIComponent('0600'); /**/
			queryParams += '&' + encodeURIComponent('nx') + '=' + encodeURIComponent('55'); /**/
			queryParams += '&' + encodeURIComponent('ny') + '=' + encodeURIComponent('127'); /**/
			xhr.open('GET', url + queryParams);
			xhr.onreadystatechange = function () {
			    if (this.readyState == 4) {
			        console.log('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
			    }
			};

			xhr.send('');
		 }
        },
        mounted() {
            var self = this;
			
        }
    });
    app.mount('#app');
</script>