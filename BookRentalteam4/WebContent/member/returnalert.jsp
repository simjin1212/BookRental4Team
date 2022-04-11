<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    

<c:if test="${result == 1 }">
	<script>
		alert("반납되었습니다");
	    location.href="./rentListAction.do";
	</script>
</c:if> 

<c:if test="${result == -1 }">
	<script>
		alert("다시 시도해주세요")
	    location.href="./rentListAction.do";
	</script>
</c:if>   