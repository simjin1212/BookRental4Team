<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Josefin+Sans:wght@500&family=Nanum+Gothic&display=swap" rel="stylesheet">

<link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<!-- 외부 자바스크립트 파일 불러오기 -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<%-- <script src="<%=request.getContextPath() %>/admin/bookupdate.js"></script> --%>

<body style="padding-top:120px; z-index:1;">
<%@ include file="../top.jsp" %>
<c:if test="${sessionScope.member_grade==1}">
  <ul class="admin_page">
<%-- <c:if test="${sessionScope.id != null}"> --%>
	<li class="admin"> <a style="text-decoration: none;" href="<%=request.getContextPath()%>/admin/admin_main.jsp"> ADMIN</a></li>
 
	<li class="menu" > <a href="<%=request.getContextPath()%>/member_board_list.do">게시판 관리</a> </li>

	<li class="menu"> <a href="<%=request.getContextPath()%>/adminmemberlist.do">회원 관리</a> </li>

	<li class="menu"> <a href="<%=request.getContextPath()%>/booklistaction.do">도서 관리</a> </li>
	 
	<li class="menu"> <a href="<%=request.getContextPath()%>/adminrentlist.do">대출 관리 </a> </li>
	 
	<li class="menu"> <a href="<%=request.getContextPath()%>/qna_BoardListAction.do">문의 관리</a> </li>
</ul>
</c:if>
<div style="font-family: 'Black Han Sans', sans-serif; font-size:40px; color:#6f42c1; margin-top:1%; margin-left: 20%; width:60%;">도서 정보 수정</div>
<form action="<%=request.getContextPath()%>/bookModify.do"  method="post">
<input type="hidden" name="book_Num" value="${book.book_Num}">

<div style="margin-top:1%; margin-left: 20%; width:60%;">
<table border="0" width="40%" align="center" class="table" style="font-family: 'Nanum Gothic', sans-serif;">
	<tr align=center>
	<td colspan=2>
	<c:if test="${book.book_Cover != null}">
	<img src = "./admin/bookfileupload.jsp?file_name=${book.book_Cover} " style="width:300px; height:300px;"/>
	</c:if>
	</td>
	</tr>
	<tr align=center><th>도서명</th>
		<td width="80%"><input type=text id="book_name" name="book_name" value="${book.book_Name}"></td>
	</tr>
	<tr align=center><th>장르</th>
		<td><select id="genre" name="genre">
				<option value="">장르선택</option>
				<option value="sosul">소설</option>
				<option value="goyang">교양</option>
				<option value="comic">만화</option>
				<option value="chamgo">참고서</option>
			</select></td>
	</tr>
	
	
	<tr align=center><th>출판사</th>
		<td><input type=text id="publisher" name="publisher" value="${book.publisher}"></td>
	</tr>
	<tr align=center><th>저자</th>
		<td><input type=text id="writer" name="writer" value="${book.writer}">
		</td>
	</tr>
	<tr align=center><th>작가의말</th>
		<td>
			<textarea id="writer_talks" name="writer_talks" rows="5" cols="50">${book.writer_talks}</textarea>
		</td>
	</tr>
	<tr align=center><td colspan=2 align=center>
			<input type=submit value="수정">
			<input type=submit value="삭제"
			onClick="location.href='./bookDelete.do?book_Num=${book.book_Num}' ">
		</td>
	</tr>		
</table>
</form>


</body>
</html>