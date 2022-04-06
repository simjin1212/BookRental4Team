<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신규도서 등록</title>
</head>
<!-- 외부 자바스크립트 파일 불러오기 -->
<script src="bookupdate.js"></script>

<body>
<form method="post" action="">
<table border=1 width=600 align=center>
	<caption>신규도서 등록</caption>
	<tr><td>도서번호(ISBN)</td>
		<td><input type=text id="book_num" name="book_num">
		</td>
	</tr>
	<tr><td>분류번호</td>
		<td><input type=text id="genre" name="genre"></td>
	</tr>
	<tr><td>도서명</td>
		<td><input type=text id="book_name" name="book_name"></td>
	</tr>
	<tr><td>출판사</td>
		<td><input type=text id="publisher" name="publisher"></td>
	</tr>
	<tr><td>저자</td>
		<td><input type=text id="writer" name="writer">
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" id="book_cover" name="book_cover">책표지
			<div align="center"></div>
		</td>
		<td>
			<input type=text id="" name="">
			<input name="" type="file"/>
		</td>
	</tr>	
	<tr><td>등록일</td>
		<td><input type=text id="bookupdateday" name="bookupdateday">
		</td>
	</tr>
	<tr><td>작가의말</td>
		<td>
			<textarea id="wirter_talks" name="wirter_talks" rows="5" cols="50"></textarea>
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