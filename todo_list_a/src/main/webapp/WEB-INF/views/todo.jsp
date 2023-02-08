<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<head>
    <link href="${context}/resources/css/todo/todo.css" rel="stylesheet">  
</head>


<body>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

   <form action="${context}/board/upload" method="post" enctype="multipart/form-data">
      <div class="page-content page-container" id="page-content">
         <div class="padding">
            <div class="row container d-flex justify-content-center">
               <div class="col-md-12">
                  <div class="card px-3">

                     <div class="card-body">
                        <h4 class="card-title">Awesome Todo list</h4>
                        <div class="add-items d-flex">
                           <input type="text" name="content"
                              class="form-control todo-list-input"
                              placeholder="What do you need to do today?">
                           <button
                              class="add btn btn-primary font-weight-bold todo-list-add-btn">Add</button>
                        </div>
                        <div class="list-wrapper">
</form>
                           
                              
                              <ul class="d-flex flex-column todo-list">
                              <c:forEach items="${boardList}" var="board">
                              <c:if test="${ not empty sessionScope.auth and board.userId == sessionScope.auth.userId }">
                                 <li>
                                    
                                    <div class="form-check">
                                       <label class="form-check-label"> <input
                                          class="checkbox my_checked" type="checkbox">
                                             ${board.content}
                                          <i class="input-helper"></i></label>
                                    </div>
                              
                                    <form action="/board/modify?bdIdx=${board.bdIdx}"method="get">
                             <input type="hidden" value="${board.bdIdx}" name="bdIdx"/>
                               <button id="btnModify"><i class="fa-solid fa-pencil" id="modify"></i></button>   
                             </form>
                              
                              
                                    <form action="/board/remove" method="post">
                               <input type="hidden" value="${board.bdIdx}" name="bdIdx"/> 
                                     <button id="btnDel"><i class="remove mdi mdi-close-circle-outline" id="delete"></i></button>
                                    </form>
                                    
                                    
                                   <label>${board.regDateAsDate}</label>
                                    
                                    
                                    
                                 </li>
                                 </c:if>
                              </c:forEach>
                              </ul>
                           

                           <div class="row mt-3">
                              <nav aria-label="Page navigation example">
                                 <ul class="pagination justify-content-center">

                                    <li class="page-item"><a class="page-link"
                                       href="/board/list?page=${paging.prevPage}">Previous</a></li>

                                    <c:forEach begin="${paging.blockStart}"
                                       end="${paging.blockEnd}" var="page">
                                       <li class="page-item"><a class="page-link"
                                          href="/board/list?page=${page}">${page}</a></li>
                                    </c:forEach>

                                    <li class="page-item"><a class="page-link"
                                       href="/board/list?page=${paging.nextPage}">Next</a></li>

                                 </ul>
                              </nav>
                           </div>


                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
         
      
      </div>

      

      <%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>

<script type="text/javascript">

document.querySelectorAll('.my_checked').forEach(ev => {
	   ev.addEventListener('click', ev => {
	      console.dir(ev.target.checked);
	   })
	})


</script>