<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>첫번째 페이지</title>	
	<style>
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
		<select v-model="AreaDong">
		<option value="">::선택::</option>
		<option v-for ="item in donglist " :value="item.dong"> {{item.dong}}</option>
		</select> 
		</template>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				AreaList : [],
				AreaSi:"",
				gulist:[],
				AreaGu:"",
				AreaDong : "",
				donglist : []
				
            };
        },
        methods: {
            fnGetList(){
				var self = this;
				var AreaSi = self.AreaSi;
				var AreaGu = self.AreaGu; 
				var nparmap = {si : AreaSi, gu : AreaGu};
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