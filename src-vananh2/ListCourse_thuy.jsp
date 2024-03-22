<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
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
    <style>
        .text-primary1, .course-title {
            text-align: center;
            margin-top: 20px;
            font-weight: bold;
            font-size: 20px;
            margin-bottom: 30px; /* Space between cards */
            background-color: #e0ecf7; /* Light background */
            border-radius: 20px;
            overflow: hidden; /* Ensures the child elements do not overflow */
            box-shadow: 0 4px 8px rgba(0,0,0,0.1); /* Adds subtle shadow */


        }
        .text-primary1{
            font-size: 40px;
            color: #06A3DA;


        }
        .course-card {
            margin-bottom: 30px; /* Space between cards */
            background-color: #e0ecf7; /* Light background */
            border-radius: 10px;
            overflow: hidden; /* Ensures the child elements do not overflow */
            box-shadow: 0 4px 8px rgba(0,0,0,0.1); /* Adds subtle shadow */
        }

        .course-image img {
            width: 100%;
            height: 200px; /* Fixed height for consistency */
            object-fit: cover; /* Ensures images cover the area nicely */
        }

        /* Advertisements */
        .advert-banner img {
            width: 100%;
            height: 20vh;
            object-fit: cover;
            margin-bottom: 10px; /* Adds space between ads */
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .btn-primary, .advert-banner {
                margin: 10px 0; /* Adjusts spacing for smaller screens */
            }
        }
        .course-title {

            text-align: center;
            margin-top: 20px;
            font-weight: bold;
            font-size: 20px; /* Adjust this value as needed */
            color: #06A3DA; /* Example: Deep blue color */
            font-family: "Nunito", sans-serif; /* Ensures font family consistency */
            /* Additional styling */
            padding: 10px;
            background-color: #c2dbf1; /* Light background color for contrast */
            border-radius: 10px; /* Rounded corners for visual appeal */
            margin-bottom: 20px; /* Spacing below the title */
        }
        .btn-primary {
            display: block;
            margin: 20px auto;
            padding: 10px 20px; /* More clickable area */
            background-color: #06A3DA; /* Your primary color */
            color: #ffffff; /* White text */
            border: none;
            border-radius: 5px; /* Rounded corners */
            font-weight: bold;
            cursor: pointer;
            text-decoration: none; /* Remove underline from anchors styled as buttons */
        }
        .course-introduction {
    /* Add your existing CSS styles here */

    /* Example of adding a shadow */
    box-shadow: 0px 4px 8px #70b7cf; /* horizontal offset, vertical offset, blur radius, color */
    font-family: Palatino;
}
.inf-course{
    font-family: Palatino;
}
    </style>
    <body>
        <jsp:include page="common/navbar.jsp" />   
        <section class="container">
            <h2 class="text-primary1"> Thông tin khóa học </h2>
            <div class="row">
                <div class="col-md-1 d-none d-md-block">
                    <div class="advert-banner animate__animated animate__fadeIn">
                        <img src="img_thuy/thuyqc1.jpg" alt="Quảng cáo bên trái" class="img-fluid"style=" height: 20vh; width: 100%; object-fit: cover;">
                        <img src="img_thuy/thuyqc1.jpg" alt="Quảng cáo bên trái" class="img-fluid"style=" height: 20vh; width: 100%; object-fit: cover;">
                        <img src="img_thuy/thuyqc1.jpg" alt="Quảng cáo bên trái" class="img-fluid"style=" height: 20vh; width: 100%; object-fit: cover;">
                        <img src="img_thuy/thuyqc1.jpg" alt="Quảng cáo bên trái" class="img-fluid"style=" height: 20vh; width: 100%; object-fit: cover;">
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="row">
                        <c:forEach var="course" items="${listCourse}">
                            <article class="col-md-4">
                                <div class="course-card">
                                    <h3 class="course-title">${course.getNameYouthTrainingCourse()}</h3>
                                    <div class="course-image">
                                        <img src="img_thuy/${course.image}" alt="Course Image - ${course.getNameYouthTrainingCourse()}" style="height: 30vh; width: 100%; object-fit: cover;">
                                    </div>
                                    <div class="inf-course">
                                    <p><strong>  Thời gian mở đăng ký:</strong>${course.getTimeRegist()}</p>
                                    <p><strong> Thời gian đóng đăng ký:</strong>${course.getTimeCloseRegist()}</p>
                                    <p><strong> Thời gian bắt đầu khóa học :</strong>${course.getTimeStart()}</p>
                                    <p><strong> Học phí:</strong>${course.getTuition()}</p>
                                    <div class="course-introduction">
                                        <p><strong> Giới thiệu :</strong>${course.getInformation()}</p>

                                    </div>
                                    </div>
                                    <a href="classCustomer?id=${course.getIdYouthTrainingCourse()}" class="btn btn-primary">Chi tiết khóa học</a>

                                </div>
                            </article>
                        </c:forEach>
                    </div>
                </div>
                <div class="col-md-1 d-none d-md-block">
                    <div class="advert-banner animate__animated animate__fadeIn">
                        <img src="img_thuy/thuyqc2.jpg" alt="Quảng cáo bên phải" class="img-fluid" style=" height: 20vh; width: 100%; object-fit: cover;">
                        <img src="img_thuy/thuyqc2.jpg" alt="Quảng cáo bên phải" class="img-fluid"  style=" height: 20vh; width: 100%; object-fit: cover;">
                        <img src="img_thuy/thuyqc2.jpg" alt="Quảng cáo bên phải" class="img-fluid"style=" height: 20vh; width: 100%; object-fit: cover;">
                        <img src="img_thuy/thuyqc2.jpg" alt="Quảng cáo bên phải" class="img-fluid"style=" height: 20vh; width: 100%; object-fit: cover;">
                    </div>

                </div>
            </div>
        </section>
        <jsp:include page="common/footer.jsp" />
    </body>
</html>