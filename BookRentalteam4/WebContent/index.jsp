<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
      <title>메인화면</title>
          <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">

     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">

<!--     Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"> 
    
    <!-- Style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="author" content="colorlib.com">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,800" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet" />
  </head>
  <body>
  <!-- 상단 nav -->
  <%@ include file="top.jsp" %> 
  
  <!-- 메인 화면 -->
    <%@ include file="main.jsp" %>
  </body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
