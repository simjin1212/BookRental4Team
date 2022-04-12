<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<c:if test="${result == 1 }">
	<script>
		alert("대출완료! 대출목록으로 이동합니다.");
	    location.href="./rentListAction.do";
	</script>
</c:if> 