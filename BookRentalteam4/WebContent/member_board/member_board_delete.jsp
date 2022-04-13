<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 폰트 -->
 	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Gothic&display=swap" rel="stylesheet">

<!-- 유효성 검사 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath() %>/member_board/script.js"></script>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String nowpage=request.getParameter("page");
%>
</head>
<body style="padding-top:200px; z-index:1;">
   <%@ include file="../top.jsp" %>
   <div class="container col-sm-2">	
<table cellpadding="0" cellspacing="0" align=center border=0 class="table" style="font-family: 'Nanum Gothic', sans-serif;"> 
<tr><td colspan="2" style="border: 1;" align=center >삭제하시겠습니까?</td></tr>
	<tr align="center" valign="middle">
		<td colspan="5" style="border-top: 0;">			
			<input type=button value="삭제" class="btn btn-primary  btn-sm flex-shrink-0" onClick="location.href='./member_board_delete.do?num=<%=num %>'">
			<input type=button value="취소" class="btn btn-primary  btn-sm flex-shrink-0" onClick="location.href='./member_board_view.do?num=<%=num %>&page=<%=nowpage%>'">
			<input type=button value="목록" class="btn btn-primary  btn-sm flex-shrink-0" onClick="location.href='./member_board_list.do?page=<%=nowpage%>'">
		</td>
	</tr>
</table>
</div>
</body>
</html>