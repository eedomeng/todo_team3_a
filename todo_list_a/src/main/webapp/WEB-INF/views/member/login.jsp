<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>


<head>
    <link href="${context}/resources/css/member/login.css" rel="stylesheet">
</head>

<body>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

 <section class="vh-100">
  <div class="container py-5 h-100">

   <c:if test="${not empty msg}">
   <div class="alert alert-danger" role="alert">
       ${msg}
   </div>
   </c:if>   

    <div class="row d-flex align-items-center justify-content-center h-100">
      <div class="col-md-8 col-lg-7 col-xl-6">
        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.svg"
          class="img-fluid" alt="Phone image">
      </div>
      <div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1">

        <form action="/member/login" method="post">
          <!-- Email input -->
          <div class="form-outline mb-4">
            <input type="text" id="userId" name="userId" class="form-control form-control-lg" />
            <label class="form-label" for="form1Example13">user name</label>
          </div>

          <!-- Password input -->
          <div class="form-outline mb-4">
            <input type="password" id="password" name="password" class="form-control form-control-lg" />
            <label class="form-label" for="form1Example23">Password</label>
          </div>

          <!-- Submit button -->
          <button type="submit" class="btn btn-primary btn-lg btn-block">Sign in</button>

        </form>
      </div>
    </div>
  </div>
</section>



<%@ include file="/WEB-INF/views/include/footer.jsp" %>




</body>
</html>