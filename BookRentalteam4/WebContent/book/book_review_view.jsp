<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<%
	String path=request.getRealPath("rb_upload");
	request.setAttribute("path",path);
%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table border=1 width="600" align="center">
		<caption><h2>상세 페이지</h2></caption>
		<tr>
			<td width = 150 align = center>제목</td>
			<td width = 250 align = center>${board.rb_Subject}</td>
		</tr>
		<tr>
			<td align = center>내용</td>
			<td><pre>${board.rb_Content}</pre> ${content}</td>
		</tr>
		<tr>
			<td align = center>첨부 파일</td>
			<td>
				<!-- 첨부파일이 있을때만 첨부파일 출력 --> 
				<c:if test="${board.rb_File!=null}">
					<img src="${path}/${board.rb_File }" width=400 height=400><br>
					<a href="./file_down.jsp?file_name=${board.rb_File}">
						${board.rb_File} </a>
				</c:if>
			</td>
		</tr>
		<tr>
			<td colspan=2 align=center><input type="button" value="목록"
				onClick="location.href='./ReviewListAction.do?page=${page}&num=${book_num}' ">

			</td>
		</tr>
	</table>

</body>
</html>