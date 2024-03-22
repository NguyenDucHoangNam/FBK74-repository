

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
            <div class="container my-5">
                <div class="row">
                    <!-- Field Booking Form -->
                    <div class="col-md-6 mb-5">
                        <div class="booking-form p-4 shadow" data-aos="fade-right" data-aos-delay="100">
                            <h2 class="text-center mb-3">Thông tin sân bóng</h2>                
                            <form>
                                <div class="mb-3">
                                    <label for="fieldName" class="form-label">Tên Sân</label>
                                    <input type="text" class="form-control" id="fieldName" value="${donThanhToan.footballFieldSchedule.footballField.name}" readonly>
                                </div>
                                <div class="mb-3">
                                    <label for="fieldType" class="form-label">Loại Sân</label>
                                    <input type="text" class="form-control" id="fieldType" value="Sân gồm ${donThanhToan.footballFieldSchedule.footballField.typeofFootballField} người/ Đội" readonly>
                                </div>
                                <div class="mb-3">
                                    <label for="startTime" class="form-label">Thời gian bắt đầu</label>
                                    <input type="text" class="form-control" id="startTime" value="${donThanhToan.footballFieldSchedule.startTime}" readonly>
                                </div>
                                <div class="mb-3">
                                    <label for="endTime" class="form-label">Thời gian kết thúc</label>
                                    <input type="text" class="form-control" id="endTime" value="${donThanhToan.footballFieldSchedule.endTime}"readonly>
                                </div>
                                <div class="mb-3">
                                    <label for="price" class="form-label">Giá tiền</label>
                                    <input type="text" class="form-control" id="price" value="${donThanhToan.footballFieldSchedule.footballField.price} VNĐ" readonly>
                                </div>
                                <c:if test="${typeDonthanhtoan eq 'rFF'}">
                                    <div class="mb-3">
                                        <label for="deposit" class="form-label">Tiền cọc</label>                                    
                                        <input type="text" class="form-control" id="deposit" value="${donThanhToan.deposit} VNĐ" readonly>                                    
                                    </div>
                                </c:if>
                            </form>
                        </div>
                    </div>
                    <!-- Deposit Information -->
                    <div class="col-md-6 mb-5">
                        <div class="booking-info p-4 shadow" data-aos="fade-left" data-aos-delay="100">
                            <h2 class="text-center mb-3">Thông tin hóa đơn</h2>
                            <form action="thanhtoanbill" method="post" id="myForm">  
                                <input type="text" value="${idDonthanhtoan}" name="idDonthanhtoan" hidden="">
                                <input type="text" value="${typeDonthanhtoan}" name="typeDonthanhtoan" hidden="">
                                <input type="text" class="form-control" id="price" value="${donThanhToan.footballFieldSchedule.footballField.price}" hidden="">
                                <c:if test="${typeDonthanhtoan eq 'rFF'}">                                                                                            
                                    <input type="text" class="form-control" id="deposit" value="${donThanhToan.deposit}" hidden="">                                                                      
                                </c:if>
                                <div class="mb-3">
                                    <label for="bookingTime" class="form-label">Thời gian</label>
                                    <input type="text" class="form-control" id="bookingTime" value="${donThanhToan.date}" name= "bookingTime"readonly>
                                </div>
                                <div class="mb-3">
                                    <label for="bookerName" class="form-label">Tên người đặt</label>
                                    <c:if test="${typeDonthanhtoan eq 'rFF'}">
                                        <input type="text" class="form-control" id="bookerName" value="${donThanhToan.name}" name="bookerName" readonly="">
                                    </c:if>
                                    <c:if test="${typeDonthanhtoan eq 'sT'}">
                                        <input type="text" class="form-control" id="bookerName" value="tên giải tổ chức" name="bookerName" readonly="">
                                    </c:if>
                                    <c:if test="${typeDonthanhtoan eq 'sS'}">
                                        <input type="text" class="form-control" id="bookerName" value="tên khóa học" name="bookerName" readonly="">
                                    </c:if>
                                </div>
                                <div class="mb-3">
                                    <label for="phone" class="form-label">Số điện thoại</label>
                                    <c:if test="${typeDonthanhtoan eq 'rFF'}">
                                        <input type="text" class="form-control" id="phone" value="${donThanhToan.phoneNumber}" name="phone" readonly="">
                                    </c:if>
                                </div>

                                <div id="waterContainer" class="mb-3">
                                    <div class="row mb-1">
                                        <div class="col">
                                            <label class="form-label" for="typewater">Loại nước</label>
                                            <select class="form-control" name="typewater" id="typewater">
                                                <c:forEach items="${listProduct}" var="l">
                                                    <option value="${l.name}">${l.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col">
                                            <label class="form-label" for="quantity">Số lượng</label>
                                            <input type="number" class="form-control" name="quantity" value="0">
                                        </div>
                                        <div class="col">
                                            <label class="form-label" for="pricewater">Giá tiền</label>
                                            <input type="text" class="form-control" name="pricewater" value="0">
                                        </div>
                                    </div>
                                </div>

                                <div class="text-center">
                                    <div class="mb-3" id="totalPrice" >
                                        0 VNĐ</div>  
                                    <button type="button" class="btn btn-primary" onclick="themHang()">Thêm hàng (+)</button>
                                    <button type="button" class="btn btn-primary" onclick="submitForm()">Thanh toán</button>
                                </div>
                            </form>
                            <script>
                                // Khởi tạo thẻ div cho tổng hóa đơn
                                var totalPriceElement = document.getElementById('totalPrice');

// Hiển thị giá trị ban đầu cho tổng hóa đơn
                                updateTotalPrice();

// Thêm sự kiện onchange cho các trường loại nước, số lượng, và giá tiền
                                var selectLoaiNuoc = document.querySelector('[name="typewater"]');
                                var inputSoLuong = document.querySelector('[name="quantity"]');
                                var inputGiaTien = document.querySelector('[name="pricewater"]');

                                selectLoaiNuoc.addEventListener('change', updateTotalPrice);
                                inputSoLuong.addEventListener('change', updateTotalPrice);
                                inputGiaTien.addEventListener('change', updateTotalPrice);

                                function updateTotalPrice() {
                                    var waterContainers = document.querySelectorAll('#waterContainer .row');
                                    var totalPrice = 0;

                                    // Fetch and parse #price and #deposit values
                                    var priceValue = parseInt(document.getElementById('price').value || '0', 10); // Default to 0 if not found
                                    var depositValue = parseInt(document.getElementById('deposit') ? document.getElementById('deposit').value : '0', 10); // Default to 0 if not found

                                    waterContainers.forEach(function (container) {
                                        var soLuong = container.querySelector('[name="quantity"]').value;
                                        var giaTien = container.querySelector('[name="pricewater"]').value;
                                        var subtotal = parseInt(soLuong) * parseInt(giaTien);
                                        totalPrice += subtotal;
                                    });

                                    // Add #price and #deposit to total price
                                    totalPrice += priceValue - depositValue;
                                    

                                    // Display total price
                                    totalPriceElement.textContent = 'Tổng hóa đơn: ' + totalPrice + ' VNĐ';
                                }

                                function themHang() {
                                    // Lấy element waterContainer
                                    var waterContainer = document.getElementById('waterContainer');
                                    // Tạo div mới để chứa các trường
                                    var newRow = document.createElement('div');
                                    newRow.className = 'row mb-1';

                                    // Tạo div cho Loại nước
                                    var colLoaiNuoc = document.createElement('div');
                                    colLoaiNuoc.className = 'col';
                                    var labelLoaiNuoc = document.createElement('label');
                                    labelLoaiNuoc.className = 'form-label';
                                    labelLoaiNuoc.setAttribute('for', 'typewater');
                                    labelLoaiNuoc.textContent = 'Loại nước';

                                    // Tạo select mới
                                    var selectLoaiNuoc = document.createElement('select');
                                    selectLoaiNuoc.className = 'form-control';
                                    selectLoaiNuoc.setAttribute('name', 'typewater');

                                    // Sao chép options từ select gốc sang select mới
                                    var originalSelect = document.getElementById('typewater');
                                    Array.from(originalSelect.options).forEach(function (option) {
                                        var newOption = option.cloneNode(true);
                                        selectLoaiNuoc.appendChild(newOption);
                                    });

                                    // Thêm label và select vào colLoaiNuoc
                                    colLoaiNuoc.appendChild(labelLoaiNuoc);
                                    colLoaiNuoc.appendChild(selectLoaiNuoc);

                                    // Tạo div cho Số lượng
                                    var colSoLuong = document.createElement('div');
                                    colSoLuong.className = 'col';
                                    var labelSoLuong = document.createElement('label');
                                    labelSoLuong.className = 'form-label';
                                    labelSoLuong.setAttribute('for', 'quantity');
                                    labelSoLuong.textContent = 'Số lượng';
                                    var inputSoLuong = document.createElement('input');
                                    inputSoLuong.type = 'number';
                                    inputSoLuong.className = 'form-control';
                                    inputSoLuong.setAttribute('name', 'quantity');

                                    // Thêm label và input vào colSoLuong
                                    colSoLuong.appendChild(labelSoLuong);
                                    colSoLuong.appendChild(inputSoLuong);

                                    // Tạo div cho Giá tiền
                                    var colGiaTien = document.createElement('div');
                                    colGiaTien.className = 'col';
                                    var labelGiaTien = document.createElement('label');
                                    labelGiaTien.className = 'form-label';
                                    labelGiaTien.setAttribute('for', 'pricewater');
                                    labelGiaTien.textContent = 'Giá tiền';
                                    var inputGiaTien = document.createElement('input');
                                    inputGiaTien.type = 'text';
                                    inputGiaTien.className = 'form-control';
                                    inputGiaTien.setAttribute('name', 'pricewater');

                                    // Thêm label và input vào colGiaTien
                                    colGiaTien.appendChild(labelGiaTien);
                                    colGiaTien.appendChild(inputGiaTien);

                                    // Thêm sự kiện onchange cho các trường loại nước, số lượng, và giá tiền
                                    selectLoaiNuoc.addEventListener('change', updateTotalPrice);
                                    inputSoLuong.addEventListener('change', updateTotalPrice);
                                    inputGiaTien.addEventListener('change', updateTotalPrice);

                                    // Thêm các div vào hàng mới
                                    newRow.appendChild(colLoaiNuoc);
                                    newRow.appendChild(colSoLuong);
                                    newRow.appendChild(colGiaTien);

                                    // Thêm hàng mới vào waterContainer
                                    waterContainer.appendChild(newRow);

                                    // Cập nhật tổng hóa đơn khi thêm hàng mới
                                    updateTotalPrice();
                                }

                                function submitForm() {
                                    var waterContainers = document.querySelectorAll('#waterContainer .row');
                                    var selectedWaterInfo = [];
                                    var totalPrice = 0;

                                    // Fetch and parse #price and #deposit values
                                    var priceValue = parseInt(document.getElementById('price').value || '0', 10); // Default to 0 if not found
                                    var depositValue = parseInt(document.getElementById('deposit') ? document.getElementById('deposit').value : '0', 10); // Default to 0 if not found

                                    waterContainers.forEach(function (container) {
                                        var loaiNuoc = container.querySelector('[name="typewater"]').value;
                                        var soLuong = container.querySelector('[name="quantity"]').value;
                                        var giaTien = container.querySelector('[name="pricewater"]').value;
                                        var subtotal = parseInt(soLuong) * parseInt(giaTien);
                                        totalPrice += subtotal;
                                        selectedWaterInfo.push({
                                            loaiNuoc: loaiNuoc,
                                            soLuong: soLuong,
                                            giaTien: giaTien
                                        });
                                    });

                                    // Add #price and #deposit to total price
                                    totalPrice += priceValue + depositValue;

                                    // Display total price
                                    totalPriceElement.textContent = 'Tổng hóa đơn: ' + totalPrice + ' VNĐ';

                                    // Tạo một hidden input để chứa thông tin về các loại nước đã thêm
                                    var hiddenInput = document.createElement('input');
                                    hiddenInput.type = 'hidden';
                                    hiddenInput.name = 'selectedWaterInfo';
                                    hiddenInput.value = JSON.stringify(selectedWaterInfo);

                                    // Thêm hidden input vào form
                                    document.querySelector('#myForm').appendChild(hiddenInput);

                                    // Thêm giá trị tổng hóa đơn vào form
                                    var hiddenTotalPrice = document.createElement('input');
                                    hiddenTotalPrice.type = 'hidden';
                                    hiddenTotalPrice.name = 'totalPrice';
                                    hiddenTotalPrice.value = totalPrice;

                                    // Thêm hidden input vào form
                                    document.querySelector('#myForm').appendChild(hiddenTotalPrice);

                                    // Submit form
                                    document.querySelector('#myForm').submit();
                                }
                            </script>
                        </div>
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
