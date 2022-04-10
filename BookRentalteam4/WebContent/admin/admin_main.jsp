<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 세션이 있는 경우 -->
<c:if test="${!empty sessionScope.id}">
<%-- <c:if test="${sessionScope.id != null}"> --%>
	${sessionScope.id}님 환영 합니다. <br><br>
	 
	 <a href=""><h5>게시판관리</h5></a> <br>
	 	 <a href="./member_board_list.do"><h5>회원게시판</h5></a> <br>

	 <a href="./adminmemberlist.do"><h5>회원관리</h5></a> <br>

	 <a href="./booklistaction.do"><h5>도서관리</h5></a> <br>
	 <a href="./qna_BoardListAction.do"><h5>문의관리</h5></a> <br>

</c:if>

<!-- 세션이 없는 경우 -->
<c:if test="${empty sessionScope.id}">
<%-- <c:if test="${sessionScope.id == null }"> --%>
	<a href="<%=request.getContextPath() %>/JoinForm.do">회원 가입</a> <br>
	<a href="<%=request.getContextPath() %>/LoginForm.do">로그인</a> <br>
</c:if>
    