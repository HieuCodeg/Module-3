<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Hiếu Nguyễn
  Date: 10/10/2022
  Time: 2:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng nhập</title>
</head>
<body>
<nav class="navbar navbar-fixed-top">
    <div class="container-fluid">
        <a class="navbar-branch" href="#">
            <img src="<c:url value="/template/login/logolg.png"/>" height="50" alt="Logo">
        </a>
    </div>
    <div class="headtext">
        <p id="bogd">BỘ GIÁO DỤC VÀ ĐÀO TẠO</p>
        <p id="csdl">CƠ SỞ DỮ LIỆU NGÀNH GIÁO DỤC VÀ ĐÀO TẠO</p>
    </div>
</nav>

<form class="form-signin" method="post" action="/dang-nhap?action=login">
    <img class="mb-4" src="<c:url value="/template/login/login.png"/>" alt="" width="72" height="72">
    <h1 class="h3 mb-3 font-weight-normal">Đăng nhập hệ thống</h1>
    <c:if test="${not empty message}">
        <div class="alert alert-${alert}">
                ${message}
        </div>
    </c:if>
    <input type="text" id="inputUserName" class="form-control" placeholder="Tên đăng nhập" required autofocus name="username">
    <input type="password" id="inputPassword" class="form-control" placeholder="Mật khẩu" required name="password">
    <div class="checkbox mb-3">
        <label>
            <input type="checkbox" value="remember-me"> Lưu mật khẩu
        </label>
    </div>
    <button class="btn btn-lg btn-primary btn-block" type="submit">Đăng nhập</button>
    <p class="mt-5 mb-3 text-muted">&copy; writeln by NMH</p>
</form>

<div class = "footer">

    <div class = "footerText">Raising the bar</div>
    <div class = "footerText">Email: thptcode@gmail.com</div>
</div>
</body>
</html>
