<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 세션이 있는 경우 -->
<c:if test="${!empty sessionScope.id}">
<%-- <c:if test="${sessionScope.id != null}"> --%>
	${sessionScope.id}님 환영 합니다. <br><br>
	 
	 <a href="./UpdateForm.do"><h5>내 정보</h5></a> <br>
	 <a href="./ReviewListAction.do"><h5>(임시)리뷰게시판 이동</h5></a> <br>
	 <a href="./rentListAction.do"><h5>대출 목록</h5></a> <br>
	 <a href="./ReserveList.do"><h5>예약 목록</h5></a> <br>
	 <a href="./member_board_list.do"><h5>회원게시판</h5></a> <br>
	 <a href="./qna_BoardListAction.do"><h5>1:1문의 게시판</h5></a> <br>
	 <a href="./Logout.do"><h5>로그아웃</h5></a> <br>
	 <a href="./DeleteMember.do"><h5>회원탈퇴</h5></a> <br>
	
</c:if>

<!-- 세션이 없는 경우 -->
<c:if test="${empty sessionScope.id}">
<%-- <c:if test="${sessionScope.id == null }"> --%>
	<a href="<%=request.getContextPath() %>/JoinForm.do">회원 가입</a> <br>
	<a href="<%=request.getContextPath() %>/LoginForm.do">로그인</a> <br>
	<a href="<%=request.getContextPath() %>/booksearchaction.do">비회원</a> <br>
</c:if>
    