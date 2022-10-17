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

</body>
</html>
