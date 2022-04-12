<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="http://code.jquery.com/jquery-latest.js"></script>
총 대출도서 : ${rentcount} 권 <br>
<%-- <%
	int count = ((Integer)request.getAttribute("listcount")).intValue();
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대출 목록</title>
</head>
<body>
		<table border=1 width=900 align=center cellpadding = 5px>
			<caption><h2>대출 목록</h2></caption>
			<tr>
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
			<tr>
				<th>${r.rent_Num }</th>
				<th><a href="./admin_memberdetail.do?id=${r.id }&page=1" style="text-decoration:none">${r.id }</th>
				<td>${r.book_Num}</td>
				<td>${r.temp_book_Name}</td>
				<td>${r.temp_Writer }</td>
				<td>${r.temp_Publisher}</td>
				<td><fmt:formatDate value="${r.rent_Date}" pattern="yyyy-MM-dd"/></td>
				<td>${r.return_Date}</td>
				<td align = center><input type=button value="강제 반납" id="return" onClick="location.href='<%=request.getContextPath()%>/returnbook.do?num=${r.rent_Num}' "></td>
			</tr>
			</c:forEach>
		</table>

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