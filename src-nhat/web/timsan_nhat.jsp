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
        <link rel="stylesheet" href="css/style_nhat.css"/>
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
            $(document).on("click", ".card", function () {
                var iD = $(this).attr("id");
                // Hiển thị modal
                $.ajax({
                    method: "GET",
                    url: "http://localhost:8080/FBK74/thongtinsanbong",
                    dataType: "JSON",
                    data: {id: iD}
                })
                        .done(function (msg) {
                            $("#tensan1").text(msg.FootballField.Name);
                            $("#loaisan1").text("Sân dành cho " + msg.FootballField.TypeofFootballField + "người/Đội");
                            $("#start1").text(msg.StartTime);
                            $("#end1").text(msg.EndTime);
                            $("#price1").text(msg.FootballField.Price + "VNĐ");
                            var imageUrl = "img_nhat/" + msg.FootballField.Image;
                            $(".imgne").css("background-image", "url('" + imageUrl + "')");
                            $("#myModal").modal("show");

                        });

            });
        </script>


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
                    <span class="material-icons">shopping_cart</span>
                    <span class="icon-button__badge">2</span>
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
        <div class="container-fluid">  
            <!--start thanh tim kiem-->
            <c:set var="currentDate" value="${sessionScope.currentDate}"/>
            <c:set var="currentTime" value="${sessionScope.currentTime}"/>
            <c:set var="currentHour" value="${sessionScope.currentHour}"/>    

            <div class="d-flex justify-content-center mt-4">
                <form action="danhsachtimsan" method="get" class="mt-3" id="myForm">
                    <div class="row">
                        <div class="col col12">
                            <label for="ngay" class="labelform">Ngày: </label>
                            <input type="text" value="${currentDate}" placeholder="${currentDate}" class="form-control" id="ngay" name="ngay" autocomplete="off"/>
                        </div>
                        <div class="col col12">
                            <label for="gio"class="labelform">Thời gian:</label>   
                            <select class="form-control" id="gio" name="gio">
                                <c:forEach var="i" begin="6" end="23">
                                    <c:if test="${i+1==24}">
                                        <option ${i==currentHour?'selected':''} value="${i}:30">${i}:30 - ${0}:30</option>
                                    </c:if> 
                                    <c:if test="${i+1 != 24}">
                                        <option ${i==currentHour?'selected':''} value="${i}:30">${i}:30 - ${i+1}:30</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col col12">
                            <label for="loaisan" name="loaisan" class="labelform">Loại sân:</label>
                            <select class="form-control" id="loaisan" name="loaisan">
                                <option value="0" >Tất cả</option>
                                <option value="5">5 người</option>
                                <option value="7">7 người</option>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-primary col">Tìm kiếm</button>
                    </div>

                </form>

            </div>
            <!--end thanh tim kiem-->

            <!--start Info san bong-->
            <div class="row mb-md-4 mt-md-4 min-vh-100">
                <div class="col-md-10">                    
                    <!--Start hiển thị phân trang-->    

                    <c:forEach var="footballschedule" items="${requestScope.currentPageData}">
                        <fmt:formatDate value="${footballschedule[0].startTime}" pattern="HH:mm" var="formattedStartTime" />
                        <fmt:formatDate value="${footballschedule[0].endTime}" pattern="HH:mm" var="formattedEndTime" />
                        <div class="row d-flex flex-row mt-2 mb-2">      
                            <div class="col-md-2 time-show">
                                <h3 class="text-dark">${formattedStartTime}-${formattedEndTime}</h3> 
                            </div>
                            <c:forEach var="football" items="${footballschedule}" >

                                <c:if test="${sessionScope.listIDFFS.contains(football.IDFootballFieldSchedule)}">
                                    <div class="col-md-${sessionScope.size}" >
                                        <div class="card" id="${football.IDFootballFieldSchedule}" >
                                            <div class="card-body text-center"style="padding: 5px">
                                                <h5 class="card-title ">${football.footballField.name}</h5>

                                                <p class="card-text m-0 ">Loại sân: Sân ${football.footballField.typeofFootballField} người</p>
                                                <p class="card-text m-0 ">Giá cả: ${football.footballField.price} VND/giờ</p>
                                                <button type="button" disabled="" class="btn btn-danger p-1 d-block w-75 m-auto" onclick="event.stopPropagation()">Sân bận</button>
                                                <!--                                                <span class="badge bg-danger p-2 d-block w-75 m-auto">Đã đặt</span>-->
                                            </div>
                                        </div>
                                    </div> 
                                </c:if>
                                <c:if test="${not(sessionScope.listIDFFS.contains(football.IDFootballFieldSchedule))}">
                                    <div class="col-md-${sessionScope.size}" >
                                        <div class="card" id="${football.IDFootballFieldSchedule}">
                                            <div class="card-body text-center"style="padding: 5px">
                                                <h5 class="card-title ">${football.footballField.name}</h5>
                                                <p class="card-text m-0 ">Loại sân: Sân ${football.footballField.typeofFootballField} người</p>
                                                <p class="card-text m-0 ">Giá cả: ${football.footballField.price} VND/giờ</p>
                                                <a href="checkdatsan?ffsID=${football.IDFootballFieldSchedule}&ngay=${currentDate}" class="btn btn-success p-1 d-block w-75 m-auto" onclick="event.stopPropagation()">Đặt sân</a>
                                            </div>
                                        </div>
                                    </div> 
                                </c:if>
                                <!-- Modal -->

                                <div class="modal fade" id="myModal" role="dialog"
                                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg" role="document">
                                        <div class="modal-content border-dark border-3">
                                            <div class="modal-header border-bottom-2">
                                                <h5 class="modal-title" id="exampleModalLabel"
                                                    style="margin: auto">Thông tin sân bóng</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        style="margin-left: 0px"></button>
                                            </div>
                                            <div class="modal-body">
                                                <!-- Nội dung của modal sẽ được hiển thị ở đây -->
                                                <div class="imgne">
                                                </div>
                                                <div class="infor">                  
                                                    <table class="table table-bordered">
                                                        <thead>
                                                        <th scope="col">Tên sân</th>                                                  
                                                        <td class="table-success" id="tensan1"></td>
                                                        </thead>
                                                        <thead>
                                                        <th scope="col" class=" table-success">Loại sân</th>
                                                        <td class=" table-success" id="loaisan1">Sân  người/ Đội</td>
                                                        </thead>
                                                        <thead>
                                                        <th scope="col" class=" table-success">Thời gian bắt đầu</th>
                                                        <td class=" table-success" id="start1"></td>
                                                        </thead>
                                                        <thead>
                                                        <th scope="col" class=" table-success">Thời gian kết thúc</th>
                                                        <td class=" table-success" id="end1"></td>
                                                        </thead>
                                                        <thead>
                                                        <th scope="col" class="table-success" >Giá tiền</th>
                                                        <td class=" table-success tiente"id="price1"></td>
                                                        </thead>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--End modal-->
                            </c:forEach>
                        </div>
                    </c:forEach>

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
                    <!--End hien thi phan trang-->
                </div>
                <div class="col-md-2 d-flex flex-column justify-content-md-start bookfootball" style="border-left: solid">
                    <a href="sandadat" class="btn btn-success m-3 floating-button">Sân đã đặt</a>

                </div>
            </div>
            <!--end san bong-->
        </div>
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

    </body>
</html>