<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
    Document   : index1
    Created on : Feb 26, 2024, 4:39:54 PM
    Author     : nhatk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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
            body {
                margin: 0;
                padding: 0;
                font-family: 'Arial', sans-serif;
            }

            .card {
                transition: transform 0.3s ease-in-out;
            }

            .card:hover {
                transform: translateY(-5px);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            }

            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
                transition: all 0.3s ease-in-out;
            }

            .btn-primary:hover {
                background-color: #0056b3;
                border-color: #0056b3;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
            }

            .table {
                margin-bottom: 0;
            }

            body {
                font-family: 'Nunito', sans-serif;
                background-color: #f4f9fc;
                color: #333;
                margin: 0;
                font-size: 16px;
            }

            .card {
                background-color: #ffffff;
                border-radius: 12px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
                margin-top: 30px;
                overflow: hidden;
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
                    <a href="../index1.jsp" class="sidebar-toggler flex-shrink-0">
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
                                <a href="../../logout" class="dropdown-item">Log Out</a>
                            </div>
                        </div>
                    </div>
                </nav>
                <!-- Navbar End -->           

                <!-- Main Content Start -->
                <div class="container mt-5">

                    <!-- Card Start -->
                    <div class="card">
                        <div class="card-header bg-primary text-white">
                            Danh Sách Đội Bóng ${team.name}
                        </div>
                        <div class="card-body">
                            <a href="AdminAddMemberOfTeam?IDTeam=${IDTeam}" class="btn btn-success mb-3">
                                <i class="fas fa-plus"></i> Thêm Thành Viên
                            </a>

                            <table class="table table-hover">
                                <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">STT</th>
                                        <th scope="col">Cầu Thủ</th>
                                        <th scope="col">Số Áo</th>
                                        <th scope="col">Số Điện Thoại</th>
                                        <th scope="col">Mô Tả</th>
                                        <th scope="col">Chức Năng</th>
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
                                                <a href="AdminEditMemberOfTeam?memberID=${loop.id}&IDTeam=${IDTeam}" class="btn btn-primary btn-sm">
                                                    <i class="fas fa-edit"></i> Chỉnh Sửa
                                                </a>
                                                <a href="AdminDeleteMember?id=${loop.id}&IDTeam=${IDTeam}" class="btn btn-danger btn-sm">
                                                    <i class="fas fa-trash-alt"></i> Xóa
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- Card End -->
                </div>
                <!-- Main Content End -->


                <script>
                    function confirmDeletion() {
                        var confirmation = confirm("Bạn có chắc chắn muốn xóa giải đấu này không?");
                        if (confirmation) {
                            // Logic to delete the tournament
                            console.log("Giải đấu đã được xóa.");
                            // Redirect or refresh the page
                            window.location.href = 'quanlygiaidau_nam.html';
                        }
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
