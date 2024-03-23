<%-- 
    Document   : chinhsuagiaidau_nam
    Created on : Feb 26, 2024, 4:56:06 PM
    Author     : nhatk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.sql.Time" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
        <!-- Include jQuery UI library with Datepicker widget -->
        <link rel="stylesheet"
              href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
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
        <script>
            $(document).ready(function () {
                // Kích hoạt Datepicker với định dạng dd/MM/yyyy
                $("#ngay1").datepicker({
                    dateFormat: "dd/mm/yy",
                    changeMonth: true,
                    changeYear: true
                });
            });
            function chuyenTrang() {
                // Lấy giá trị ngày từ input
                var ngay = document.getElementById("ngay1").value;

                // Tạo một form ẩn
                var form = document.createElement("form");
                form.method = "POST";
                form.action = "quanlysanbong";  // Địa chỉ của Servlet

                // Thêm input chứa giá trị ngày vào form
                var inputNgay = document.createElement("input");
                inputNgay.type = "hidden";
                inputNgay.name = "ngay1";
                inputNgay.value = ngay;
                form.appendChild(inputNgay);

                // Thêm form vào body và submit form
                document.body.appendChild(form);
                form.submit();

            }
        </script>
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
                <div class="container-fluid mt-5 text-center">
                    <h2>Quản lý sân bóng</h2>
                    <div class="row">
                        <div class="col col-12">
                            <label for="ngay" class="labelform">Ngày: </label>
                            <input type="text" class="form-control" id="ngay1" name="ngay1" 
                                   autocomplete="off" value="${requestScope.ngay1}" onchange="chuyenTrang()"/>
                        </div>
                    </div>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Thời gian</th>
                                <th>Sân</th>
                                <th>Tên đại diện</th>
                                <th>Số điện thoại</th>
                                <th>Tiền cọc</th>
                                <th>Giá tiền</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody> 
                            <c:set var="currentTime" value="<%= new java.sql.Time(new java.util.Date().getTime())%>"/>

                            <!--rFF: đánh dấu đó id sân đk, sT: là id lịch giải, sS:id lịch khóa học-->
                            <c:forEach var="list" items="${requestScope.listTotalSchedule}">
                                <c:if test="${list.registeredFootballField!=null}">
                                    <tr id="${list.registeredFootballField.IDRegisteredFootballField}-rFF">
                                        <td>${list.registeredFootballField.footballFieldSchedule.startTime}-${list.registeredFootballField.footballFieldSchedule.endTime}</td>
                                        <td>${list.registeredFootballField.footballFieldSchedule.footballField.name}</td>
                                        <td>${list.registeredFootballField.name}</td>
                                        <td>${list.registeredFootballField.phoneNumber}</td>
                                        <td>${list.registeredFootballField.deposit}</td>
                                        <td>${list.registeredFootballField.footballFieldSchedule.footballField.price}</td>
                
                                        <td><a href="thanhtoanbill?idDonthanhtoan=${list.registeredFootballField.IDRegisteredFootballField}&typeDonthanhtoan=rFF" class="btn btn-light">Thanh toán</a>
                                        </td>
                                    </tr>
                                </c:if>
                                <c:if test="${list.scheduleTournament!=null}">
                                    <tr id="${list.scheduleTournament.IDScheduleTournament}-sT">
                                        <td>${list.scheduleTournament.footballFieldSchedule.startTime}-${list.scheduleTournament.footballFieldSchedule.endTime}</td>
                                        <td>${list.scheduleTournament.footballFieldSchedule.footballField.name}</td>
                                        <td>Giải đấu ${list.scheduleTournament.tournament.name}</td>
                                        <td></td>
                                        <td></td>
                                        <td>${list.scheduleTournament.footballFieldSchedule.footballField.price}</td>


                                        

                                        <td><a href="thanhtoanbill?idDonthanhtoan=${list.scheduleTournament.IDScheduleTournament}&typeDonthanhtoan=sT" class="btn btn-light">Thanh toán</a>
                                        </td>
                                    </tr>
                                </c:if>
                                <c:if test="${list.studySchedule!=null}">
                                    <tr id="${list.studySchedule.IDStudySchedule}-sS">
                                        <td>${list.studySchedule.footballFieldSchedule.startTime}-${list.studySchedule.footballFieldSchedule.endTime}</td>
                                        <td>${list.studySchedule.footballFieldSchedule.footballField.name}</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td>${list.studySchedule.footballFieldSchedule.footballField.price}</td>
                                        
                                        <td><a href="thanhtoanbill?idDonthanhtoan=${list.studySchedule.IDStudySchedule}&typeDonthanhtoan=sS" class="btn btn-light">Thanh toán</a>                                            
                                        </td>
                                    </tr>
                                </c:if>

                            </c:forEach>
                            <!-- Add more rows as needed -->
                        </tbody>
                    </table>
                </div>
                <!--Content admin end-->
                <!--modal hiển thị hoàn cọc-->
                <!-- Modal -->
                <div class="modal fade" id="refundModal" tabindex="-1" aria-labelledby="refundModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="refundModalLabel">Thông tin hoàn lại tiền cho 2 người</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Thông tin cho người thứ nhất 
                                <ul>
                                    <li><strong>Tên:</strong> <span id="name1"></span></li>
                                    <li><strong>UserName:</strong> <span id="username1"></span></li>
                                    <li><strong>Số điện thoại:</strong> <span id="phone1"></span></li>
                                    <li><strong>Email:</strong> <span id="email1"></span></li>
                                    <li><strong>Tên ngân hàng:</strong> <span id="bankName1"></span></li>
                                    <li><strong>Số tài khoản:</strong> <span id="accountNumber1"></span></li>
                                    <li><strong>Số tiền hoàn:</strong> <span id="refundAmount1"></span></li>
                                </ul>

                                Thông tin cho người thứ hai 
                                <ul>
                                    <li><strong>Tên:</strong> <span id="name2"></span></li>
                                    <li><strong>UserName:</strong> <span id="username2"></span></li>
                                    <li><strong>Số điện thoại:</strong> <span id="phone2"></span></li>
                                    <li><strong>Email:</strong> <span id="email2"></span></li>
                                    <li><strong>Tên ngân hàng:</strong> <span id="bankName2"></span></li>
                                    <li><strong>Số tài khoản:</strong> <span id="accountNumber2"></span></li>
                                    <li><strong>Số tiền hoàn:</strong> <span id="refundAmount2"></span></li>
                                </ul>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                <button type="button" class="btn btn-primary" id="confirmRefund">Hoàn cọc</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- end modal hoàn tiền -->
                <!--JS sử lý-->
                <script>
