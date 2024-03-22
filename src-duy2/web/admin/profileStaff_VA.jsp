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

            .input-bordered {
                border: 1px solid #cccccc; /* Màu vi?n xám nh?t */
                padding: 12px 15px; /* ??m ?? nh?p li?u không b? sát vi?n */
                margin: 8px 0; /* Kho?ng cách gi?a các tr??ng nh?p */
                width: 100%; /* Chi?u r?ng t?i ?a */
                background-color: #eee; /* Màu n?n nh?t cho tr??ng nh?p */
                border-radius: 4px; /* Bán kính bo góc cho vi?n */
            }
            body {
                font-family: 'Inter', sans-serif;
            }
            .radio-button:checked + .radio-label {
                background-color: #f97316;
                border-color: #f97316;
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
                                <a href="profile" class="dropdown-item">My Profile</a>
                                <a href="#" class="dropdown-item">Settings</a>
                                <a href="../logout" class="dropdown-item">Log Out</a>
                            </div>
                        </div>
                    </div>
                </nav>
                <!-- Navbar End -->           
                <!--Content admin start-->
                <div class="min-h-screen bg-gray-100 flex items-center justify-center px-4" style="margin-top: -50px;">
                    <div class="bg-white shadow-lg rounded-lg p-8 max-w-4xl w-full">
                        <div class="flex flex-col md:flex-row justify-between items-start">
                            <div class="flex flex-col items-center text-center md:text-left md:items-start">
                                <h2 class="text-2xl text-gray-800 font-semibold mb-4">
                                    <i class="fas fa-user-circle mr-2"></i>Thông tin tài khoản
                                </h2>

                                <img src="https://placehold.co/100x100" alt="Profile picture" id="profile-picture" class=" border-3 border-green-500 p-1 mb-3" style="width: 170px; cursor: pointer; margin: 10px auto;border-radius:50%;border: 2px solid #1b730d">

                                <input type="file" id="image-input" style="display: none;">

                                <p class="text-gray-700 mb-1" style="margin: 0 auto">${sessionScope.account.userName}</p>
                                <a href="changePassword">
                                    <button class="bg-green-500 text-white text-lg px-6 py-2 rounded-full shadow-md hover:shadow-lg transition-shadow duration-300 ease-in-out focus:outline-none focus:ring-2 focus:ring-green-700 focus:ring-opacity-50" style="background-image: linear-gradient(to right top,#45af2a,#3ba023,#30901c,#268215,#1b730d,#1b730d,#1b730d,#1b730d,#268215,#30901c,#3ba023,#45af2a); margin:10px auto">
                                        Nhấn để đổi mật khẩu
                                    </button>
                                </a>                         
                            </div>
                            <div class="mt-8 md:mt-0 md:ml-10 w-full max-w-lg">
                                <form class="space-y-4" action="profile2" method="POST">
                                    <input type="hidden" name="action" value="updateProfile" />                
                                    <input type="hidden" name="accountId" value="${user.IDAccount}" />

                                    <div>
                                        <label for="surname" class="text-gray-700">Tên</label>
                                        <input name="name" value="${user.name}" type="text" id="surname" placeholder="H?" class="w-full mt-1 px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent">
                                    </div>
                                    <div>
                                        <label for="Phone" class="text-gray-700">Số điện thoại</label>
                                        <input name="phone" value="${user.phoneNumber}" type="text" id="Phone" placeholder="Số điện thoại" class="w-full mt-1 px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent" pattern="^\d{1,10}$" title="Số điện thoại phải gồm 10 chữ số và không chứa ký tự đặc biệt." required>
                                    </div>
                                    <div>
                                        <label for="Email" class="text-gray-700">Email</label>
                                        <input name="email" value="${user.IDEmail}" type="email" id="Email" placeholder="Email" class="w-full mt-1 px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" title="Email phải chứa ký tự '@' và không được chứa các ký tự đặc biệt không hợp lệ." required>
                                    </div>

                                    <div class="flex items-center mt-4">
                                        <span class="text-gray-700 mr-3">Giới tính</span>

                                        <div class="flex items-center mr-4">
                                            <input id="genderMale" name="gender" type="radio" value="gender-male"  ${user.gender == 1 ? 'checked="true"' : ''} />
                                            <label>Nam</label>
                                        </div>
                                        <div class="flex items-center mr-4">
                                            <input id="genderFemale" name="gender" type="radio" value="gender-female" ${user.gender != 1 ? 'checked="true"' : ''} />
                                            <label>Nữ</label>
                                        </div>

                                    </div>
                                    <div>
                                        <label for="birthdate" class="text-gray-700">Ngày sinh</label>
                                        <input name="Dob" type="date" id="birthdate" value="${user.dob}" class="w-full mt-1 px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent">
                                    </div>

                                    <button type="submit" class="w-full bg-green-500 text-white px-4 py-2 rounded shadow peer-checked:bg-green-500 transition-colors" style="background-image: linear-gradient(to right top,#45af2a,#3ba023,#30901c,#268215,#1b730d,#1b730d,#1b730d,#1b730d,#268215,#30901c,#3ba023,#45af2a);">Lưu</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Content admin end-->


                <!-- Footer Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-light rounded-top p-4">
                        <div class="row">
                            <div class="col-12 col-sm-6 text-center text-sm-start">
                                <a href="index.jsp"></a>, All Right Reserved. 
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


            const profilePicture = document.getElementById('profile-picture');
            const imageInput = document.getElementById('image-input');

            profilePicture.addEventListener('click', () => {
                imageInput.click();
            });

            imageInput.addEventListener('change', () => {
                const file = imageInput.files[0];
                const formData = new FormData();
                formData.append('image', file);

                // G?i d? li?u lên server b?ng XMLHttpRequest ho?c Axios
                // ...

                // Hi?n th? ?nh ?ã ch?n
                const reader = new FileReader();
                reader.onload = () => {
                    profilePicture.src = reader.result;
                };
                reader.readAsDataURL(file);
            });
            document.addEventListener("DOMContentLoaded", function () {
                const phoneInput = document.getElementById("Phone");

                phoneInput.addEventListener("input", function () {
                    const regex = /^\d{0,10}$/;
                    if (!regex.test(phoneInput.value)) {
                        // If validation fails, show a custom error message
                        phoneInput.setCustomValidity("Số điện thoại phải gồm 10 chữ số và không chứa ký tự đặc biệt.");
                    } else {
                        // Clear custom error message
                        phoneInput.setCustomValidity("");
                    }
                });
            });

        </script>
    </body>

</html>