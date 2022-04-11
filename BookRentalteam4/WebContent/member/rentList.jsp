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
	<form method="post">
		<table border=1 width=900 align=center cellpadding = 5px>
			<caption><h2>대출 목록</h2></caption>
			<tr>
				<th>도서번호</th>
				<th>도서명</th>
				<th>저자</th>
				<th>출판사</th>
				<th>대출일</th>
				<th>반납일</th>
				<th>리뷰</th>
				<th>반납</th>

			</tr>
			<c:forEach var="r" items="${rentlist}">
			<tr>
				<th>${r.rent_Num}</th>
				<th>${r.temp_book_Name }</th>
				<th>${r.temp_Writer }</th>
				<th>${r.temp_Publisher }</th>
				<th>${r.rent_Date}</th>
				<th>${r.return_Date}</th>
				<td align = center>
				<input type=button value="리뷰 작성" id="reviewWrite" onClick="location.href='<%=request.getContextPath()%>/BookReview_Form.do' ">
				</td>
				<td align = center><input type=button value="반납 신청" id="return"></td>
			</tr>
			
			</c:forEach>
		</table>

	</form>

</body>
</html>