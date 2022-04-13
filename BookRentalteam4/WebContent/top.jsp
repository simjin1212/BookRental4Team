<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
  <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Agency - Start Bootstrap Theme</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
  </head>
  <body >
  <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav" style="position:fixed; top:0; width:100%; z-index:3;">
            <div class="container">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/assets/img/navbar-logo.svg" alt="..." /></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i> 
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                     <c:if test="${empty sessionScope.id }">
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/joinform.do"><span>JOIN</span></a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/loginform.do"><span>LogIn</span></a></li>
                     </c:if>
                     <c:if test="${not empty sessionScope.id }">
                     	<c:if test="${sessionScope.member_grade==0 }">

                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/main.jsp"><span>My Page</span></a></li>
                        </c:if>
                        <c:if test="${sessionScope.member_grade==1 }">
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/admin_main.jsp"><span>Admin Page</span></a></li>
                        </c:if>
                        <li class="nav-item"><a class="nav-link"  href="${pageContext.request.contextPath}/Logout.do"><span>LogOut</span></a></li>
                        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/member_board_list.do"><span>MemberBoard</span></a></li>
                     </c:if>
                    </ul>
                </div>
            </div>
        </nav>
                        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
 
  </body>
</html>