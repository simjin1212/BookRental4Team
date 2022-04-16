<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	alert("회원만 이용 가능합니다!!");
	location.href="<%=request.getContextPath()%>/member/loginform.jsp"
</script>