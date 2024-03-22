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
        .text-primary1 {
            text-align: center;
            margin-top: 20px;
            font-weight: bold;
            font-size: 40px;
            margin-bottom: 30px; /* Space between cards */
            background-color: #e0ecf7; /* Light background */
            border-radius: 20px;
            overflow: hidden; /* Ensures the child elements do not overflow */
            box-shadow: 0 4px 8px rgba(0,0,0,0.1); /* Adds subtle shadow */


        }

        .text-primary1{

            color: #06A3DA;
            #error-messages li {
                color: red;
            }
           
            
        </style>
        <body>
            <!-- Navbar -->
            <%@include file="common/navbar.jsp"%>

            <!-- Button Quay lại -->
            

            <!-- Kiểm tra và hiển thị thông báo -->
            <c:if test="${not empty msg}">
                <div class="alert-container">
                    <div class="alert alert-danger" role="alert" >
                        ${msg}
                    </div>
                </div>

            </c:if>

            <!-- Biểu mẫu đăng ký -->
            <c:if test="${empty msg}">
                <div class="container-md">
                    <h2 class="text-primary1">Đăng ký lớp học</h2>
                    <form action="regist-member?classId=${classID}" method="post">
                        <div class="mb-3">
                            <label for="nameStudent" class="form-label">Tên người tham gia:</label>
                            <input type="text" class="form-control" id="nameStudent" name="nameStudent" required>
                            <div id="nameStudentError" class="text-danger"></div>
                        </div>
                        <div class="mb-3">
                            <label for="phoneNumber" class="form-label">Số điện thoại:</label>
                            <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" required>
                            <div id="phoneNumberError" class="text-danger"></div>
                        </div>
                        <div class="mb-3">
                            <label for="age" class="form-label">Tuổi:</label>
                            <input type="number" id="age" class="form-control" min="1" max="18" name="age" required>
                            <div id="ageError" class="text-danger"></div>
                        </div>
                        <div class="mb-3">
                            <label for="height" class="form-label">Chiều cao (cm):</label>
                            <input type="number" class="form-control" id="height" name="height" required>
                            <div id="heightError" class="text-danger"></div>
                        </div>
                        <div class="mb-3">
                            <label for="weight" class="form-label">Cân nặng (kg):</label>
                            <input type="number" class="form-control" id="weight" name="weight" required>
                            <div id="weightError" class="text-danger"></div>
                        </div>
                        <button type="submit" class="btn btn-primary">Đăng kí</button>
                    </form>

                </div>
            </c:if>

            <!-- Footer -->
            <%@include file="common/footer.jsp"%>

            <!-- Script validation -->
            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    function validateInput(inputElement, errorElementId, validationFunction) {
                        const errorElement = document.getElementById(errorElementId);
                        inputElement.addEventListener('input', function () {
                            let errorMessage = '';
                            if (!inputElement.value.trim()) {
                                errorMessage = 'Trường này không được bỏ trống.';
                            } else {
                                errorMessage = validationFunction(inputElement.value);
                            }
                            errorElement.textContent = errorMessage;
                        });
                    }

                    validateInput(document.getElementById('nameStudent'), 'nameStudentError', function (value) {
                        if (!/^[a-zA-ZàáâäãèéêëìíîïòóôöùúûüýÿăđĩũơưẠạảÁÀãẢâẤầẫẩậăắằẵẳặèÉÈẻẼêếềễểệìÍÌỉĨịòÓÒỏÕôốồỗổộơớờỡởợùÚÙủŨụỤýÝỳỷỸỵ\s]+$/.test(value)) {
                            return 'Tên chỉ được chứa chữ cái và không chứa số.';
                        }
                        return '';
                    });

                    validateInput(document.getElementById('phoneNumber'), 'phoneNumberError', function (value) {
                        if (!/^(03|05|07|08|09|01[2|6|8|9])[0-9]{8}$/.test(value)) {
                            return 'Số điện thoại không hợp lệ. Phải theo định dạng Việt Nam.';
                        }
                        return '';
                    });

                    validateInput(document.getElementById('age'), 'ageError', function (value) {
                        if (value < 1 || value > 18) {
                            return 'Tuổi phải từ 1 đến 18.';
                        }
                        return '';
                    });

                    validateInput(document.getElementById('height'), 'heightError', function (value) {
                        if (value < 50 || value > 250) {
                            return 'Chiều cao không hợp lệ. Phải từ 50cm đến 250cm.';
                        }
                        return '';
                    });

                    validateInput(document.getElementById('weight'), 'weightError', function (value) {
                        if (value < 10 || value > 200) {
                            return 'Cân nặng không hợp lệ. Phải từ 10kg đến 200kg.';
                        }
                        return '';
                    });
                });
            </script>
        </body>
    </html>
