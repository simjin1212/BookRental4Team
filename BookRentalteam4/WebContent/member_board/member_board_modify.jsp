
<%@ page language="java" contentType="text/html; charset=utf-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<html>
<head>
	<title>게시판</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="<%=request.getContextPath() %>/member_board/script.js"></script>
</head> 
<body>
현재 아이디:  ${sessionScope.id }<br>

<form action="<%=request.getContextPath() %>/member_board_modify.do" method="post" 
	  enctype="multipart/form-data"> <!-- 이 객체로 getParameter 할 것 -->
	  <input type=hidden id="page" name="page" value="${page }"/>
		<input type=hidden id="mb_num" name="mb_num"  value="${board.mb_Num }"/>
	  <center>자유게시판</center> <br>
<table cellpadding="0" cellspacing="0" align=center border=1>

<tr>  
		<th>제목</th>
		<td>
			<input name="mb_subject" id="mb_subject" type="text" maxlength="100" 
				style="height:30px; width:100%; border: 0; text-indent: 10px;" value="${board.mb_Subject }" />
		</td>
	</tr>
	<tr> 
 
		<td colspan="2">
			<textarea name="mb_content" id="mb_content" cols="60" rows="15"
			style="text-indent: 10px;">${board.mb_Content }</textarea>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center" >파일</div>
		</td>
		<td>
			<input name="mb_file" type="file" style="width:100%;"/>
		</td>
	</tr>
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	<tr><td colspan="2" style="border: 0;">&nbsp;</td></tr>
	<tr align="center" valign="middle">
		<td colspan="5" style="border-top: 0;">			
			<input type=submit value="수정">
			<input type=reset value="취소">
			<input type=button value="목록" onClick="location.href='./member_board_list.do?page=${page}'">
		</td>
	</tr>
</table>
</form>

</body>
</html>
