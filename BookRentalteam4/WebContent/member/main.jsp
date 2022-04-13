<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Agency - Start Bootstrap Theme</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="${pageContext.request.contextPath}/https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
  </head>
<body>
  <!-- 상단 nav -->
  <%@ include file="../top.jsp" %> 
  
<!-- 세션이 있는 경우 -->
<c:if test="${!empty sessionScope.id}">
<%-- <c:if test="${sessionScope.id != null}"> --%>
	${sessionScope.id}님 환영 합니다. <br><br>
	 <br><br><br>
	 <a href="<%=request.getContextPath()%>/UpdateForm.do"><h5>내 정보</h5></a> <br>
	 <a href="<%=request.getContextPath()%>/rentListAction.do"><h5>대출 목록</h5></a> <br>
	 <a href="<%=request.getContextPath()%>/ReserveList.do"><h5>예약 목록</h5></a> <br>
	 <a href="<%=request.getContextPath()%>/member_board_list.do"><h5>회원게시판</h5></a> <br>
	 <a href="<%=request.getContextPath()%>/qna_BoardListAction.do"><h5>1:1문의 게시판</h5></a> <br>
	 <a href="<%=request.getContextPath()%>/booksearchaction.do">도서검색</a> <br><br>
	 <a href="<%=request.getContextPath()%>/Logout.do"><h5>로그아웃</h5></a> <br>
	 <a href="<%=request.getContextPath()%>/DeleteMember.do"><h5>회원탈퇴</h5></a> <br>

</c:if>

<!-- 세션이 없는 경우 -->
<c:if test="${empty sessionScope.id}">
<%-- <c:if test="${sessionScope.id == null }"> --%>
	<a href="<%=request.getContextPath() %>/JoinForm.do">회원 가입</a> <br>
	<a href="<%=request.getContextPath() %>/LoginForm.do">로그인</a> <br>
	<a href="<%=request.getContextPath() %>/booksearchaction.do">비회원</a> <br>
</c:if>
</body>
</html>
    