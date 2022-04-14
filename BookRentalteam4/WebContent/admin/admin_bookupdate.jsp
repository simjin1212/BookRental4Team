<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 폰트 -->
 	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Gothic&display=swap" rel="stylesheet">


<!-- 외부 자바스크립트 파일 불러오기 -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath() %>/admin/bookupdate.js"></script>
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

<form action="<%=request.getContextPath()%>/bookupdate.do"  method="post" enctype="multipart/form-data">
<div class="container col-sm-6">	

<table cellpadding="0" cellspacing="0" align=center border=0 class="table" style="font-family: 'Nanum Gothic', sans-serif;">
	
	<!-- <tr><td>도서번호(ISBN)</td>		순차로 대체
		<td><input type=text id="book_num" name="book_num">
		</td>
	</tr> -->
	<tr><td colspan=8 style="border:0;"><div style="font-family: 'Black Han Sans', sans-serif; font-size:40px; color:#6f42c1;">도서 작성</div></td></tr>
	<tr><td>도서명</td>
		<td><input type=text id="book_name" name="book_name"></td>
	</tr>
	<tr><td>장르</td>
		<td><select id="genre" name="genre">
				<option value="">장르선택</option>
				<option value="sosul">소설</option>
				<option value="goyang">교양</option>
				<option value="comic">만화</option>
				<option value="chamgo">참고서</option>
			</select></td>
	</tr>
	
	
	<tr><td>출판사</td>
		<td><input type=text id="publisher" name="publisher"></td>
	</tr>
	<tr><td>저자</td>
		<td><input type=text id="writer" name="writer">
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">책표지</div>
		</td>
		<td>
			<input name="book_cover" type="file"/>
		</td>
	</tr>	
	<tr><td>등록일</td>
		<td> <p><input type="date" id="book_regdate" name="book_regdate"></p>
		</td>
	</tr>
	<tr><td>작가의말</td>
		<td>
			<textarea id="writer_talks" name="writer_talks" rows="5" cols="50"></textarea>
		</td>
	</tr>
	<tr><td colspan=2 align=center>
			<input type=submit value="등록">
			<input type=reset value="삭제">
		</td>
	</tr>		
</table>
</div>
</form>


</body>
</html>