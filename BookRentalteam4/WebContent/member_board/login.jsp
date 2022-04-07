<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${!empty sessionScope.id}">
${sessionScope.id}님 환영 합니다. <br><br>
</c:if>

<a href="./member_board_login.do">로그인</a><br>
<a href="./member_board_list.do">글목록</a><br>
<a href="./member_board_writeform.do">글쓰기</a><br>
</body>
</html>