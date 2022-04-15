<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath()%>/js/script.js"></script>  
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="author" content="colorlib.com">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,800" rel="stylesheet" />
    <link href="css/main.css" rel="stylesheet" />
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Gothic&display=swap"
	rel="stylesheet">
</head>
<body>
 <%--   <%@ include file="top.jsp" %> --%>
 <c:set var="book_name" value="book_name"/>
   <div class="s006" style="z-index:2;">
      <form method="post" action="<%=request.getContextPath() %>/book/book_search.jsp" name="search">
      <input type=hidden name="sel" id="sel" value=${book_name }>
        <fieldset>
          <legend>What are you looking for?</legend>
          <div class="inner-form">
            <div class="input-field">
              <button class="btn-search" type="submit" id="serach">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                  <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path>
                </svg>
              </button>
              <input id="find" name="find" type="text" placeholder="Search..."  />
            </div>
          </div>
          <div class="suggestion-wrap">
          <c:set var="s1" value="홍길동전" />
          <c:set var="s2" value="수능특강" />
          <c:set var="s3" value="코스모스" />
          <c:set var="s4" value="전우치전" />
          <c:set var="s5" value="헤드헌터" />
            <span><a style="text-decoration:none; color:#fff;" href="<%=request.getContextPath() %>/book/book_search.jsp?sel=${book_name }&find=${s1}">${s1 }</a></span>
            <span><a style="text-decoration:none; color:#fff;" href="<%=request.getContextPath() %>/book/book_search.jsp?sel=${book_name }&find=${s2}">${s2 }</a></span>
            <span><a style="text-decoration:none; color:#fff;" href="<%=request.getContextPath() %>/book/book_search.jsp?sel=${book_name }&find=${s3}">${s3 }</a></span>
            <span><a style="text-decoration:none; color:#fff;" href="<%=request.getContextPath() %>/book/book_search.jsp?sel=${book_name }&find=${s4}">${s4 }</a></span>
            <span><a style="text-decoration:none; color:#fff;" href="<%=request.getContextPath() %>/book/book_search.jsp?sel=${book_name }&find=${s5}">${s5 }</a></span>
          </div>
        </fieldset>
      </form>
    </div>
</body>
</html>