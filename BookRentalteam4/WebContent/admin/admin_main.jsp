<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 세션이 있는 경우 -->
<c:if test="${!empty sessionScope.id}">
<%-- <c:if test="${sessionScope.id != null}"> --%>
	${sessionScope.id}님 환영 합니다. <br><br>
	 
	 <a href="<%=request.getContextPath()%>/member_board_list.do"><h5>회원게시판 공지및 관리</h5></a> <br>

	 <a href="<%=request.getContextPath()%>/adminmemberlist.do"><h5>회원 목록 관리</h5></a> <br>

	 <a href="<%=request.getContextPath()%>/booklistaction.do"><h5>도서 CRUD 관리</h5></a> <br>
	 
	 <a href=""><h5>미반납 도서목록관리 </h5> </a> <br>
	 
	 <a href="<%=request.getContextPath()%>/qna_BoardListAction.do"><h5>1:1 QNA 문의관리</h5></a> <br>

</c:if>

<!-- 세션이 없는 경우 -->
<c:if test="${empty sessionScope.id}">
<%-- <c:if test="${sessionScope.id == null }"> --%>
	<a href="<%=request.getContextPath() %>/JoinForm.do">회원 가입</a> <br>
	<a href="<%=request.getContextPath() %>/LoginForm.do">로그인</a> <br>
</c:if>
    