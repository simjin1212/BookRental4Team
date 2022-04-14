<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- 폰트 -->
 	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Gothic&display=swap" rel="stylesheet">

  <!-- <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
  
  <link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet" />
</head>
<!-- 유효성검사 -->
<script>
		$(document).ready(function() {
			$("form").submit(function() {
				if ($("select").val() == "") {
					alert("검색할 항목을 선택");
					return false;
				}
				if ($("#find").val() == "") {
					alert("검색어를 입력하세요");
					$("#find").focus();
					return false;
				}
			});
		});
	</script>



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



 <div style="margin-top:1%; margin-left: 20%; width:60%;">
도서 개수 : ${listcount} 개<br>

  <table border="0" width="600" align="center" class="table table-striped" style="font-family: 'Nanum Gothic', sans-serif;">
    
        
        <thead>
		<tr><td colspan=8 style="border:0;"><div style="font-family: 'Black Han Sans', sans-serif; font-size:40px; color:#6f42c1;">도서 목록</div></td></tr>
		</thead>
		<tr align ="center"  bgcolor = lightgrey>
		<th>도서번호</th>
		<th>도서명</th>
		<th>글쓴이</th>
		<th>출판사</th>
		<th>장르</th>
		</tr>
		
		 <tbody>
	<c:set var="num" value="${listcount - (page-1) * 10}" />
	<c:forEach var="b" items="${booklist}">
		<tr align = "center">
			<td>${b.book_Num}
			<c:set var="num" value="${num-1}" />
			</td>
			<td>
			<a href="./bookDetailAction.do?book_Num=${b.book_Num}&page=${page}">${b.book_Name}</a>
			</td>
			<td>${b.writer}</td>
			<td>${b.publisher}</td>
			<td>${b.genre}</td>
			
		</tr>
			
	</c:forEach>
</tbody>
</table> <br><br>
</div> 
<div style="font-family: 'Nanum Gothic', sans-serif; margin-top:1%; margin-left: 20%; width:60%;">
       	<div style="float:right;">
        <input  type="button" class="btn btn-outline-secondary btn-sm" value="   도서 등록     " onClick="location.href='./bookupdateform.do' ">
     	</div>
	
 </div>
		<!-- 페이지 처리 -->
<center>
<c:if test="${listcount > 0}">

<!-- 1페이지로 이동 -->
<a href="./booklistaction.do?page=1" style="text-decoration:none"> << </a>

<!-- 이전 블럭으로 이동 -->
<c:if test="${startPage > 10}">
	<a href="./booklistaction.do?page=${startPage-10}">[이전]</a>
</c:if>

<!-- 각 블럭에 10개의 페이지 출력 -->
<c:forEach var="i" begin="${startPage}" end="${endPage}">
	<c:if test="${i == page}">	<!-- 현재 페이지 -->
		[${i}]
	</c:if>
	<c:if test="${i != page}">	<!-- 현재 페이지가 아닌 경우 -->
		<a href="./booklistaction.do?page=${i}">[${i}]</a>
	</c:if>
</c:forEach>

<!-- 다음 블럭으로 이동  -->
<c:if test="${endPage < pageCount}">
	<a href="./booklistaction.do?page=${startPage+10}">[다음]</a>
</c:if>

<!-- 마지막 페이지로 이동 -->
<a href="./booklistaction.do?page=${pageCount}"
	style="text-decoration:none"> >> </a>

</c:if>
</center>






</body>
</html>