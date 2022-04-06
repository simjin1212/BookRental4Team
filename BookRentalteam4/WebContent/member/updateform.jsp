<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<body>
	<form method="post" action="<%=request.getContextPath()%>/Update.do">
		<input type="hidden" name="id" value="${member.id}">
		<table border=1 width=500 align=center cellpadding=5px>
			<caption>
				<h2>내 정보 수정</h2>
			</caption>
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
</body>
</html>