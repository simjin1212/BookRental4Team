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
	<h3 align=center>도서 관리</h3>
      <table border=1 width=700 align=center>
        <caption align="right">
        <input type="text" name="text" placeholder="검색어">
        <input type="submit" value="검색"></caption>
        
		<tr bgcolor=lightgrey>
		<th>분류기호</th>
		<th>도서명</th>
		<th>회원명</th>
		<th>대출일</th>
		<th>반납예정일</th>
		<th>문자발송</th>
		</tr>
		
		<tr>
		<th>005.133-남16ㅈ</th>
		<th>자바의 정석</th>
		<th>홍길동</th>
		<th>2022-04-04</th>
		<th>2022-04-18</th>
		<th><input type="checkbox" name="" value=""></th>
		</tr>
		
		<tr>
		<th>005.133-남16ㅈ</th>
		<th>자바의 정석</th>
		<th>안화수</th>
		<th>2022-04-04</th>
		<th>2022-04-18</th>
		<th><input type="checkbox" name="" value=""></th>
		</tr>
</table>
</form>




</body>
</html>