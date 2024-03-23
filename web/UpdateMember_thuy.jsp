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
        <!-- thuyss -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+Knujsl5+z24igq5f9Gdq8vD5CXLmmanA+O3BhqG5i" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

    </head>
    <style>
         .text-primary, .course-title {
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
        .text-primary{
            font-size: 40px;
            color: #06A3DA;


        }
    </style>
    <body>
        <jsp:include page="common/navbar.jsp" />

        <div class="container-md">
            <h2 class="text-primary">Chỉnh sửa đăng kí</h2>
            <jsp:include page="common/Message.jsp" />

            <form action="UpdateMember?idMember=${idMember}" method="post" onsubmit="return validatePhoneNumber();">
                <!-- Input fields for accountID, phoneNumber, and gender -->
                <div class="mb-3">
                    <label for="nameStudent" class="form-label">Tên người tham gia:</label>
                    <input type="text" class="form-control" id="nameStudent" name="nameStudent" required>
                </div>
                <div class="mb-3">
                    <label for="phoneNumber" class="form-label">Số điện thoại:</label>
                    <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" required>
                </div>
                <div class="mb-3">
                    <label for="age" class="form-label">Tuổi:</label>
                    <input type="number" id="age"  class="form-control" min="1" max="18" name="age" required>
                </div>
                <div class="mb-3">
                    <label for="height" class="form-label">Chiều cao (cm) </label>
                    <input type="number" class="form-control" id="height" name="height" required>
                </div>
                <div class="mb-3">
                    <label for="weight" class="form-label">Cân nặng (kg)</label>
                    <input type="number" class="form-control" id="weight" name="weight" required>
                </div>



                <button type="submit" class="btn btn-primary">Đã xong</button>
            </form>
            <div class="mt-3">
                <a href="ListCourse" onclick="goBack()" class="btn btn-secondary">Back</a>
            </div>
        </div>
        <jsp:include page="common/footer.jsp" />
        <script>
            function validatePhoneNumber() {
                var phoneNumber = document.getElementById("phoneNumber").value;

                // Regular expression for a valid phone number (adjust as needed)
                var phoneRegex = /^\d{10}$/;

                if (!phoneRegex.test(phoneNumber)) {
                    alert("Please enter a valid 10-digit phone number.");
                    return false;
                }

                return true;
            }
        </script>
    </body>
</html>
