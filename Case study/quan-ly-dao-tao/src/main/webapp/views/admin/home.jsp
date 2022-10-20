<%--
  Created by IntelliJ IDEA.
  User: Hiếu Nguyễn
  Date: 10/8/2022
  Time: 9:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp"%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Trang chủ</title>
</head>
<body>
    <main>
        <div class="container-fluid px-4">
            <h1 class="mt-4">TRƯỜNG THPT CODE</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item active">Vững bước tri thức</li>
            </ol>
            <div class="row">
                <div class="col-xl-3 col-md-6">
                    <div class="card bg-primary text-white mb-4">
                        <div class="card-body">Lịch công tác</div>
                        <div class="card-footer d-flex align-items-center justify-content-between">
                            <a class="small text-white stretched-link" href="#">Chi tiết</a>
                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card bg-warning text-white mb-4">
                        <div class="card-body">Việc cần làm</div>
                        <div class="card-footer d-flex align-items-center justify-content-between">
                            <a class="small text-white stretched-link" href="#">Chi tiết</a>
                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card bg-success text-white mb-4">
                        <div class="card-body">Hồ sơ</div>
                        <div class="card-footer d-flex align-items-center justify-content-between">
                            <a class="small text-white stretched-link" href="#">Chi tiết</a>
                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card bg-danger text-white mb-4">
                        <div class="card-body">Khẩn cấp</div>
                        <div class="card-footer d-flex align-items-center justify-content-between">
                            <a class="small text-white stretched-link" href="#">Chi tiết</a>
                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-6">
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-chart-area me-1"></i>
                            BIỂU ĐỒ KẾT QUẢ HỌC TẬP
                        </div>
                        <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                    </div>
                </div>
                <div class="col-xl-6">
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-chart-bar me-1"></i>
                            BIỂU ĐỒ CHUYÊN CẦN
                        </div>
                        <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                    </div>
                </div>
            </div>
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-table me-1"></i>
                    HỌC SINH TIÊU BIỂU
                </div>
                <div class="card-body">
                    <table id="datatablesSimple">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>TÊN</th>
                            <th>LỚP</th>
                            <th>THÀNH TÍCH</th>
                            <th>NGÀY SINH</th>
                            <th>HỌC BỔNG</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>ID</th>
                            <th>TÊN</th>
                            <th>THÀNH TÍCH</th>
                            <th>LỚP</th>
                            <th>NGÀY SINH</th>
                            <th>HỌC BỔNG</th>
                        </tr>
                        </tfoot>
                        <tbody>
                        <tr>
                            <td>1</td>
                            <td>Nguyễn Hữu Hi</td>
                            <td>Giải nhất</td>
                            <td>10A</td>
                            <td>2011/04/25</td>
                            <td>$320,800</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Đỗ Văn Tèo Eo</td>
                            <td>Gỉai nhì tỉnh</td>
                            <td>11B</td>
                            <td>2011/07/25</td>
                            <td>$170,750</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>Lân Văn Đân</td>
                            <td>Huy chương vàng</td>
                            <td>12D</td>
                            <td>2009/01/12</td>
                            <td>$86,000</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>Nguyễn Minh</td>
                            <td>Huy Chương Bạc</td>
                            <td>11C</td>
                            <td>2012/03/29</td>
                            <td>$433,060</td>
                        </tr>


                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
