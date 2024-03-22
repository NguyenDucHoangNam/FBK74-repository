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
            /*---------------------
              Shop Cart
            -----------------------*/
            .add-product-btn {
                padding: 10px 20px;
                background-color: #4CAF50; /* Green */
                border: none;
                color: white;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin-top: 10px;
                cursor: pointer;
                border-radius: 5px;
            }

            .add-product-btn:hover {
                background-color: #45a049; /* Darker Green */
            }

            .quantity {
                display: inline-block;
                font-size: 14px;
            }

            .pro-qty {
                display: flex;
                align-items: center;
            }

            .qtybtn {
                width: 30px;
                height: 30px;
                background: #f1f3f5;
                border: none;
                cursor: pointer;
            }

            input[type="text"] {
                width: 50px;
                text-align: center;
                border: none;
                border-radius: 5px;
                margin: 0 5px;
            }

            #quantityText {
                margin-top: 5px;
            }

            .shoping-cart {
                padding-top: 80px;
                padding-bottom: 80px;
            }

            .shoping__cart__table {
                margin-bottom: 30px;
            }

            .shoping__cart__table table {
                width: 100%;
                text-align: center;
            }

            .shoping__cart__table table thead tr {
                border-bottom: 1px solid #ebebeb;
            }

            .shoping__cart__table table thead th {
                font-size: 20px;
                font-weight: 700;
                color: #1c1c1c;
                padding-bottom: 20px;
            }

            .shoping__cart__table table thead th.shoping__product {
                text-align: left;
            }

            .shoping__cart__table table tbody tr td {
                padding-top: 30px;
                padding-bottom: 30px;
                border-bottom: 1px solid #ebebeb;
            }

            .shoping__cart__table table tbody tr td.shoping__cart__item {
                width: 630px;
                text-align: left;
            }

            .shoping__cart__table table tbody tr td.shoping__cart__item img {
                display: inline-block;
                margin-right: 25px;
            }

            .shoping__cart__table table tbody tr td.shoping__cart__item h5 {
                color: #1c1c1c;
                display: inline-block;
            }

            .shoping__cart__table table tbody tr td.shoping__cart__price {
                font-size: 18px;
                color: #1c1c1c;
                font-weight: 700;
                width: 100px;
            }

            .shoping__cart__table table tbody tr td.shoping__cart__total {
                font-size: 18px;
                color: #1c1c1c;
                font-weight: 700;
                width: 110px;
            }

            .shoping__cart__table table tbody tr td.shoping__cart__item__close {
                text-align: right;
            }

            .shoping__cart__table table tbody tr td.shoping__cart__item__close span {
                font-size: 24px;
                color: #b2b2b2;
                cursor: pointer;
            }

            .shoping__cart__table table tbody tr td.shoping__cart__quantity {
                width: 225px;
            }

            .shoping__cart__table table tbody tr td.shoping__cart__quantity .pro-qty {
                width: 120px;
                height: 40px;
            }

            .shoping__cart__table table tbody tr td.shoping__cart__quantity .pro-qty input {
                color: #1c1c1c;
            }

            .shoping__cart__table table tbody tr td.shoping__cart__quantity .pro-qty input::placeholder {
                color: #1c1c1c;
            }

            .shoping__cart__table table tbody tr td.shoping__cart__quantity .pro-qty .qtybtn {
                width: 15px;
            }

            .primary-btn.cart-btn {
                color: #6f6f6f;
                padding: 14px 30px 12px;
                background: #f5f5f5;
            }

            .primary-btn.cart-btn span {
                font-size: 14px;
            }

            .primary-btn.cart-btn.cart-btn-right {
                float: right;
            }

            .shoping__discount {
                margin-top: 45px;
            }

            .shoping__discount h5 {
                font-size: 20px;
                color: #1c1c1c;
                font-weight: 700;
                margin-bottom: 25px;
            }

            .shoping__discount form input {
                width: 255px;
                height: 46px;
                border: 1px solid #cccccc;
                font-size: 16px;
                color: #b2b2b2;
                text-align: center;
                display: inline-block;
                margin-right: 15px;
            }

            .shoping__discount form input::placeholder {
                color: #b2b2b2;
            }

            .shoping__discount form button {
                padding: 15px 30px 11px;
                font-size: 12px;
                letter-spacing: 4px;
                background: #6f6f6f;
            }

            .shoping__checkout {
                background: #f5f5f5;
                padding: 30px;
                padding-top: 20px;
                margin-top: 50px;
            }

            .shoping__checkout h5 {
                color: #1c1c1c;
                font-weight: 700;
                font-size: 20px;
                margin-bottom: 28px;
            }

            .shoping__checkout ul {
                margin-bottom: 28px;
            }

            .shoping__checkout ul li {
                font-size: 16px;
                color: #1c1c1c;
                font-weight: 700;
                list-style: none;
                overflow: hidden;
                border-bottom: 1px solid #ebebeb;
                padding-bottom: 13px;
                margin-bottom: 18px;
            }

            .shoping__checkout ul li:last-child {
                padding-bottom: 0;
                border-bottom: none;
                margin-bottom: 0;
            }

            .shoping__checkout ul li span {
                font-size: 18px;
                color: #dd2222;
                float: right;
            }

            .shoping__checkout .primary-btn {
                display: block;
                text-align: center;
            }

            /*---------------------
              Checkout
            -----------------------*/

            .checkout {
                padding-top: 80px;
                padding-bottom: 60px;
            }

            .checkout h6 {
                color: #999999;
                text-align: center;
                background: #f5f5f5;
                border-top: 1px solid #6AB963;
                padding: 12px 0 12px;
                margin-bottom: 75px;
            }

            .checkout h6 span {
                font-size: 16px;
                color: #6AB963;
                margin-right: 5px;
            }

            .checkout h6 a {
                text-decoration: underline;
                color: #999999;
            }

            .checkout__form h4 {
                color: #1c1c1c;
                font-weight: 700;
                border-bottom: 1px solid #e1e1e1;
                padding-bottom: 20px;
                margin-bottom: 25px;
            }

            .checkout__form p {
                column-rule: #b2b2b2;
            }

            .checkout__input {
                margin-bottom: 24px;
            }

            .checkout__input p {
                color: #1c1c1c;
                margin-bottom: 20px;
            }

            .checkout__input p span {
                color: #dd2222;
            }

            .checkout__input input {
                width: 100%;
                height: 46px;
                border: 1px solid #ebebeb;
                padding-left: 20px;
                font-size: 16px;
                color: #b2b2b2;
                border-radius: 4px;
            }

            .checkout__input input.checkout__input__add {
                margin-bottom: 20px;
            }

            .checkout__input input::placeholder {
                color: #b2b2b2;
            }

            .checkout__input__checkbox {
                margin-bottom: 10px;
            }

            .checkout__input__checkbox label {
                position: relative;
                font-size: 16px;
                color: #1c1c1c;
                padding-left: 40px;
                cursor: pointer;
            }

            .checkout__input__checkbox label input {
                position: absolute;
                visibility: hidden;
            }

            .checkout__input__checkbox label input:checked~.checkmark {
                background: #7fad39;
                border-color: #7fad39;
            }

            .checkout__input__checkbox label input:checked~.checkmark:after {
                opacity: 1;
            }

            .checkout__input__checkbox label .checkmark {
                position: absolute;
                left: 0;
                top: 4px;
                height: 16px;
                width: 14px;
                border: 1px solid #a6a6a6;
                content: "";
                border-radius: 4px;
            }

            .checkout__input__checkbox label .checkmark:after {
                position: absolute;
                left: 1px;
                top: 1px;
                width: 10px;
                height: 8px;
                border: solid white;
                border-width: 3px 3px 0px 0px;
                -webkit-transform: rotate(127deg);
                -ms-transform: rotate(127deg);
                transform: rotate(127deg);
                content: "";
                opacity: 0;
            }

            .checkout__order {
                background: #f5f5f5;
                padding: 40px;
                padding-top: 30px;
            }

            .checkout__order h4 {
                color: #1c1c1c;
                font-weight: 700;
                border-bottom: 1px solid #e1e1e1;
                padding-bottom: 20px;
                margin-bottom: 20px;
            }

            .checkout__order .checkout__order__products {
                font-size: 18px;
                color: #1c1c1c;
                font-weight: 700;
                margin-bottom: 10px;
            }

            .checkout__order .checkout__order__products span {
                float: right;
            }

            .checkout__order ul {
                margin-bottom: 12px;
            }

            .checkout__order ul li {
                font-size: 16px;
                color: #6f6f6f;
                line-height: 40px;
                list-style: none;
            }

            .checkout__order ul li span {
                font-weight: 700;
                float: right;
            }

            .checkout__order .checkout__order__subtotal {
                font-size: 18px;
                color: #1c1c1c;
                font-weight: 700;
                border-bottom: 1px solid #e1e1e1;
                border-top: 1px solid #e1e1e1;
                padding-bottom: 15px;
                margin-bottom: 15px;
                padding-top: 15px;
            }

            .checkout__order .checkout__order__subtotal span {
                float: right;
            }

            .checkout__order .checkout__input__checkbox label {
                padding-left: 20px;
            }

            .checkout__order .checkout__order__total {
                font-size: 18px;
                color: #1c1c1c;
                font-weight: 700;
                border-bottom: 1px solid #e1e1e1;
                padding-bottom: 15px;
                margin-bottom: 25px;
            }

            .checkout__order .checkout__order__total span {
                float: right;
                color: #dd2222;
            }

            .checkout__order button {
                font-size: 18px;
                letter-spacing: 2px;
                width: 100%;
                margin-top: 10px;
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
                <nav class="navbar bg-light navbar-light">
                    <a href="index.html" class="navbar-brand mx-4 mb-3">
                        <h3 class="text-primary">FBK74</h3>
                    </a>
                    <div class="navbar-nav w-100">
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i
                                    class="fa fa-laptop me-2"></i>Quản lý sân bóng</a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <a href="" class="dropdown-item">Quản lý sân bóng</a>
                                <a href="" class="dropdown-item">Cập nhật sân bóng</a>
                                <a href="" class="dropdown-item">Xác nhận yêu cầu</a>
                                <a href="" class="dropdown-item">Danh sách đối thủ</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i
                                    class="fa fa-laptop me-2"></i>Giải đấu</a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <a href="quanlygiaidau_nam.html" class="dropdown-item">Quản lý giải đấu</a>
                                <a href="quanlydoibongthamgia_nam.html" class="dropdown-item">Quản lý đội bóng và danh sách
                                    cầu thủ</a>
                                <a href="quanlylichthidau_nam.html" class="dropdown-item">Quản lý lịch thi đấu</a>
                                <a href="quanlyketqua_nam.html" class="dropdown-item">Quản lý kết quả</a>
                                <a href="kiemduyetcacdoibongthamgiagiaidau_nam.html" class="dropdown-item">Kiểm duyệt các
                                    đội bóng tham gia</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i
                                    class="fa fa-laptop me-2"></i>Khóa học</a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <a href="" class="dropdown-item">Buttons</a>
                                <a href="" class="dropdown-item">Typography</a>
                                <a href="" class="dropdown-item">Other Elements</a>
                            </div>
                        </div>

                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i
                                    class="far fa-file-alt me-2"></i>Pages</a>
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
                                <img class="rounded-circle me-lg-2" src="img/user.jpg" alt=""
                                     style="width: 40px; height: 40px;">
                                <span class="d-none d-lg-inline-flex">John Doe</span>
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
              <section class="shoping-cart spad">

        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <form action="sort" method="get" style="margin-top:10px;">
                        <button class="btn btn-primary mt-5" type="submit" name="action" value="sort_quantity">Sort by Quantity</button>
                    </form>
                    
                </div>
                <div class="col-md-4">
                    <form action="search" method="get" style="margin-top:10px;display:flex">
                       
                        <input type="text" class="form-control" name="search" placeholder="Search products..." style="margin-top: 42px;
    width: 225px !important;
    padding: 0px;
}">
                        <button class="btn btn-primary mt-5" type="submit" name="action" value="search">Search</button>
                      
                    </form>
                    
                </div>
                <div class="col-md-4">
                    <button class="add-product-btn" style="margin-top: 50px;
    margin-left: 200px;" ><a href="add-product.jsp" style="color: white; text-decoration: none;">Add product</a>

                    </button>

                </div>
            </div>



            <div class="row mt-5">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">Products</th>
                                   
                                    <th>Quantity</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="product" items="${products}">
                                    <tr>
                                        <td class="shoping__cart__item">

                                            <img src="../img/${product.image}" alt="${product.image}" style="width:200px">
                                            <h5>${product.name}</h5>
                                        </td>
                                       
                                        <td class="shoping__cart__price">


                                            <input type="number" value="${product.quantity}" style="width:60px;padding:10px 0px">


                                        </td>

                                        <td class="">
                                            <button class="delete-btn btn btn-outline-danger" onclick="deleteProduct('${product.id}')">Delete</button>
                                            <button class="update-btn btn btn-outline-warning" onclick="updateProduct('${product.id}')">Update</button>
                                        </td>
                                    </tr>
                                </c:forEach>


                            </tbody>
                        </table>
                    </div>

                </div>

                <ul class="pagination">
                    <c:forEach var="page" begin="1" end="${totalPages}">
                        <li class="page-item">
                            <a class="page-link" href="${pageContext.request.contextPath}?currentPage=${page}">${page}</a>
                        </li>
                    </c:forEach>
                </ul>

            </div>

        </div>
    </section>

                <!-- Main Content End -->


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
    function deleteProduct(id) {
        if (confirm('Are you sure you want to delete product with id = ' + id)) {

            window.location.href = 'delete_product?id=' + id;

        }
    }

    function updateProduct(id) {
        window.location.href = 'update_product?id=' + id;
    }

    document.addEventListener("DOMContentLoaded", function () {
        var quantityInput = document.querySelector("input[type='text']");

        var decrementBtn = document.querySelector(".dec");
        var incrementBtn = document.querySelector(".inc");

        decrementBtn.addEventListener("click", function () {
            var currentValue = parseInt(quantityInput.value);
            if (currentValue >= 1) {
                quantityInput.value = currentValue - 1;
            }
        });

        incrementBtn.addEventListener("click", function () {
            var currentValue = parseInt(quantityInput.value);
            quantityInput.value = currentValue + 1;

        });


    });

</script>
</html>
