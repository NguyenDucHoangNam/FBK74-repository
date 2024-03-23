<%-- 
    Document   : chinhsuagiaidau_nam
    Created on : Feb 26, 2024, 4:56:06 PM
    Author     : nhatk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>DASHMIN - Bootstrap Admin Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">


        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <<link rel="stylesheet" href="css/style_nhat.css"/>>
        <style>
            .shadow {
                box-shadow: 0 4px 8px rgba(75, 0, 130, 0.2);
            }

            .form-control:focus {
                border-color: #4b0082;
                box-shadow: 0 0 0 0.2rem rgba(75, 0, 130, 0.25);
            }

            .btn-primary:hover {
                background-color: #6a0dad;
                border-color: #6a0dad;
            }

            .form-check-label {
                margin-left: 30px; /* Điều chỉnh giá trị margin-left theo ý bạn */
            }
        </style>
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
                <a href="index1.jsp" class="navbar-brand mx-4 mb-3">
                    <h3 class="text-primary">FBK74</h3>
                </a>
                <div class="navbar-nav w-100">
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>Quản lý sân bóng</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="quanlysanbong" class="dropdown-item">Quản lý sân bóng</a>
                            <a href="danhsachsanbong" class="dropdown-item">Cập nhật sân bóng</a>
                            <a href="danhsachyeucau" class="dropdown-item">Xác nhận yêu cầu</a>
                            <a href="" class="dropdown-item">Danh sách đối thủ</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>Giải đấu</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="quanlygiaidau_nam.html" class="dropdown-item">Quản lý giải đấu</a>
                            <a href="quanlydoibongthamgia_nam.html" class="dropdown-item">Quản lý đội bóng và danh sách cầu thủ</a>
                            <a href="quanlylichthidau_nam.html" class="dropdown-item">Quản lý lịch thi đấu</a>
                            <a href="quanlyketqua_nam.html" class="dropdown-item">Quản lý kết quả</a>
                            <a href="kiemduyetcacdoibongthamgiagiaidau_nam.html" class="dropdown-item">Kiểm duyệt các đội bóng tham gia</a>
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


        <!-- Content Start -->
        <div class="content">
            <!-- Navbar Start -->
            <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                <a href="index1.jsp" class="navbar-brand d-flex d-lg-none me-4">
                    <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                </a>
                <a href="#" class="sidebar-toggler flex-shrink-0">
                    <i class="fa fa-bars"></i>
                </a>
                <div class="navbar-nav align-items-center ms-auto">                                            
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <img class="rounded-circle me-lg-2" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                            <span class="d-none d-lg-inline-flex">${sessionScope.account.name}</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                            <a href="#" class="dropdown-item">My Profile</a>
                            <a href="#" class="dropdown-item">Settings</a>
                            <a href="../logout" class="dropdown-item">Log Out</a>
                        </div>
                    </div>
                </div>
            </nav>
            <!-- Navbar End -->           
            <!--Content admin start-->
            <form action="addsanbong" method="post" enctype="multipart/form-data">                
                <label for="fieldName" class="form-label">Tên sân:</label>
                <input type="text" class="form-control"id="fieldName" name="fieldName" required >

                <br>

                <label for="fieldType" class="form-label">Loại sân:</label>
                <input type="number" class="form-control" id="fieldType" name="fieldType" required >

                <br>

                <label for="fieldPrice" class="form-label">Giá tiền (VNĐ):</label>
                <input class="form-control" type="number" id="fieldPrice" name="fieldPrice" required="" >

                <br>

                <label for="fieldImage" class="form-label">Ảnh sân (URL):</label>
                <input class="form-control" type="file" id="fieldImage" name="fieldImage" >

                <br>

                <label for="fieldTime" class="form-label">Chọn thời gian:</label>
                <br>
                <div id="timeOptions" class="form-check">
                    <!-- Danh sách thời gian được tạo bằng JavaScript -->
                </div>

                <br>

                <button type="submit" class="btn btn-primary">Thêm sân bóng</button>
            </form>

            <script>
                // Tạo danh sách thời gian từ 6:30 đến 0:30 với khoảng thời gian 1 tiếng
                var startTime = 6 * 60 + 30; // 6:30 AM
                var endTime = 23 * 60 + 30; // 12:30 AM next day

                var timeOptionsContainer = document.getElementById('timeOptions');
                var dem = 0;
                for (var time = startTime; time <= endTime; time += 60) {
                    dem++;
                    var startHours = Math.floor(time / 60);
                    var startMinutes = time % 60;

                    var endHours = Math.floor((time + 60) / 60);
                    var endMinutes = (time + 60) % 60;

                    var formattedStartTime = (startHours < 10 ? '0' : '') + startHours + ':' + (startMinutes < 10 ? '0' : '') + startMinutes;
                    var formattedEndTime = (endHours < 10 ? '0' : '') + endHours + ':' + (endMinutes < 10 ? '0' : '') + endMinutes;

                    var checkbox = document.createElement('input');
                    checkbox.type = 'checkbox';
                    checkbox.name = 'selectedTimes';
                    checkbox.value = formattedStartTime + ' - ' + formattedEndTime;
                    checkbox.className = 'form-check-input';
                    var label = document.createElement('label');
                    label.appendChild(checkbox);
                    label.appendChild(document.createTextNode(formattedStartTime + ' - ' + formattedEndTime));
                    label.className = 'form-check-label';
                    timeOptionsContainer.appendChild(label);
                    if (dem / 10 == 0) {
                        timeOptionsContainer.appendChild(document.createElement('br'));
                    }
                }
            </script>
            <!--Content admin end-->
           <!-- Footer Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light rounded-top p-4">
                    <div class="row">
                        <div class="col-12 col-sm-6 text-center text-sm-start">
                            <a href="index1.jsp">FBK74 Nơi tôn vinh bóng đá</a>, All Right Reserved. 
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
    <!--    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/chart/chart.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>
