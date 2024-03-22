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
     .table {
            border-collapse: collapse;
            width: 100%;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .table thead th {
            background-color: #06A3DA;
            color: #ffffff;
            padding: 5px 10px;
            text-align: left;
             font-size: 14px;
        }

        .table tbody tr:nth-child(odd) {
            background-color: #f2f2f2;
        }

        .table tbody tr:hover {
            background-color: #ddd;
            cursor: pointer;
        }

        .table td, .table th {
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
        <div class="container-md">
            <h2 class="text-primary1"> Khóa học của tôi</h2>
            <jsp:include page="common/Message.jsp" />

            <table class="table">
                <thead>
                    <tr>
                        <th>Khóa học</th>
                        <th>ID lớp học</th>
                        <th>Tên HLV</th>
                        <th>Số điện thoại HLV</th>
                        <th>Tên học sinh</th>
                        <th>Tuổi</th>
                        <th>Trạng thái</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    
                    <c:forEach var="courseC" items="${CourseRegit}">
                        <tr>
                            <td>${courseC.course.nameYouthTrainingCourse}</td>
                            <td>${courseC.idClass}</td>
                            <td>${courseC.classCourse.coachName}</td>
                            <td>${courseC.classCourse.coachPhoneNumber}</td>
                            <td>${courseC.nameStudent}</td>
                            <td>${courseC.age}</td>
                            <c:if test="${courseC.status1 == 1}">
                                <td class="status"><span class="active">Chờ xét duyệt</span></td>
                            </c:if>
                            <c:if test="${courseC.status1 == 2}">
                                <td class="status"><span class="deleted">Đã đăng kí thành công</span></td>
                                </c:if>
                                <c:if test="${courseC.status1 == 3}">
                                <td class="status"><span class="deleted">Đã hủy</span></td>
                            </c:if>
                            <c:if test="${courseC.status1 == 1}">
                                <td>
                                    <a href="UpdateMember?id=${courseC.idMemberOfClass}">
                                        <button class="btn btn-primary">Chỉnh sửa</button>
                                    </a>
                                </td>
                                <td>
                                    <a href="CancelMember?id=${courseC.idMemberOfClass}">
                                        <button class="btn btn-danger">Hủy bỏ</button>
                                    </a>
                                </td>
                            </c:if>

                        </tr>
                    </c:forEach>
                    <!-- Add more rows as needed -->
                </tbody>
            </table>
        </div>
        <jsp:include page="common/footer.jsp" />
    </body>
</html>
