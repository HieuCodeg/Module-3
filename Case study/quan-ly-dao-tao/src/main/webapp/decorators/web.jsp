<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Hiếu Nguyễn
  Date: 10/9/2022
  Time: 8:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp"%>
<html>
<head>
    <title><dec:title default="Trang chủ" /></title>

    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="<c:url value="/template/web/assets/favicon.ico" /> " />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="<c:url value="/template/web/css/styles.css" />" rel="stylesheet" />
<%--    caro--%>
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="/template/web/carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/template/web/carousel/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/4.5.6/css/ionicons.min.css">
    <link rel="stylesheet" href="/template/web/carousel/css/style.css">
</head>
<body>
    <!-- header -->
    <%@ include file="/common/web/header.jsp" %>
    <!-- header -->

    <div class="container">
        <dec:body/>
    </div>

    <!-- footer -->
    <%@ include file="/common/web/footer.jsp" %>
    <!-- footer -->

    <!-- Bootstrap core JS-->
    <script type="text/javascript" src="<c:url value='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js' />"></script>
    <!-- Core theme JS-->
    <script type="text/javascript" src="<c:url value='/template/web/js/scripts.js' />"></script>
<%--caro--%>
    <script src="/template/web/carousel/js/jquery.min.js"></script>
    <script src="/template/web/carousel/js/popper.js"></script>
    <script src="/template/web/carousel/js/bootstrap.min.js"></script>
    <script src="/template/web/carousel/js/owl.carousel.min.js"></script>
    <script src="/template/web/carousel/js/main.js"></script>
</body>
</html>
