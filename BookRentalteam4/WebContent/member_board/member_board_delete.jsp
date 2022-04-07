<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String nowpage=request.getParameter("page");
%>
</head>
<body>
<table cellpadding="0" cellspacing="0" align=center border=1 width=200>
<tr><td colspan="2" style="border: 1;" align=center >삭제하시겠습니까?</td></tr>
	<tr align="center" valign="middle">
		<td colspan="5" style="border-top: 0;">			
			<input type=button value="삭제" onClick="location.href='./member_board_delete.do?num=<%=num %>'">
			<input type=button value="취소" onClick="location.href='./member_board_view.do?num=<%=num %>&page=<%=nowpage%>'">
			<input type=button value="목록" onClick="location.href='./member_board_list.do?page=<%=nowpage%>'">
		</td>
	</tr>
</table>
</body>
</html>