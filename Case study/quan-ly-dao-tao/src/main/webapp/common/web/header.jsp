<%--
  Created by IntelliJ IDEA.
  User: Hiếu Nguyễn
  Date: 10/9/2022
  Time: 2:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- Responsive navbar-->
<nav class="navbar navbar-expand-lg navbar-dark " style="background-color: #28298a">
    <div class="container-fluid px-5">
        <a class="navbar-brand" href="#!">QUẢN LÝ GIÁO DỤC</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Trang chủ</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">Thông tin</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">Liên hệ</a></li>
                <c:if test="${not empty USERMODEL}">
                    <li class="nav-item">
                        <a class="nav-link" href='#'>Xin chào, ${USERMODEL.fullName}</a>
                    </li>
                    <img  class="rounded-circle" style="height: 50px" src="${USERMODEL.getImage()}">
                    <li class="nav-item">
                        <a class="nav-link" href='<c:url value="/thoat?action=logout"/>'>Đăng xuất</a>
                    </li>
                </c:if>
                <c:if test="${empty USERMODEL}">
                    <li class="nav-item">
                        <a class="nav-link" href='<c:url value="/dang-nhap?action=login"/>'>Đăng nhập</a>
                    </li>
                </c:if>
            </ul>

        </div>

    </div>
</nav>
