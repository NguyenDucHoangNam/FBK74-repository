<%@ page pageEncoding="UTF-8" contentType="text/html; charset = UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <meta charset="utf-8">
        <title>Sân Bóng FBK74</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&family=Rubik:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/animate/animate.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- fevicon -->
        <link rel="icon" href="images/fevicon.png" type="image/gif" />
        <!-- Scrollbar Custom CSS -->
        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--CSS Nhat-->
        <link rel="stylesheet" href="css/style_nhat.css"/>
        <style>
            body {
                font-family: 'Tahoma', sans-serif;
                background-color: #f0f2f5;
                color: #333;
            }

            .container {
                background-color: #fff;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
                border-radius: 8px;
                padding: 20px;
                margin-top: 20px;
            }

            .titlepage h2 {
                color: #0056b3;
                text-align: center;
            }

            .main_form {
                margin-top: 20px;
            }

            .contactus {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .send_btn {
                background-color: #0056b3;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .send_btn:hover {
                background-color: #004494;
            }

            input[type="checkbox"] {
                margin-right: 5px;
            }

            input[type="date"] {
                padding: 10px;
                border-radius: 5px;
                border: 1px solid #ccc;
            }

            select.form-control {
                padding: 10px;
                border-radius: 5px;
                border: 1px solid #ccc;
                width: 100%;
                box-sizing: border-box;
            }
        </style>
    </head>

    <body>
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner"></div>
        </div>
        <!-- Spinner End -->


        <!-- Topbar Start -->

        <!-- Topbar End -->


        <!-- Navbar & Carousel Start -->

        <nav class="navbar navbar-expand-lg px-5 py-3 py-lg-0 bg-dark navbar-dark position-sticky">
            <a href="index.jsp" class="navbar-brand">
                <h1 class="m-0">FBK74</h1>
            </a>

            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto py-0">
                    <a href="index.jsp" class="nav-item nav-link ">Trang Chủ</a>
                    <a href="danhsachtimsan" class="nav-item nav-link active">Tìm Sân</a>

                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Tìm Đối Thủ</a>
                        <div class="dropdown-menu m-0">
                            <a href="regist-find-opponent" class="dropdown-item">Đăng ký làm đối thủ</a>
                            <a href="find-opponent" class="dropdown-item">Tìm kiếm đối thủ</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Giải Đấu</a>
                        <div class="dropdown-menu m-0">
                            <a href="tournaments" class="dropdown-item">Thông tin các giải đấu</a>
                            <a href="HistoryServlet" class="dropdown-item">Giải đấu đã đăng ký</a>
                        </div>
                    </div>
                    <a href="service.html" class="nav-item nav-link">Khóa Học Bóng Đá</a>
                    <a href="contact.html" class="nav-item nav-link">Liên Hệ</a>
                </div >
                <button type="button" class="icon-button">
                    <span class="material-icons">notifications</span>
                    <span class="icon-button__badge">2</span>
                </button>
                <!--login-->
                <h1 class="m-4 ">
                    <div class="d-none d-lg-block ">
                        <c:if test="${sessionScope.account==null}">
                            <a href="sign-in.jsp" class="bi-person custom-icon me-3">Login!</a>
                        </c:if>  
                        <c:if test="${sessionScope.account!=null }">
                            <div class="dropdown">
                                <button type="button" id="dropdownMenuButton1" class="btn dropdown-toggle " data-bs-toggle="dropdown" aria-expanded="false"style="color: #06A3DA;
                                        font-size: 20px;">
                                    ${sessionScope.account.name}
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                    <a class="dropdown-item " href="#">Profile</a>
                                    <a class="dropdown-item " href="#">Update</a>
                                    <a class="dropdown-item " href="logout">Logout</a>
                                </div>
                            </div>
                        </c:if> 
                    </div>
                </h1>
                <!--end login-->
            </div>
        </nav>   
        <!-- Navbar & Carousel End -->
        <!--Content start-->
        <div class="contact">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="titlepage">
                            <h2 style="font-family: 'Tahoma', sans-serif;">CHỈNH SỬA ĐƠN ĐĂNG KÝ </h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-10 offset-md-1">
                        <form action="update-history-find-opponent?idRFO=${requestScope.idRFO}" method="post" id="request" class="main_form">
                            <div class="row">

                                <div class="col-md-12 ">
                                    <h3 style="font-family: 'Tahoma', sans-serif;">Tên người đại diện: </h3>
                                    <input class="contactus"  type="text" id="name" name="name" required> 
                                </div>
                                <div class="col-md-12 ">
                                    <h3 style="font-family: 'Tahoma', sans-serif;">Số điện thoại: </h3>
                                    <input class="contactus" placeholder="Ví dụ : 0123456789" type="tel" id="phone" name="phone" pattern="0[0-9]{9}" required> 
                                </div>
                                <div class="col-md-12">
                                    <h3 style="font-family: 'Tahoma', sans-serif;">Khung giờ:</h3>
                                    <h4 style="font-family: 'Tahoma', sans-serif;">Buổi sáng</h4>
                                    <input type="radio" id="time1" name="times" value="6:30 - 7:30">
                                    <label for="time1">6:30 - 7:30 .</label>

                                    <input type="radio" id="time2" name="times" value="7:30 - 8:30">
                                    <label for="time2">7:30 - 8:30 .</label>

                                    <input type="radio" id="time3" name="times" value="8:30 - 9:30">
                                    <label for="time3">8:30 - 9:30 .</label>

                                    <input type="radio" id="time4" name="times" value="9:30 - 10:30">
                                    <label for="time4">9:30 - 10:30 .</label><br> 
                                    <h3 style="font-family: 'Tahoma', sans-serif;">Buổi chiều - tối</h3>

                                    <input type="radio" id="time5" name="times" value="14:30 - 15:30">
                                    <label for="time5">14:30 - 15:30 .</label>

                                    <input type="radio" id="time6" name="times" value="15:30 - 16:30">
                                    <label for="time6">15:30 - 16:30 .</label>

                                    <input type="radio" id="time7" name="times" value="16:30 - 17:30">
                                    <label for="time7">16:30 - 17:30 .</label>
                                    <input type="radio" id="time8" name="times" value="17:30 - 18:30">
                                    <label for="time8">17:30 - 18:30 .</label>

                                    <input type="radio" id="time9" name="times" value="18:30 - 19:30">
                                    <label for="time9">18:30 - 19:30 .</label><br>

                                    <input type="radio" id="time10" name="times" value="19:30 - 20:30">
                                    <label for="time10">19:30 - 20:30 .</label>

                                    <input type="radio" id="time11" name="times" value="20:30 - 21:30">
                                    <label for="time11">20:30 - 21:30 .</label>

                                    <input type="radio" id="time12" name="times" value="21:30 - 22:30">
                                    <label for="time12">21:30 - 22:30 .</label>

                                    <input type="radio" id="time13" name="times" value="22:30 - 23:30">
                                    <label for="time13">22:30 - 23:30 .</label>

                                    <input type="radio" id="time14" name="times" value="23:30 - 0:30">
                                    <label for="time14">23:30 - 0:30 .</label><br>
                                </div>
                                <script>
                                    function validateForm() {
                                        var checkboxes = document.querySelectorAll('input[type="radio"][name="times"]');
                                        var checked = false;
                                        for (var i = 0; i < checkboxes.length; i++) {
                                            if (checkboxes[i].checked) {
                                                checked = true;
                                                break;
                                            }
                                        }
                                        if (!checked) {
                                            alert("Vui lòng chọn một khung giờ.");
                                            return false;
                                        }
                                        return true;
                                    }
                                </script>
                                <div class="col-md-12 ">
                                    <h3 style="font-family: 'Tahoma', sans-serif;">Ngày thi đấu:</h3>
                                    <label for="futureDate"></label>
                                    <input type="date" id="futureDate" name="futureDate" max="" min="" required pattern="dd/MM/yyyy"><br>

                                    <script>
                                        // Lấy ngày hiện tại
                                        var today = new Date();
                                        // Lấy ngày mai
                                        var tomorrow = new Date();
                                        tomorrow.setDate(today.getDate() + 1);

                                        // Tính ngày trong tương lai 7 ngày từ ngày mai
                                        var futureDate = new Date(tomorrow);
                                        futureDate.setDate(tomorrow.getDate() + 7);

                                        // Chuyển đổi ngày trong tương lai thành chuỗi yyyy-MM-dd
                                        var futureDateString = futureDate.toISOString().substring(0, 10);

                                        // Đặt thuộc tính max của input date là ngày trong tương lai
                                        document.getElementById("futureDate").setAttribute("max", futureDateString);

                                        // Đặt thuộc tính min của input date là ngày mai
                                        document.getElementById("futureDate").setAttribute("min", tomorrow.toISOString().substring(0, 10));
                                    </script>


                                </div>
                                <div class="col-md-12 ">
                                    <br>
                                </div>
                                <div class="col-md-12">
                                    <h3 style="font-family: 'Tahoma', sans-serif;">Loại sân: </h3>
                                    <input type="radio" id="footballfield5" name="footballfield" value="5">
                                    <label for="footballfield5">Sân 5</label><br>

                                    <input type="radio" id="footballfield7" name="footballfield" value="7">
                                    <label for="footballfield7">Sân 7</label><br>
                                </div>
                                <script>
                                    function validateAndSubmit() {
                                        var checkboxesField = document.querySelectorAll('input[type="radio"][name="footballfield"]');
                                        var checked = false;
                                        for (var i = 0; i < checkboxesField.length; i++) {
                                        if (checkboxesField[i].checked) {
                                        checked = true;
                                                break;
                                        }
                                        }
                                        if (!checked) {"Vui lòng chọn ít nhất một loại sân");
                                        return false;
                                        }
                                        return true;

                                    }
                                </script>
                                <div class="col-md-12 ">
                                    <br>
                                </div>
                                <div class="col-md-12 ">
                                    <h3 style="font-family: 'Tahoma', sans-serif;">Năng lực đội bóng :</h3>
                                    <td>
                                        <select name="power" class="form-control">
                                            <option value="Giao lưu vui vẻ">Giao lưu vui vẻ</option>
                                            <option value="Mới tập đá">Mới tập đá</option>
                                            <option value="Độ tuổi học sinh">Độ tuổi học sinh</option>
                                            <option value="Độ tuổi sinh viên">Độ tuổi sinh viên</option>
                                            <option value="Độ tuổi 22 - 30">Độ tuổi 22 - 30</option>
                                            <option value="Độ tuổi 30 - 40">Độ tuổi 30 - 40</option>
                                            <option value="Độ tuổi trên 40">Độ tuổi trên 40</option>
                                            <option value="Năng lực đội bóng cao">Năng lực đội bóng cao</option>
                                        </select>
                                    </td>                                   
                                </div>

                                <div class="col-md-12">
                                    <button class="send_btn" style="font-family: 'Tahoma', sans-serif;" onclick="validateAndSubmit())">--> Cọc sân</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--Content end-->
        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-light mt-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container">
                <div class="row gx-5">
                    <div class="col-lg-4 col-md-6 footer-about">
                        <div class="d-flex flex-column align-items-center justify-content-center text-center h-100 bg-primary p-4">
                            <a href="index.html" class="navbar-brand">
                                <h1 class="m-0 text-white"><i class="fa fa-user-tie me-2"></i>FBK74</h1>
                            </a>
                            <p class="mt-3 mb-4">Địa chỉ chuyên nghiệp dành cho mọi lứa tuổi, hãy cùng nhau trải nghiệm sân chơi đẳng cấp của chúng tôi ngay nhé.</p>
                            <form action="">
                                <div class="input-group">
                                    <input type="text" class="form-control border-white p-3" placeholder="Your Email">
                                    <button class="btn btn-dark">Sign Up</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-6">
                        <div class="row gx-5">
                            <div class="col-lg-4 col-md-12 pt-5 mb-5">
                                <div class="section-title section-title-sm position-relative pb-3 mb-4">
                                    <h3 class="text-light mb-0">Get In Touch</h3>
                                </div>
                                <div class="d-flex mb-2">
                                    <i class="bi bi-geo-alt text-primary me-2"></i>
                                    <p class="mb-0">78 Bình Kỳ, Ngũ Hành Sơn, Đà Nẵng</p>
                                </div>
                                <div class="d-flex mb-2">
                                    <i class="bi bi-envelope-open text-primary me-2"></i>
                                    <p class="mb-0">fbk74@gmail.com</p>
                                </div>
                                <div class="d-flex mb-2">
                                    <i class="bi bi-telephone text-primary me-2"></i>
                                    <p class="mb-0">+012 345 67890</p>
                                </div>
                                <div class="d-flex mt-4">
                                    <a class="btn btn-primary btn-square me-2" href="#"><i class="fab fa-twitter fw-normal"></i></a>
                                    <a class="btn btn-primary btn-square me-2" href="#"><i class="fab fa-facebook-f fw-normal"></i></a>
                                    <a class="btn btn-primary btn-square me-2" href="#"><i class="fab fa-linkedin-in fw-normal"></i></a>
                                    <a class="btn btn-primary btn-square" href="#"><i class="fab fa-instagram fw-normal"></i></a>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12 pt-0 pt-lg-5 mb-5">
                                <div class="section-title section-title-sm position-relative pb-3 mb-4">
                                    <h3 class="text-light mb-0">Quick Links</h3>
                                </div>
                                <div class="link-animated d-flex flex-column justify-content-start">
                                    <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Trang Chủ</a>
                                    <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Tìm Sân</a>
                                    <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Tìm Đối Thủ</a>
                                    <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Giải Đấu</a>
                                    <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Khóa Học Bóng Đá</a>
                                    <a class="text-light" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Liên Hệ</a>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12 pt-0 pt-lg-5 mb-5">
                                <div class="section-title section-title-sm position-relative pb-3 mb-4">
                                    <h3 class="text-light mb-0">Popular Links</h3>
                                </div>
                                <div class="link-animated d-flex flex-column justify-content-start">
                                    <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Trang Chủ</a>
                                    <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Tìm Sân</a>
                                    <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Tìm Đối Thủ</a>
                                    <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Giải Đấu</a>
                                    <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Khóa Học Bóng Đá</a>
                                    <a class="text-light" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Liên Hệ</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid text-white" style="background: #061429;">
            <div class="container text-center">
                <div class="row justify-content-end">
                    <div class="col-lg-8 col-md-6">
                        <div class="d-flex align-items-center justify-content-center" style="height: 75px;">
                            <p class="mb-0">&copy; <a class="text-white border-bottom" href="#">Your Site Name</a>. All Rights Reserved. 

                                <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                                Designed by <a class="text-white border-bottom" href="https://htmlcodex.com">HTML Codex</a></p>
                            <br>Distributed By: <a class="border-bottom" href="https://themewagon.com" target="_blank">ThemeWagon</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="timsan_nhat.jsp" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/counterup/counterup.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>


        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <script src="js/duy.js"></script>
    </body>
</html>