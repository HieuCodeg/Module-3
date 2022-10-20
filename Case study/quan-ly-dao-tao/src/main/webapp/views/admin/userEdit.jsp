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
    <c:if test="${userModel.getId() != null}">
        <form method="post" action="/admin-user?action=edit">
    </c:if>
    <c:if test="${userModel.getId() == null}">
        <form method="post" action="/admin-user?action=insert">
    </c:if>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><i class="fa-solid fa-house-chimney"></i> Trang chủ</li>
            <li class="breadcrumb-item active">Giáo viên</li>
            <c:if test="${userModel.getId() != null}">
                <li class="breadcrumb-item active">  Chỉnh sửa</li>
            </c:if>
            <c:if test="${userModel.getId() == null}">
                <li class="breadcrumb-item active">  Thêm mới</li>
            </c:if>
        </ol>

        <div class="card mb-4">
            <c:if test="${userModel.getId() != null}">
                <div class="card-header">
                    <i class="fa-solid fa-pen-to-square fa-2xl"></i>
                    Chỉnh sửa thông tin
                </div>
            </c:if>
            <c:if test="${userModel.getId() == null}">
                <div class="card-header">
                    <i class="fa-solid fa-address-card fa-2xl"></i>
                    Thêm mới giáo viên
                </div>
            </c:if>

            <div class="row">
                <div class="containerAvar col-md-3 ">
                    <img src="${userModel.getImage()}" alt="avarta" class="imgavar img-thumbnail"
                         id="avatar" onerror="javascript:this.src='/template/admin/avatar.png';errImage()">

                </div>

                <div class="card-body col-md-9">

                    <c:if test="${errors.get('format') != null}">
                        <div class="alert alert-danger">${errors.get('format')}</div>
                    </c:if>
                    <div class="form-group row">
                        <label for="inputId" class="col-sm-2 col-form-label" >ID</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="inputId" name="id" value="${userModel.getId()}"
                                   readonly>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="myImg" class="col-sm-2 col-form-label" >Ảnh đại diện</label>
                        <div class="col-sm-10">
                            <input type="text" id="myImg" onchange="load()" class="form-control" value="${userModel.getImage()}" name="avatar">
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
                            <input type="text" class="form-control" id="inputName" name="fullName" value="${userModel.getFullName()}">
                            <c:if test="${errors.get('fullName') != null}">
                                <span style="color: red;font-style: italic; ">${errors.get('fullName')}</span>
                            </c:if>
                        </div>
                    </div>

                    <c:if test="${USERMODEL.getId() == userModel.getId() || userModel.getId() == null}">
                        <div class="form-group row">
                            <label for="inputUserName" class="col-sm-2 col-form-label">Tên đăng nhập</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputUserName" name="userName" value="${userModel.getUserName()}">
                                <c:if test="${errors.get('userName') != null}">
                                    <span style="color: red;font-style: italic; ">${errors.get('userName')}</span>
                                </c:if>
                            </div>
                        </div>
                    </c:if>

                    <c:if test="${USERMODEL.getId() == userModel.getId() || userModel.getId() == null}">
                        <div class="form-group row">
                            <label for="inputPassword" class="col-sm-2 col-form-label">Mật khẩu</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="inputPassword" name="password" value="${userModel.getPassword()}">
                                <c:if test="${errors.get('password') != null}">
                                    <span style="color: red;font-style: italic; ">${errors.get('password')}</span>
                                </c:if>
                            </div>
                        </div>
                    </c:if>

                    <fieldset class="form-group">
                        <div class="row">
                            <legend class="col-form-label col-sm-2 pt-0">Giới tính</legend>
                            <div class="col-sm-10">
                                <c:choose>
                                    <c:when test="${userModel.getGender() == 1}">
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
                        <label class="control-label col-sm-2 requiredField" for="date" >Ngày sinh <i
                                class="fa fa-calendar"></i></label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <input class="form-control" id="date" name="birthday"
                                       value="${userModel.getBirthday()}" type="text"/>
                            </div>
                            <c:if test="${errors.get('birthday') != null}">
                                <span style="color: red;font-style: italic; ">${errors.get('birthday')}</span>
                            </c:if>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-2">Quyền truy cập</div>
                        <div class="col-sm-10">
                            <select id="inputRole" class="dataTable-selector" name="role">
                                <c:forEach items="${applicationScope.listRole}" var="item">
                                    <c:choose>
                                        <c:when test="${item.getId() == userModel.getRoleId()}">
                                            <option selected value="${item.getId()}">${item.getName()}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${item.getId()}">${item.getName()}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                            <c:if test="${errors.get('role') != null}">
                                <span style="color: red;font-style: italic; ">${errors.get('role')}</span>
                            </c:if>
                        </div>
                    </div>


                    <div class="form-group row">
                        <div class="col-sm-2">Môn dạy</div>
                        <div class="col-sm-10">
                            <select id="inputSubject" class="dataTable-selector" name="subject">
                                <c:forEach items="${applicationScope.listSubject}" var="item">
                                    <c:choose>
                                        <c:when test="${item.getId() == userModel.getIdSubject()}">
                                            <option selected value="${item.getId()}">${item.getSubject()}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${item.getId()}">${item.getSubject()}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                            <c:if test="${errors.get('subject') != null}">
                                <span style="color: red;font-style: italic; ">${errors.get('subject')}</span>
                            </c:if>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-2">Lớp dạy</div>
                        <div class="col-sm-10">
