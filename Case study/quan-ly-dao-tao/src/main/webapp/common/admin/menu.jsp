<%--
  Created by IntelliJ IDEA.
  User: Hiếu Nguyễn
  Date: 10/9/2022
  Time: 2:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <div class="sb-sidenav-menu-heading">DANH MỤC</div>
                <a class="nav-link" href="/admin-home">
                    <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                    Trang chủ
                </a>
                <div class="sb-sidenav-menu-heading">QUẢN LÝ</div>
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                    Học sinh
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link" href="/admin-home?action=infomation">Thông tin</a>
                        <a class="nav-link" href="#">Điểm</a>
                    </nav>
                </div>
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                    <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                    Giáo viên
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">

                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="/admin-user">Thông tin</a>
                                <a class="nav-link" href="#">Giáo án</a>

                            </nav>
                </div>
                <div class="sb-sidenav-menu-heading">Thống kê</div>
                <a class="nav-link" href="#">
                    <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                    Biểu đồ
                </a>
                <a class="nav-link" href="#">
                    <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                    Bảng điểm
                </a>
            </div>
        </div>
        <div class="sb-sidenav-footer">
            <div class="small">Đăng nhập bởi:</div>
           ${USERMODEL.fullName}
        </div>
    </nav>
</div>
