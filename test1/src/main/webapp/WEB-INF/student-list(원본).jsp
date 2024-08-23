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
		<button @click="fnSearch()">{{a.stuNo}} 검색</button>
		<hr>
		<template v-if="click === 't'">
			<div> 이름 : {{a.stuName}} </div>
			<div> 학번 : {{a.stuNo}} </div>
		</template>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                name: "홍길동",
                a: {},  // 빈 객체로 초기화
                click: "f"
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
                var nparmap = {};

                $.ajax({
                    url: "abc.dox", // controller에 주소가 있어야 호출됨
                    dataType: "json",
                    type: "POST",
                    data: nparmap,
                    success: function (data) {
                        console.log(data);
                        self.a = data.info;
                    }
                });
            }
        },
        mounted() {
            var self = this;
            self.fnGetList();
        }
    });
	
    app.mount('#app');
</script>
