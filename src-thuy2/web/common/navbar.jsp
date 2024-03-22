<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset = UTF-8" %>

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
                        <a href="danhsachtimsan" class="nav-item nav-link">Tìm Sân</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Tìm Đối Thủ</a>
                            <div class="dropdown-menu m-0">
                                <a href="blog.html" class="dropdown-item">Đăng ký làm đối thủ</a>
                                <a href="detail.html" class="dropdown-item">Tìm kiếm đối thủ</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Giải Đấu</a>
                            <div class="dropdown-menu m-0">
                                <a href="tournaments" class="dropdown-item">Thông tin các giải đấu</a>
                                <a href="HistoryServlet" class="dropdown-item">Giải đấu đã đăng ký</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown">Khóa học</a>
                            <div class="dropdown-menu m-0">
                                <a href="ListCourse" class="dropdown-item">Thông tin khóa học</a>

                                <a href="CustomerCourse " class="dropdown-item">Khóa học của tôi</a>
                            </div>
                        </div>
                        <a href="contact.html" class="nav-item nav-link">Liên Hệ</a>
                    </div >
                    <a href="lichsuhoadon" class="icon-button">
                        <span class="material-icons">shopping_cart</span>
                    </a>
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
</div><!-- comment -->