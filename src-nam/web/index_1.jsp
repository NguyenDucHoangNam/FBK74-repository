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

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/animate/animate.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    </head>

    <body>

        <jsp:include page="header_nam.jsp"/>
        <div id="header-carousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="w-100" src="img/anh3.jpg" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 900px;">
                            <h5 class="text-white text-uppercase mb-3 animated slideInDown">Chuyên Nghiệp & Chất Lượng</h5>
                            <h1 class="display-1 text-white mb-md-4 animated zoomIn">Sân cỏ nhân tạo dành cho thi đấu bóng đá</h1>
                            <a href="about.html" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Đặt Sân</a>
                            <a href="" class="btn btn-outline-light py-md-3 px-md-5 animated slideInRight">Liên hệ</a>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="img/anh1.jpg" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 900px;">
                            <h5 class="text-white text-uppercase mb-3 animated slideInDown">Nhanh Chóng & Hiệu Quả</h5>
                            <h1 class="display-1 text-white mb-md-4 animated zoomIn">Thỏa sức cháy hết mình với đam mê</h1>
                            <a href="about.html" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Đặt Sân</a>
                            <a href="" class="btn btn-outline-light py-md-3 px-md-5 animated slideInRight">Liên hệ</a>
                        </div>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#header-carousel"
                    data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#header-carousel"
                    data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
        <!-- About Start -->
        <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container py-5">
                <div class="row g-5">
                    <div class="col-lg-7">
                        <div class="section-title position-relative pb-3 mb-5">
                            <h5 class="fw-bold text-primary text-uppercase">Thông tin</h5>
                            <h1 class="mb-0">Sân bóng nhân tạo hàng đầu Đà Nẵng</h1>
                        </div>
                        <p class="mb-4">
                            Chào mừng bạn đến với trung tâm quản lý sân bóng đá nhân tạo FBK74 Đà Nẵng! Với hơn 10 năm kinh nghiệm, chúng tôi tự hào giới thiệu đến bạn một không gian chất lượng và hiện đại, đáp ứng đầy đủ nhu cầu cho mọi đội bóng và đấu trường thể thao.</p>
                        <div class="row g-0 mb-3">
                            <div class="col-sm-6 wow zoomIn" data-wow-delay="0.2s">
                                <h5 class="mb-3"><i class="fa fa-check text-primary me-3"></i>CHẤT LƯỢNG KIỂM CHỨNG</h5>
                                <h5 class="mb-3"><i class="fa fa-check text-primary me-3"></i>CƠ SỞ VẬT CHẤT HIỆN ĐẠI</h5>
                            </div>
                            <div class="col-sm-6 wow zoomIn" data-wow-delay="0.4s">
                                <h5 class="mb-3"><i class="fa fa-check text-primary me-3"></i> ĐA DẠNG VÀ TIỆN NGHI</h5>
                                <h5 class="mb-3"><i class="fa fa-check text-primary me-3"></i>DỊCH VỤ CHUYÊN NGHIỆP</h5>
                            </div>
                        </div>
                        <div class="d-flex align-items-center mb-4 wow fadeIn" data-wow-delay="0.6s">
                            <div class="bg-primary d-flex align-items-center justify-content-center rounded" style="width: 60px; height: 60px;">
                                <i class="fa fa-phone-alt text-white"></i>
                            </div>
                            <div class="ps-4">
                                <h5 class="mb-2">Liên Hệ Để Đuợc Tư Vấn</h5>
                                <h4 class="text-primary mb-0">+012 345 6789</h4>
                            </div>
                        </div>
                        <a href="quote.html" class="btn btn-primary py-3 px-5 mt-3 wow zoomIn" data-wow-delay="0.9s">Đặt sân</a>
                    </div>
                    <div class="col-lg-5" style="min-height: 500px;">
                        <div class="position-relative h-100">
                            <img class="position-absolute w-100 h-100 rounded wow zoomIn" data-wow-delay="0.9s" src="img/anh6.jpg" style="object-fit: cover;">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- About End -->


        <!-- Features Start -->
        <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container py-5">
                <div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width: 1000px;">
                    <h5 class="fw-bold text-primary text-uppercase">Tại sao bạn nên chọn chúng tôi</h5>
                    <h1 class="mb-0">Cỏ nhân tạo, trận đấu thực sự <br> Chúng tôi là lựa chọn của người chiến thắng!</h1>
                </div>
                <div class="row g-5">
                    <div class="col-lg-4">
                        <div class="row g-5">
                            <div class="col-12 wow zoomIn" data-wow-delay="0.2s">
                                <div class="bg-primary rounded d-flex align-items-center justify-content-center mb-3" style="width: 60px; height: 60px;">
                                    <i class="fa fa-cubes text-white"></i>
                                </div>
                                <h4>Sân cỏ tốt nhất</h4>
                                <p class="mb-0">Sử dụng cỏ chuyên dụng, chăm sóc đặc biệt để đảm bảo độ chơi tốt nhất và an toàn cho cầu thủ</p>
                            </div>
                            <div class="col-12 wow zoomIn" data-wow-delay="0.6s">
                                <div class="bg-primary rounded d-flex align-items-center justify-content-center mb-3" style="width: 60px; height: 60px;">
                                    <i class="fa fa-award text-white"></i>
                                </div>
                                <h4>Đội ngũ nhân viên nhiệt tình, chuyên nghiệp</h4>
                                <p class="mb-0">Sẵn sàng hỗ trợ và giải đáp mọi thắc mắc khách hàng cần, chăm sóc khách hàng mọi lúc mọi nơi </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4  wow zoomIn" data-wow-delay="0.9s" style="min-height: 350px;">
                        <div class="position-relative h-100">
                            <img class="position-absolute w-100 h-100 rounded wow zoomIn" data-wow-delay="0.1s" src="img/anh5.jpg" style="object-fit: cover;">
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="row g-5">
                            <div class="col-12 wow zoomIn" data-wow-delay="0.4s">
                                <div class="bg-primary rounded d-flex align-items-center justify-content-center mb-3" style="width: 60px; height: 60px;">
                                    <i class="fa fa-users-cog text-white"></i>
                                </div>
                                <h4>Cơ sở vật chất hiện đại</h4>
                                <p class="mb-0">Đảm bảo cơ sở vật chất hiện đại hàng đầu, an toàn dành cho mọi người chơi</p>
                            </div>
                            <div class="col-12 wow zoomIn" data-wow-delay="0.8s">
                                <div class="bg-primary rounded d-flex align-items-center justify-content-center mb-3" style="width: 60px; height: 60px;">
                                    <i class="fa fa-phone-alt text-white"></i>
                                </div>
                                <h4>Hỗ trợ 24/7 </h4>
                                <p class="mb-0">Mọi vấn đề đều được giải quyết nhanh chóng và sớm nhất</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Features Start -->
        <!-- Testimonial Start -->
        <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container py-5">
                <div class="section-title text-center position-relative pb-3 mb-4 mx-auto" style="max-width: 600px;">
                    <h5 class="fw-bold text-primary text-uppercase">Người dùng chia sẻ</h5>
                    <h1 class="mb-0">Khách hàng nói gì về Website của chúng tôi</h1>
                </div>
                <div class="owl-carousel testimonial-carousel wow fadeInUp" data-wow-delay="0.6s">
                    <div class="testimonial-item bg-light my-4">
                        <div class="d-flex align-items-center border-bottom pt-5 pb-4 px-5">
                            <img class="img-fluid rounded" src="https://vcdn-thethao.vnecdn.net/2023/01/24/lionel-messi-4-jpeg-8016-1674528922.jpg" style="width: 60px; height: 60px;" >
                            <div class="ps-4">
                                <h4 class="text-primary mb-1">Messi</h4>
                                <small class="text-uppercase">Nhân Viên Văn Phòng</small>
                            </div>
                        </div>
                        <div class="pt-4 pb-5 px-5">
                            "Trang web rất dễ sử dụng, tìm kiếm và đặt sân nhanh chóng. Giao diện thân thiện với người dùng. Tính năng xem sẵn có và đặt sân online làm tăng tính thuận tiện, tiết kiệm thời gian."
                        </div>
                    </div>
                    <div class="testimonial-item bg-light my-4">
                        <div class="d-flex align-items-center border-bottom pt-5 pb-4 px-5">
                            <img class="img-fluid rounded" src="https://images.ladepeche.fr/api/v1/images/view/6564ffd0ee16960696387567/large/image.jpg?v=1" style="width: 60px; height: 60px;" >
                            <div class="ps-4">
                                <h4 class="text-primary mb-1">Ronaldo</h4>
                                <small class="text-uppercase">IT</small>
                            </div>
                        </div>
                        <div class="pt-4 pb-5 px-5">
                            "Giao diện trực quan và dễ sử dụng, nhưng tôi mong muốn có thêm tính năng nhắc nhở thông qua tin nhắn hoặc email để đảm bảo không bỏ lỡ các đặt sân. Hỗ trợ từ ban quản trị rất nhanh chóng và nhiệt tình khi có vấn đề xuất hiện."
                        </div>
                    </div>
                    <div class="testimonial-item bg-light my-4">
                        <div class="d-flex align-items-center border-bottom pt-5 pb-4 px-5">
                            <img class="img-fluid rounded" src="https://img.a.transfermarkt.technology/portrait/big/342229-1682683695.jpg?lm=1" style="width: 60px; height: 60px;" >
                            <div class="ps-4">
                                <h4 class="text-primary mb-1">Mbappe</h4>
                                <small class="text-uppercase">Giảng Viên</small>
                            </div>
                        </div>
                        <div class="pt-4 pb-5 px-5">
                            "Thông tin chi tiết về sân giúp tôi chọn được sân phù hợp với nhu cầu. Các hình ảnh và đánh giá từ người chơi trước cũng rất hữu ích. Quá trình thanh toán trực tuyến làm cho mọi thứ trở nên thuận tiện và an toàn."
                        </div>
                    </div>
                    <div class="testimonial-item bg-light my-4">
                        <div class="d-flex align-items-center border-bottom pt-5 pb-4 px-5">
                            <img class="img-fluid rounded" src="https://b.fssta.com/uploads/application/soccer/headshots/713.vresize.350.350.medium.34.png" style="width: 60px; height: 60px;" >
                            <div class="ps-4">
                                <h4 class="text-primary mb-1">Neymar</h4>
                                <small class="text-uppercase">Sinh Viên</small>
                            </div>
                        </div>
                        <div class="pt-4 pb-5 px-5">
                            "Dịch vụ chăm sóc khách hàng vô cùng tốt, tìm sân kèo nhanh chóng, dễ bắt cặp với đối thủ tương xứng"
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
        <!-- Testimonial End
    
    
        <!-- Team Start -->
        <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container py-5">
                <div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width: 600px;">
                    <h5 class="fw-bold text-primary text-uppercase">Huấn luyện viên</h5>
                    <h1 class="mb-0">Đội ngũ huấn luyện viên trẻ vô cùng chuyên nghiệp</h1>
                </div>
                <div class="row g-5">
                    <div class="col-lg-4 wow slideInUp" data-wow-delay="0.3s">
                        <div class="team-item bg-light rounded overflow-hidden">
                            <div class="team-img position-relative overflow-hidden">
                                <img class="img-fluid w-100" src="https://www.rmit.edu.au/content/dam/rmit/vn/en/assets-for-production/images/news/news-thumb-coach-park-hang-seo-from-the-shadow-to-mainstream-phs.jpg" alt="">
                                <div class="team-social">
                                    <a class="btn btn-lg btn-primary btn-lg-square rounded" href=""><i class="fab fa-twitter fw-normal"></i></a>
                                    <a class="btn btn-lg btn-primary btn-lg-square rounded" href=""><i class="fab fa-facebook-f fw-normal"></i></a>
                                    <a class="btn btn-lg btn-primary btn-lg-square rounded" href=""><i class="fab fa-instagram fw-normal"></i></a>
                                    <a class="btn btn-lg btn-primary btn-lg-square rounded" href=""><i class="fab fa-linkedin-in fw-normal"></i></a>
                                </div>
                            </div>
                            <div class="text-center py-4">
                                <h4 class="text-primary">Park Hang-seo</h4>
                                <p class="text-uppercase m-0">Huấn luyện viên</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 wow slideInUp" data-wow-delay="0.6s">
                        <div class="team-item bg-light rounded overflow-hidden">
                            <div class="team-img position-relative overflow-hidden">
                                <img class="img-fluid w-300" src="https://image.baogialai.com.vn/w800/dataimages/202109/original/images3083267_CDN.jpg" alt="">
                                <div class="team-social">
                                    <a class="btn btn-lg btn-primary btn-lg-square rounded" href=""><i class="fab fa-twitter fw-normal"></i></a>
                                    <a class="btn btn-lg btn-primary btn-lg-square rounded" href=""><i class="fab fa-facebook-f fw-normal"></i></a>
                                    <a class="btn btn-lg btn-primary btn-lg-square rounded" href=""><i class="fab fa-instagram fw-normal"></i></a>
                                    <a class="btn btn-lg btn-primary btn-lg-square rounded" href=""><i class="fab fa-linkedin-in fw-normal"></i></a>
                                </div>
                            </div>
                            <div class="text-center py-4">
                                <h4 class="text-primary">Chu Đình Nghiêm</h4>
                                <p class="text-uppercase m-0">Huấn luyện viên</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 wow slideInUp" data-wow-delay="0.9s">
                        <div class="team-item bg-light rounded overflow-hidden">
                            <div class="team-img position-relative overflow-hidden">
                                <img class="img-fluid w-100" src="https://cdn-i.vtcnews.vn/resize-v1/yKoUY7taF5I8JGlXLXLsc7CsBB0Slio4Ltogdt3D16A/upload/2023/08/28/truong-viet-hoang-111-09305059.jpeg" alt="">
                                <div class="team-social">
                                    <a class="btn btn-lg btn-primary btn-lg-square rounded" href=""><i class="fab fa-twitter fw-normal"></i></a>
                                    <a class="btn btn-lg btn-primary btn-lg-square rounded" href=""><i class="fab fa-facebook-f fw-normal"></i></a>
                                    <a class="btn btn-lg btn-primary btn-lg-square rounded" href=""><i class="fab fa-instagram fw-normal"></i></a>
                                    <a class="btn btn-lg btn-primary btn-lg-square rounded" href=""><i class="fab fa-linkedin-in fw-normal"></i></a>
                                </div>
                            </div>
                            <div class="text-center py-4">
                                <h4 class="text-primary">Trương Việt Hoàng</h4>
                                <p class="text-uppercase m-0">Huấn luyện viên</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Team End -->


        <!-- Blog Start -->
        <!-- <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container py-5">
                <div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width: 600px;">
                    <h5 class="fw-bold text-primary text-uppercase">Latest Blog</h5>
                    <h1 class="mb-0">Read The Latest Articles from Our Blog Post</h1>
                </div>
                <div class="row g-5">
                    <div class="col-lg-4 wow slideInUp" data-wow-delay="0.3s">
                        <div class="blog-item bg-light rounded overflow-hidden">
                            <div class="blog-img position-relative overflow-hidden">
                                <img class="img-fluid" src="img/blog-1.jpg" alt="">
                                <a class="position-absolute top-0 start-0 bg-primary text-white rounded-end mt-5 py-2 px-4" href="">Web Design</a>
                            </div>
                            <div class="p-4">
                                <div class="d-flex mb-3">
                                    <small class="me-3"><i class="far fa-user text-primary me-2"></i>John Doe</small>
                                    <small><i class="far fa-calendar-alt text-primary me-2"></i>01 Jan, 2045</small>
                                </div>
                                <h4 class="mb-3">How to build a website</h4>
                                <p>Dolor et eos labore stet justo sed est sed sed sed dolor stet amet</p>
                                <a class="text-uppercase" href="">Read More <i class="bi bi-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 wow slideInUp" data-wow-delay="0.6s">
                        <div class="blog-item bg-light rounded overflow-hidden">
                            <div class="blog-img position-relative overflow-hidden">
                                <img class="img-fluid" src="img/blog-2.jpg" alt="">
                                <a class="position-absolute top-0 start-0 bg-primary text-white rounded-end mt-5 py-2 px-4" href="">Web Design</a>
                            </div>
                            <div class="p-4">
                                <div class="d-flex mb-3">
                                    <small class="me-3"><i class="far fa-user text-primary me-2"></i>John Doe</small>
                                    <small><i class="far fa-calendar-alt text-primary me-2"></i>01 Jan, 2045</small>
                                </div>
                                <h4 class="mb-3">How to build a website</h4>
                                <p>Dolor et eos labore stet justo sed est sed sed sed dolor stet amet</p>
                                <a class="text-uppercase" href="">Read More <i class="bi bi-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 wow slideInUp" data-wow-delay="0.9s">
                        <div class="blog-item bg-light rounded overflow-hidden">
                            <div class="blog-img position-relative overflow-hidden">
                                <img class="img-fluid" src="img/blog-3.jpg" alt="">
                                <a class="position-absolute top-0 start-0 bg-primary text-white rounded-end mt-5 py-2 px-4" href="">Web Design</a>
                            </div>
                            <div class="p-4">
                                <div class="d-flex mb-3">
                                    <small class="me-3"><i class="far fa-user text-primary me-2"></i>John Doe</small>
                                    <small><i class="far fa-calendar-alt text-primary me-2"></i>01 Jan, 2045</small>
                                </div>
                                <h4 class="mb-3">How to build a website</h4>
                                <p>Dolor et eos labore stet justo sed est sed sed sed dolor stet amet</p>
                                <a class="text-uppercase" href="">Read More <i class="bi bi-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
        <!-- Blog Start -->


        <!-- Vendor Start -->
        <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container py-5 mb-5">
                <div class="bg-white">
                    <div class="owl-carousel vendor-carousel">
                        <img src="img/anh8.png" alt="">
                        <img src="img/anh9.webp" alt="">
                        <img src="img/anh10.png" alt="">
                        <img src="img/anh11.png" alt="">
                        <img src="img/anh12.png" alt="">
                        <img src="img/anh13.png" alt="">
                        <img src="img/vendor-7.jpg" alt="">
                        <img src="img/vendor-8.jpg" alt="">
                        <img src="img/vendor-9.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
        <!-- Vendor End -->


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
        <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>


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
    </body>

</html>