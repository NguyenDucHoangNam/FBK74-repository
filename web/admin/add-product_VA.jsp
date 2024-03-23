<html lang="en">
    <%@ page pageEncoding="UTF-8" contentType="text/html; charset = UTF-8" %>
    <head>
        <meta charset="utf-8">
        <title>DASHMIN - Bootstrap Admin Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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
        <style>
            /* Custom styles for the toggle switch */
            .toggle-checkbox:checked {
                @apply: right-0 border-orange-500;
                right: 0;
                border-color: #f6ad55;
                /* Orange color */
            }

            .toggle-checkbox:checked+.toggle-label {
                @apply: bg-orange-500;
                background-color: #f6ad55;
                /* Orange color */
            }

            .toggle-label {
                @apply: bg-gray-300;
                background-color: #cbd5e0;
                /* Grey color */
                position: relative;
            }

            .toggle-label:after {
                @apply: absolute bg-white rounded-full transition;
                content: '';
                position: absolute;
                top: 1px;
                left: 1px;
                width: 22px;
                height: 22px;
                background: #fff;
                border: 2px solid #cbd5e0;
                border-radius: 50%;
                transition: 0.3s;
            }

            .toggle-checkbox:checked+.toggle-label:after {
                @apply: transform translate-x-full border-orange-500;
                transform: translateX(100%);
                border-color: #f6ad55;
            }
            .container {
                margin-top: 50px;
            }
            .form-container {
                background-color: #ffffff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            }
            .form-group {
                margin-bottom: 20px;
            }
            .form-label {
                font-weight: bold;
            }
            .btn-add-product {
                background-color: #007bff;
                color: #ffffff;
                border: none;
                border-radius: 5px;
                padding: 10px 20px;
            }
            .btn-add-product:hover {
                background-color: #0056b3;
                color: #ffffff;
            }
            #image-preview {
                margin-top: 10px;
                display: none;
                max-width: 100%;
                height: auto;
            }
            .container {
                margin-top: 50px;
            }
            .form-container {
                background-color: #ffffff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            }
            .form-group {
                margin-bottom: 20px;
            }
            .form-label {
                font-weight: bold;
            }
            .btn-add-product {
                background-color: #007bff;
                color: #ffffff;
                border: none;
                border-radius: 5px;
                padding: 10px 20px;
            }
            .btn-add-product:hover {
                background-color: #0056b3;
                color: #ffffff;
            }
            #image-preview {
                margin-top: 10px;
                display: none;
                max-width: 100%;
                height: auto;
            }
        </style>
    </head>

    <body>
        <div class="container-xxl position-relative bg-white d-flex p-0">
            <!-- Spinner Start -->
            <div id="spinner"
                 class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
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

                <!-- Main Content Start -->



                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-md-6">
                            <div class="form-container">
                                <h2 class="text-center mb-4">Thêm Sản phẩm</h2>
                                <form action="product" method="post" enctype="multipart/form-data">
                                    <input type="hidden" name="action" value="add"> <!-- Hidden input for action parameter -->
                                    <div class="form-group">
                                        <label for="name" class="form-label">Tên Sản phẩm</label>
                                        <input type="text" id="name" name="name" class="form-control" placeholder="Nhập tên sản phẩm" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="image" class="form-label">Hình ảnh sản phẩm</label>
                                        <input type="file" id="image" name="image" class="form-control"  required onchange="previewImage(event)">
                                        <img id="image-preview" src="#" alt="Image Preview">
                                    </div>

                                    <div class="form-group">
                                        <label for="quantity" class="form-label">Số lượng</label>
                                        <input type="number" id="quantity" name="quantity" class="form-control" placeholder="Nhập số lượng" required>
                                    </div>
                                    <div class="flex justify-center">
                                        <button type="submit" class="btn btn-add-product" style="background-color: green;">Thêm Sản phẩm</button>
                                    </div>                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Widgets Start -->

                <!-- Widgets End -->


                <!-- Footer Start -->



                <div class=" container-fluid pt-4 px-4">
                    <div class="bg-light rounded-top p-4">
                        <div class="row">
                            <div class="col-12 col-sm-6 text-center text-sm-start">
                                <a href="index.html">FBK74 Nơi tôn vinh bóng đá</a>, All Right
                                Reserved.
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
    </body>
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
                                            // JavaScript to handle the toggle switch change event
                                            document.addEventListener('DOMContentLoaded', function () {
                                                var toggles = document.querySelectorAll('.toggle-checkbox');
                                                toggles.forEach(function (toggle) {
                                                    toggle.addEventListener('change', function () {
                                                        // Here you can handle the state change
                                                        console.log('Toggle ' + this.id + ' is ' + (this.checked ? 'on' : 'off'));
                                                    });
                                                });
                                            });
                                            // Initialize all toggle switches
                                            document.addEventListener('DOMContentLoaded', function () {
                                                var toggles = document.querySelectorAll('.toggle-checkbox');
                                                for (var i = 0; i < toggles.length; i++) {
                                                    toggles[i].addEventListener('change', function (event) {
                                                        var toggle = event.target;
                                                        var label = toggle.nextElementSibling;
                                                        if (toggle.checked) {
                                                            label.classList.add('bg-orange-400');
                                                            label.classList.remove('bg-gray-300');
                                                        } else {
                                                            label.classList.add('bg-gray-300');
                                                            label.classList.remove('bg-orange-400');
                                                        }
                                                    });
                                                }
                                            });
                                            function previewImage(event) {
                                                var input = event.target;
                                                var reader = new FileReader();
                                                reader.onload = function () {
                                                    var img = document.getElementById('image-preview');
                                                    img.style.display = 'block';
                                                    img.src = reader.result;
                                                };
                                                reader.readAsDataURL(input.files[0]);
                                            }
    </script>

</html>
