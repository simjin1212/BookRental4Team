<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

<!-- 폰트 -->
 	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Josefin+Sans:wght@500&family=Nanum+Gothic&display=swap" rel="stylesheet">

<!-- CSS 적용 안될때 이거 붙이기 -->
  <link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet" />

</head>

<body style="padding-top:120px;">
  <%@ include file="../top.jsp" %>
 <!-- 세션이 있는 경우 -->
<c:if test="${!empty sessionScope.id}">
  <ul class="admin_page">
<%-- <c:if test="${sessionScope.id != null}"> --%>
	<li class="admin"> <a style="text-decoration: none;" href="<%=request.getContextPath()%>/booklistaction.do"> ADMIN</a></li>
 
	<li class="menu" > <a href="<%=request.getContextPath()%>/member_board_list.do">게시판 관리</a> </li>

	<li class="menu"> <a href="<%=request.getContextPath()%>/adminmemberlist.do">회원 관리</a> </li>

	<li class="menu"> <a href="<%=request.getContextPath()%>/booklistaction.do">도서 관리</a> </li>
	 
	<li class="menu"> <a href="<%=request.getContextPath()%>/adminrentlist.do">대출 관리 </a> </li>
	 
	<li class="menu"> <a href="<%=request.getContextPath()%>/qna_BoardListAction.do">문의 관리</a> </li>
</ul>
</c:if>

<%-- 
<!-- 세션이 없는 경우 -->
<c:if test="${empty sessionScope.id}">
<c:if test="${sessionScope.id == null }">
	<a href="<%=request.getContextPath() %>/JoinForm.do">회원 가입</a> <br>
	<a href="<%=request.getContextPath() %>/LoginForm.do">로그인</a> <br>
</c:if>
 --%>
</body>