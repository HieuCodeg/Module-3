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
    <title>Trang chủ</title>
</head>
<body>
<!-- Heading Row-->
<div class="row gx-4 gx-lg-5 align-items-center my-5">
    <div class="col-lg-7 ">
        <div class="home-slider owl-carousel " style="height:300px">
            <div class="slider-item " style="height:300px; background-image:url(https://farm8.staticflickr.com/7125/7608164378_d9cf71e375_b.jpg);">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row no-gutters slider-text align-items-center justify-content-center">
                        <div class="col-md-12 ftco-animate">
                            <div class="text w-100 text-center " style="height:300px">
                                <h2>Best Place to Travel</h2>
                                <h1 class="mb-3" style="font-size: xx-large">STUDY HARD</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="slider-item " style="height:300px;background-image:url(https://img.meta.com.vn/Data/image/2022/01/13/anh-dep-thien-nhien-3.jpg);">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row no-gutters slider-text align-items-center justify-content-center">
                        <div class="col-md-12 ftco-animate">
                            <div class="text w-100 text-center" style="height:300px">
                                <h2>Điểm đến lý tưởng</h2>
                                <h1 class="mb-3" style="font-size: xx-large">THPT CODE CODE</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="slider-item " style="height:300px;background-image:url(https://cdn3.ivivu.com/2022/10/truong-quoc-hoc-hue-ivivu-5.jpg);">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row no-gutters slider-text align-items-center justify-content-center">
                        <div class="col-md-12 ftco-animate">
                            <div class="text w-100 text-center" style="height:300px">
                                <h2>Trường học uy tín trong top 5</h2>
                                <h1 class="mb-3" style="font-size: xx-large">Việt Nam</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-5">
        <h1 class="font-weight-light">TRƯỜNG THPT CODE</h1>
        <p>Công nghệ Thông tin là một ngành lớn và quan trọng của Việt Nam, nhưng sự thiếu hụt nhân lực cả về số lượng và chất lượng luôn là một rào cản để phát triển...</p>
        <a class="btn btn-primary" href="#!">Đăng ký ngay!</a>
    </div>
</div>
<!-- Call to Action-->
<div class="card my-5 py-4 text-center" style="background-color: #ce5833">
    <div class="card-body" style="font-size: large"><p class="text-white m-0" >"Tất cả những sự khó khăn thường là để chuẩn bị cho những người bình thường một số phận phi thường!"</p></div>
</div>
<!-- Content Row-->
<div class="row gx-4 gx-lg-5">
    <div class="col-md-4 mb-5">
        <div class="card h-100">
            <div class="card-body">
                <h2 class="card-title text-center">HỌC SINH</h2>
                <p class="card-text">Chương trình được thiết kế dành cho người không biết gì về ngành CNTT và Lập trình, bắt đầu với những việc nhỏ nhất như gõ bàn phím, cài đặt phần mềm, tìm kiếm thông tin.</p>
            </div>
            <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">Xem thêm</a></div>
        </div>
    </div>
    <div class="col-md-4 mb-5">
        <div class="card h-100">
            <div class="card-body">
                <h2 class="card-title text-center">GIÁO VIÊN</h2>
                <p class="card-text">Thấu hiểu được tình trạng đó, các nhà sáng lập của CodeGym – vốn xuất thân là các lập trình viên nhiều năm kinh nghiệm, giảng viên, chủ doanh nghiệp phần mềm có tâm huyết</p>
            </div>
            <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">Xem thêm</a></div>
        </div>
    </div>
    <div class="col-md-4 mb-5">
        <div class="card h-100">
            <div class="card-body">
                <h2 class="card-title text-center">ĐIỂM</h2>
                <p class="card-text">Coding Bootcamp là một mô hình đào tạo lập trình hiệu quả cao giúp học viên nhanh chóng trưởng thành và đạt được trình độ sẵn sàng tham gia ngay vào thị trường việc làm.</p>
            </div>
            <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">Xem thêm</a></div>
        </div>
    </div>
</div>
</body>
</html>
