<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
    Document   : index1
    Created on : Feb 26, 2024, 4:39:54 PM
    Author     : nhatk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <title>Sân Bóng FBK74</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="../lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <link href="../lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="../css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="../css/style_nam.css" rel="stylesheet">
        <style>
            .content2 {
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
            }

            .buttons {
                margin-bottom: 30px;
            }

            .btn {
                padding: 10px 20px;
                margin: 0 5px;
                border: none;
                background-color: #333;
                color: #fff;
                text-transform: uppercase;
                letter-spacing: 1px;
                font-weight: bold;
                cursor: pointer;
                outline: none;
                position: relative;
                overflow: hidden;
                transition: color 0.4s;
            }

            .btn::after {
                content: '';
                position: absolute;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background-color: #fff;
                z-index: -1;
                transition: transform 0.5s;
                transform: scale(0);
                transform-origin: center;
            }

            .btn:hover::after {
                transform: scale(4);
                color: #333;
            }

            .btn:hover {
                color: #333;
            }

            .team-link {
                color: #333; /* Or whatever color your design uses */
                text-decoration: none; /* Removes underline from links */
                transition: color 0.2s ease-in-out;
            }
            .team-link:hover, .team-link:focus {
                color: #555; /* Slightly different color on hover for feedback */
                text-decoration: none; /* Keeps the underline off on hover */
            }
            .team-item {
                margin: 20px;
                padding: 20px;
                background-color: #f7f7f7;
                border: 1px solid #ddd;
                border-radius: 8px;
                transition: all 0.3s ease-in-out;
            }

            .team-item {
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-bottom: 1px solid #ccc;
                padding: 10px 0;
            }

            .team-item h2 {
                font-size: 1.5em;
                color: #333;
                position: relative;
            }

            .team-item h2::after {
                content: '';
                position: absolute;
                left: 0;
                bottom: -10px;
                width: 50%;
                height: 3px;
                background-color: #333;
                transition: width 0.3s;
            }

            .team-item:hover h2::after {
                width: 100%;
            }
            .add-team {
                margin-bottom: 20px;
            }
            .team-list {
                border: 1px solid #ccc;
                border-radius: 5px;
                padding: 10px;
            }
            .team-name {
                margin: 0;
            }
            /* Add any additional global styles or animations here */


        </style>
    </head>

    <body>
        <div class="container-xxl position-relative bg-white d-flex p-0">
            <!-- Spinner Start -->
            <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
            <!-- Spinner End -->


            <!-- Sidebar Start -->
            <div class="sidebar pe-4 pb-3">
                <nav class="navbar bg-light navbar-light">
                    <a href="../index1.jsp" class="navbar-brand mx-4 mb-3">
                        <h3 class="text-primary">FBK74</h3>
                    </a>

                                  <div class="navbar-nav w-100">
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>Quản lý sân bóng</a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <a href="quanlysanbong" class="dropdown-item">Quản lý sân bóng</a>
                                <a href="danhsachsanbong" class="dropdown-item">Cập nhật sân bóng</a>
                                <a href="danhsachyeucau" class="dropdown-item">Xác nhận yêu cầu</a>
                                <a href="approve_opponent" class="dropdown-item">Danh sách đối thủ</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>Giải đấu</a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <a href="AdminTournaments" class="dropdown-item">Quản lý giải đấu</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>Khóa học</a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <a href="ManagerCourse" class="dropdown-item">Quản lý lớp học</a>

                            </div>
                        </div>
                        <div class="nav-item">
                            <a href="manageuser?action=viewList" class="nav-link " ><i class="fa fa-laptop me-2"></i>Quản lý người dùng</a>

                        </div>
                        <div class="nav-item">
                            <a href="product" class="nav-link" ><i class="fa fa-laptop me-2"></i>Quản lý dịch vụ</a>                            
                        </div>
                        <div class="nav-item">
                            <a href="doanhthu" class="nav-link" ><i class="fa fa-laptop me-2"></i>Doanh thu</a>                            
                        </div>

                    </div>
                </nav>
            </div>
            <!-- Sidebar End -->


            <div class="content">
                <!-- Navbar Start -->
                <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                    <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                        <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                    </a>
                    <a href="#" class="sidebar-toggler flex-shrink-0">
                        <i class="fa fa-bars"></i>
                    </a>
                    <div class="navbar-nav align-items-center ms-auto">                                            
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <img class="rounded-circle me-lg-2" src="../img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                <span class="d-none d-lg-inline-flex">John Doe</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                <a href="#" class="dropdown-item">My Profile</a>
                                <a href="#" class="dropdown-item">Settings</a>
                                <a href="../../logout" class="dropdown-item">Log Out</a>
                            </div>
                        </div>
                    </div>
                </nav>
                <!-- Navbar End -->           

                <!-- Main Content Start -->
                <div class="content2">
                    <h2 class="mb-4">Quản Lý Đội Bóng</h2>

                    <!-- Nút thêm đội bóng -->
                    <div class="add-team">
                        <a href="AdminAddTeam?IDTournament=${IDTournament}" class="btn btn-primary" id="create">Thêm Đội Bóng</a>
                    </div>

                    <!-- Danh sách các đội bóng -->
                    <div class="team-list">
                        <c:forEach items="${teams}" var="team">
                            <div class="team-item">
                                <!-- Tên đội bóng và liên kết đến trang danh sách thành viên -->
                                <h2 class="team-name"><a href="AdminEditTeamMemberServlet?IDTeam=${team.id}" class="team-link">${team.name}</a></h2>
                                <!-- Nút chỉnh sửa và xóa đội bóng -->
                                <div class="team-actions">
                                    <a href="AdminEditTeam?IDTeam=${team.id}" class="btn btn-secondary" id="edit">Chỉnh Sửa</a>
                                    <a href="AdminDeleteTeam?IDTeam=${team.id}" class="btn btn-danger" id="delete">Xóa</a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <!-- Main Content End -->


                <!-- Widgets Start -->

                <!-- Widgets End -->


                <!-- Footer Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-light rounded-top p-4">
                        <div class="row">
                            <div class="col-12 col-sm-6 text-center text-sm-start">
                                <a href="index.html">FBK74 Nơi tôn vinh bóng đá</a>, All Right Reserved. 
                            </div>                        
                        </div>
                    </div>
                </div>
                <!-- Footer End -->
            </div>
            <!-- Content End -->


            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        </div>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="../lib/chart/chart.min.js"></script>
        <script src="../lib/easing/easing.min.js"></script>
        <script src="../lib/waypoints/waypoints.min.js"></script>
        <script src="../lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="../lib/tempusdominus/js/moment.min.js"></script>
        <script src="../lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="../lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Javascript -->
        <script src="../js/main.js"></script>
    </body>

</html>
