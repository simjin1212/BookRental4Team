<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대출 도서관리</title>
</head>


<body>
<form method="post">
	<h3 align=center>도서정보 관리</h3>
      <table border=1 width=700 align=center>
        <caption align="right">
        <input type="text" name="text" placeholder="검색어">
        <input type="submit" value="검색"></caption>
        
		<tr bgcolor=lightgrey>
		<th>분류번호</th>
		<th>도서명</th>
		<th>저자</th>
		<th>출판사</th>
		<th>등록일</th>
		<th>ISBN</th>
		</tr>
		
		<tr>
		<th>005.100-H</th>
		<th>Head First Java</th>
		<th>버트베이즈</th>
		<th>한빛미디어</th>
		<th>2022-04-04</th>
		<th>123456789456789</th>
		<th><input type="checkbox" name="color" value="red"></th>
		</tr>
		
		<tr>
		<th>005.133-남16ㅈ</th>
		<th>자바의 정석</th>
		<th>남궁성</th>
		<th>지음사</th>
		<th>2022-01-01</th>
		<th>123456789456123</th>
		<th><input type="checkbox" name="" value=""></th>
		</tr>
</table>
</form>




</body>
</html>