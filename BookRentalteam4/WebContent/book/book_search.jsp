<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.book_dto"%>
<%@ page import="dao.book_dao"%>
<%@page import="java.util.*"%>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
	
<!-- --------------------------------------------------------------- -->

<%
	request.setCharacterEncoding("utf-8");

	String sel = request.getParameter("sel");
	String find = request.getParameter("find");
	// 1. 한 화면에 출력할 데이터 갯수
	int pageSize = 10;

	String pageNum = request.getParameter("pageNum");
	if (pageNum == null) {
		pageNum = "1";
	}

	//2. 현재 페이지 번호
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;

	//3. 총 데이터 갯수 
	int count = 0;
	int fcount = 0;
	int number = 0; // 화면에 출력되는 번호
	int fnumber = 0; // 화면에 출력되는 번호
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>도서 검색</title>
</head>


	<%
		List list = null;
		List flist = null;
		book_dao manager = book_dao.getInstance();

		count = manager.getCount();
		fcount = manager.getFcount(sel, find);
		/* 	System.out.println("count="+count);
			System.out.println("fcount="+fcount); */
		/* 	out.println("count="+count+"<br>");
			out.println("fcount="+fcount+"<br>");	
			out.println("sel="+sel+"<br>");	
			out.println("find="+find+"<br>"); */

		number = count - (currentPage - 1) * pageSize;
		fnumber = fcount - (currentPage - 1) * pageSize;

		if (count > 0) {
			list = manager.selectBook(startRow, endRow);
		}
		if (fcount > 0) {
			flist = manager.selectFbook(startRow, endRow, sel, find);
		}
		System.out.println("list=" + list);
		System.out.println("flist=" + flist);
	%>

	<script>
		$(document).ready(function() {
			$("form").submit(function() {
				if ($("select").val() == "") {
					alert("검색할 항목을 선택");
					return false;
				}
				if ($("#find").val() == "") {
					alert("검색어를 입력하세요");
					$("#find").focus();
					return false;
				}
			});
		});
	</script>
<body style="padding-top: 120px; z-index: 1;">
<%@ include file="../top.jsp"%>
	<form action="book/book_search.jsp" method="post"  align=center cellpadding = 15px>
		<div class="container col-sm-8">
		
		<table align = center valign = center cellpadding = 15px>
	        <div style="font-family: 'Black Han Sans', sans-serif; font-size:40px; color:#6f42c1;">도서 검색 목록</div>
			<select align = center name="sel">
				<option value="">검색</option>
				<option value="BOOK_NAME">제목</option>
				<option value="WRITER">저자</option>
				<option value="PUBLISHER">출판사</option>
			</select>
			<input type="text" name="find" id="find" placeholder="검색어">
			<input type="submit" value="검색">
		</table>
		<tr height = 150> <br> </tr>
		<table align="center" valign = center cellpadding = 15px>
		
		<tr border = 1 style="font-size:20px; color:#331B3F;">
			<td width = 150 align = center valign = "center">책 표지</td>
			<td width = 150 align = center valign = "center">도서 번호</td>
			<td width = 150 align = center valign = "center">도서 이름</td>
			<td width = 150 align = center valign = "center">저자</td>
			<td width = 150 align = center valign = "center">출판사</td>
		</tr>
		</table>
		<%
			//  전체 목록
			if (count > 0 && fcount == 0) {
				for (int i = 0; i < list.size(); i++) {
					book_dto book = (book_dto) list.get(i);
		%>
		<table align="center" valign = center cellpadding = 15px>
		<tr>
			<td><img src = "./admin/bookfileupload.jsp?file_name=<%=book.getBook_Cover()%> " style="width:150px; height:150px;"/></td>
			<td width = 150 align = center valign = center><%=number--%></td>
			<td width = 150 align = center valign = center><a
				href="./ReviewListAction.do?num=<%=book.getBook_Num()%>&pageNum=<%=currentPage%>">
					<%=book.getBook_Name()%>
			</a></td>
			<td width = 150 align = center valign = center><%=book.getWriter()%></td>
			<td width = 150 align = center valign = center><%=book.getPublisher()%></td>
		</tr>

		<%
			} // for end

				// 검색 목록	
			} else if (count > 0 && fcount != 0) {
				for (int i = 0; i < flist.size(); i++) {
					book_dto book = (book_dto) flist.get(i);
		%>

		<tr>
		<td><img src = "./admin/bookfileupload.jsp?file_name=<%=book.getBook_Cover()%> " style="width:150px; height:150px;"/></td>
			<td><%=fnumber--%></td>
			<td><a
				href="./memberbookdetail.do?no=<%=book.getBook_Num()%>&pageNum=<%=currentPage%>">
					<%=book.getBook_Name()%>
			</a></td>
			<td><%=book.getWriter()%></td>
			<td><%=book.getPublisher()%></td>
		</tr>

		<%
			} // for end

			}
		%>

	</table>
	</div>
