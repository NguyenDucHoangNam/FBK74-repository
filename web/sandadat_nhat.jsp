<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset = UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="model.FootballFieldSchedule" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>--%>

<html>
    <head>
        <meta charset="utf-8">
        <title>Sân Bóng FBK74</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>        
        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&family=Rubik:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet">
        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/animate/animate.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--CSS Nhat-->
        <!--        <link rel="stylesheet" href="css/style_nhat.css"/>-->
        <!-- Include jQuery library -->

        <!-- Include jQuery UI library with Datepicker widget -->
        <link rel="stylesheet"
              href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            $(document).ready(function () {
                // Kích hoạt Datepicker với định dạng dd/MM/yyyy
                $("#ngay").datepicker({
                    dateFormat: "dd/mm/yy",
                    changeMonth: true,
                    changeYear: true
                });
            });
        </script>
        <link href="css/style_nhat.css" rel="stylesheet">
    </head>

    <body>
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner"></div>
        </div>
        <!-- Spinner End -->


        <!-- Topbar Start -->

        <!-- Topbar End -->


        <!-- Navbar & Carousel Start -->

        <nav class="navbar navbar-expand-lg px-5 py-3 py-lg-0 bg-dark navbar-dark position-sticky">
            <a href="index.jsp" class="navbar-brand">
                <h1 class="m-0">FBK74</h1>
            </a>

            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto py-0">
                    <a href="index.jsp" class="nav-item nav-link ">Trang Chủ</a>
                    <a href="danhsachtimsan" class="nav-item nav-link active">Tìm Sân</a>

                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Tìm Đối Thủ</a>
                        <div class="dropdown-menu m-0">
                            <a href="blog.html" class="dropdown-item">Đăng ký làm đối thủ</a>
                            <a href="detail.html" class="dropdown-item">Tìm kiếm đối thủ</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Giải Đấu</a>
                        <div class="dropdown-menu m-0">
                            <a href="tournaments" class="dropdown-item">Thông tin các giải đấu</a>
                            <a href="HistoryServlet" class="dropdown-item">Giải đấu đã đăng ký</a>
                        </div>
                    </div>
                    <a href="service.html" class="nav-item nav-link">Khóa Học Bóng Đá</a>
                    <a href="contact.html" class="nav-item nav-link">Liên Hệ</a>
                </div >
                <a href="lichsuhoadon" class="icon-button">
                    <span class="material-icons">history</span>
                </a>
                <!--login-->
                <h1 class="m-4 ">
                    <div class="d-none d-lg-block ">
                        <c:if test="${sessionScope.account==null}">
                            <a href="sign-in.jsp" class="bi-person custom-icon me-3">Login!</a>
                        </c:if>  
                        <c:if test="${sessionScope.account!=null }">
                            <div class="dropdown">
                                <button type="button" id="dropdownMenuButton1" class="btn dropdown-toggle " data-bs-toggle="dropdown" aria-expanded="false"style="color: #06A3DA;
                                        font-size: 20px;">
                                    ${sessionScope.account.name}
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                    <a class="dropdown-item " href="#">Profile</a>
                                    <a class="dropdown-item " href="#">Update</a>
                                    <a class="dropdown-item " href="logout">Logout</a>
                                </div>
                            </div>
                        </c:if> 
                    </div>
                </h1>
                <!--end login-->
            </div>
        </nav>    
        <!-- Navbar & Carousel End -->
        <!--Content start-->        
        <section class="ftco-section min-vh-100">
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mt-5">
                        <h2 class="heading-section">Lịch sử đặt sân</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive-xl">
                            <table class="table table-bordered">
                                <thead class="thead-dark">
                                    <tr class="">
                                        <th class="col-1 text-center">Ngày</th>
                                        <th class="col-2 text-center">Thông tin sân bóng</th>
                                        <th class="col-2 text-center">Tên người đặt</th>
                                        <th class="col-1 text-center">Số điện thoại</th>
                                        <th class="col-2 text-center">Chú thích</th>
                                        <th class="col-2 text-center">Status</th>
                                        <th class="col-1 text-center">&nbsp;</th>
                                        <th class="col-1 text-center">&nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="list" items="${sessionScope.listRFF}">
                                        <tr class="alert" role="alert" data-toggle="collapse" data-target="#details" aria-expanded="false" aria-controls="details">

                                            <td>${list.date}</td>
                                            <td class="details collapsed" >
                                                <div class="text-start">
                                                    <div>Tên sân: ${list.footballFieldSchedule.footballField.name}</div>
                                                    <div>Loại sân: Sân dành cho ${list.footballFieldSchedule.footballField.typeofFootballField} người/ đội</div>
                                                    <div>Thời gian: ${list.footballFieldSchedule.startTime} - ${list.footballFieldSchedule.endTime}</div>
                                                    <div>Giá cả: ${list.footballFieldSchedule.footballField.price} VNĐ</div>
                                                    <div>Tiền cọc: ${list.deposit} VNĐ</div>
                                                </div>
                                            </td>
                                            <td>${list.name}</td>
                                            <td>${list.phoneNumber}</td>
                                            <td class="details collapsed">${list.note}</td>
                                            <c:if test="${list.status == 7}">
                                                <td class="status"><span class="deleted">Từ chối</span></td>
                                            </c:if>
                                            <c:if test="${list.status == 1}">

                                                <td class="status"><span class="active">Đã được duyệt</span></td>
                                            </c:if>
                                            <c:if test="${list.status == 4}">
                                                <td class="status"><span class="deleted">Đã hủy&Chờ hoàn cọc</span></td>
                                            </c:if>
                                            <c:if test="${list.status == 6}">
                                                <td class="status"><span class="deleted">Đã hủy</span></td>
                                            </c:if>
                                            <c:if test="${list.status == 5}">
                                                <td class="status"><span class="deleted">Đã hủy& Hoàn cọc</span></td>
                                            </c:if>
                                            <c:if test="${list.status == 2}">
                                                <td class="status"><span class="waiting">Chờ xét duyệt</span></td>
                                            </c:if>
                                            <c:if test="${list.status == 3}">
                                                <td class="status"><span class="finished">Đã diễn ra</span></td>
                                            </c:if>

                                            <c:if test="${list.status != 1 && list.status != 2}"> 
                                                <td>
                                                    <a href="" class="btn btn-danger" aria-disabled="true" onclick="return false;">Hủy sân</a>
                                                </td>
                                                <td>
                                                    <a href="" class="btn btn-secondary" aria-disabled="true" onclick="return false;">Update</a>
                                                </td>
                                            </c:if>
                                            <c:if test="${list.status == 1 || list.status == 2}">
                                                <td>
                                                    <a href="javascript:void(0);" class="btn btn-danger" onclick="confirmCancel(${list.IDRegisteredFootballField})">Hủy sân</a>
                                                </td>
                                                <td>
                                                    <a href="updatesandadat?IDrff=${list.IDRegisteredFootballField}" class="btn btn-secondary">Update</a>
                                                </td>
                                            </c:if>
                                        </tr> 
                                    </c:forEach>
                                    <!-- Add more rows if needed -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script>
            function confirmCancel(IDrff) {
                if (confirm("Bạn chắc chắn muốn hủy sân? <br/> Chú ý: Nếu bạn hủy sân trước 1 tiếng khi sân bắt đầu thì sẽ không được hoàn tiền!")) {
                    // Nếu người dùng nhấn "Đồng ý", chuyển đến trang cancelsandadat
                    window.location.href = "cancelsandadat?IDrff=" + IDrff;
                }
            }
        </script>
        <!--Content end-->
        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-light mt-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container">
                <div class="row gx-5">
                    <div class="col-lg-4 col-md-6 footer-about">
                        <div class="d-flex flex-column align-items-center justify-content-center text-center h-100 bg-primary p-4">
                            <a href="index.html" class="navbar-brand">
                                <h1 class="m-0 text-white"><i class="fa fa-user-tie me-2"></i>FBK74</h1>
                            </a>
                            <p class="mt-3 mb-4">Địa chỉ chuyên nghiệp dành cho mọi lứa tuổi, hãy cùng nhau trải nghiệm sân chơi đẳng cấp của chúng tôi ngay nhé.</p>
                            <form action="">
                                <div class="input-group">
                                    <input type="text" class="form-control border-white p-3" placeholder="Your Email">
                                    <button class="btn btn-dark">Sign Up</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-6">
                        <div class="row gx-5">
                            <div class="col-lg-4 col-md-12 pt-5 mb-5">
                                <div class="section-title section-title-sm position-relative pb-3 mb-4">
                                    <h3 class="text-light mb-0">Get In Touch</h3>
                                </div>
                                <div class="d-flex mb-2">
                                    <i class="bi bi-geo-alt text-primary me-2"></i>
                                    <p class="mb-0">78 Bình Kỳ, Ngũ Hành Sơn, Đà Nẵng</p>
                                </div>
                                <div class="d-flex mb-2">
                                    <i class="bi bi-envelope-open text-primary me-2"></i>
                                    <p class="mb-0">fbk74@gmail.com</p>
                                </div>
                                <div class="d-flex mb-2">
                                    <i class="bi bi-telephone text-primary me-2"></i>
                                    <p class="mb-0">+012 345 67890</p>
                                </div>
                                <div class="d-flex mt-4">
                                    <a class="btn btn-primary btn-square me-2" href="#"><i class="fab fa-twitter fw-normal"></i></a>
                                    <a class="btn btn-primary btn-square me-2" href="#"><i class="fab fa-facebook-f fw-normal"></i></a>
                                    <a class="btn btn-primary btn-square me-2" href="#"><i class="fab fa-linkedin-in fw-normal"></i></a>
                                    <a class="btn btn-primary btn-square" href="#"><i class="fab fa-instagram fw-normal"></i></a>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12 pt-0 pt-lg-5 mb-5">
                                <div class="section-title section-title-sm position-relative pb-3 mb-4">
                                    <h3 class="text-light mb-0">Quick Links</h3>
                                </div>
                                <div class="link-animated d-flex flex-column justify-content-start">
                                    <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Trang Chủ</a>
                                    <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Tìm Sân</a>
                                    <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Tìm Đối Thủ</a>
                                    <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Giải Đấu</a>
                                    <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Khóa Học Bóng Đá</a>
                                    <a class="text-light" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Liên Hệ</a>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12 pt-0 pt-lg-5 mb-5">
                                <div class="section-title section-title-sm position-relative pb-3 mb-4">
                                    <h3 class="text-light mb-0">Popular Links</h3>
                                </div>
                                <div class="link-animated d-flex flex-column justify-content-start">
                                    <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Trang Chủ</a>
                                    <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Tìm Sân</a>
                                    <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Tìm Đối Thủ</a>
                                    <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Giải Đấu</a>
                                    <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Khóa Học Bóng Đá</a>
                                    <a class="text-light" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Liên Hệ</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid text-white" style="background: #061429;">
            <div class="container text-center">
                <div class="row justify-content-end">
                    <div class="col-lg-8 col-md-6">
                        <div class="d-flex align-items-center justify-content-center" style="height: 75px;">
                            <p class="mb-0">&copy; <a class="text-white border-bottom" href="#">Your Site Name</a>. All Rights Reserved. 

                                <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                                Designed by <a class="text-white border-bottom" href="https://htmlcodex.com">HTML Codex</a></p>
                            <br>Distributed By: <a class="border-bottom" href="https://themewagon.com" target="_blank">ThemeWagon</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->

        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>
        <!-- JavaScript Libraries -->
        <!--<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>-->

        <script src="lib/wow/wow.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/counterup/counterup.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
        <!--tập hợp js-->
        <script src="js/js_nhat.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script>
            function toggleDetails(row) {
                const detailsCell = row.querySelector('.details');
                detailsCell.classList.toggle('collapsed');
            }
        </script>

    </body>
</html>