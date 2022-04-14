<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Josefin+Sans:wght@500&family=Nanum+Gothic&display=swap" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet" />
<title>회원정보 수정</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function openDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
				document.getElementById('post').value = data.zonecode;
				document.getElementById('address').value = data.address;

			}
		}).open();
	}
</script>
</head>
<body style="padding-top:120px; z-index:1;">
  <!-- 상단 nav -->
  <%@ include file="../top.jsp" %> 
  <c:if test="${!empty sessionScope.id}">
  	<ul class="admin_page">
	<li class="admin"> <a style="text-decoration: none;" href="<%=request.getContextPath()%>/UpdateForm.do"> MENU</a></li>
	<li class="menu" > <a href="<%=request.getContextPath()%>/UpdateForm.do">내 정보</a></li>
	<li class="menu" > <a href="<%=request.getContextPath()%>/booksearchaction.do">도서검색</a></li>
	<li class="menu" > <a href="<%=request.getContextPath()%>/rentListAction.do">대출 목록</a> </li>
	<li class="menu" > <a href="<%=request.getContextPath()%>/ReserveList.do">예약 목록</a></li>
	<li class="menu" > <a href="<%=request.getContextPath()%>/member_board_list.do">회원게시판</a></li>
	<li class="menu" > <a href="<%=request.getContextPath()%>/qna_BoardListAction.do">1:1문의 게시판</a></li>
	<li class="menu" > <a href="<%=request.getContextPath()%>/Logout.do">로그아웃</a></li>
	<li class="menu" > <a href="<%=request.getContextPath()%>/DeleteMember.do">회원탈퇴</a></li>
</ul>

	<form method="post" action="<%=request.getContextPath()%>/Update.do">
		<input type="hidden" name="id" value="${member.id}">
		
 <div style="margin-top:1%; margin-left: 20%; width:60%;">
<table align="center" valign = center cellpadding = 15px>
<tr><td colspan=8 style="border:0;"><div style="font-family: 'Black Han Sans', sans-serif; font-size:40px; color:#6f42c1;">내 정보 수정</div></td></tr>
	<tr>
	<td colspan=4 align="left" style="border-top:0;"> <c:if test="${not empty find}">[${find }] 검색 결과  총 ${listcount} 개</c:if></td>
		<c:if test="${sessionScope.member_grade==1 }">
		<td colspan=4 align="right" style="border-top:0;"><input type="submit" class="btn btn-outline-secondary btn-sm"  value="삭제"></td>
		</c:if>
		<!-- 삭제는 관리자가 들어갈 때만 보이게 설정... checked 위에. -->
	</tr>
	</table>
</div>
		
		
		

		<table border=1 width=800 align=center cellpadding=5px>
			<tr>
				<td>ID</td>
				<td><input type=text id="id" name="id" disabled="disabled"
					value="${member.id}">
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type=password id="passwd" name="passwd" size=21></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type=text id="name" name="name" disabled="disabled"
					value="${member.name}"></td>
			</tr>
			<tr>
				<td>주민번호</td>
				<td><input type=text size=6 maxlength=6 id="jumin" name="jumin"
					disabled="disabled" value="${member.jumin}"> - <input
					type=text size=7 maxlength=7 id="jumin2" name="jumin2"
					disabled="disabled" value="*******"></td>
			</tr>
			<tr>
				<td>E-Mail</td>
				<td><input type=text size=10 id="mailid" name="mailid"
					value="${member.mailid}">@ <input type=text size=10
					id="domain" name="domain" value="${member.domain}"> <select
					id="email">
						<option value="">직접입력</option>
						<option value="naver.com">네이버</option>
						<option value="daum.net">다음</option>
						<option value="nate.com">네이트</option>
						<option value="gmail.com">gmail</option>
				</select></td>
			</tr>
			<tr>
				<td>핸드폰</td>
				<td><select id="phone1" name="phone1" value="${member.phone1}">
						<option value="">번호선택</option>
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="018">018</option>
						<option value="019">019</option>
				</select>- <input type=text size=4 id="phone2" name="phone2"
					value="${member.phone2}" maxlength=4>- <input type=text
					size=4 id="phone3" name="phone3" value="${member.phone2}"
					maxlength=4></td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td><input type=text size=5 id="post" name="post"
					value="${member.post}"> <input type=button value="우편번호검색"
					onClick="openDaumPostcode()"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type=text size=45 id="address" name="address"
					value="${member.address}"></td>
			</tr>
			<tr>
				<td colspan=2 align=center><input type=submit value="수정">
					<input type=reset value="취소"></td>
			</tr>
		</table>
	</form>
</c:if>
</body>
</html>