<%@ page pageEncoding="UTF-8" contentType="text/html; charset = UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <link rel="stylesheet" href="css/style_nam.css"/>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
            />
        <style>
            .banner {
                background: url('img/giaidaubanner.jpg') no-repeat center center;
                background-size: cover;
                height: 300px;
                position: relative;
            }
            .register-button {
                position: absolute;
                top: 50%;
                right: 15px;
                transform: translateY(-50%);
            }
            .tournament-item {
                margin-bottom: 30px;
            }
            .tournament-item img {
                width: 100%;
                height: 180px; /* Fixed height for uniformity */
                object-fit: cover; /* Ensures images cover the area nicely */
                border-radius: 5px;
            }
            .tournament-name {
                text-align: center;
                margin-top: 10px;
                font-weight: bold;
                font-size: 24px; /* Adjust the font size as desired */
                color: #007bff; /* Change the color if needed */
                padding: 5px;
                border-bottom: 2px solid #007bff; /* Adds an underline effect */
                display: inline-block;
            }
            .advert-banner {
                background-color: #f8f9fa; /* Placeholder color */
                border: 1px solid #ddd;
                height: 100vh; /* Full height of the viewport */
                position: sticky;
                top: 0;
            }
            /* Responsive adjustments */
            @media (max-width: 991.98px) {
                .advert-banner {
                    height: 300px; /* Adjust height for smaller screens */
                    margin-bottom: 20px;
                }
            }
            .tournament-info p {
                font-family: 'Nunito', sans-serif; /* Use the font you included */
                font-size: 16px; /* Adjust the font size as needed */
                line-height: 1.6; /* Gives a little more space between lines */
                color: #333; /* A dark grey that's softer than black */
                text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.1); /* A subtle text shadow for depth */
                margin-bottom: 10px; /* Spacing between paragraphs */
            }

            .tournament-info h3 {
                font-family: 'Rubik', sans-serif; /* Use the font you included */
                font-weight: 700; /* Makes the font bold */
                font-size: 28px; /* A larger font size for headings */
                color: #007bff; /* The primary color for headings */
                margin-bottom: 15px; /* Spacing after the heading */
            }
            .tournament-title-container {
                text-align: center;
                margin: 40px 0;
            }

            .tournament-title {
                display: inline-block;
                color: #2193b0; /* Đây là màu xanh dương đậm */
                font-size: 2.5rem;
                font-weight: bold;
                padding: 0.5em 1em;
                border-radius: 10px;
                box-shadow: 0px 0px 15px rgba(33, 147, 176, 0.7);
            }
            @keyframes textClip {
                to {
                    background-position: 200% center;
                }
            }
            .team-list-container {
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }

            .team-list-title {
                text-align: center;
                color: #004d99;
                margin-bottom: 20px;
            }

            .team-list-table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            .team-list-table th,
            .team-list-table td {
                padding: 10px;
                text-align: left;
                border: 1px solid #ddd;
            }

            .team-list-table th {
                background-color: #004d99;
                color: #fff;
            }

            .team-list-table tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            .btn-edit-team-list {
                background-color: #007bff;
                color: white;
                padding: 10px 15px;
                text-align: center;
                display: block;
                margin: 20px auto;
                font-size: 16px;
                cursor: pointer;
                border: none;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }

            .btn-edit-team-list:hover {
                background-color: #0056b3;
            }

            /* Modal style */
            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgb(0,0,0);
                background-color: rgba(0,0,0,0.4);
                padding-top: 60px;
            }

            /* Modal content box */
            .modal-content {
                background-color: #fefefe;
                margin: 5% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
            }

            /* Responsive design */
            @media (max-width: 768px) {
                .team-list-container {
                    width: 95%;
                }
                .team-list-table {
                    display: block;
                    overflow-x: auto;
                }

            </style>
        </head>

        <body>

            <!-- Navbar & Carousel Start -->

            <jsp:include page="header_nam.jsp"/>

            <!-- Navbar & Carousel End -->
            <!--Content start-->
            <div class="container-fluid">
                <div class="row">
                    <!-- Left advertising banner -->
                    <div class="col-md-1 d-none d-md-block">
                        <div class="advert-banner animate__animated animate__fadeIn">
                            <img src="img/quangcao1.webp" alt="Quảng cáo bên phải" class="img-fluid">
                            <img src="img/quangcao1.webp" alt="Quảng cáo bên phải" class="img-fluid">
                            <img src="img/quangcao1.webp" alt="Quảng cáo bên phải" class="img-fluid">
                            <img src="img/quangcao1.webp" alt="Quảng cáo bên phải" class="img-fluid">
                            <img src="img/quangcao1.webp" alt="Quảng cáo bên phải" class="img-fluid">
                        </div>
                    </div>

                    <!-- Main content -->
                    <div class="col-md-10">
                        <div class="banner">
                            <%--                            <button class="btn btn-primary register-button animate__animated animate__bounceIn" onclick="redirectToPage()">Giải đấu đã đăng ký</button>--%>
                            <form action="./HistoryServlet" method="get">
                                <input class="btn btn-primary register-button animate__animated animate__bounceIn" value="Giải đấu đã đăng ký" type="submit">
                            </form>
                        </div>
                        <script>
                            function redirectToPage() {
                                window.location.href = "giaidaudadangky_nam.jsp";
                            }
                        </script>
                        <div class="tournament-title-container">
                            <a href="detail?id=${tournament.id}" class="tournament-title animate__animated animate__pulse">${tournament.name}</a>
                        </div>
                        <div class="row my-4">
                            <div class="col-md-4 text-center">
                                <a href="schedule?id=${id}" class="btn btn-outline-primary w-100">Lịch Thi Đấu</a>
                            </div>
                            <div class="col-md-4 text-center">
                                <a href="teams?id=${id}" class="btn btn-outline-primary w-100">Danh Sách Đội</a>
                            </div>
                            <div class="col-md-4 text-center">
                                <a href="result?id=${id}" class="btn btn-outline-primary w-100">Kết Quả</a>
                            </div>
                        </div>
                        <!--<div class="list">-->
                        <div class="team-list-container">
                            <c:if test="${teams != null && !teams.isEmpty()}">
                                <c:forEach items="${teams}" var="team" varStatus="stt">
                                    <div class="item">
                                        <h2 class="team-list-title">Danh Sách Đội Bóng ${team.name}</h2>
                                        <table class="team-list-table">
                                            <thead>
                                                <tr>
                                                    <th>STT</th>
                                                    <th>Cầu Thủ</th>
                                                    <th>Số Áo</th>
                                                    <th>Số Điện Thoại</th>
                                                    <th>Mô Tả</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${team.members}" var="loop" varStatus="stt">
                                                    <tr>
                                                        <td>${stt.index + 1}</td>
                                                        <td>${loop.name}</td>
                                                        <td>${loop.number}</td>
                                                        <td>${loop.phone}</td>
                                                        <td>${loop.detail}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${team != null}">
                                <div class="item">
                                    <h2 class="team-list-title">Danh Sách Đội Bóng ${team.name}</h2>
                                    <table class="team-list-table">
                                        <thead>
                                            <tr>
                                                <th>STT</th>
                                                <th>Cầu Thủ</th>
                                                <th>Số Áo</th>
                                                <th>Số Điện Thoại</th>
                                                <th>Mô Tả</th>
                                                <th>Chỉnh Sửa</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${team.members}" var="loop" varStatus="stt">
                                                <tr>
                                                    <td>${stt.index + 1}</td>
                                                    <td>${loop.name}</td>
                                                    <td>${loop.number}</td>
                                                    <td>${loop.phone}</td>
                                                    <td>${loop.detail}</td>

                                                    <td>
                                                        <a href="EditMemberOfTeam?memberID=${loop.id}&IDTeam=${team.id}" >Chỉnh Sửa |</a>
                                                        <a href="DeleteMember?id=${loop.id}&IDTeam=${IDTeam}&tournamentID=${tournament.id}" onclick="return confirm('Bạn có chắc chắn muốn xóa thành viên này khỏi đội')">Xóa</a>
                                                    </td>

                                                </tr>

                                            </c:forEach>
                                        <a href="AddMember?IDTeam=${team.id}&tournamentID=${tournament.id}" >Thêm +</a>
                                    </c:if>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- Main content end -->
                    
                    <!-- Right advertising banner -->
                    <div class="col-md-1 d-none d-md-block">
                        <div class="advert-banner animate__animated animate__fadeIn">
                            <img src="img/quangcao1.webp" alt="Quảng cáo bên phải" class="img-fluid">
                            <img src="img/quangcao1.webp" alt="Quảng cáo bên phải" class="img-fluid">
                            <img src="img/quangcao1.webp" alt="Quảng cáo bên phải" class="img-fluid">
                            <img src="img/quangcao1.webp" alt="Quảng cáo bên phải" class="img-fluid">
                            <img src="img/quangcao1.webp" alt="Quảng cáo bên phải" class="img-fluid">
                        </div>
                    </div>
                <ul class="listPage">
                </ul>
                </div>
            </div>
            <script src="js/script.js"></script>
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