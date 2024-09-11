<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>첫번째 페이지</title>	
	<style>
		a {		
		display: inline-block; /* allows width to be applied */
		width: 90px;
		}
	</style>
</head>
<style>
</style>
<body>
	<div id="app">
		도/시 
		<select v-model="AreaSi" @change="fnGetList()">
		<option value="">::선택::</option>
		<option v-for ="item in AreaList " :value="item.si"> {{item.si}}</option>
		</select>
		<template v-if="AreaSi">
		구/군
		<select v-model="AreaGu" @change="fnGetList()">
		<option value="">::선택::</option>
		<option v-for ="item in gulist" :value="item.gu"> {{item.gu}}</option>
		</select> 
		</template>
		<template v-if="AreaGu">
		동
		<select v-model="AreaDong"  @change="fnGetList()">
		<option value="">::선택::</option>
		<option v-for ="item in donglist " :value="item.dong" > {{item.dong}}</option>
		</select> 
		</template>
		<hr>
		<template v-if="NxNy">
		<h3>{{NxNy.si}} {{NxNy.gu}} {{NxNy.dong}} 의 좌표는 ({{NxNy.nx}},{{NxNy.ny}}) 입니다. </h3>
		<button @click="fnApi(NxNy.nx,NxNy.ny )">클릭</button>
		</template>
		<!--<div>
			<a>아이디</a><input type="text" placeholder="아이디)영어+숫자 5글자이상" v-model="userId" >
			<button @click="fnCheck()">중복체크</button>
		</div>
		<div>
			<a>비밀번호</a><input type="password" placeholder="비밀번호)영어+숫자+특문 8글자이상" v-model="pwd" >
		</div>
		<div>
			<a>비밀번호확인</a><input type="password" placeholder="비밀번호 확인" v-model="pwd2" >
		</div>
		<div>
			<a>주소</a><input type="text" placeholder="주소" v-model="roadFullAddr">
			<button @click="fnSearchAddr()">주소찾기</button>	
		</div>
		<div>
			<a>핸드폰번호</a><input type="text" placeholder="핸드폰번호 숫자만)" v-model="phone" >
		</div>
		<button @click="fnSave()"> 가입하기 </button>
	</div>-->
</body>
</html>
<script>
	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
					if (window.vueAppInstance) {
						window.vueAppInstance.fnResult(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo);
					} else {
						console.error("Vue app instance is not available.");
					}
				}
    const app = Vue.createApp({
        data() {
            return {
				AreaList : [],
				AreaSi:"",
				gulist:[],
				AreaGu:"",
				AreaDong : "",
				donglist : [],
				roadFullAddr : "",
				userId : "",
				pwd : "",
				pwd2 :"",
				phone : "",
				idCheck : {},
				gu:'',
				NxNy : {},
				nx : '',
				ny : ''
				
            };
        },
        methods: {		
			fnSave(){
					var self = this;
					
					if (self.pwd !== self.pwd2) {
					           alert("비밀번호가 서로 틀립니다.");
					           return;
			       }
				   var pwda = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[\W_]).{8,20}$/;
				      if (!pwda.test(self.pwd)) {
				          alert("비밀번호는 8자리 이상 알파벳, 숫자, 특수문자가 포함");
				          return;
				      }

				     
				   var phonea = /^[0-9]{10,11}$/;
				      if (!phonea.test(self.phone)) {
				          alert("휴대폰 번호는 숫자만 가능");
				          return;
				      }

				  
				   var userIda = /^[A-Za-z0-9]{5,20}$/;
				      if (!userIda.test(self.userId)) {
				          alert("ID는 5자리 이상 알파벳과 숫자만 가능");
				          return;
				      }
				
					var nparmap = {userId : self.userId, pwd : self.pwd ,
							   	   phone : self.phone, addr : self.roadFullAddr};
					$.ajax({
						url:"/join.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) { 
							alert(data.message);
					}
				});
            },
			fnCheck(){
					var self = this;
					var nparmap = {userId : self.userId};
					$.ajax({
						url:"/user.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) { 
							if(self.userId == ""){
								alert("아이디 입력하세요");
								return;
							}
							if(data.idCheck == undefined){
								alert("중복된 아이디 없음!");
							}else{
								alert("중복된아이디!");
							}
						}
					});
	            },
			fnResult(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
				var self = this;
				self.roadFullAddr = roadFullAddr;
				// 콘솔 통해 각 변수 값 찍어보고 필요한거 가져다 쓰면 됩니다.
				console.log(roadFullAddr);
				console.log(roadAddrPart1);
				console.log(addrDetail);
				console.log(engAddr);
			},
			fnSearchAddr(){
				var self = this;
				
				var option = "width = 500, height = 500, top = 100, left = 200, location = no"
				window.open("../addr.do", "addr", option );
			},
			
            fnGetList(){
				var self = this;
				var AreaSi = self.AreaSi;
				var AreaGu = self.AreaGu; 
				var AreaDong = self.AreaDong;
				var nparmap = {si : AreaSi, gu : AreaGu, dong : AreaDong};
					if (AreaSi == "") {
	                   self.gulist = [];
	                   self.AreaGu = "";
	                   self.donglist = [];
	                   self.AreaDong = "";
	               } else if (AreaGu == "") {
	                   self.donglist = [];
	                   self.AreaDong = "";
	               }
				$.ajax({
					url:"/board/Area.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.AreaList = data.list;
						self.gulist = data.gulist;
						self.donglist = data.donglist;
						self.NxNy = data.NxNy;					}
				});
            },			fnApi(nx,ny){
					var self = this;
					var xhr = new XMLHttpRequest();
					var url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst'; /*URL*/
					var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'EOazpFyjvggWrA1MakzjdNfHJ3HCxiGTAy%2BrWOEPoUhyXpQgHemblWzEJ0f6tQk4EInoS3Q%2FylXLuRWFNb3PVA%3D%3D'; /*Service Key*/
					queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
					queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('1000'); /**/
					queryParams += '&' + encodeURIComponent('dataType') + '=' + encodeURIComponent('JSON'); /**/
					queryParams += '&' + encodeURIComponent('base_date') + '=' + encodeURIComponent('20240911'); /**/
					queryParams += '&' + encodeURIComponent('base_time') + '=' + encodeURIComponent('0600'); /**/
					queryParams += '&' + encodeURIComponent('nx') + '=' + encodeURIComponent(nx); /**/
					queryParams += '&' + encodeURIComponent('ny') + '=' + encodeURIComponent(ny); /**/
					xhr.open('GET', url + queryParams);
					xhr.onreadystatechange = function () {
					    if (this.readyState == 4) {
							//console.log('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
						console.log(JSON.parse(this.responseText));
					    }
					};

					xhr.send('');
				 },
			
			
        },
        mounted() {
            var self = this;
			self.fnGetList();	
			window.vueAppInstance = this;
			
        }
    });
    app.mount('#app');
</script>