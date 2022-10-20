<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Tables - SB Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet"/>
    <link href="/template/css/styles.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
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
                   aria-describedby="btnNavbarSearch"/>
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
                    <hr class="dropdown-divider"/>
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

                <form method="post" action="/home?action=create">


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
                                <label for="inputId" class="col-sm-2 col-form-label">ID</label>
                                <div class="col-sm-10">
                                    <input type="number" class="form-control" id="inputId" name="id"
                                           value="${product.getId()}"
                                           readonly>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputName" class="col-sm-2 col-form-label">Name</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputName" name="name"
                                           value="${product.getName()}">
                                    <c:if test="${errors.get('name') != null}">
                                        <span style="color: red;font-style: italic; ">${errors.get('name')}</span>
                                    </c:if>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputPrice" class="col-sm-2 col-form-label">Price</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputPrice" name="price"
                                           value="${product.getPrice()}">
                                    <c:if test="${errors.get('price') != null}">
                                        <span style="color: red;font-style: italic; ">${errors.get('price')}</span>
                                    </c:if>
                                </div>
                            </div>
                                <div class="form-group row">
                                    <label for="inputQuantity" class="col-sm-2 col-form-label">Quantity</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="inputQuantity" name="quantity"
                                               value="${product.getQuantity()}">
                                        <c:if test="${errors.get('quantity') != null}">
                                            <span style="color: red;font-style: italic; ">${errors.get('quantity')}</span>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="inputColor" class="col-sm-2 col-form-label">color</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="inputColor" name="color"
                                               value="${product.getColor()}">
                                        <c:if test="${errors.get('color') != null}">
                                            <span style="color: red;font-style: italic; ">${errors.getColor('color')}</span>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="inputDescription" class="col-sm-2 col-form-label">Description</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="inputDescription" name="description"
                                               value="${product.getDescription()}">
                                        <c:if test="${errors.get('description') != null}">
                                            <span style="color: red;font-style: italic; ">${errors.get('description')}</span>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="inputCategory" class="col-sm-2 col-form-label">Category</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="inputCategory" name="category"
                                               value="${product.getCategory()}">
                                        <c:if test="${errors.get('category') != null}">
                                            <span style="color: red;font-style: italic; ">${errors.get('category')}</span>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-10 btn-holder">

                                            <button type="submit" class="btne btn-2 hover-slide-down" onclick="document.getElementById('id01').style.display='block'"> <span>Cập nhật</span></button>


                                    </div>
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
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="/template/js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="/template/js/datatables-simple-demo.js"></script>

</body>

</html>