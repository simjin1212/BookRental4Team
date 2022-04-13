<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">

<!-- 폰트 -->
 	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Josefin+Sans:wght@500&family=Nanum+Gothic&display=swap" rel="stylesheet">

  <link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet" />
</head>
<%--    <%@ include file="./admin_main.jsp" %> --%>

<body style="padding-top:120px; z-index:1;">
  <%@ include file="../top.jsp" %>
 <!-- 세션이 있는 경우 --><!-- nav -->
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


<!-- 회원관리 테이블 -->
    <div style="margin-top:1%; margin-left: 20%; width:60%;">
    <table border="0" width="600" align="center" class="table" style="font-family: 'Nanum Gothic', sans-serif;">
<tr><td colspan=8 style="border:0;"><div style="font-family: 'Black Han Sans', sans-serif; font-size:40px; color:#6f42c1;">회원목록</div></td></tr>
	<tr>
	<td colspan=4 align="left" style="border:0; font-family: 'Nanum Gothic', sans-serif; font-weight:bold; "> 총 ${listcount} 명</td>

	</tr>
	</table>
  <table class="table table-striped" align="center" >
	<tr bgcolor=lightgrey>
		<th>번호</th>
		<th>ID</th>
		<th>이름</th>
		<th>전화번호</th>
		<th>이메일</th>
	</tr>

		<c:set var="num" value="${listcount - (page-1) * 10}" />
	<c:forEach var="m" items="${memberlist}">
	<tr>
		<td>${num}
			<c:set var="num" value="${num-1}" />
		</td>
		<td>
		<a style="text-decoration:none" href="./admin_memberdetail.do?id=${m.id}&page=${page}">
		${m.id}</a>
		</td>
		<td>
			<%-- <!-- 댓글 제목 앞에 여백 처리 -->
			<c:if test="${b.board_re_lev > 0}">
				<c:forEach var="i" begin="0" end="${b.board_re_lev}">
					&nbsp;
				</c:forEach>
			</c:if> --%>		
			${m.name}		
		</td>
		<td>
		${m.phone1} - ${m.phone2} - ${m.phone3}
		</td>
		<td>${m.mailid} @ ${m.domain}</td>
	</tr>
	</c:forEach>

</table> <br><br>
</div>


<!-- 페이지 처리 -->
  <div class="container text-center" style="margin-left:12%; font-family: 'Nanum Gothic', sans-serif;">
<c:if test="${listcount > 0}">

<!-- 1페이지로 이동 -->
<a href="./BoardListAction.do?page=1" style="text-decoration:none"> << </a>

<!-- 이전 블럭으로 이동 -->
<c:if test="${startPage > 10}">
	<a style="text-decoration:none" href="./BoardListAction.do?page=${startPage-10}">[이전]</a>
</c:if>

<!-- 각 블럭에 10개의 페이지 출력 -->
<c:forEach var="i" begin="${startPage}" end="${endPage}">
	<c:if test="${i == page}">	<!-- 현재 페이지 -->
		[${i}]
	</c:if>
	<c:if test="${i != page}">	<!-- 현재 페이지가 아닌 경우 -->
		<a style="text-decoration:none" href="./BoardListAction.do?page=${i}">[${i}]</a>
	</c:if>
</c:forEach>

<!-- 다음 블럭으로 이동  -->
<c:if test="${endPage < pageCount}">
	<a style="text-decoration:none" href="./BoardListAction.do?page=${startPage+10}">[다음]</a>
</c:if>

<!-- 마지막 페이지로 이동 -->
<a href="./BoardListAction.do?page=${pageCount}"
	style="text-decoration:none"> >> </a>
</c:if>
</div>
</body>
