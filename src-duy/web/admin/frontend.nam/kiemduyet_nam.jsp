<%@ page import="dao.UserDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            .section-title {
                text-align: center;
                color: #191C24;
                font-weight: bold;
                margin-bottom: 20px;
                text-transform: uppercase;
                letter-spacing: 1px;
            }

            .table {
                box-shadow: 0 0 30px rgba(0, 0, 0, 0.1);
            }

            .table thead th {
                background-color: #009DFF;
                color: #fff;
            }

            .table tbody td {
                vertical-align: middle;
            }

            .btn-action {
                margin-right: 8px;
                transition: transform 0.2s ease-in-out;
            }

            .btn-action:hover {
                transform: scale(1.05);
            }

            .btn-success {
                background-color: #1cc88a;
                border: none;
            }

            .btn-danger {
                background-color: #e74a3b;
                border: none;
            }

            /* Additional styling */
            .btn-success:hover {
                background-color: #17a673;
            }

            .btn-danger:hover {
                background-color: #e02d1b;
            }

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
                    <a href="index.html" class="navbar-brand mx-4 mb-3">
                        <h3 class="text-primary">FBK74</h3>
                    </a>

                    <div class="navbar-nav w-100">
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>Quản lý sân bóng</a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <a href="" class="dropdown-item">Quản lý sân bóng</a>
                                <a href="" class="dropdown-item">Cập nhật sân bóng</a>
                                <a href="" class="dropdown-item">Xác nhận yêu cầu</a>
                                <a href="" class="dropdown-item">Danh sách đối thủ</a>
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
                                <a href="" class="dropdown-item">Buttons</a>
                                <a href="" class="dropdown-item">Typography</a>
                                <a href="" class="dropdown-item">Other Elements</a>
                            </div>
                        </div>

                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Pages</a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <a href="signin.html" class="dropdown-item">Sign In</a>
                                <a href="signup.html" class="dropdown-item">Sign Up</a>
                                <a href="404.html" class="dropdown-item">404 Error</a>
                                <a href="blank.html" class="dropdown-item">Blank Page</a>
                            </div>
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
                <div class="container-fluid pt-4 px-4">
                    <!-- Title -->
                    <div class="mb-4">
                        <h2 class="section-title">Danh Sách Đăng Ký</h2>
                    </div>

                    <!-- Registration Table -->
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Tên đội bóng</th>
                                    <th>Tên người đại diện</th>
                                    <th>Số điện thoại</th>
                                    <th>Xét duyệt</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listPendingApproval}" var="item">
                                    <tr>
                                        <td>${item.id}</td>
                                        <td>${item.name}</td>
                                        <c:set var="name" value="${userDAO.getUserByIDAccount(item.accountID).getName()}" />

                                        <td>${name}</td>
                                        <td>${item.detail}</td>
                                        <td>
                                            <div class="d-flex justify-content-around">
                                                <form action="AdminCensor" method="post" class="me-2">
                                                    <input type="hidden" name="IDTournament" value="${IDTournament}">
                                                    <input type="hidden" name="id" value="${item.id}">
                                                    <input type="hidden" name="type" value="approveRegis">
                                                    <input type="submit" class="btn btn-success btn-action" value="Phê Duyệt">
                                                </form>
                                                <form action="AdminCensor" method="post">
                                                    <input type="hidden" name="IDTournament" value="${IDTournament}">
                                                    <input type="hidden" name="id" value="${item.id}">
                                                    <input type="hidden" name="type" value="rejectRegis">
                                                    <input type="submit" class="btn btn-danger btn-action" value="Từ Chối">
                                                </form>
                                            </div>
                                        </td>

                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- Main Content End -->

                <!-- Main Content Start -->
                <div class="container-fluid pt-4 px-4">
                    <!-- Title -->
                    <div class="mb-4">
                        <h2 class="section-title">Danh Sách Hủy Đăng Ký</h2>
                    </div>

                    <!-- Registration Table -->
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Tên đội bóng</th>
                                    <th>Tên người đại diện</th>
                                    <th>Số điện thoại</th>
                                    <th>Xét duyệt</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listPendingCancel}" var="item">
                                    <tr>
                                        <td>${item.id}</td>
                                        <td>${item.name}</td>
                                        <c:set var="name" value="${userDAO.getUserByIDAccount(item.accountID).getName()}" />

                                        <td>${name}</td>
                                        <td>${item.detail}</td>
                                        <td>
                                            <div class="d-flex justify-content-around">
                                                <form action="AdminCensor" method="post" class="me-2">
                                                    <input type="hidden" name="id" value="${item.id}">
                                                    <input type="hidden" name="IDTournament" value="${IDTournament}">
                                                    <input type="hidden" name="type" value="approveCancel">
                                                    <input type="submit" class="btn btn-success btn-action" value="Phê Duyệt">
                                                </form>
                                                <form action="AdminCensor" method="post">
                                                    <input type="hidden" name="IDTournament" value="${IDTournament}">
                                                    <input type="hidden" name="id" value="${item.id}">
                                                    <input type="hidden" name="type" value="rejectCancel">
                                                    <input type="submit" class="btn btn-danger btn-action" value="Từ Chối">
                                                </form>
                                            </div>
                                        </td>

                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- Main Content End -->

                <script>
                    // JavaScript for Approve and Reject buttons
                    function approve() {
                        // Add logic for approve
                        console.log('Approved');
                    }

                    function reject() {
                        // Add logic for reject
                        console.log('Rejected');
                    }
                </script>


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
