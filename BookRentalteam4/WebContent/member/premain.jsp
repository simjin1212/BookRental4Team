<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    

<c:if test="${admincheck == 1 }">
	<script>
		alert("관리자 계정입니다!!!!");
	    location.href="./index.jsp";
	</script>
</c:if> 

<c:if test="${admincheck == -1 }">
	<script>
		alert("일반회원입니다!")
	    location.href="./index.jsp";
	</script>
</c:if>   