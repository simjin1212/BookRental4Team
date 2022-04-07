<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서상세정보</title>
</head>


<body>

<table border=1 width=600 align=center>
	<caption>도서상세정보</caption>
	<tr>
		<td style="font-family:돋음; font-size:12">책표지
			<div align="center"></div>
		</td>
		<td>
			<c:if test="${book.book_Cover != null}">
		<a href="./admin/bookfileupload.jsp?file_name=${book.book_Cover}">				
				${book.book_Cover}
			</a>	
			</c:if>
		</td>
	</tr>	
	<tr><td>도서명</td>
		<td>${book.book_Name}</td>
	</tr>
	<tr><td>도서번호(ISBN)</td>
		<td>${book.book_Num}
		</td>
	</tr>
	<tr><td>장르</td>
		<td>${book.genre}</td>
	</tr>
	<tr><td>출판사</td>
		<td>${book.publisher}</td>
	</tr>
	<tr><td>저자</td>
		<td>${book.writer}</td>
	</tr>	
	<tr><td>등록일</td>
		<td>${book.book_regDate}</td>
	</tr>
	<tr><td>작가의말</td>
		<td>
			<pre>${book.writer_talks}</pre>
		</td>
	</tr>
	<tr><td colspan=2 align=center>
			<input type=submit value="수정하기"
			onClick="location.href='./bookModifyAction.do?book_Num=${book.book_Num}' ">
			<input type=submit value="삭제"
			onClick="location.href='./bookDelete.do?book_Num=${book.book_Num}' ">
			<input type="button" value="목록" 
			onClick="location.href='./booklistaction.do' ">
		</td>
	</tr>		
</table>



</body>
</html>