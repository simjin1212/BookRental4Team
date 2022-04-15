<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>  
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Gothic&display=swap" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet" />
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="<%=request.getContextPath() %>/board/script.js"></script>
	
</head>
<body style="padding-top:120px; z-index:1;">
<%@ include file="../top.jsp" %>

<c:if test="${sessionScope.member_grade==1}">
	<c:if test="${!empty sessionScope.id}">
	<ul class="admin_page">
<%-- <c:if test="${sessionScope.id != null}"> --%>
	<li class="admin" > <a style="text-decoration: none;" href="<%=request.getContextPath()%>/admin/admin_main.jsp">ADMIN</a></li>

	<li class="menu" > <a href="<%=request.getContextPath()%>/member_board_list.do">게시판 관리</a> </li>

	<li class="menu"> <a href="<%=request.getContextPath()%>/adminmemberlist.do">회원 관리</a> </li>

	<li class="menu"> <a href="<%=request.getContextPath()%>/booklistaction.do">도서 관리</a> </li>
	 
	<li class="menu"> <a href="<%=request.getContextPath()%>/adminrentlist.do">대출 관리 </a> </li>
	 
	<li class="menu"> <a href="<%=request.getContextPath()%>/qna_BoardListAction.do">문의 관리</a> </li>
	</ul>
	</c:if>
</c:if>
	<c:if test="${sessionScope.member_grade==0}">
		<c:if test="${!empty sessionScope.id}">
<%-- <c:if test="${sessionScope.id != null}"> --%>
	<ul class="admin_page">
	<li class="admin"> <a style="text-decoration: none;" href="<%=request.getContextPath()%>/UpdateForm.do"> MENU</a></li>
	<li class="menu" > <a href="<%=request.getContextPath()%>/UpdateForm.do">내 정보</a></li>
	<li class="menu" > <a href="<%=request.getContextPath()%>/booksearchaction.do">도서검색</a></li>
	<li class="menu" > <a href="<%=request.getContextPath()%>/rentListAction.do">대출 목록</a> </li>
	<li class="menu" > <a href="<%=request.getContextPath()%>/ReserveList.do">예약 목록</a></li>
	<li class="menu" > <a href="<%=request.getContextPath()%>/member_board_list.do">회원게시판</a></li>
	<li class="menu" > <a href="<%=request.getContextPath()%>/qna_BoardListAction.do">1:1문의 게시판</a></li>
	<li class="menu" > <a href="<%=request.getContextPath()%>/Logout.do">로그아웃</a></li>
	<li class="menu" > <a href="<%=request.getContextPath()%>/DeleteMember.do">회원탈퇴</a></li>
</ul>
		</c:if>
	</c:if>
<!-- nav 끝 -->


현재 등급 : ${sessionScope.member_grade }	<br>
<div style="margin-top:1%; margin-left: 20%; width:60%;"> 
<table cellpadding="0" cellspacing="0" align=center border=0 class="table" style="font-family: 'Nanum Gothic', sans-serif;"> 
	<tr align="center" valign="middle">
		 <td><div style="font-family: 'Black Han Sans', sans-serif; font-size:40px; color:#6f42c1;">QNA상세페이지</div></td>
	</tr>
	<tr>
		<th style="font-family:돋음; font-size:12" height="16">
			<div align="center">회원 ID</div>
		</th>
		<td width=60% align="center">
			${board.id}
		</td>
	</tr>
	<tr>
		<th style="font-family:돋음; font-size:12" height="16">
			<div align="center">제 목</div>
		</th>
		<td align="center">
			${board.qb_subject}
		</td>
	</tr>
	<tr>
		<th style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</th>
		<td colspan=8 align="center" border=1 style="font-size:18px; height:300px;">
			<pre>${board.qb_content}</pre>
		</td>
	</tr>
	
	
	<tr align="center" valign="middle">
		<td colspan="5">		
		     <input type=button value="목록" onclick ="location.href='./qna_BoardListAction.do?page=${page}' ">	
		     <c:if test="${sessionScope.id == board.id}">
		<input type=button value="수정" onclick="location.href='./qna_BoardModifyAction.do?qb_num=${board.qb_num}&page=${page}' "> <br> <!-- 일반회원일 때만 문의 작성하기 보이게 만들기 -->		
			</c:if>	
			<c:if test="${sessionScope.member_grade==1}">
				<input type=button value="답글" onClick="location.href='./qna_board_replyform.do?qb_num=${board.qb_num}&page=${page}'">
			</c:if>	
		</td>
	</tr>
</table>


</body>
</html>