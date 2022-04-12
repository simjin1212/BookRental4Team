<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 목록</title>
</head>
<body>
	<form method="post">
		<table border=1 width=900 align=center cellpadding = 5px>
			<caption><h2>예약 목록</h2></caption>
			<tr>
				<th>도서번호</th>
				<th>도서명</th>
				<th>저자</th>
				<th>출판사</th>
				<th>예약신청일</th>
				<th>현 대출자 반납일</th>
				<th>예약여부</th>

			</tr> 
			<c:forEach var="rv" items="${reservelist}">
			<tr>
				<th>${rv.book_Num}</th>
				<th>${rv.book_Name}</th>
				<th>${rv.writer}</th>
				<th>${rv.publisher}</th>
				<th>${rv.reserve_Date}</th>
				<th>${rv.return_date}</th>
				<th><input type="button" value="대출하기"></th>
				<td align = center><input type=button value="예약 취소" id="reserveCancle"></td>
			</tr>
			</c:forEach>
		</table>

	</form>

</body>
</html>