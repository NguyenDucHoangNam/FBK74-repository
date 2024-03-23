<%@page import="model.Tournament"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Date"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset = UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
    <head>
        <meta charset="utf-8">
        <title>Sân Bóng FBK74</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
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
        <!--<link rel="stylesheet" href="css/style_nam.css"/>-->
        <style>
            .banner {
                background: url('img_nam/giaidaubanner.jpg') no-repeat center center;
                background-size: cover;
                height: 300px;
                position: relative;
            }

            .tournament-item {
                display: flex;
                flex-direction: column;
                align-items: center;
                margin-bottom: 20px;
            }
            .tournament-item .select-button {
                align-self: flex-end;
                margin-top: 10px;
            }

            .tournament-image {

                width: 70%;
                height: 180px; /* Fixed height for uniformity */
                object-fit: cover; /* Ensures images cover the area nicely */
                border-radius: 5px;
            }
            .tournament-name {
                margin-top: 20px;
                font-size: 1.5rem; /* Sets a larger font size */
                color: #333; /* Sets a dark color for the text */
                font-weight: 600; /* Makes the font a bit bolder */
                text-align: center; /* Centers the text */
                transition: color 0.3s ease, transform 0.3s ease; /* Smooth transition for color and transform changes */
            }


            .advert-banner {
                background-color: #f8f9fa; /* Placeholder color */
                border: 1px solid #ddd;
                height: 100vh; /* Full height of the viewport */
                position: sticky;
                top: 0;
            }
            .tournament-list {
                display: flex;
                flex-direction: column;
                width: 100%; /* This makes sure it takes the full width */
                padding-top: 2%;
            }
            .tournament-link:hover .tournament-name {
                color: #007bff; /* Changes text color on hover */
                transform: scale(1.05); /* Slightly increase the size to create a 'pop' effect */
            }
            .tournament-info {
                display: flex;
                flex-direction: column;
                align-items: center;
                width: 100%; /* Chiếm toàn bộ chiều rộng */
            }

            /* Responsive adjustments */
            @media (max-width: 991.98px) {
                .advert-banner {
                    height: 300px; /* Adjust height for smaller screens */
                    margin-bottom: 20px;
                }
            }
            .cancel-registration {
                margin-top: 20px;
                margin-left: auto;
                margin-right: auto;
                display: block;
            }
            .registered-tournaments-title {
                text-align: center;
                font-size: 2.5rem; /* Adjust the size as needed */
                color: #007bff; /* Change the color to match your design */
                margin-bottom: 5px;
                margin-top: 20px;
                font-weight: bold;
                animation: fadeInDown; /* This is an animation from Animate.css */
                animation-duration: 1s; /* Duration of the animation */
            }
        </style>
    </head>

    <body>
        <jsp:include page="header_nam.jsp"/>

        <!-- Navbar & Carousel End -->
        <script>
            function toggleHighlight(button) {
                // Lấy phần tử cha tương ứng với giải đấu
                var tournamentItem = button.closest('.tournament-item');
                // Toggle class 'highlight' để làm nổi bật hoặc bỏ nổi bật
                tournamentItem.classList.toggle('highlight');
            }
        </script>
        <!--Content start-->
        <div class="container-fluid">
            <div class="row">
                <!-- Left advertising banner -->
                <jsp:include page="quangcaotrai_nam.jsp"/>
                <c:set var="currentDate" value="<%= new java.util.Date()%>" />
                <c:set var="formattedCurrentDate" value="<fmt:formatDate value='${currentDate}' pattern='yyyy-MM-dd' />" />

                <!-- Main content -->
                <div class="col-md-10">
                    <div class="banner">
                    </div>
                    <h2 class="registered-tournaments-title">GIẢI ĐẤU ĐÃ ĐĂNG KÝ</h2>
                    <div class="tournament-list">
                        <c:forEach items="${tournaments}" var="tournament">
                            <div class="tournament-item">
                                <img src="img_nam/${tournament.image}" alt="${tournament.name}" class="tournament-image" width="100" height="100">
                                <div class="tournament-info">
                                    <a href="./TournamentDetail?tournamentID=${tournament.id}&isFromHistory=isFromHistory" class="animate__animated animate__zoomIn">
                                        <div class="tournament-name">${tournament.name}</div>
                                    </a>
                                    <button class="btn btn-primary select-button" onclick="toggleHighlight(this)">Chọn</button>


                                    <c:if test="${tournament.getStart().after(currentDate)}">
                                        <a href="./CancelRegisTournament?tournamentID=${tournament.id}" class="btn btn-danger cancel-registration" onclick="return confirm('Bạn có chắc chắn muốn hủy giải đấu? Bạn cần 1 thời gian để admin xem xét có hủy được hay không. Và đội bóng của bạn vẫn đang được đăng ký trong thời gian xem xét !')">Hủy giải đấu đã đăng ký</a>
                                        <p>(Lưu ý: Chỉ được hủy những giải đấu đang trong thời gian mở đơn đăng ký)</p>
                                    </c:if>






                                </div>
                            </div>
                            <br/>
                            <br/>
                            <br/>

                        </c:forEach>

                    </div>
                </div>

                <!-- Right advertising banner -->
                <jsp:include page="quangcaophai_nam.jsp"/>
            </div>
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
        <a href="timsan_nhat.jsp" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/counterup/counterup.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>
</html>