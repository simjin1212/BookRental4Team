<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

<!-- 폰트 -->
 	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Josefin+Sans:wght@500&family=Nanum+Gothic&display=swap" rel="stylesheet">

<style type="text/css">

ul.admin_page {
	list-style-type: none;
	background-color: #fff;
	width: 20%;
	height:100%;
	padding: 10px;
	margin: 0;
	position: fixed;
	height:100%;
	overflow: auto;
	}

li.menu a {
	text-decoration: none;
	display: block;
	color: #000;
	padding: 15px 30px 15px 30px;
	margin: 10px;
	font-weight: bold;
	font-size: 16px;
	font-family: 'Nanum Gothic', sans-serif;
	}

li.admin {
	text-decoration: none;
	color: #6f42c1;
	display: block;
	padding: 15px 30px 15px 30px;
	font-family: 'Josefin Sans', sans-serif;
	font-weight: bolder;
	font-size:40px;
	}

li.blank {
	padding: 50px 30px 50px 30px;
}
</style>

</head>

<body style="z-index:1;  float: left; display: flex;">
  <%@ include file="../top.jsp" %>
 <!-- 세션이 있는 경우 -->
<c:if test="${!empty sessionScope.id}">
  <ul class="nav flex-column">
<%-- <c:if test="${sessionScope.id != null}"> --%>
	<li class="blank" ></li>

	<li class="admin" > ADMIN</li>

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