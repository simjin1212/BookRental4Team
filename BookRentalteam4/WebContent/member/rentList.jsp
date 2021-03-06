<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Josefin+Sans:wght@500&family=Nanum+Gothic&display=swap" rel="stylesheet">

 <link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet" />
<!-- --------------------------------------------------------------- -->
<title>대출 목록</title>
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

		<table border="0" width="600" align="center" class="table" style="font-family: 'Nanum Gothic', sans-serif;">
	<tr><td colspan=8 style="border:0;"><div style="font-family: 'Black Han Sans', sans-serif; font-size:40px; color:#6f42c1;">대출목록</div></td></tr>
	<tr><td colspan=4 align="left" style="font-weight:bolder; border:0;">총 대출도서 : ${rentcount} 권</td></tr>
	</table>

	<table border = 0 width=450 align=center cellpadding=15px class="table" style="font-family: 'Nanum Gothic', sans-serif;">
			<tr style="vertical-align :middle; text-align:center; font-size:16px; background-color:lightgray">
				<th>No.</th>
				<th>도서명</th>
				<th>저자</th>
				<th>출판사</th>
				<th>대출일</th>
				<th>반납일</th>
				<th>리뷰</th>
				<th>반납</th>

			</tr>
			<c:set var="num" value="${rentcount-(rentcount-1)}"/>
			<c:forEach var="r" items="${rentlist}"> 
			<tr style="vertical-align :middle; text-align:center;">
				<td>${num}</td>
				<c:set var="num" value="${num+1 }"/>
				<td>${r.temp_book_Name }</td>
				<td>${r.temp_Writer }</td>
				<td>${r.temp_Publisher }</td>
				<td><fmt:formatDate value="${r.rent_Date}" pattern="yyyy-MM-dd"/></td>
				<td>${r.return_Date}</td>
				<td align = center>
					<input type=button value="리뷰 작성" id="reviewWrite"  class="btn btn-outline-secondary btn-sm" 
						   onClick="location.href='<%=request.getContextPath()%>/rent_numPassingAction.do?book_Num=${r.book_Num}&rent_num=${r.rent_Num}'">
				</td>
				<td align = center><input type=button value="반납 신청" id="return" class="btn btn-outline-secondary btn-sm"  
							onClick="location.href='<%=request.getContextPath()%>/returnbook.do?num=${r.rent_Num}' "></td>
			</tr>
			
			</c:forEach>
		</table>
	</div>

</body>
</html>