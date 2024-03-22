<%-- 
    Document   : manage-user
    Created on : Mar 1, 2024, 4:54:47 PM
    Author     : Datnt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

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

                <!-- Main Content End -->
                    <div class="container mx-auto p-4">
                        <h1 class="text-lg font-semibold text-gray-700 my-6">Quản lý người dùng trên nền tảng</h1>
                        <div class="bg-white shadow overflow-hidden rounded-lg">
                            <table class="min-w-full divide-y divide-gray-200">
                                <thead class="bg-pink-200">
                                    <tr>
                                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ID</th>
                                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">TÊN NGƯỜI DÙNG</th>
                                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">TÊN TÀI KHOẢN</th>
                                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">QUYỀN</th>
                                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ĐÃ CHẤN</th>
                                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">THAO TÁC</th>
                                    </tr>
                                </thead>
                                <tbody class="bg-white divide-y divide-gray-200">
                                    <c:forEach items="${listUser}" var="user" varStatus="status">
                                        <tr>
                                            <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">${status.count}</td>
                                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${user.name}</td>
                                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${user.userName}</td>
                                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                                <c:choose>
                                                    <c:when test ="${user.role == 1}">
                                                        Customer
                                                    </c:when>
                                                    <c:otherwise>
                                                        Staff
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"> 
                                                <c:choose>
                                                    <c:when test ="${user.status == 1}">
                                                        <div class="relative inline-block w-10 mr-2 align-middle select-none">
                                                            <input checked type="checkbox" name="toggle" id="toggle${status.count}" data-bs-toggle="modal" data-bs-target="#enableUser-${status.count}" class="toggle-checkbox absolute block w-6 h-6 rounded-full bg-white border-4 appearance-none cursor-pointer"/>
                                                            <label for="toggle${status.count}" class="toggle-label block overflow-hidden h-6 rounded-full bg-gray-300 cursor-pointer"></label>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="relative inline-block w-10 mr-2 align-middle select-none">
                                                            <input type="checkbox" name="toggle" id="toggle${status.count}" data-bs-toggle="modal" data-bs-target="#disableUser-${status.count}" class="toggle-checkbox absolute block w-6 h-6 rounded-full bg-white border-4 appearance-none cursor-pointer"/>
                                                            <label for="toggle${status.count}" class="toggle-label block overflow-hidden h-6 rounded-full bg-gray-300 cursor-pointer"></label>
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>

                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap text-left text-sm font-medium">
                                                <button data-bs-toggle="modal" data-bs-target="#setRole-${status.count}" class="px-3 py-1 border border-transparent shadow-sm text-sm leading-4 font-medium rounded-full text-white bg-orange-500 hover:bg-orange-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-orange-500">
                                                    <i class="fas fa-user-cog mr-2"></i>PHÂN QUYỀN
                                                </button>
                                            </td>
                                        </tr>

                                        <!--Modal disable user-->
                                    <div class="modal fade" id="disableUser-${status.count}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Chặn người dùng</h1>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div>
                                                        Name: ${user.name} | AccountId: ${user.IDAccount}
                                                    </div>
                                                    Bạn có chắc chắn sẽ chặn người dùng này?

                                                </div>
                                                <div class="modal-footer">
                                                    <button style="color: #000" type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                    <button style="background-image: linear-gradient(to right top, #45af2a, #3ba023, #30901c, #268215, #1b730d, #1b730d, #1b730d, #1b730d, #268215, #30901c, #3ba023, #45af2a)" type="button" class="btn btn-primary">
                                                        <a href="manageuser?action=disableUser&id=${user.IDAccount}"> Save changes </a>  
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <!--Modal enalble user-->
                                    <div class="modal fade" id="enableUser-${status.count}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Bỏ chặn người dùng</h1>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div>
                                                        Name: ${user.name} | AccountId: ${user.IDAccount}
                                                    </div>
                                                    Bạn có chắc chắn sẽ bỏ chặn người dùng này?
                                                </div>
                                                <div class="modal-footer">
                                                    <button style="color: #000" type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                    <button style=" background-image: linear-gradient(to right top, #45af2a, #3ba023, #30901c, #268215, #1b730d, #1b730d, #1b730d, #1b730d, #268215, #30901c, #3ba023, #45af2a)" type="button" class="btn btn-primary">
                                                        <a href="manageuser?action=enableUser&id=${user.IDAccount}"> Save changes </a>  
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>



                                    <!--Modal disable user-->
                                    <div class="modal fade" id="setRole-${status.count}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <form action="manageuser">
                                                <input hidden name="action" value="setRole">      
                                                <input hidden name="id" value="${user.IDAccount}">

                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Phân quyền cho tài khoản: ${user.userName}</h1>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div>
                                                            Name: ${user.name} | AccountId: ${user.IDAccount}
                                                        </div>

                                                        <div style="display: flex; align-item: center; justify-content: center">
                                                            <span>
                                                                Role: 
                                                            </span>
                                                            <select name="roleId" id="permissions" name="pe rmissions" class="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md">
                                                                <option value="1">Chọn quyền:</option>
                                                                <option value="1">Customer</option>
                                                                <option value="2">Staff</option>
                                                                <option value="3">Admin</option>
                                                            </select>
                                                        </div>

                                                        Vai trò của người dùng sẽ được cập nhật sao khi bạn nhất vào "Save change"!
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button style="color: #000" type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        <button style="background-image: linear-gradient(to right top, #45af2a, #3ba023, #30901c, #268215, #1b730d, #1b730d, #1b730d, #1b730d, #268215, #30901c, #3ba023, #45af2a)" type="submit" class="btn btn-primary" >
                                                            <a> Save changes </a>  
                                                        </button>
                                                    </div>
                                                </div>
                                            </form>

                                        </div>
                                    </div>

                                </c:forEach>
                                <!-- Repeat for each user -->
                                </tbody>
                            </table>
                        </div>
                    </div>


                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <c:choose>
                                <c:when test ="${selectedPage - 1 < 1}">
                                    <li class="page-item disabled">
                                        <a  class="page-link"  tabindex="-1" aria-disabled="true">Previous</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a class="page-link" href="manageuser?action=viewList&index=${selectedPage-1}">Previous</a></li>
                                </c:otherwise>
                            </c:choose>
                            <c:forEach begin="1" end="${endP}" var="i">
                                <li class="page-item ${i == selectedPage ? "active" : ""}"><a class="page-link" href="manageuser?action=viewList&index=${i}">${i}</a></li>
                                </c:forEach>
                                <c:choose>
                                    <c:when test ="${selectedPage >= endP}">
                                    <li class="page-item disabled">
                                        <a  class="page-link"  tabindex="-1" aria-disabled="true">Next</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a class="page-link" href="manageuser?action=viewList&index=${selectedPage + 1}">Next</a></li>
                                    </c:otherwise>
                                </c:choose>
                        </ul>
                    </nav>

                    <!-- Widgets Start -->

                    <!-- Widgets End -->


                    <!-- Footer Start -->
                    <c:if test="${msg != null}">
                        <div class=" container-fluid pt-4 px-4">
                            <div class="bg-light rounded-top p-4">
                                <div class="row">
                                    <div class="col-12 col-sm-6 text-center text-sm-start">
                                        <a href="">${msg}</a>!!!
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <div class=" container-fluid pt-4 px-4">
                        <div class="bg-light rounded-top p-4">
                            <div class="row">
                                <div class="col-12 col-sm-6 text-center text-sm-start">
                                    <a href="index1.jsp">FBK74 Nơi tôn vinh bóng đá</a>, All Right
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
    </script>

</html>
