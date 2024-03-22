<%@page import="model.ClassEntity"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset = UTF-8" %>
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
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/animate/animate.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--CSS Nhat-->
        <link rel="stylesheet" href="css/style_nhat.css"/>
    </head>
    <style>
        .table1 {
            border-collapse: collapse;
            width: 100%;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .table1 thead th {
            background-color: #06A3DA;
            color: #ffffff;
            padding: 5px 10px;
            text-align: left;
            font-size: 14px;
        }

        .table1 tbody tr:nth-child(odd) {
            background-color: #f2f2f2;
        }

        .table1 tbody tr:hover {
            background-color: #ddd;
            cursor: pointer;
        }

        .table1 td, .table1 th {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }
        .text-primary1 {
            text-align: center;
            color: #06A3DA;
            margin-top: 20px;
            font-weight: bold;
            font-size: 40px;
            margin-bottom: 30px; /* Space between cards */
            background-color: #e0ecf7; /* Light background */
            border-radius: 20px;
            overflow: hidden; /* Ensures the child elements do not overflow */
            box-shadow: 0 4px 8px rgba(0,0,0,0.1); /* Adds subtle shadow */
            

        </style>
        <body>
            <jsp:include page="common/navbar.jsp" />   
           

            <div class="container-fluid">
                <h2 class="text-primary1">Danh sách lớp học</h2>

                <table class="table1">
                    <thead>
                        <tr>
                            <th>Tên lớp học</th>
                            <th>ID Lớp học</th>
                            
                            <th>Tên HLV</th>
                            <th>Số điện thoại HLV</th>
                            <th>Số lượng học sinh</th>
                            <th>Lựa chọn</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="course" items="${listClass}">

                            <tr>
                                <td>${name}</td>
                                <td>${course.idClass}</td>
                                
                                <td>${course.coachName}</td>
                                <td>${course.coachPhoneNumber}</td>
                                <td>${course.numberOfStudent}</td>

                                <td>
                                    <a href="regist-member?idClass=${course.idClass}&numberOfStudent=${course.numberOfStudent}&idCourse=${idCourse}">
                                        <button class="btn btn-primary">Đăng kí</button>
                                    </a>
                                </td>

                            </tr>
                        </c:forEach>
                        <!-- Add more rows as needed -->
                    </tbody>
                </table>
            </div>
            <jsp:include page="common/footer.jsp" />
        </body>
    </html>
