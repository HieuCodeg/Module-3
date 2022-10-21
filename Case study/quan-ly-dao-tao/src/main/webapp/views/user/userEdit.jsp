<%--
  Created by IntelliJ IDEA.
  User: Hiếu Nguyễn
  Date: 10/14/2022
  Time: 3:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!doctype html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css"/>
    <link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css"/>
    <style>
        .bootstrap-iso .formden_header h2, .bootstrap-iso .formden_header p, .bootstrap-iso form {
            font-family: Arial, Helvetica, sans-serif;
            color: black
        }

        .bootstrap-iso form button, .bootstrap-iso form button:hover {
            color: white !important;
        }
    </style>

    <title>Chỉnh sửa</title>
</head>
<body>
<div class="container-fluid px-4">

    <form method="post" action="/user-teacher?action=edit">

<ol class="breadcrumb mb-4">
    <li class="breadcrumb-item"><i class="fa-solid fa-house-chimney"></i> Trang chủ</li>
    <li class="breadcrumb-item active">Giáo viên</li>

        <li class="breadcrumb-item active">Thông tin</li>
</ol>

<div class="card mb-4">

    <div class="card-header">
        <i class="fa-solid fa-pen-to-square fa-2xl"></i>
        Chỉnh sửa thông tin
    </div>


<div class="row">
<div class="containerAvar col-md-3 ">
    <img src="${USERMODEL.getImage()}" alt="avarta" class="imgavar img-thumbnail"
         id="avatar" onerror="javascript:this.src='/template/admin/avatar.png';errImage()">

</div>

<div class="card-body col-md-9">

<c:if test="${errors.get('format') != null}">
    <div class="alert alert-danger">${errors.get('format')}</div>
</c:if>
<div class="form-group row">
    <label for="inputId" class="col-sm-2 col-form-label">ID</label>
    <div class="col-sm-10">
        <input type="number" class="form-control" id="inputId" name="id" value="${USERMODEL.getId()}"
               readonly>
    </div>
</div>
<div class="form-group row">
    <label for="myImg" class="col-sm-2 col-form-label">Ảnh đại diện</label>
    <div class="col-sm-10">
        <input type="text" id="myImg" onchange="load()" class="form-control" value="${USERMODEL.getImage()}"
               name="avatar">
        <input type="hidden" value="" id="checkImage" name="checkImage"/>
    </div>
</div>
<c:if test="${errors.get('avatar') != null}">
    <div class="alert alert-danger">${errors.get('avatar')}</div>
</c:if>
<div><p style="color: red; font-style: italic" id="avatarInput"></p></div>
<div class="form-group row">
    <label for="inputName" class="col-sm-2 col-form-label">Họ và tên</label>
    <div class="col-sm-10">
        <input type="text" class="form-control" id="inputName" name="fullName" value="${USERMODEL.getFullName()}">
        <c:if test="${errors.get('fullName') != null}">
            <span style="color: red;font-style: italic; ">${errors.get('fullName')}</span>
        </c:if>
    </div>
</div>


    <div class="form-group row">
        <label for="inputUserName" class="col-sm-2 col-form-label">Tên đăng nhập</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="inputUserName" name="userName"
                   value="${USERMODEL.getUserName()}">
            <c:if test="${errors.get('userName') != null}">
                <span style="color: red;font-style: italic; ">${errors.get('userName')}</span>
            </c:if>
        </div>
    </div>

    <div class="form-group row">
        <label for="inputPassword" class="col-sm-2 col-form-label">Mật khẩu</label>
        <div class="col-sm-10">
            <input type="password" class="form-control" id="inputPassword" name="password"
                   value="${USERMODEL.getPassword()}">
            <c:if test="${errors.get('password') != null}">
                <span style="color: red;font-style: italic; ">${errors.get('password')}</span>
            </c:if>
        </div>
    </div>


<fieldset class="form-group">
    <div class="row">
        <legend class="col-form-label col-sm-2 pt-0">Giới tính</legend>
        <div class="col-sm-10">
            <c:choose>
                <c:when test="${USERMODEL.getGender() == 1}">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" id="gridRadios1"
                               value="1" checked>
                        <label class="form-check-label" for="gridRadios1">Nam</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" id="gridRadios2"
                               value="0">
                        <label class="form-check-label" for="gridRadios2">Nữ</label>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" id="gridRadios3"
                               value="1">
                        <label class="form-check-label" for="gridRadios3">Nam</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" id="gridRadios4"
                               value="0" checked>
                        <label class="form-check-label" for="gridRadios4">Nữ</label>
                    </div>
                </c:otherwise>
            </c:choose>
            <c:if test="${errors.get('gender') != null}">
                <span style="color: red;font-style: italic; ">${errors.get('gender')}</span>
            </c:if>

        </div>
    </div>
</fieldset>

<div class="form-group row">
    <label class="control-label col-sm-2 requiredField" for="date">Ngày sinh <i
            class="fa fa-calendar"></i></label>
    <div class="col-sm-10">
        <div class="input-group">
            <input class="form-control" id="date" name="birthday"
                   value="${USERMODEL.getBirthday()}" type="text"/>
        </div>
        <c:if test="${errors.get('birthday') != null}">
            <span style="color: red;font-style: italic; ">${errors.get('birthday')}</span>
        </c:if>
    </div>
</div>


            <div class="form-group row">
            <div class="col-sm-10 btn-holder">

                <button type="button" class="btne btn-2 hover-slide-down"
                        onclick="document.getElementById('id01').style.display='block'"><span>Cập nhật</span></button>


            </div>
            </div>
            </div>
            </div>

            </div>
            <%-- model xac nhan--%>
            <div id="id01" class="modal">
            <div class="containerCon">
                <h1>Lưu thay đổi</h1>
                <p>Bạn có chắc chắn sửa đổi?</p>

            <div class="clearfix">
            <button type="button" onclick="document.getElementById('id01').style.display='none'"
            class="cancelbtn btnModel">Hủy bỏ</button>
            <button type="submit" onclick="document.getElementById('id01').style.display='none'"
            class="confirmbtn btnModel">Chấp nhận</button>
            </div>
            </div>
            </div>

            </form>

            </div>

            <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
            <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
            <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

            <script>
            $(document).ready(function () {
            var date_input = $('input[name="birthday"]'); //our date input has the name "date"
            var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
            date_input.datepicker({
            format: 'yyyy-mm-dd',
            container: container,
            todayHighlight: true,
            autoclose: true,
            })
            })

            // model xac nhận thay đổi
            // Get the modal
            var modal = document.getElementById('id01');

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
            if (event.target == modal) {
            modal.style.display = "none";
            }
            }
            function load() {
            let url = document.querySelector("#myImg").value;
            let image = document.querySelector("#avatar");
            image.setAttribute("src", url);
            document.getElementById("avatarInput").innerHTML = "";
            document.getElementById("checkImage").value = "";

            }
            function errImage() {
            document.getElementById("avatarInput").innerHTML = "Vui lòng kiểm tra lại đường dẫn ảnh!";
            document.getElementById("checkImage").value = "/template/admin/avatar.png";
            }


            </script>
            </body>
            </html>
