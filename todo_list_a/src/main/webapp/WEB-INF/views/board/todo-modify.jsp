<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>todoList</title>
    <%-- <link href="${path}/resources/css/reset.css" rel="stylesheet"> --%>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css">
    <link href="${context}/resources/css/todo/todo.css" rel="stylesheet">

    
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
 <div class="content container">
	<div class="desc_board">
		<form action="${context}/board/modify" id="todoModify" class="todo_modify" method="post" >
			<input type="hidden" value="${board.bdIdx}" name="bdIdx"> 
			<div >
				<div class="content_board">
					<textarea name="content" required="required"  class="form-control" id="textAreaExample1" ows="4"><c:out value="${board.content}"/></textarea>
				</div>
				<div class="btn_section">
					<button style="background-color:red; color:white; width:100%">전송</button>
				</div>
			</div>

		</form>
	</div>
</div>
   <%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>