<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="http://code.jquery.com/jquery-latest.js"></script>

<!-- 외부 자바스크립트 파일 불러오기 -->
<script src="./member/member.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Josefin+Sans:wght@500&family=Nanum+Gothic&display=swap" rel="stylesheet">

 <link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet" />
</head>
<body style="padding-top:100px; z-index:1;">
<%@ include file="../top.jsp" %>
<c:if test="${!empty sessionScope.id}">
<%-- <c:if test="${sessionScope.id != null}"> --%>
	<br>
	<ul class="admin_page">
	<li class="admin"> <a style="text-decoration: none;" href="<%=request.getContextPath()%>/member.main.jsp"> MENU</a></li>
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

<div style="margin-top:1%; margin-left: 20%; width:60%;">
	<form method="post" action="<%=request.getContextPath()%>/Delete.do">
		<input type="hidden" name="id" value="${sessionScope.id}">
		<table  border="0" width="600" align="center" class="table" style="font-family: 'Nanum Gothic', sans-serif;">
			<tr><td colspan=8 style="border:0;"><div style="font-family: 'Black Han Sans', sans-serif; font-size:40px; color:#6f42c1;">회원 탈퇴</div></td></tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type=password id="passwd" name="passwd">
				</td>
			</tr>
			<tr>
				<td colspan=2 align=center>
					<input type=submit value="회원삭제">
					<input type="button" value="취소" onClick="history.go(-1)">
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>