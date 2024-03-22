

<!DOCTYPE html>
<html lang="en">
    <%@ page pageEncoding="UTF-8" contentType="text/html; charset = UTF-8" %>

    <head>
        <meta charset="utf-8">
        <title>DASHMIN - Bootstrap Admin Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">
        <title>Password Change Form</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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
        <style>
            root {
                --primary: #009CFF;
                --light: #F3F6F9;
                --dark: #191C24;
            }

            .back-to-top {
                position: fixed;
                display: none;
                right: 45px;
                bottom: 45px;
                z-index: 99;
            }


            /*** Spinner ***/
            #spinner {
                opacity: 0;
                visibility: hidden;
                transition: opacity .5s ease-out, visibility 0s linear .5s;
                z-index: 99999;
            }

            #spinner.show {
                transition: opacity .5s ease-out, visibility 0s linear 0s;
                visibility: visible;
                opacity: 1;
            }


            /*** Button ***/
            .btn {
                transition: .5s;
            }

            .btn.btn-primary {
                color: #FFFFFF;
            }

            .btn-square {
                width: 38px;
                height: 38px;
            }

            .btn-sm-square {
                width: 32px;
                height: 32px;
            }

            .btn-lg-square {
                width: 48px;
                height: 48px;
            }

            .btn-square,
            .btn-sm-square,
            .btn-lg-square {
                padding: 0;
                display: inline-flex;
                align-items: center;
                justify-content: center;
                font-weight: normal;
                border-radius: 50px;
            }


            /*** Layout ***/
            .sidebar {
                position: fixed;
                top: 0;
                left: 0;
                bottom: 0;
                width: 320px;
                height: 100vh;
                overflow-y: auto;
                background: var(--light);
                transition: 0.5s;
                z-index: 999;
            }

            .content {
                min-height: 100vh;
                background: #FFFFFF;
                transition: 0.5s;
                margin-left: 300px;
            }

            @media (min-width: 992px) {
                .sidebar {
                    margin-left: 0;
                }

                .sidebar.open {
                    margin-left: -250px;
                }

                .content {
                    width: calc(100% - 300px);

                }

                .content.open {
                    width: 100%;
                    margin-left: 0;
                }
            }

            @media (max-width: 991.98px) {
                .sidebar {
                    margin-left: -250px;
                }

                .sidebar.open {
                    margin-left: 0;

                }

                .content {
                    width: 100%;
                    margin-left: 0;

                }
            }


            /*** Navbar ***/
            .sidebar .navbar .navbar-nav .nav-link {
                padding: 7px 20px;
                color: var(--dark);
                font-weight: 500;
                border-left: 3px solid var(--light);
                border-radius: 0 30px 30px 0;
                outline: none;
            }

            .sidebar .navbar .navbar-nav .nav-link:hover,
            .sidebar .navbar .navbar-nav .nav-link.active {
                color: var(--primary);
                background: #FFFFFF;
                border-color: var(--primary);
            }

            .sidebar .navbar .navbar-nav .nav-link i {
                width: 40px;
                height: 40px;
                display: inline-flex;
                align-items: center;
                justify-content: center;
                background: #FFFFFF;
                border-radius: 40px;
            }

            .sidebar .navbar .navbar-nav .nav-link:hover i,
            .sidebar .navbar .navbar-nav .nav-link.active i {
                background: var(--light);
            }

            .sidebar .navbar .dropdown-toggle::after {
                position: absolute;
                top: 15px;
                right: 15px;
                border: none;
                content: "\f107";
                font-family: "Font Awesome 5 Free";
                font-weight: 900;
                transition: .5s;
            }

            .sidebar .navbar .dropdown-toggle[aria-expanded=true]::after {
                transform: rotate(-180deg);
            }

            .sidebar .navbar .dropdown-item {
                padding-left: 25px;
                border-radius: 0 30px 30px 0;
            }

            .content .navbar .navbar-nav .nav-link {
                margin-left: 25px;
                padding: 12px 0;
                color: var(--dark);
                outline: none;
            }

            .content .navbar .navbar-nav .nav-link:hover,
            .content .navbar .navbar-nav .nav-link.active {
                color: var(--primary);
            }

            .content .navbar .sidebar-toggler,
            .content .navbar .navbar-nav .nav-link i {
                width: 40px;
                height: 40px;
                display: inline-flex;
                align-items: center;
                justify-content: center;
                background: #FFFFFF;
                border-radius: 40px;
            }

            .content .navbar .dropdown-toggle::after {
                margin-left: 6px;
                vertical-align: middle;
                border: none;
                content: "\f107";
                font-family: "Font Awesome 5 Free";
                font-weight: 900;
                transition: .5s;
            }

            .content .navbar .dropdown-toggle[aria-expanded=true]::after {
                transform: rotate(-180deg);
            }

            @media (max-width: 575.98px) {
                .content .navbar .navbar-nav .nav-link {
                    margin-left: 15px;
                }
            }


            /*** Date Picker ***/
            .bootstrap-datetimepicker-widget.bottom {
                top: auto !important;
            }

            .bootstrap-datetimepicker-widget .table * {
                border-bottom-width: 0px;
            }

            .bootstrap-datetimepicker-widget .table th {
                font-weight: 500;
            }

            .bootstrap-datetimepicker-widget.dropdown-menu {
                padding: 10px;
                border-radius: 2px;
            }

            .bootstrap-datetimepicker-widget table td.active,
            .bootstrap-datetimepicker-widget table td.active:hover {
                background: var(--primary);
            }

            .bootstrap-datetimepicker-widget table td.today::before {
                border-bottom-color: var(--primary);
            }


            /*** Testimonial ***/
            .progress .progress-bar {
                width: 0px;
                transition: 2s;
            }


            /*** Testimonial ***/
            .testimonial-carousel .owl-dots {
                margin-top: 24px;
                display: flex;
                align-items: flex-end;
                justify-content: center;
            }

            .testimonial-carousel .owl-dot {
                position: relative;
                display: inline-block;
                margin: 0 5px;
                width: 15px;
                height: 15px;
                border: 5px solid var(--primary);
                border-radius: 15px;
                transition: .5s;
            }

            .testimonial-carousel .owl-dot.active {
                background: var(--dark);
                border-color: var(--primary);
            }

            /* Add to your existing style.css */
            .list-group-item {
                background-color: #f8f9fa; /* Light grey background */
                border: 1px solid #ddd; /* Grey border */
                margin-bottom: 10px; /* Spacing between items */
                border-radius: 5px; /* Rounded corners */
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
                transition: transform 0.1s ease-in-out; /* Smooth transition for hover effect */
            }

            .list-group-item:hover {
                transform: translateY(-2px); /* Lift item on hover */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15); /* Larger shadow on hover */
            }

            .btn-sm {
                padding: .25rem .5rem; /* Smaller padding for small buttons */
                font-size: .875rem; /* Smaller font size for small buttons */
                line-height: 1.5; /* Proper line height for readability */
                border-radius: .2rem; /* Slightly rounded corners for small buttons */
            }

            .btn-secondary {
                color: #fff; /* White text color */
                background-color: #6c757d; /* Grey background */
                border-color: #6c757d; /* Grey border */
            }

            .btn-secondary:hover {
                background-color: #5a6268; /* Darker grey on hover */
                border-color: #545b62; /* Darker grey border on hover */
            }

            .btn-danger {
                color: #fff; /* White text color */
                background-color: #dc3545; /* Red background */
                border-color: #dc3545; /* Red border */
            }

            .btn-danger:hover {
                background-color: #c82333; /* Darker red on hover */
                border-color: #bd2130; /* Darker red border on hover */
            }

            /* Adjust the primary button styles if needed */
            .btn-primary {
                /* Your primary button styles */
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
                                <a href="" class="dropdown-item">Buttons</a>
                                <a href="" class="dropdown-item">Typography</a>
                                <a href="" class="dropdown-item">Other Elements</a>
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
                                <a href="profile2" class="dropdown-item">My Profile</a>
                                <a href="#" class="dropdown-item">Settings</a>
                                <a href="../logout" class="dropdown-item">Log Out</a>
                            </div>
                        </div>
                    </div>
                </nav>
                <!-- Navbar End -->           

                <div class="flex justify-center mt-10">
                    <div class="w-full max-w-4xl bg-white shadow-lg rounded-lg">
                        <div class="flex flex-col md:flex-row">
                            <div class="w-full md:w-1/2 p-5 border-b md:border-b-0 md:border-r">
                                <div class="flex items-center mb-5">
                                    <i class="fas fa-key text-lg text-gray-500" style="color: #3ba023;"></i>
                                    <h2 class="text-xl font-bold pl-3" style="color: #176d07;">Thay Đổi Mật Khẩu</h2>
                                </div>
                                <form action="changePassword" method="post">
                                    <h3 class="text-xl font-bold pl-3" style="color: green;">${successMessage}</h2>
                                        <div class="mb-4 relative">
                                            <label for="old-password" class="block text-gray-700 text-sm font-bold mb-2">Mật khẩu hiện tại</label>
                                            <input name="password" type="password" id="old-password" placeholder="Mật khẩu hiện tại" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                                            <i class="fas fa-eye-slash password-toggle cursor-pointer absolute right-3 top-9" id="toggle-old-password" data-input="old-password"></i>
                                        </div>
                                        <div class="mb-4 relative">
                                            <label for="new-password" class="block text-gray-700 text-sm font-bold mb-2">Mật khẩu mới</label>
                                            <input name="newPassword" type="password" id="new-password" placeholder="Mật khẩu mới" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                                            <div id="password-message" style="color:red;font-size:11px"></div>
                                            <i class="fas fa-eye-slash password-toggle cursor-pointer absolute right-3 top-9" id="toggle-new-password" data-input="new-password"></i>
                                        </div>
                                        <div class="mb-6 relative">
                                            <label for="confirm-password" class="block text-gray-700 text-sm font-bold mb-2">Xác nhận mật khẩu mới</label>
                                            <input name="confirmPassword" type="password" id="confirm-password" placeholder="Xác nhận mật khẩu mới" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                                            <i class="fas fa-eye-slash password-toggle cursor-pointer absolute right-3 top-9" id="toggle-confirm-password" data-input="confirm-password"></i>
                                            <input name="email" value="${sessionScope.account.IDEmail}" hidden>
                                        </div>
                                        <h5 style="color:red">${errorMessage}</h5>

                                        <div class="flex items-center justify-between">

                                            <button type="submit" class="inline-block align-baseline font-bold text-sm text-gray-500 hover:text-gray-800 border border-gray-300 py-2 px-4 rounded hover:border-gray-500 focus:outline-none focus:border-gray-500" type="button" >
                                                Lưu
                                            </button>
                                            <a href="profile2">
                                                <button class="inline-block align-baseline font-bold text-sm text-gray-500 hover:text-gray-800 border border-gray-300 py-2 px-4 rounded hover:border-gray-500 focus:outline-none focus:border-gray-500" type="button" >
                                                    Hủy
                                                </button>
                                            </a>


                                        </div>
                                </form>
                            </div>
                            <div class="w-full md:w-1/2 p-5">
                                <div class="flex items-center mb-5">
                                    <i class="fas fa-shield-alt text-lg text-gray-500" style="color: rgb(229, 69, 10);"></i>
                                    <h2 class="text-xl font-bold pl-3" style="color: #cf6203;">Xác Thực Hai Yếu Tố</h2>
                                </div>
                                <div class="bg-orange-100 border-l-4 border-orange-500 text-orange-700 p-4" role="alert">
                                    <p class="font-bold">Xác thực hai yếu tố chưa được kích hoạt.</p>
                                    <p>Xác thực hai yếu tố bổ sung thêm một lớp bảo mật cho tài khoản của bạn bằng cách yêu cầu nhiều hơn chỉ mật khẩu đăng nhập. Tìm hiểu thêm.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="bg-light rounded-top p-4">
                <div class="row">
                    <div class="col-12 col-sm-6 text-center text-sm-start">
                        <a href="index1.html">FBK74 N?i tôn vinh bóng ?á</a>, All Right Reserved. 
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
<script>
    const passwordInput = document.getElementById('new-password');
    const passwordMessage = document.getElementById('password-message');
    const submitButton = document.getElementById('btn-submit');

    const passwordRegex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!"#$%&'*+,-\./:;<=>?@\[\]^_`{|}~])[^\s]{8,}$/;

    passwordInput.addEventListener('keyup', (event) => {
        const password = event.target.value;
        let isValid = true;
        passwordMessage.textContent = '';

        if (!passwordRegex.test(password)) {
            isValid = false;
            passwordMessage.textContent = 'Mật khẩu phải chứa ít nhất 8 kí tự và ít nhất một kí tự hoa,1 kí tự thường, 1 số, và 1 kí tự đặc biệt.';
        }

        submitButton.disabled = !isValid;
    });
    document.addEventListener("DOMContentLoaded", () => {
        const togglePasswordVisibility = (toggleIconId, inputId) => {
            const toggleIcon = document.getElementById(toggleIconId);
            const passwordInput = document.getElementById(inputId);
            const isPasswordVisible = passwordInput.type === 'text';
            passwordInput.type = isPasswordVisible ? 'password' : 'text';
            toggleIcon.classList.toggle('fa-eye', isPasswordVisible);
            toggleIcon.classList.toggle('fa-eye-slash', !isPasswordVisible);
        };

        document.querySelectorAll('.password-toggle').forEach(toggleIcon => {
            toggleIcon.addEventListener('click', () => {
                const inputId = toggleIcon.getAttribute('data-input');
                togglePasswordVisibility(toggleIcon.id, inputId);
            });
        });
    });
</script>
</body>

</html>
