<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<html lang="en" class="h-100">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.108.0">
    <title>Cover Template · Bootstrap v5.3</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/cover/">

   <link href="${context}/resources/assets/dist/css/bootstrap.min.css" rel="stylesheet">


   <meta name="theme-color" content="#712cf9">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
      
      .mainTitle{
       font-size: 3rem;
      }
      
      .text{
         font-size: 1.5rem;
         padding-bottom: 1rem;
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="${context}/resources/css/todo/index.css" rel="stylesheet">
  </head>
  <body class="d-flex h-100 text-center text-bg-dark">
    
<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
  <header class="mb-auto">
    <div>
      <h3 class="float-md-start mb-0">Todo List</h3>
      <nav class="nav nav-masthead justify-content-center float-md-end">
              
        <c:if test="${empty sessionScope.auth}">
           <button id="goHone"><a class="nav-link fw-bold py-1 px-0 active" aria-current="page" href="#">Home</a></button>   
             <button id="goLogin"><a class="nav-link fw-bold py-1 px-0" href="/member/login">login</a></button>   
             <button id="goSignup"><a class="nav-link fw-bold py-1 px-0" href="/member/signup" class="btn btn-warning">Sign-up</a></button>
          </c:if>
          
          <c:if test="${not empty sessionScope.auth}">
             <button id="goHome"><a class="nav-link fw-bold py-1 px-0 active" aria-current="page" href="#">Home</a></button>
           <button id="goList"><a class="nav-link fw-bold py-1 px-0" href="/board/list">todoList</a></button>
           <button id="goLogout"><a class="nav-link fw-bold py-1 px-0" href="/member/logout">Logout</a></button>
        </c:if>        
      </nav>
    </div>
  </header>

   <main class="px-3">
         <div class="mt-2" id="advice-area">
                <p class="text card-text"></p> <!—명언이 나타나는 부분—>
              </div>
    <p class="lead">
    <button onclick="location.href='borad/list'" class="btn btn-lg btn-light fw-bold border-white bg-white"><span>시험일정<span> <i class="fa-solid fa-calendar-days"></i></button>
    </p>
  </main>

  <footer class="mt-auto text-white-50">
    <p>Cover template for <a href="https://getbootstrap.com/" class="text-white">Bootstrap</a>, by <a href="https://twitter.com/mdo" class="text-white">@mdo</a>.</p>
  </footer>
</div>

<!-- <div id="fatkun-drop-panel">
    <a id="fatkun-drop-panel-close-btn">×</a>
        <div id="fatkun-drop-panel-inner">
            <div class="fatkun-content">
                <svg class="fatkun-icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5892"><path d="M494.933333 782.933333c2.133333 2.133333 4.266667 4.266667 8.533334 6.4h8.533333c6.4 0 10.666667-2.133333 14.933333-6.4l2.133334-2.133333 275.2-275.2c8.533333-8.533333 8.533333-21.333333 0-29.866667-8.533333-8.533333-21.333333-8.533333-29.866667 0L533.333333 716.8V128c0-12.8-8.533333-21.333333-21.333333-21.333333s-21.333333 8.533333-21.333333 21.333333v588.8L249.6 475.733333c-8.533333-8.533333-21.333333-8.533333-29.866667 0-8.533333 8.533333-8.533333 21.333333 0 29.866667l275.2 277.333333zM853.333333 874.666667H172.8c-12.8 0-21.333333 8.533333-21.333333 21.333333s8.533333 21.333333 21.333333 21.333333H853.333333c12.8 0 21.333333-8.533333 21.333334-21.333333s-10.666667-21.333333-21.333334-21.333333z" p-id="5893"></path></svg>
                <div class="fatkun-title">드래그 여기에 드롭</div>
                <div class="fatkun-desc">사진 다운로드가 완료됩니다</div>
            </div>
            <div id="fatkun-supported-by">AIX 스마트 다운로더(사진/비디오/음악/문서)Pro Pro 제공</div>
        </div>
    </div>
    </body>
     -->
   <!-- advice api 불러오는 script 입니다.  -->
   <script type="text/javascript">
       const adviceText = document.querySelector('.text');
       const adviceArea = document.getElementById('advice-area');
       
       window.addEventListener('load', advice);
   
       function advice() {
         fetch("https://api.adviceslip.com/advice")
           .then(response => response.json())
           .then(data => {
             adviceArea.style.display = 'block';
             adviceText.innerHTML = data.slip.advice;
           })
           .catch(err => console.log(err));
       }

    </script>
    </html>