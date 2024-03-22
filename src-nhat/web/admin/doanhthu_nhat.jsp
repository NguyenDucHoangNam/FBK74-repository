<%-- 
    Document   : index1
    Created on : Feb 26, 2024, 4:39:54 PM
    Author     : nhatk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <!-- Include jQuery UI library with Datepicker widget -->
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
        <link rel="stylesheet"
              href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <style>
            .error-message {
                color: #dc3545;
                font-size: 80%;
            }
        </style>
        <script>
            $(document).ready(function () {
                // Kích hoạt Datepicker với định dạng dd/MM/yyyy
                $("#ngayFrom").datepicker({
                    dateFormat: "dd/mm/yy",
                    changeMonth: true,
                    changeYear: true
                });
                $("#ngayTo").datepicker({
                    dateFormat: "dd/mm/yy",
                    changeMonth: true,
                    changeYear: true
                });
            });

            function validateForm() {
                var ngayFrom = document.getElementById("ngayFrom").value;
                var ngayTo = document.getElementById("ngayTo").value;
                var isValid = true;

                if (ngayFrom === "") {
                    document.getElementById("ngayFromError").innerHTML = "Vui lòng nhập Từ ngày.";
                    document.getElementById("ngayFrom").classList.add("border-danger");
                    isValid = false;
                } else {
                    document.getElementById("ngayFromError").innerHTML = "";
                    document.getElementById("ngayFrom").classList.remove("border-danger");
                }

                if (ngayTo === "") {
                    document.getElementById("ngayToError").innerHTML = "Vui lòng nhập Đến ngày.";
                    document.getElementById("ngayTo").classList.add("border-danger");
                    isValid = false;
                } else {
                    document.getElementById("ngayToError").innerHTML = "";
                    document.getElementById("ngayTo").classList.remove("border-danger");
                }

                return isValid;
            }

            function validateInput(input) {
                if (input.value.trim() === "") {
                    var errorElementId = input.id + "Error";
                    document.getElementById(errorElementId).innerHTML = "Vui lòng nhập thông tin.";
                    input.classList.add("border-danger");
                } else {
                    var errorElementId = input.id + "Error";
                    document.getElementById(errorElementId).innerHTML = "";
                    input.classList.remove("border-danger");
                }
            }

            document.addEventListener("DOMContentLoaded", function () {
                var form = document.getElementById("searchForm");
                form.addEventListener("submit", function (event) {
                    var invoiceCodeInput = document.getElementById("invoiceCode");
                    if (invoiceCodeInput.value.trim() === "") {
                        invoiceCodeInput.classList.add("is-invalid");
                        event.preventDefault();
                    }
                });

                document.getElementById("invoiceCode").addEventListener("input", function () {
                    if (this.value.trim() !== "") {
                        this.classList.remove("is-invalid");
                    }
                });
            });

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

                <!--content admin start-->
                <div class="container-fluid">
                    <form id="myForm" action="doanhthu" method="POST" onsubmit="return validateForm()">
                        <div class="row mt-5">
                            <div class="col-4">
                                <label for="ngayFrom" class="labelform" style="display: inline;width: 30%">Từ ngày: </label>
                                <input style="width: 60%; display: inline"type="text" class="form-control" id="ngayFrom" name="ngayFrom" autocomplete="off" onchange="validateInput(this)">
                                <div id="ngayFromError" class="error-message" style="margin-left: 30%"></div>
                            </div>
                            <div class="col-4">
                                <label for="ngayTo" class="labelform" style="display: inline;width: 30%">Đến ngày: </label>
                                <input style="width: 60%; display: inline" type="text" class="form-control" id="ngayTo" name="ngayTo" autocomplete="off" onchange="validateInput(this)">
                                <div id="ngayToError" class="error-message" style="margin-left: 30%"></div>
                            </div>
                            <button type="submit" class="btn btn-outline-dark col-1" style="margin-left: -3%">Gửi</button>
                        </div>                        
                    </form>

                    <form id="searchForm" action="doanhthu" method="POST" class="mt-3">
                        <div class="form-group">
                            <input style="display: inline;width: 25%" type="text" class="form-control" id="invoiceCode" name="invoiceCode" placeholder="Nhập hóa đơn cần tìm...">
                            <button style="display: inline;width: 10%" type="submit" class="btn btn-primary">Tìm kiếm</button>
                            <div class="invalid-feedback">Hãy nhập mã hóa đơn!</div>
                        </div>
                    </form>

                    <h2 class="mt-4 text-center">Doanh thu</h2>
                    <table class="table table-striped mt-4">
                        <thead>
                            <tr>
                                <th scope="col">Ngày thanh toán</th>
                                <th scope="col">Mã hóa đơn</th>
                                <th scope="col">Loại tiền</th>
                                <th scope="col">Nv thanh toán</th>
                                <th scope="col">Số tiền</th>
                                <th scope="col">Trạng thái</th>
                                <th scope="col">&nbsp;</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${nobill ne null}">
                            <h3 style="color: red">${nobill}</h3>
                        </c:if>
                        <c:forEach var="bill" items="${listBill}">
                            <tr id="${bill.IDBill}">
                                <td>${bill.paymentDate}</td>
                                <td>${bill.invoice}</td>
                                <c:if test="${not bill.invoice.contains('A') && bill.registFindOpponent!=null}">
                                    <td>Cọc ĐK đối</td>
                                </c:if>
                                <c:if test="${not bill.invoice.contains('A') && bill.registFindOpponent==null}">
                                    <td>Cọc Sân</td>
                                </c:if>
                                <c:if test="${bill.invoice.contains('A')}">
                                    <td>Thanh toán sân</td>
                                </c:if>
                                <td>${bill.account2.name}</td>
                                <c:if test="${not bill.invoice.contains('A')}">
                                    <td>100000 VNĐ</td>
                                </c:if>
                                <c:if test="${bill.invoice.contains('A')}">
                                    <td>${bill.totalPrice} VNĐ</td>
                                </c:if>
                                <!--check xem nếu là đơn cọc thì đã hoàn hãy thanh toán và tiền hóa đơn thì luôn thanh toán-->
                                <c:choose>
                                    <c:when test="${bill.registeredFootballField.status==5 && bill.registFindOpponent==null}">
                                        <td>Đã hoàn tiền</td>
                                    </c:when>
                                    <c:when test="${bill.registeredFootballField==null && bill.registFindOpponent.status==5}">
                                        <td>Đã hoàn tiền</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>Đã thanh toán</td>
                                    </c:otherwise>
                                </c:choose>
                                <td><a href="chitiethoadon?idBill=${bill.IDBill}" class="btn btn-info">Chi tiết hóa đơn</a></td>
                            </tr>
                        </c:forEach>
                        <c:if test="${check==null}">
                            <tr>
                                <td colspan="3"></td>
                                <td><strong>Total:</strong></td>
                                <td><strong>${doanhThu} VNĐ</strong></td>
                            </tr>
                        </c:if>

                        </tbody>
                    </table>
                </div>

                <!--content admin end-->

                <!-- Footer Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-light rounded-top p-4">
                        <div class="row">
                            <div class="col-12 col-sm-6 text-center text-sm-start">
                                <a href="index1.html">FBK74 Nơi tôn vinh bóng đá</a>, All Right Reserved. 
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
        <!--<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>-->
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
