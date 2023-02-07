<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<head>
	<link href="${context}/resources/css/member/signup.css" rel="stylesheet">
</head>


<body>


<div class="form">
   <form:form action="${context}/member/signup" method="post" id="frmJoin"
   	modelAttribute="signUpForm" >
   	
   		<div class="title">Welcome</div>
        <div class="subtitle">Let's create your account!</div>
        
        	<div class="input-container ic1">
           	  <input type="text" name="userId" id="inpId" class="input" size="10" placeholeder=" " required/>
              <button type="button" id="btnIdCheck">check</button>
              <span class="valid_info" id="idCheck"></span>
              <div class="cut"></div>
              <label for="firstname" class="placeholder">Id</label>
              <!-- path: 필드명 -->
              <form:errors path="userId" cssClass="valid_info"/>
            </div>
        
        	<div class="input-container ic2">
           	  <input type="password" name="password" id="pw" class="input" placeholeder=" " required/>
           	  <span id="pw_confirm" class="valid_info"></span>
           	  <div class="cut"></div>
              <label for="lastname" class="placeholder">password</label>
           	  <form:errors path="password" cssClass="valid_info"/>
        	</div>
        
        	<div class="input-container ic2">
           	  <input type="tel" name="tell" class="input" placeholeder=" " required/>
           	  <div class="cut"></div>
              <label for="lastname" class="placeholder">password</label>
           	  <form:errors path="tell" cssClass="valid_info"/>
         	</div>
        
        	<div class="input-container ic2">
           	  <input type="email" name="email" class="input" placeholeder=" " required/>
           	  <div class="cut cut-short"></div>
              <label for="email" class="placeholder">Email</>
           	  <form:errors path="email" cssClass="valid_info"/>
        	</div>
        	
              <button type="submit" class="submit" value="가입">submit</button>
   
   </form:form>
</div>




 <script type="text/javascript">
 
 let idCheckFlg = false;
 
 btnIdCheck.addEventListener("click", ev => {

  let userId = inpId.value;
  
  if(userId){
   
   fetch("/member/checkId?userId=" + userId)
   .then(response => response.json())
   .then(obj => {
	   if(obj.exist){
		   idCheck.innerHTML = '이미 존재하는 아이디 입니다.';
		   idCheckFlg = false;
		   return;
	   }
	   
	   idCheck.innerHTML = '사용 가능한 아이디 입니다.';
	   idCheckFlg = true;
	   
   });
  }
 })
 
 frmJoin.addEventListener('submit', ev => {
  if(!idCheckFlg){
   ev.preventDefault();
   alert("아이디 중복검사에 실패했습니다.");
   inpId.focus();   
  }
  
 })
 
 
 
 
 </script>




</body>
</html>