</form>


	<!-- 페이지 출력 -->
	<center>
		<%
			// 전체 목록 페이지 처리
			if (count > 0 && fcount == 0) {

				// 총 페이지수
				int pageCount = count / pageSize + ((count % pageSize == 0) ? 0 : 1);

				// 각 블럭의 시작페이지 번호
				int startPage = ((currentPage - 1) / 10) * pageSize + 1;

				// 각 블럭의 끝페이지 번호
				int endPage = startPage + 10 - 1;

				// 존재하는 페이지만 출력
				if (endPage > pageCount)
					endPage = pageCount;

				// 이전 블럭으로 이동
				if (startPage > 10) {
		%>
		<a href="book_search.jsp?pagseNum=<%=startPage - 10%>"><%="[이전]"%></a>
		<%
			} else {
		%>
		<%="[이전]"%>
		<%
			}

				// 각 블럭에 10개의 페이지 출력 
				for (int i = startPage; i <= endPage; i++) {
					if (i == currentPage) { // 현재 페이지
		%>
		<%=i%>

		<%
			} else {
		%>
		<a href="book_search.jsp?pageNum=<%=i%>"><%=i%></a>
		<%
			}
				}

				// 다음 블럭으로 이동
				if (endPage < pageCount) {
		%>
		<a href="book_search.jsp.jsp?pageNum=<%=startPage + 10%>"><%="[다음]"%></a>
		<%
			} else {
		%>
		<%="[다음]"%>
		<%
			}

				// 검색 목록 페이지 처리		
			} else if (fcount > 0) {
				// 총 페이지수
				int pageCount = fcount / pageSize + ((fcount % pageSize == 0) ? 0 : 1);

				// 각 블럭의 시작페이지 번호
				int startPage = ((currentPage - 1) / 10) * pageSize + 1;

				// 각 블럭의 끝페이지 번호
				int endPage = startPage + 10 - 1;

				// 존재하는 페이지만 출력
				if (endPage > pageCount)
					endPage = pageCount;

				// 이전 블럭으로 이동
				if (startPage > 10) {
		%>
		<a
			href="book_search.jsp.jsp?pageNum=<%=startPage - 10%>&sel=<%=sel%>&find=<%=find%>"><%="[이전]"%></a>
		<%
			} else {
		%>
		<%="[이전]"%>
		<%
			}

				// 각 블럭에 10개의 페이지 출력 
				for (int i = startPage; i <= endPage; i++) {
					if (i == currentPage) { // 현재 페이지
		%>
		<%=i%>

		<%
			} else {
		%>
		<a
			href="book_search.jsp.jsp?pageNum=<%=i%>&sel=<%=sel%>&find=<%=find%>"><%=i%></a>
		<%
			}
				}

				// 다음 블럭으로 이동
				if (endPage < pageCount) {
		%>
		<a
			href="book_search.jsp?pageNum=<%=startPage + 10%>&sel=<%=sel%>&find=<%=find%>"><%="[다음]"%></a>
		<%
			} else {
		%>
		<%="[다음]"%>
		<%
			}

			}
		%>
	
</body>

</html>