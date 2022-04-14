<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="http://code.jquery.com/jquery-latest.js"></script>

<%-- <%
	int count = ((Integer)request.getAttribute("listcount")).intValue();
%> --%>
<!DOCTYPE html>
<html>
<head>
<!-- 폰트 -->
 	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Gothic&display=swap" rel="stylesheet">
<meta charset="UTF-8">

<link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet" />
</head>
<body style="padding-top:120px; z-index:1;">
<%@ include file="../top.jsp" %>
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
<!-- nav 끝 -->

<div style="margin-top:1%; margin-left: 20%; width:60%;">
총 대출도서 : ${rentcount} 권 <br>
		<table border="0" width="800" align="center" class="table table-striped" style="font-family: 'Nanum Gothic', sans-serif;">
			<thead>
		<tr><td colspan=8 style="border:0;"><div style="font-family: 'Black Han Sans', sans-serif; font-size:40px; color:#6f42c1;">현재 대출중인 목록</div></td></tr>
		</thead>

			<tr align ="center"  bgcolor = lightgrey>
				<th> No. </th>
				<th> ID </th>
				<th>도서번호</th>
				<th>도서명</th>
				<th>저자</th>
				<th>출판사</th>
				<th>대출일</th>
				<th>반납일</th> 
				<th>강제반납</th>
			</tr>
			<c:forEach var="r" items="${rentlist}">
			<tr align ="center">
				<th>${r.rent_Num }</th>
				<th><a href="./admin_memberdetail.do?id=${r.id }&page=1" style="text-decoration:none">${r.id }</th>
				<td>${r.book_Num}</td>
				<td>${r.temp_book_Name}</td>
				<td>${r.temp_Writer }</td>
				<td>${r.temp_Publisher} </td>
				<td><fmt:formatDate value="${r.rent_Date}" pattern="yyyy-MM-dd"/></td>
				<td>${r.return_Date} </td>
				<td align = center><input type=button value="강제 반납" id="return" onClick="location.href='<%=request.getContextPath()%>/returnbook.do?num=${r.rent_Num}' "></td>
			</tr>
			</c:forEach>
		</table>
		</div>

<!-- 페이지 목록 -->
<center>
<c:if test="${rentcount>0}"> <!-- 글이 존재하는 경우에만 페이지 출력 -->
<!-- 1페이지로 -->
	<a href="./adminrentlist.do?page=1" style="text-decoration:none"> << </a>
<!-- 이전 페이지 -->
	<c:if test="${page>1 }">
		<a href="./adminrentlist.do?page=${page-1 }"> < </a>
	</c:if>

	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<c:if test="${i==page }">  <!-- 현재 페이지 -->
			[${i}]
		</c:if>
		<c:if test="${i!=page }"> <!-- 현재 페이지가 아닌 경우 -->
			<a href="./adminrentlist.do?page=${i}">[${i}]</a>
		</c:if>	
	</c:forEach>
	
<!-- 다음 페이지 -->
	<c:if test="${page <pageCount}">
		<a href="./adminrentlist.do?page=${page+1 }"> > </a></c:if>
<!-- 끝페이지로 -->
	<a href="./adminrentlist.do?page=${pageCount}" style="text-decoration:none"> >> </a>
		
</c:if>
</center>

</body>
</html>