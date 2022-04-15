<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>

<head>
<!-- 폰트 -->
 	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Josefin+Sans:wght@500&family=Nanum+Gothic&display=swap" rel="stylesheet">


<!-- 유효성 검사 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath() %>/member_board/script.js"></script>


 </head>


<body style="padding-top:120px; z-index:1;">
   <%@ include file="../top.jsp" %>

<form action="<%=request.getContextPath() %>/member_board_write.do" method="post"  name="writeform" 
	  enctype="multipart/form-data" id="writeform" name="writeform"> <!-- 이 객체로 getParameter 할 것 -->
<div style="margin-top:1%; margin-left: 20%; width:60%;">   

<table cellpadding="0" cellspacing="0" align=center border=0 class="table" style="font-family: 'Nanum Gothic', sans-serif;"> 
<tr><td colspan=8 style="border:0;"><div style="font-family: 'Black Han Sans', sans-serif; font-size:40px; color:#6f42c1;">자유게시판</div></td></tr>
<tr>  
		<td colspan="2">
			<input name="mb_subject" id="mb_subject" type="text" maxlength="100"  placeholder="제목" 
				style="height:30px; width:100%; border: 0; text-indent: 10px;" value="" />
		</td>
	</tr>
	<tr> 
 
		<td colspan="2">
			<textarea name="mb_content" id="mb_content" rows="15" placeholder="내용"
			style="text-indent: 10px; width:100%;"></textarea>
		</td>
	</tr>
	<tr>
		<td style="font-family: 'Nanum Gothic', sans-serif;">
			<div align="center" style="font-weight:bold; ">파일</div>
		</td>
		<td>
			<input name="mb_file" type="file" style="width:100%;"/>
		</td>
	</tr>
	<tr >
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	<tr align="center" valign="middle">
		<td colspan="5" style="border-top: 0;">			
			<input type=submit value="등록" class="btn btn-primary  btn-sm flex-shrink-0">
			<input type=reset value="취소"  class="btn btn-primary  btn-sm flex-shrink-0">
			<input type="button" class="btn btn-primary  btn-sm flex-shrink-0" value="목록" onClick="location.href='./member_board_list.do'">
		</td>
	</tr>
</table>
</div>
</form>

</body>
</html>