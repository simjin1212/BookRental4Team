<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신규도서 등록</title>
</head>


<body>
<form method="post" action="">
<table border=1 width=600 align=center>
	<caption>신규도서 등록</caption>
	<tr><td>도서번호(ISBN)</td>
		<td><input type=text id="" name="">
		</td>
	</tr>
	<tr><td>분류번호</td>
		<td><input type=text id="" name=""></td>
	</tr>
	<tr><td>도서명</td>
		<td><input type=text id="" name=""></td>
	</tr>
	<tr><td>출판사</td>
		<td><input type=text id="" name=""></td>
	</tr>
	<tr><td>저자</td>
		<td><input type=text id="" name="">
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">책표지
			<div align="center"></div>
		</td>
		<td>
			<input type=text id="" name="">
			<input name="" type="file"/>
		</td>
	</tr>	
	<tr><td>등록일</td>
		<td><input type=text id="" name="">
		</td>
	</tr>
	<tr><td>작가의말</td>
		<td>
			<textarea id="" name="" rows="5" cols="50"></textarea>
		</td>
	</tr>
	<tr><td colspan=2 align=center>
			<input type=submit value="등록">
			<input type=submit value="삭제">
		</td>
	</tr>		
</table>
</form>


</body>
</html>