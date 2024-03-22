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
            .header-overlay {
                padding: 20px;
                border-radius: 5px;
                background: linear-gradient(to right, #6a11cb 0%, #2575fc 100%);
            }

            .content-title {
                text-shadow: 2px 2px 4px #000;
            }

            .card {
                transform: scale(1);
                transition: transform 0.3s ease-in-out;
            }

            .card:hover {
                transform: scale(1.05);
            }

            .rotating-square {
                width: 50px;
                height: 50px;
                background-color: #5dade2;
                animation: rotate-square 5s linear infinite;
            }

            @keyframes rotate-square {
                0% {
                    transform: rotate(0deg);
                }
                100% {
                    transform: rotate(360deg);
                }
            }

            .tournament-table .form-control {
                margin-bottom: 10px;
            }

            .tournament-table table {
                width: 100%;
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
                    <a href="quanlygiaidau_nam.jsp" class="navbar-brand mx-4 mb-3">
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
                <div class="main-content p-4">
                    <!-- Artistic Card Start -->
                    <div class="card border-0 shadow-sm mb-4">
                        <div class="card-body">
                            <!-- Content Header Start -->
                            <div class="content-header mb-4">
                                <div class="header-overlay">
                                    <h2 class="content-title text-white">Chỉnh sửa giải đấu</h2>
                                </div>
                            </div>
                            <!-- Content Header End -->

                            <!-- Form Start -->
                            <form action="AdminEditTournament" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="id" value="${tournament.id}">

                                <div class="mb-3">
                                    <label for="name" class="form-label">Tên giải đấu</label>
                                    <input type="text" class="form-control" id="name" name="name" value="${tournament.name}" required>
                                </div>

                                <div class="mb-3">
                                    <label for="timeRegister" class="form-label">Thời gian mở đơn đăng ký</label>
                                    <input type="date" class="form-control" id="timeRegister" name="timeRegister" value="${tournament.timeRegister}" required>
                                </div>

                                <div class="mb-3">
                                    <label for="timeEndRegister" class="form-label">Thời gian đóng đơn đăng ký</label>
                                    <input type="date" class="form-control" id="timeEndRegister" name="timeEndRegister" value="${tournament.timeCloseRegister}" required>
                                </div>

                                <div class="mb-3">
                                    <label for="start" class="form-label">Thời gian bắt đầu</label>
                                    <input type="date" class="form-control" id="start" name="start" value="${tournament.start}" required>
                                </div>

                                <div class="mb-3">
                                    <label for="end" class="form-label">Thời gian kết thúc</label>
                                    <input type="date" class="form-control" id="end" name="end" value="${tournament.end}" required>
                                </div>

                                <div class="mb-3">
                                    <label for="award" class="form-label">Tiền thưởng</label>
                                    <input type="number" class="form-control" id="award" name="award" value="${tournament.award}" required>
                                </div>

                                <div class="mb-3">
                                    <label for="information" class="form-label">Thông tin chi tiết</label>
                                    <input type="text" class="form-control" id="information" name="information" value="${tournament.information}" required>
                                </div>

                                <div class="mb-3">
                                    <label for="image" class="form-label">Hình ảnh</label>
                                    <img src="${tournament.image}" alt="${tournament.name}"  style="display: block; width: 50px; height: auto;" required>
                                    <input type="file" class="form-control" id="image" name="image">
                                </div>

                                <button type="submit" class="btn btn-primary">Chỉnh sửa</button>
                            </form>
                            <!-- Form End -->
                        </div>
                    </div>
                    <!-- Artistic Card End -->
                </div>


                <!-- Main Content End -->



                <script>
                    $(document).ready(function () {
                        $('.card').hover(
                                // Mouse Enter
                                        function () {
                                            $(this).css('box-shadow', '0px 10px 20px rgba(0, 0, 0, 0.2)');
                                        },
                                        // Mouse Leave
                                                function () {
                                                    $(this).css('box-shadow', '');
                                                }
                                        );
                                    });
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