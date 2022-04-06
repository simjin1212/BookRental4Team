<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<th>대출가능여부</th>
				<th>예약여부</th>
				
			</tr>
			<tr>
				<th>1</th>
				<th>자바의정석</th>
				<th>남궁성</th>
				<th>한빛미디어</th>
				<th>2022-04-05</th>
				<th>대출가능</th>
				<td align = center><input type=button value="예약 취소" id="reserveCancle"></td>
			<tr>
		</table>

	</form>

</body>
</html>