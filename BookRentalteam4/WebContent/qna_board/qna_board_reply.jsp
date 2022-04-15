<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>

	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="<%=request.getContextPath() %>/board/script.js"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Gothic&display=swap" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet" />
</head>
<body style="padding-top:120px; z-index:1;">
 <%@ include file="../top.jsp" %>
	<c:if test="${!empty sessionScope.id}">
	<ul class="admin_page">
<%-- <c:if test="${sessionScope.id != null}"> --%>
	<li class="admin" > <a style="text-decoration: none;" href="<%=request.getContextPath()%>/admin/admin_main.jsp">ADMIN</a></li>

	<li class="menu" > <a href="<%=request.getContextPath()%>/member_board_list.do">게시판 관리</a> </li>

	<li class="menu"> <a href="<%=request.getContextPath()%>/adminmemberlist.do">회원 관리</a> </li>

	<li class="menu"> <a href="<%=request.getContextPath()%>/booklistaction.do">도서 관리</a> </li>
	 
	<li class="menu"> <a href="<%=request.getContextPath()%>/adminrentlist.do">대출 관리 </a> </li>
	 
	<li class="menu"> <a href="<%=request.getContextPath()%>/qna_BoardListAction.do">문의 관리</a> </li>
	</ul>
	</c:if>



<form action="<%=request.getContextPath() %>/qna_board_reply.do" method="post">
<input type=hidden name="qb_num" value="${board.qb_num}">
<input type=hidden name="qb_ref" value="${board.qb_ref}">
<input type=hidden name="qb_lev" value="${board.qb_lev}">
<input type=hidden name="qb_seq" value="${board.qb_seq}">
<input type=hidden name="page" value="${page}">   
<div style="margin-top:1%; margin-left: 20%; width:60%;">
<table cellpadding="0" cellspacing="0" align=center border=0 class="table" style="font-family: 'Nanum Gothic', sans-serif;">

<tr><td colspan=8 style="border:0;"><div style="font-family: 'Black Han Sans', sans-serif; font-size:40px; color:#6f42c1;">문의 답변</div></td></tr>

	<tr align="center" valign="middle">
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">제목</div>
		</td>
		<td>
			<input name="qb_subject" id="qb_subject" type="text" size="10" maxlength="10" 
				value="${board.qb_subject}"/>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td>
			<textarea name="qb_content" id="qb_content" cols="67" rows="15" style="text-indent: 10px;">

======================================
${board.qb_content}	</textarea>
		</td>
	</tr>
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>

	<tr align="center" valign="middle">
		<td colspan="5">			
			<input type=submit value="등록">
			<input type=reset value="취소">
		</td>
	</tr>
</table>
</div>
</form>

</body>
</html>