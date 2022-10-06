<%--
  Created by IntelliJ IDEA.
  User: Hiếu Nguyễn
  Date: 10/5/2022
  Time: 10:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Product List</title>
</head>
<body>
<h1>Products</h1>
<p>
  <a href="/products">Back to customer list</a>
</p>
<table border="1">
  <tr>
    <td>ID</td>
    <td>Name</td>
    <td>Manufacture</td>
    <td>Price</td>
    <td>Describe</td>
    <td>Edit</td>
    <td>Delete</td>
  </tr>
  <c:forEach items='${requestScope["productList"]}' var="product">
  <tr>
    <td>${product.getId()}</td>
    <td><a href="/products?action=view&id=${product.getId()}">${product.getName()}</a></td>
    <td>${product.getManufacture()}</td>
    <td>${product.getPrice()}</td>
    <td>${product.getDescribe()}</td>
    <td><a href="/products?action=edit&id=${product.getId()}">edit</a></td>
    <td><a href="/products?action=delete&id=${product.getId()}">delete</a></td>
  </tr>
  </c:forEach>
