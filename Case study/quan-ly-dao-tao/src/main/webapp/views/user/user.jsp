<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %><%--
  Created by IntelliJ IDEA.
  User: Hiếu Nguyễn
  Date: 10/12/2022
  Time: 2:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>

<html>
<head>
    <title>Giáo viên</title>
</head>
<body>
<div class="container-fluid px-4">
    <form action="/user-teacher" id="formSubmit" method="post">

        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><i class="fa-solid fa-house-chimney"></i> Trang chủ</li>
            <li class="breadcrumb-item active">Giáo viên</li>
        </ol>

        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                <span style="font-size: large">Thông tin</span>
            </div>


            <div class="card-body">
                <div class="dataTable-top">

                </div>
                <div class="table-responsive">

                    <table class="table table-bordered table-hover" id="mytb">
                        <thead>
                        <tr style="background-color: #c49a68">
                            <th class="slected" >ID</th>
                            <th class="slected" >Ảnh đại diện</th>
                            <th class="slected" >Họ và tên</th>
                            <th class="slected" >Giới tính</th>
                            <th class="slected" >Ngày sinh</th>
                            <th class="slected" >Tên đăng nhập</th>
                            <th class="slected" >Mật khẩu</th>
                            <th>Thao tác</th>
                        </tr>

                        </thead>
                        <tbody>
                            <tr>
                                <td><c:out value="${USERMODEL.id}"/></td>
                                <td>
                                    <div class="containerImage">
                                    <img src="${USERMODEL.getImage()}" alt="avarta" class="imgavar">
                                    </div>

                                </td>
                                <td><c:out value="${USERMODEL.fullName}"/></td>
                                <c:if test="${USERMODEL.gender == 1}">
                                    <td><c:out value="Nam"/></td>
                                </c:if>
                                <c:if test="${USERMODEL.gender == 0}">
                                    <td><c:out value="Nữ"/></td>
                                </c:if>
                                <td><c:out value="${USERMODEL.birthday}"/></td>
                                <td><c:out value="${USERMODEL.userName}"/></td>
                                <td><c:out value="${USERMODEL.password}"/></td>

                                <td>
                                    <a class="btn btn-secondary zoom" data-toggle="tooltip" data-placement="top" id="btnEdit"
                                       title="Chỉnh sửa" href='/user-teacher?action=edit&id=${USERMODEL.id}' style="background-color: #198754">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </a>
                                </td>
                            </tr>


                        </tbody>
                    </table>
                    <div class="text-nowrap">

                    </div>

                    <input type="hidden" value="information" id="action" name="action"/>


                </div>
            </div>
        </div>

    </form>
    <c:if test="${message != null}">
        <script type="text/javascript">
            window.onload = () => {
                showToast();
            }
        </script>
    </c:if>
</div>
<%--   toast thông báo--%>
<div class="toast" id="myToast" style="position: absolute; top: 10px;right: 10px;">
    <div class="toast-header">
        <strong class="me-auto"><i class="fa-solid fa-bell" style="color:rgb(7, 147, 7);"></i> Thông báo!</strong>
        <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
    <div class="toast-body">
        Cập nhật thông tin thành công
    </div>
</div>

<script>
    function showToast() {
        $("#myToast").toast("show");
    }
</script>

</body>
</html>
