<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<c:if test="${member_grade == 0 }">
	<script>
	alert("예약삭제완료 예약리스트로 이동합니다.");
	location.href="./ReserveList.do";
	</script>
</c:if>
<c:if test="${member_grade == 1 }">
	<script>
	alert("예약 강제 삭제 완료 회원목록으로 이동합니다.");
	location.href="./adminmemberlist.do";
	</script>
</c:if>