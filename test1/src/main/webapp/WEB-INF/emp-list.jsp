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
   <body>
       <div id="app">
           <input type="checkbox" v-model="selectItem" :value="10" @change="fnCheckRemove">ACCOUNTING
           <input type="checkbox" v-model="selectItem" :value="20" @change="fnCheckRemove">RESEARCH
           <input type="checkbox" v-model="selectItem" :value="30" @change="fnCheckRemove">SALES
           <input type="checkbox" v-model="selectItem" :value="40" @change="fnCheckRemove">OPERATIONS
            <input type="checkbox" v-model="selectItem" :value="" @change="fnReset"> 전체보기
          
          <table v-if="Clist.length > 0">
               <tr>
                   <th>사번</th>
                   <th>이름</th>
                   <th>직업</th>
                   <th>상사</th>
                   <th>입사일</th>
                   <th>월급</th>
                   <th>보너스</th>
                   <th>직업코드</th>
               </tr>
               <tr v-for="item in Clist">
                   <td>{{ item.empNo }}</td>
                   <td>{{ item.ENAME }}</td>
                   <td>{{ item.JOB }}</td>
                   <td>{{ item.MGR }}</td>
                   <td>{{ item.HIREDATE }}</td>
                   <td>{{ item.SAL }}</td>
                   <td>{{ item.COMM }}</td>
                   <td>{{ item.DEPTNO }}</td>
               </tr>
           </table>

           <table v-else>
               <tr>
                   <th>사번</th>
                   <th>이름</th>
                   <th>직업</th>
                   <th>상사</th>
                   <th>입사일</th>
                   <th>월급</th>
                   <th>보너스</th>
                   <th>직업코드</th>
               </tr>
               <tr v-for="item in empList">
                   <td>{{ item.empNo }}</td>
                   <td>{{ item.ENAME }}</td>
                   <td>{{ item.JOB }}</td>
                   <td>{{ item.MGR }}</td>
                   <td>{{ item.HIREDATE }}</td>
                   <td>{{ item.SAL }}</td>
                   <td>{{ item.COMM }}</td>
                   <td>{{ item.DEPTNO }}</td>
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
                   empList: [],
                   selectItem: [],
                   Clist: []
            
               };
           },
           methods: {
               fnGetList() {
                   var self = this;
                   $.ajax({
                       url: "emplist.dox",
                       dataType: "json",
                       type: "POST",
                       success: function(data) {
                           console.log(data);
                           self.empList = data.list;
                       }
                   });
               },
               fnCheckRemove() {
                   var self = this;
                   var fList = JSON.stringify(self.selectItem);
                   var nparmap = { selectItem: fList };
                   $.ajax({
                       url: "/checkEmplist.dox",
                       dataType: "json",
                       type: "POST",
                       data: nparmap,
                       success: function(data) {
                           self.Clist = data.Clist;
                       }
                   });
               },
            fnReset() {
               var self = this;
                  self.selectItem = [];
                  self.Clist = [];
                  self.fnGetList();
              },
      
           },
           mounted() {
               this.fnGetList();
           }
       });
       app.mount('#app');
   </script>