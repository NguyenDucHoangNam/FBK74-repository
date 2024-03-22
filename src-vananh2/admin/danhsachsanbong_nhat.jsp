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
        <link rel="stylesheet" href="css/style_nhat.css"/>>
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
            <div class="text-end m-3">
                <button class="btn btn-primary mt-3" onclick="addSanmoi()">Thêm sân mới</button>
            </div>
            <div class="container mt-5 text-center">
                <h2>Thông tin sân bóng</h2>
                <table class="table" style="width:100%">
                    <thead>
                        <tr>
                            <th>Tên sân</th>
                            <th style="width:20%">Hình ảnh</th>
                            <th >Loại sân</th>
                            <th>Giá tiền</th>
                            <th style="width: 20%">Khung giờ có thể đá</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="list" items="${requestScope.listffandffs}">
                            <tr id="${list[0].footballField.IDFootballField}">
                                <td>${list[0].footballField.name}</td>
                                <td id="${list[0].footballField.image}">
                                    <img src="../img_nhat/${list[0].footballField.image}" alt="Hình ảnh sân" style="width: 100%; height: 80px" data-bs-toggle="modal" data-bs-target="#myModal" onclick="getImageId(this)">
                                </td>
                                <td>Sân ${list[0].footballField.typeofFootballField} người/Đội</td>
                                <td>${list[0].footballField.price} VNĐ</td>
                                <td>
                                    <select class="form-control" >
                                        <c:forEach var="it" items="${list}">
                                            <option>${it.startTime} - ${it.endTime}</option>                                      
                                        </c:forEach>
                                    </select>
                                </td>
                                <td>
                                    <button class="btn btn-danger" type="button" onclick ="editSanBong(${list[0].footballField.IDFootballField})">
                                        Chỉnh sửa
                                    </button>
                                    <button class="btn btn-dark" type="button" onclick="deleteSanBong(${list[0].footballField.IDFootballField}, this)">
                                        Xóa sân bóng
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <script>
                function getImageId(imgElement) {
                    // Lấy parentNode (thẻ <td>) của thẻ <img>
                    var tdElement = imgElement.parentNode;
                    // Lấy id của thẻ <td>
                    var tdId = tdElement.id;
                    var imgElement1 = document.getElementById('getimg');

                    // Chèn id vào src
                    imgElement1.src = "../img_nhat/" + tdId;
                }
                var footballFieldId1;
                function editSanBong(footballFieldId) {
                    footballFieldId1 = footballFieldId;
                    // Chuyển hướng đến trang /admin/updatesanbong với thông tin của list
                    window.location.href = 'updatesanbong?footballFieldId=' + footballFieldId;

                }
                function deleteSanBong(footballFieldId) {
                    // Hiển thị modal xác nhận
                    $('#confirmDeleteModal').modal('show');

                    // Lưu ID sân bóng vào input hidden
                    $('#deleteFootballFieldId').val(footballFieldId);
                }

                function confirmDelete() {
                    // Lấy ID sân bóng từ input hidden
                    var footballFieldId = $('#deleteFootballFieldId').val();

                    // Ẩn modal
                    $('#confirmDeleteModal').modal('hide');

                    // Gửi yêu cầu Ajax khi nhấn nút Xác nhận
                    $.ajax({
                        type: "POST",
                        url: "http://localhost:8080/FBK74/admin/deletesanbong",
                        data: {footballFieldId: footballFieldId},
                        success: function (response) {
                            // Xử lý phản hồi từ máy chủ nếu cần
                            console.log(response);

                            // Xóa thẻ <tr> khi Ajax thành công
                            $('tr#' + footballFieldId).remove();
                        },
                        error: function (error) {
                            // Xử lý lỗi nếu có
                            console.error("Error deleting football field:", error);
                        }
                    });
                }
                function addSanmoi() {
                    window.location.href = 'addsanbong';
                }
            </script>
            <!--start model ìnormation-->            
            <!--end model information-->

            <div class="modal fade" id="myModal" role="dialog"
                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content border-dark border-3">
                        <div class="modal-header border-bottom-2">
                            <h5 class="modal-title" id="exampleModalLabel"
                                style="margin: auto">Thông tin ảnh</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    style="margin-left: 0px"></button>
                        </div>
                        <div class="modal-body w-100">
                            <!-- Nội dung của modal sẽ được hiển thị ở đây -->

                            <img id="getimg" src="" alt="Hình ảnh sân" style="width: 100%;height: 80vh">
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Xác nhận Xóa Sân Bóng -->
            <div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="confirmDeleteModalLabel" style="margin: auto">Xác nhận Xóa Sân Bóng</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <p class="text-center font-weight-bold">Bạn có chắc chắn muốn xóa sân bóng không?</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary m-1" data-bs-dismiss="modal">Hủy</button>
                            <button type="button" class="btn btn-danger m-1" onclick="confirmDelete()">Xác nhận</button>
                        </div>

                        <!-- Thêm input hidden để lưu trữ ID của <tr> -->
                        <input type="hidden" id="deleteFootballFieldId">
                    </div>
                </div>
            </div>

            <!--Content admin start-->


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