//                    $(document).ready(function () {
//                        $(".btn1").click(function () {
//                            // Lấy ID của thẻ "tr" gần nhất
//                            var closestTrId = $(this).closest("tr").attr("id");
//
//                            // Tách ID bằng dấu "-"
//                            var idParts = closestTrId.split("-");
//
//                            // Lưu vào biến idDon và loaiDon
//                            var idDon = idParts[0];
//                            var loaiDon = idParts[1];
//
//                            // Gửi yêu cầu AJAX
//                            $.ajax({
//                                type: "GET",
//                                url: "http://localhost:8080/FBK74/admin/huythanhtoanbill",
//                                data: {idDon: idDon, loaiDon: loaiDon},
//                                dataType: "JSON",
//                                success: function (data) {
//                                    // Xử lý phản hồi từ máy chủ nếu cần
//                                    console.log(data);
//                                },
//                                error: function (xhr, status, error) {
//                                    // Xử lý lỗi nếu có
//                                    console.error(error);
//                                }
//                            });
//                            return false; // Tránh hành động mặc định của thẻ "a"
//                        });
//                    });

                </script>

                <!-- Footer Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-light rounded-top p-4">
                        <div class="row">
                            <div class="col-12 col-sm-6 text-center text-sm-start">
                                <a href="index.jsp">FBK74 Nơi tôn vinh bóng đá</a>, All Right Reserved. 
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
<!--        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>-->
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
