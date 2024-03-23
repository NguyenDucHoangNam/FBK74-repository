<%--<%@page import="model.InformationRegistFindOpponent"%>
<%@page import="java.util.List"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset = UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>--%>

<%@ page pageEncoding="UTF-8" contentType="text/html; charset = UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.text.SimpleDateFormat" %>

<html>
    <head>
        <meta charset="utf-8">
        <title>Sân Bóng FBK74</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&family=Rubik:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/animate/animate.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--CSS Nhat-->
        <link rel="stylesheet" href="css/style_nhat.css"/>
        <link rel="stylesheet"
              href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
                            <a href="regist-find-opponent" class="dropdown-item">Đăng ký làm đối thủ</a>
                            <a href="find-opponent" class="dropdown-item">Tìm kiếm đối thủ</a>
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
        <div class="container-fluid">
            <div class="row">
                <!-- Left advertising banner -->
                <jsp:include page="quangcaotrai_nam.jsp"/>

                <!-- Main content -->
                <div class="col-md-10">
                    <h2>Danh sách đăng ký tìm đối thủ</h2>
                    <!--start thanh tim kiem-->
                    <c:set var="currentDate" value="${sessionScope.currentDate}"/>
                    <c:set var="currentTime" value="${sessionScope.currentTime}"/>
                    <c:set var="currentHour" value="${sessionScope.currentHour}"/> 

                    <div class="d-flex justify-content-center mt-4">
                        <form action="suggest_opponent" method="get" class="mt-3" id="myForm">
                            <div class="row">
                                <div class="col col12">
                                    <label for="ngay" class="labelform">Ngày: </label>
                                    <input type="date" id="futureDate" name="futureDate" max="" min="" required pattern="dd/MM/yyyy"><br>
                                    <script>
                                        // Lấy ngày hiện tại
                                        var today = new Date();

                                        // Tính ngày trong tương lai 7 ngày
                                        var futureDate = new Date();
                                        futureDate.setDate(today.getDate() + 7);

                                        // Chuyển đổi ngày trong tương lai thành chuỗi yyyy-MM-dd
                                        var futureDateString = futureDate.toISOString().substring(0, 10);

                                        // Đặt thuộc tính max và min của input date
                                        document.getElementById("futureDate").setAttribute("max", futureDateString);
                                        document.getElementById("futureDate").setAttribute("min", today.toISOString().substring(0, 10));
                                    </script>

                                </div>
                                <div class="col col12">
                                    <label for="gio"class="labelform">Thời gian:</label>  
                                    <select name="times" class="form-control">
                                        <option value="6:30">6:30 - 7:30</option>
                                        <option value="7:30">7:30 - 8:30</option>
                                        <option value="8:30">8:30 - 9:30</option>
                                        <option value="9:30">9:30 - 10:30</option>
                                        <option value="14:30">14:30 - 15:30</option>
                                        <option value="15:30">15:30 - 16:30</option>
                                        <option value="16:30">16:30 - 17:30</option>
                                        <option value="17:30">17:30 - 18:30</option>
                                        <option value="18:30">18:30 - 19:30</option>
                                        <option value="19:30">19:30 - 20:30</option>
                                        <option value="20:30">20:30 - 21:30</option>
                                        <option value="21:30">21:30 - 22:30</option>
                                        <option value="22:30">22:30 - 23:30</option>
                                        <option value="23:30">23:30 - 0:30</option>
                                    </select>

                                    </select>
                                </div>
                                <div class="col col12">
                                    <label for="loaisan" name="loaisan" class="labelform">Loại sân:</label>
                                    <select class="form-control" id="loaisan" name="loaisan">
                                        <option value="5">5 người</option>
                                        <option value="7">7 người</option>
                                    </select>
                                </div>

                                <button type="submit" class="btn btn-primary col">Tìm kiếm</button>
                            </div>

                        </form>

                    </div>
                    <!--end thanh tim kiem-->
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Tên</th>
                                <th>Số điện thoại</th>
                                <th>Giờ bắt đầu</th>
                                <th>Giờ kết thúc</th>
                                <th>Ngày</th>
                                <th>Chú thích</th>
                                <th>Loại sân</th>              
                                <th>Chọn</th>
                            </tr>
                        </thead>
                        <tbody id="bookingList">

                            <c:forEach items="${requestScope.currentPageData}" var="l">


                                <tr id="${l.idRFO}">
                                    <td>${l.name}</td>
                                    <td>${l.phone}</td> 
                                    <td>${l.timeStart}</td>
                                    <td>${l.timeEnd}</td>
                                    <td>${l.date}</td>             
                                    <td>${l.power}</td>
                                    <td>${l.typeFootballField}</td>
                                    <td>
                                        <form action="danhsachtimsan" method="get">
<!--                                            <input type="hidden" name="ngay" value="${l.date}">
                                            <input type="hidden" name="gio" value="${l.timeStart}">
                                            <input type="hidden" name="loaisan" value="${l.typeFootballField}">
                                            <input type="hidden" name="idAccount1" value="${l.idAccount1}">-->
                                            <input type="hidden" name="idRFO" value="${l.idRFO}">
                                            <button type="submit" class="btn btn-primary">Chọn</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>

                        </tbody>
                    </table>
                    <nav aria-label="Page navigation "> 
                        <ul class="pagination justify-content-end">
                            <c:set var="totalPages" value="${Math.floor((totalRecords + recordsPerPage - 1) / recordsPerPage)}"/>
                            <c:set var="currentPage" value="${currentPage}"/>

                            <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                <a class="page-link" href="pagination?page=${currentPage - 1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>

                            <c:forEach begin="1" end="${totalPages}" var="i">
                                <li class="page-item ${i == currentPage ? 'active' : ''}">
                                    <a class="page-link" href="pagination?page=${i}">${i}</a>
                                </li>
                            </c:forEach>

                            <li class="page-item ${currentPage ==  totalPages ? 'disabled' : ''}">
                                <a class="page-link" href="pagination?page=${currentPage + 1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>



                <!--end san bong-->

                <!-- Right advertising banner -->
                <jsp:include page="quangcaophai_nam.jsp"/>
            </div>
            <div class="col-md-2 d-flex flex-column justify-content-center" style="border-left: solid">
                <form action="history-regist-find-opponent" method="get" id="request" class="main_form">
                    <button type="submit" class="btn btn-success m-3" style="padding: 15px 25px; font-size: 18px;">Sân đã đặt</button>
                </form>
            </div>


        </div>
        <!--Content start-->



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
        <!-- Back to Top -->
        <a href="timsan_nhat.jsp" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>


        <!-- JavaScript Libraries -->
        <!--<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/counterup/counterup.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>
</html>