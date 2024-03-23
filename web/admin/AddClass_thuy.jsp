<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset = UTF-8" %>
<html lang="en">

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
        .invalid-feedback {
            display: none;
            color: red;
        }
        .is-invalid + .invalid-feedback {
            display: block;
        }
    </style>
    <body>
        <div class="container-xxl position-relative bg-white d-flex p-0">
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
                                <a href="approve_opponent" class="dropdown-item">Danh sách đối thủ</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>Giải đấu</a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <a href="frontend.nam/AdminTournaments" class="dropdown-item">Quản lý giải đấu</a>
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


            <!-- Content Start -->
            <div class="content">
                <!-- Navbar Start -->
                <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
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
                    <h2 class="text-primary mb-4">Thêm lớp học</h2>
                    <jsp:include page="../common/Message.jsp" />

                    <form id="addCourseForm" action="addclass?idCourse=${idCourse}" method="post" >
                        <div class="mb-3">
                            <label for="name" class="form-label">ID Lớp:</label>
                            <input type="text" class="form-control" id="classId" name="classId" value="${classId}" disabled="">
                            <div class="invalid-feedback">
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="name" class="form-label">Tên HLV:</label>
                            <input type="text" class="form-control" id="nameheadcoach" name="nameheadcoach" value="${course.getCoachName()}" required>
                            <div class="invalid-feedback">
                                
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="name" class="form-label">Số điện thoại HLV</label>
                            <textarea class="form-control" id="phoneheadcoach" name="phoneheadcoach"  required>${course.getCoachPhoneNumber()}</textarea>
                            <div class="invalid-feedback">
                               
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="name" class="form-label">Số lượng học sinh:</label>
                            <input type="number" id="numberStudent" class="form-control" name="numberStudent" min="1" max="100" value="${course.getNumberOfStudent()}" required>
                            <div class="invalid-feedback">
                                
                            </div>
                        </div>              

                        <button type="submit" class="btn btn-primary">Thêm Lớp</button>
                    </form>
                </div>



                <script>
                    document.addEventListener('DOMContentLoaded', function () {
                        const nameheadcoach = document.getElementById('nameheadcoach');
                        const phoneheadcoach = document.getElementById('phoneheadcoach');
                        const numberStudent = document.getElementById('numberStudent');

                        function showValidationError(inputElement, message) {
                            const feedbackElement = inputElement.nextElementSibling;
                            feedbackElement.style.display = 'block';
                            feedbackElement.textContent = message;
                            inputElement.classList.add('is-invalid');
                        }

                        function clearValidationError(inputElement) {
                            const feedbackElement = inputElement.nextElementSibling;
                            feedbackElement.style.display = 'none';
                            feedbackElement.textContent = '';
                            inputElement.classList.remove('is-invalid');
                        }

                        nameheadcoach.addEventListener('input', function () {
                            // Regex cho kí tự tiếng Việt (không chứa số)
                            const nameRegex = /^[a-zA-ZàáâäãèéêëìíîïòóôöùúûüýÿăđĩũơưẠạảÁÀãẢâẤầẫẩậăắằẵẳặèÉÈẻẼêếềễểệìÍÌỉĨịòÓÒỏÕôốồỗổộơớờỡởợùÚÙủŨụỤýÝỳỷỸỵ\s]+$/;
                            if (!nameRegex.test(nameheadcoach.value.trim())) {
                                showValidationError(nameheadcoach, 'Tên không được chứa số');
                            } else {
                                clearValidationError(nameheadcoach);
                            }
                        });

                        phoneheadcoach.addEventListener('input', function () {
                            const phoneRegex = /^[0-9]{10,11}$/;
                            if (!phoneRegex.test(phoneheadcoach.value.trim())) {
                                showValidationError(phoneheadcoach, 'Số điện thoại không hợp lệ.');
                            } else {
                                clearValidationError(phoneheadcoach);
                            }
                        });

                        numberStudent.addEventListener('input', function () {
                            const number = parseInt(numberStudent.value, 10);
                            if (isNaN(number) || number < 1 || number > 100) {
                                showValidationError(numberStudent, 'Số lượng học sinh phải từ 1 đến 100.');
                            } else {
                                clearValidationError(numberStudent);
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