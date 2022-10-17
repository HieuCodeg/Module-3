<%--
  Created by IntelliJ IDEA.
  User: Hiếu Nguyễn
  Date: 10/9/2022
  Time: 8:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title><dec:title default="Trang chủ" /></title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css">
    <link rel="stylesheet" href="<c:url value='/template/admin/css/styles.css' />"  />
    <script src="<c:url value='https://use.fontawesome.com/releases/v6.1.0/js/all.js'  />" crossorigin="anonymous"></script>

<%--link phân trang--%>
    <link rel="stylesheet" href="<c:url value='https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css' />"  />
    <script src="<c:url value='https://code.jquery.com/jquery-3.3.1.min.js'/>"></script>
    <script src="<c:url value='https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/template/paging/jquery.twbsPagination.js' />"></script>

</head>
<body class="sb-nav-fixed">
<!-- header -->
<%@ include file="/common/admin/header.jsp" %>
<!-- header -->

<div id="layoutSidenav">

    <!-- header -->
    <%@ include file="/common/admin/menu.jsp" %>
    <!-- header -->
    <div id="layoutSidenav_content">
        <dec:body/>

        <!-- footer -->
        <%@ include file="/common/admin/footer.jsp" %>
        <!-- footer -->
    </div>
</div>

<script src="<c:url value='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js'/>" crossorigin="anonymous"></script>
<script src="<c:url value='/template/admin/js/scripts.js'/>"></script>
<script src="<c:url value='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js'/>" crossorigin="anonymous"></script>
<script src="<c:url value='/template/admin/assets/demo/chart-area-demo.js'/>"></script>
<script src="<c:url value='/template/admin/assets/demo/chart-bar-demo.js'/>"></script>
<script src="<c:url value='https://cdn.jsdelivr.net/npm/simple-datatables@latest'/>" crossorigin="anonymous"></script>
<script src="<c:url value='/template/admin/js/datatables-simple-demo.js'/>"></script>

</body>
</html>
