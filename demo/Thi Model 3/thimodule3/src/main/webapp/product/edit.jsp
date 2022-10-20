<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Tables - SB Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="/template/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <!-- Navbar Brand-->
    <a class="navbar-brand ps-3" href="index.html">Start Bootstrap</a>
    <!-- Sidebar Toggle-->
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
            class="fas fa-bars"></i></button>
    <!-- Navbar Search-->
    <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
        <div class="input-group">
            <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..."
                   aria-describedby="btnNavbarSearch" />
            <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i
                    class="fas fa-search"></i></button>
        </div>
    </form>
    <!-- Navbar-->
    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"
               aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="#!">Settings</a></li>
                <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                <li>
                    <hr class="dropdown-divider" />
                </li>
                <li><a class="dropdown-item" href="#!">Logout</a></li>
            </ul>
        </li>
    </ul>
</nav>
<div id="layoutSidenav">
    <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
            <div class="sb-sidenav-menu">
                <div class="nav">
                    <div class="sb-sidenav-menu-heading">Core</div>
                    <a class="nav-link" href="index.html">
                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                        Dashboard
                    </a>
                    <div class="sb-sidenav-menu-heading">Interface</div>
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                       data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                        <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                        Layouts
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne"
                         data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link" href="layout-static.html">Static Navigation</a>
                            <a class="nav-link" href="layout-sidenav-light.html">Light Sidenav</a>
                        </nav>
                    </div>
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages"
                       aria-expanded="false" aria-controls="collapsePages">
                        <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                        Pages
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapsePages" aria-labelledby="headingTwo"
                         data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                               data-bs-target="#pagesCollapseAuth" aria-expanded="false"
                               aria-controls="pagesCollapseAuth">
                                Authentication
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne"
                                 data-bs-parent="#sidenavAccordionPages">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="login.html">Login</a>
                                    <a class="nav-link" href="register.html">Register</a>
                                    <a class="nav-link" href="password.html">Forgot Password</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                               data-bs-target="#pagesCollapseError" aria-expanded="false"
                               aria-controls="pagesCollapseError">
                                Error
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne"
                                 data-bs-parent="#sidenavAccordionPages">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="401.html">401 Page</a>
                                    <a class="nav-link" href="404.html">404 Page</a>
                                    <a class="nav-link" href="500.html">500 Page</a>
                                </nav>
                            </div>
                        </nav>
                    </div>
                    <div class="sb-sidenav-menu-heading">Addons</div>
                    <a class="nav-link" href="charts.html">
                        <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                        Charts
                    </a>
                    <a class="nav-link" href="tables.html">
                        <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                        Tables
                    </a>
                </div>
            </div>
            <div class="sb-sidenav-footer">
                <div class="small">Logged in as:</div>
                Start Bootstrap
            </div>
        </nav>
    </div>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">

                <form method="post" action="/admin-home?action=edit">


                        <div class="card mb-4">

                                <div class="card-header">
                                    <i class="fa-solid fa-pen-to-square fa-2xl"></i>
                                    Chỉnh sửa thông tin
                                </div>


                            <div class="card-body">

<%--                                <c:if test="${errors.get('format') != null}">--%>
<%--                                    <div class="alert alert-danger">${errors.get('format')}</div>--%>
<%--                                </c:if>--%>
                                <div class="form-group row">
                                    <label for="inputId" class="col-sm-2 col-form-label" >ID</label>
                                    <div class="col-sm-10">
                                        <input type="number" class="form-control" id="inputId" name="id" value="${studentModel.getId()}"
                                               readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="inputName" class="col-sm-2 col-form-label">Họ và tên</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="inputName" name="name" value="${studentModel.getName()}">
                                        <c:if test="${errors.get('name') != null}">
                                            <span style="color: red;font-style: italic; ">${errors.get('name')}</span>
                                        </c:if>
                                    </div>
                                </div>
                                <fieldset class="form-group">
                                    <div class="row">
                                        <legend class="col-form-label col-sm-2 pt-0">Giới tính</legend>
                                        <div class="col-sm-10">
                                            <c:choose>
                                                <c:when test="${studentModel.getGender() == 1}">
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
                                                   value="${studentModel.getBirthday()}" type="text"/>
                                        </div>
                                        <c:if test="${errors.get('birthday') != null}">
                                            <span style="color: red;font-style: italic; ">${errors.get('birthday')}</span>
                                        </c:if>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="inputPhone" class="col-sm-2 col-form-label">Điện thoại</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="inputPhone" name="phoneNumber"
                                               value="${studentModel.getPhoneNumber()}">
                                        <c:if test="${errors.get('phoneNumber') != null}">
                                            <span style="color: red;font-style: italic; ">${errors.get('phoneNumber')}</span>
                                        </c:if>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="inputEmail" name="email"
                                               value="${studentModel.getEmail()}">
                                        <c:if test="${errors.get('email') != null}">
                                            <span style="color: red;font-style: italic; ">${errors.get('email')}</span>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-2">Lớp</div>
                                    <div class="col-sm-10">

                                        <select id="inputClass" class="dataTable-selector" name="grade">
                                            <c:forEach items="${applicationScope.listGrade}" var="item">
                                                <c:choose>
                                                    <c:when test="${item.getId() == studentModel.getIdGrade()}">
                                                        <option selected value="${item.getId()}">${item.getGrade()}</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="${item.getId()}">${item.getGrade()}</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </select>
                                        <c:if test="${errors.get('grade') != null}">
                                            <span style="color: red;font-style: italic; ">${errors.get('grade')}</span>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-10 btn-holder">
                                        <c:if test="${studentModel.getId() != null}">
                                            <button type="button" class="btne btn-2 hover-slide-down" onclick="document.getElementById('id01').style.display='block'"> <span>Cập nhật</span></button>
                                        </c:if>
                                        <c:if test="${studentModel.getId() == null}">
                                            <button type="button" class="btne btn-2 hover-slide-down" onclick="document.getElementById('id01').style.display='block'"><span>Lưu thông tin</span></button>
                                        </c:if>

                                    </div>
                                </div>
                            </div>

                        </div>
                        <%-- model xac nhan--%>
                        <div id="id01" class="modal">
                            <div class="containerCon">
                                <c:if test="${studentModel.getId() != null}">
                                    <h1>Lưu thay đổi</h1>
                                    <p>Bạn có chắc chắn sửa đổi?</p>
                                </c:if>
                                <c:if test="${studentModel.getId() == null}">
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
        </main>
        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Copyright &copy; Your Website 2022</div>
                    <div>
                        <a href="#">Privacy Policy</a>
                        &middot;
                        <a href="#">Terms &amp; Conditions</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="/template/js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="/template/js/datatables-simple-demo.js"></script>
</body>

</html>