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
    <form action="/admin-user" id="formSubmit" method="post">

        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><i class="fa-solid fa-house-chimney"></i> Trang chủ</li>
            <li class="breadcrumb-item active">Giáo viên</li>
        </ol>

        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                <span style="font-size: large">Danh sách giáo viên toàn trường</span>
                <span>
                <a class="btn btn-secondary float-end zoom" data-toggle="tooltip" data-placement="top" title="Thêm mới" href='/admin-user?action=insert' style="background-color: #1b72cf">
                    <i class="fa-solid fa-user-plus" ></i>
                </a>
                </span>
            </div>


            <div class="card-body">
                <div class="dataTable-top">
                    <div class="dataTable-dropdown"><label>
                        <select id="selector" class="dataTable-selector" name="visiblePage" onchange="loadPage()">
                            <%!
                                List<Integer> list = new ArrayList<>(Arrays.asList(5, 10, 15, 20, 25));
                            %>
                            <c:forEach items="<%= list%>" var="item">
                                <c:choose>
                                    <c:when test="${userModel.visiblePage == item}">
                                        <option selected value="${item}">${item}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${item}">${item}</option>
                                    </c:otherwise>
                                </c:choose>

                            </c:forEach>
                        </select>Mục trên mỗi trang </label></div>

                    <div class="dataTable-search">
                        <input class="dataTable-input" placeholder="Tìm kiếm..." type="text" id="finder"
                               value="${requestScope.finder}" name="finder" onchange="find()">
                    </div>

                </div>
                <div class="table-responsive">

                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr style="background-color: #c49a68">
                            <th class="slected" onclick="sortTable('id')">ID</th>
                            <th class="slected" onclick="sortTable('fullname')">Họ và tên</th>
                            <th class="slected" onclick="sortTable('gender')">Giới tính</th>
                            <th class="slected" onclick="sortTable('birthday')">Ngày sinh</th>
                            <th class="slected" onclick="sortTable('rodeid')">Quyền truy cập</th>
                            <th class="slected" onclick="sortTable('subject')">Môn dạy</th>
                            <th>Thao tác</th>
                        </tr>

                        </thead>
                        <tbody>
                        <c:forEach var="user" items="${userModel.getListResult()}">
                            <tr>
                                <td><c:out value="${user.id}"/></td>
                                <td><c:out value="${user.fullName}"/></td>
                                <c:if test="${user.gender == 1}">
                                    <td><c:out value="Nam"/></td>
                                </c:if>
                                <c:if test="${user.gender == 0}">
                                    <td><c:out value="Nữ"/></td>
                                </c:if>
                                <td><c:out value="${user.birthday}"/></td>
                                <c:forEach items="${applicationScope.listRole}" var="item">
                                    <c:if test="${item.getId() == user.getRoleId()}">
                                        <td><c:out value="${item.getName()}"/></td>
                                    </c:if>
                                </c:forEach>
                                <c:forEach items="${applicationScope.listSubject}" var="item">
                                    <c:if test="${item.getId() == user.getIdSubject()}">
                                        <td><c:out value="${item.getSubject()}"/></td>
                                    </c:if>
                                </c:forEach>
                                <td>
                                    <a class="btn btn-secondary zoom" data-toggle="tooltip" data-placement="top" id="btnEdit"
                                       title="Chỉnh sửa" href='/admin-user?action=edit&id=${user.id}' style="background-color: #198754">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </a>
                                    <a class="btn btn-secondary  zoom" data-toggle="tooltip" data-placement="top"
                                       title="Xóa" style="background-color: #da383c; color: white" onclick="document.getElementById('id01').style.display='block'">
                                        <i class="fa-solid fa-trash-can"></i>
                                    </a>
                                        <%-- model xac nhan--%>
                                    <div id="id01" class="modal">
                                        <div class="containerCon">
                                            <h1>Lưu thay đổi</h1>
                                            <p>Bạn có chắc chắn muốn xóa?</p>
                                            <div class="clearfix">
                                                <button type="button" onclick="document.getElementById('id01').style.display='none'"
                                                        class="cancelbtn btnModel">Hủy bỏ</button>
                                                <a href='/admin-user?action=delete&id=${user.id}'>
                                                    <button type="button" onclick="document.getElementById('id01').style.display='none'"
                                                            class="deletebtn btnModel">Chấp nhận</button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>

                                </td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                    <div class="text-nowrap">
                        Từ ${(userModel.getPage() * userModel.getVisiblePage()) - userModel.getVisiblePage() + 1}
                        đến ${(userModel.getPage() * userModel.getVisiblePage()) > userModel.getTotalItem()? userModel.getTotalItem(): (userModel.getPage() * userModel.getVisiblePage())}
                        trong ${userModel.getTotalItem()} kết quả
                    </div>
                    <ul class="pagination float-end" id="pagination"></ul>
                    <input type="hidden" value="${userModel.page}" id="page" name="page"/>
                    <input type="hidden" value="information" id="action" name="action"/>
                    <input type="hidden" value="${userModel.getSortName()}" id="sortName" name="sortName"/>
                    <input type="hidden" value=" ${userModel.getSortBy()}" id="sortBy" name="sortBy"/>

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
    var totalPages = ${userModel.totalPage};
    var currentPage = ${userModel.page};
    var limit = $("#selector").val();
    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPages,
            visiblePages: limit,
            startPage: currentPage,
            first: 'Đầu',
            prev: 'Trước',
            next: 'Sau',
            last: 'Cuối',
            onPageClick: function (event, page) {
                if (currentPage != page) {
                    $('#visiblePage').val(limit);
                    $('#page').val(page);
                    $('#formSubmit').submit();
                }
            }

        });
    });

    function loadPage() {
        $('#page').val(1);
        $('#formSubmit').submit();
    }

    function sortTable(item) {
        $('#sortName').val(item);
        var sortor = $("#sortBy").val();
        sortor = sortor.trim();

        if (sortor == "desc") {
            $('#sortBy').val('asc');
        } else {
            $('#sortBy').val('desc');
        }
        $('#formSubmit').submit();
    }

    function find(item) {
        $('#formSubmit').submit();
    }

    function showToast() {
        $("#myToast").toast("show");
    }

</script>
</body>
</html>
