<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="utf-8">
        <title>DASHMIN - Bootstrap Admin Template</title>
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
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>
<style>
              .text-primary, .course-title {
            text-align: center;
            margin-top: 20px;
            font-weight: bold;
            font-size: 20px;
            margin-bottom: 30px; /* Space between cards */
            background-color: #e0ecf7; /* Light background */
            border-radius: 20px;
            overflow: hidden; /* Ensures the child elements do not overflow */
            box-shadow: 0 4px 8px rgba(0,0,0,0.1); /* Adds subtle shadow */


        }
        .text-primary{
            font-size: 40px;
            color: #06A3DA;


        }
        .table {
            border-collapse: collapse;
            width: 100%;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .table thead th {
            background-color: #06A3DA;
            color: #ffffff;
            padding: 5px 10px;
            text-align: left;
             font-size: 14px;
        }

        .table tbody tr:nth-child(odd) {
            background-color: #f2f2f2;
        }

        .table tbody tr:hover {
            background-color: #ddd;
            cursor: pointer;
        }

        .table td, .table th {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }
    </style>
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
                <!--thanh nav dọc bên trái-->
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
                                <a href="ManagerCourse" class="dropdown-item">Quản lý lớp học</a>

                            </div>
                        </div>
                        <div class="nav-item">
                            <a href="manageuser?action=viewList" class="nav-link " ><i class="fa fa-laptop me-2"></i>Quản lý người dùng</a>

                        </div>
                        <div class="nav-item">
                            <a href="product" class="nav-link" ><i class="fa fa-laptop me-2"></i>Quản lý dịch vụ</a>                            
                        </div>

                    </div>
                </nav>
            </div>
            <!-- Sidebar End -->


            <!-- Content Start -->
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
                <div class="container">
                    <h2 class="text-primary mb-4">Cập nhật khóa học</h2>
                    <jsp:include page="../common/Message.jsp" />

                           <form id="addCourseForm" action="UpdateCourse" method="post" onsubmit="return validateForm()" enctype="multipart/form-data">
                        <div class="mb-3">
                            <label for="name" class="form-label">Tên khóa học:</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                            <span id="nameError" class="error"></span>
                        </div>

                        <div class="mb-3">
                            <label for="description" class="form-label">Giới thiệu:</label>
                            <textarea class="form-control" id="description" name="description" required></textarea>
                            <span id="descriptionError" class="error"></span>
                        </div>

                        <div class="mb-3">
                            <label for="timeRegist" class="form-label">Thời gian mở đăng ký:</label>
                            <input type="date" class="form-control" id="timeRegist" name="timeRegist" required>
                            <span id="timeRegistError" class="error"></span>
                        </div>

                        <div class="mb-3">
                            <label for="endDate" class="form-label">Thời gian đóng đăng ký:</label>
                            <input type="date" class="form-control" id="endDate" name="endDate" required>
                            <span id="endDateError" class="error"></span>
                        </div>

                        <div class="mb-3">
                            <label for="startDate" class="form-label">Thời gian bắt đầu:</label>
                            <input type="date" class="form-control" id="startDate" name="startDate" required>
                            <span id="startDateError" class="error"></span>
                        </div>

                        <div class="mb-3">
                            <label for="tuition" class="form-label">Học phí:</label>
                            <input type="number" class="form-control" id="tuition" name="tuition" required>
                            <span id="tuitionError" class="error"></span>
                        </div>

                        <div class="mb-3">
                            <label for="img1" class="form-label">Hình ảnh</label>
                            <input type="file" class="form-control" id="img1" name="img1" required>
                            <span id="img1Error" class="error"></span>
                        </div>

                        <button type="submit" class="btn btn-primary">Thêm khóa học</button>
                    </form>
                </div>


         <script>
                    document.addEventListener('DOMContentLoaded', function () {
                        const nameInput = document.getElementById('name');
                        const endDateInput = document.getElementById('endDate');
                        const startDateInput = document.getElementById('startDate');
                        const timeRegistInput = document.getElementById('timeRegist');
                        const tuitionInput = document.getElementById('tuition');
                        const img1Input = document.getElementById('img1');

                        const nameError = document.getElementById('nameError');
                        const endDateError = document.getElementById('endDateError');
                        const startDateError = document.getElementById('startDateError');
                        const timeRegistError = document.getElementById('timeRegistError');
                        const tuitionError = document.getElementById('tuitionError');
                        const img1Error = document.getElementById('img1Error');

                        function validateName() {
                            const nameRegex = /^[^\d]+$/;
                            if (!nameRegex.test(nameInput.value.trim())) {
                                
                                nameError.style.color = 'red'; // Thêm màu đỏ cho thông báo lỗi
                            } else {
                                nameError.textContent = '';
                            }
                        }

                        function validateEndDate() {
                            const timeRegist = new Date(timeRegistInput.value);
                            const endDate = new Date(endDateInput.value);
                            if (endDate <= timeRegist) {
                                endDateError.textContent = 'Thời gian đóng đăng ký phải sau thời gian mở đăng ký.';
                                endDateError.style.color = 'red'; // Thêm màu đỏ cho thông báo lỗi
                            } else {
                                endDateError.textContent = '';
                            }
                        }

                        function validateStartDate() {
                            const endDate = new Date(endDateInput.value);
                            const startDate = new Date(startDateInput.value);
                            if (startDate <= endDate) {
                                startDateError.textContent = 'Thời gian bắt đầu phải sau thời gian đóng đăng ký.';
                                startDateError.style.color = 'red'; // Thêm màu đỏ cho thông báo lỗi
                            } else {
                                startDateError.textContent = '';
                            }
                        }

                        function validateTimeRegist() {
                            const currentDate = new Date();
                            const timeRegist = new Date(timeRegistInput.value);
                            if (timeRegist < currentDate) {
                                timeRegistError.textContent = 'Thời gian mở đăng ký phải bằng hoặc sau ngày hiện tại.';
                                timeRegistError.style.color = 'red'; // Thêm màu đỏ cho thông báo lỗi
                            } else {
                                timeRegistError.textContent = '';
                            }
                        }

                        function validateTuition() {
                            if (!tuitionInput.value.trim() || isNaN(tuitionInput.value) || parseInt(tuitionInput.value) <= 0) {
                                tuitionError.textContent = 'Vui lòng nhập học phí hợp lệ.';
                                tuitionError.style.color = 'red'; // Thêm màu đỏ cho thông báo lỗi
                            } else {
                                tuitionError.textContent = '';
                            }
                        }

                        function validateImg1() {
                            if (!img1Input.value) {
                                img1Error.textContent = 'Vui lòng chọn hình ảnh.';
                                img1Error.style.color = 'red'; // Thêm màu đỏ cho thông báo lỗi
                            } else {
                                img1Error.textContent = '';
                            }
                        }

                        nameInput.addEventListener('input', validateName);
                        endDateInput.addEventListener('input', validateEndDate);
                        startDateInput.addEventListener('input', validateStartDate);
                        timeRegistInput.addEventListener('input', validateTimeRegist);
                        tuitionInput.addEventListener('input', validateTuition);
                        img1Input.addEventListener('input', validateImg1);

                        const form = document.getElementById('addCourseForm');
                        form.addEventListener('submit', function (event) {
                            validateName();
                            validateEndDate();
                            validateStartDate();
                            validateTimeRegist();
                            validateTuition();
                            validateImg1();

                            if (nameError.textContent || endDateError.textContent || startDateError.textContent || timeRegistError.textContent || tuitionError.textContent || img1Error.textContent) {
                                event.preventDefault();
                            }
                        });
                    });
                </script>
                <!-- Recent Sales Start -->

                
                <!-- Widgets End -->


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
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/chart/chart.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/tempusdominus/js/moment.min.js"></script>
        <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

</html>