<%--                            <c:forEach items="${applicationScope.listTeacherClass}" var="item">--%>
<%--                                <c:if test="${item.getIdTeacher() == userModel.getId()}">--%>
<%--                                    <c:forEach items="${applicationScope.listGrade}" var="gradeModel">--%>
<%--                                        <c:choose>--%>
<%--                                            <c:when test="${gradeModel.getId() == item.getIdClass() }">--%>
<%--                                                <div class="form-check form-check-inline">--%>
<%--                                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox1"  name="teacherClass" value="${gradeModel.getId()}" checked>--%>
<%--                                                    <label class="form-check-label" for="inlineCheckbox1">--%>
<%--                                                        <c:out value="${gradeModel.getGrade()}"/>--%>
<%--                                                    </label>--%>
<%--                                                </div>--%>
<%--                                            </c:when>--%>
<%--                                            <c:otherwise>--%>
<%--                                                <div class="form-check form-check-inline">--%>
<%--                                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox2"  name="teacherClass" value="${gradeModel.getId()}">--%>
<%--                                                    <label class="form-check-label" for="inlineCheckbox2">--%>
<%--                                                        <c:out value="${gradeModel.getGrade()}"/>--%>
<%--                                                    </label>--%>
<%--                                                </div>--%>
<%--                                            </c:otherwise>--%>
<%--                                        </c:choose>--%>
<%--                                    </c:forEach>--%>
<%--                                </c:if>--%>
<%--                            </c:forEach>--%>

<%--                                    <c:forEach items="${applicationScope.listIdClassTeach}" var="item">--%>
<%--                                        <c:forEach var = "i" begin = "0" end = "${applicationScope.listGrade.size()}">--%>
<%--                                    <c:choose>--%>
<%--                                            <c:when test="${applicationScope.listGrade.get(i) != null}">--%>
<%--                                                <c:if test="${applicationScope.listGrade.get(i).getId() == item}">--%>
<%--                                                    <div class="form-check form-check-inline col-sm-2">--%>
<%--                                                         <input class="form-check-input" type="checkbox"  name="teacherClass" style="width: 30px; height: 30px" value="${gradeModel.getId()}" checked>--%>
<%--                                                        <label class="form-check-label" >--%>
<%--                                                        <c:out value="${gradeModel.getGrade()}"/>--%>
<%--                                                        </label>--%>
<%--                                                     </div>--%>
<%--                                                </c:if>--%>
<%--                                            </c:when>--%>

<%--                                        <c:otherwise>--%>
<%--                                            <input class="form-check-input" type="checkbox"  name="teacherClass" style="width: 30px; height: 30px" value="${gradeModel.getId()}">--%>
<%--                                            <label class="form-check-label" >--%>
<%--                                                <c:out value="${gradeModel.getGrade()}"/>--%>
<%--                                            </label>--%>
<%--                                        </c:otherwise>--%>
<%--                                    </c:choose>--%>
<%--                                        </c:forEach>--%>
<%--                                    --%>
<%--                                </c:forEach>--%>

                    <c:forEach items="${applicationScope.listGrade}" var="gradeModel">
                        <div class="form-check form-check-inline col-sm-2">
                            <input class="form-check-input" type="checkbox"  name="teacherClass" style="width: 30px; height: 30px" value="${gradeModel.getId()}"
                                <c:forEach items="${requestScope.listIdClassTeach}" var="item">
                                    <c:if test="${gradeModel.getId() == item}">checked</c:if>
                                </c:forEach>
                            >
                            <label class="form-check-label" >
                                <c:out value="${gradeModel.getGrade()}"/>
                            </label>
                        </div>
                    </c:forEach>


                            <c:if test="${errors.get('teacherClass') != null}">
                                <span style="color: red;font-style: italic; ">${errors.get('teacherClass')}</span>
                            </c:if>
                        </div>
                    </div>


                    <div class="form-group row">
                        <div class="col-sm-10 btn-holder">
                            <c:if test="${userModel.getId() != null}">
                                <button type="button" class="btne btn-2 hover-slide-down" onclick="document.getElementById('id01').style.display='block'"> <span>Cập nhật</span></button>
                            </c:if>
                            <c:if test="${userModel.getId() == null}">
                                <button type="button" class="btne btn-2 hover-slide-down" onclick="document.getElementById('id01').style.display='block'"><span>Lưu thông tin</span></button>
                            </c:if>

                        </div>
                    </div>
                </div>
            </div>

        </div>
<%-- model xac nhan--%>
        <div id="id01" class="modal">
            <div class="containerCon">
                <c:if test="${userModel.getId() != null}">
                    <h1>Lưu thay đổi</h1>
                    <p>Bạn có chắc chắn sửa đổi?</p>
                </c:if>
                <c:if test="${userModel.getId() == null}">
                    <h1>Lưu thông tin</h1>
                    <p>Bạn có chắc chắn muốn lưu thông tin?</p>
                </c:if>
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

//    model xac nhận thay đổi
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
