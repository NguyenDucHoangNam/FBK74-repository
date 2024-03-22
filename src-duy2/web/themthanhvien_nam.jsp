<%-- 
    Document   : chinhsuathanhvien
    Created on : Mar 2, 2024, 3:58:46 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sân Bóng FBK74</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!-- Custom CSS for animations -->
        <style>
            body {
                background-color: #f8f9fa;
                padding-top: 20px;
            }

            .table {
                transition: transform 0.3s ease-in-out;
                width: 100%; /* Ensure the table is 100% width */
            }

            .table:hover {
                transform: scale(1.02);
            }

            input[type="text"], input[type="submit"] {
                border-radius: 20px;
                border: 1px solid #ced4da;
                transition: all 0.3s ease-in-out;
            }

            input[type="text"]:focus, input[type="submit"]:hover {
                box-shadow: 0 0 8px 0 rgba(0, 123, 255, 0.5);
            }

            input[type="submit"] {
                cursor: pointer;
                background-color: #007bff;
                color: white;
            }

            input[type="submit"]:hover {
                background-color: #0056b3;
            }

            .container-fluid {
                padding: 0 100px; /* Adjust the padding to control the overall width */
            }

            .text-center {
                margin-bottom: 20px;
            }

            .error-message {
                color: red;
                display: none;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <h2 class="text-center">Thêm thành viên mới</h2>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">Cầu Thủ</th>
                            <th scope="col">Số Áo</th>
                            <th scope="col">Số Điện Thoại</th>
                            <th scope="col">Mô Tả</th>
                            <th scope="col">Hành Động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Dynamic rows will be added here -->
                        <tr>
                    <form id="addMemberForm" action="AddMember" method="post" onsubmit="return validateForm()">
                        <input type="hidden" name="IDTeam" value="${IDTeam}"/>
                        <input type="hidden" name="tournamentID" value="${tournamentID}"/>
                        <td><input type="text" class="form-control" name="name" required></td>
                        <td><input type="text" class="form-control" id="number" name="number" required></td>
                        <td><input type="text" class="form-control" id="phone" name="phone" required></td>
                        <td><input type="text" class="form-control" name="detail" required></td>
                        <td>
                            <input type="submit" class="btn btn-primary" value="Thêm">
                        </td>
                    </form>
                    </tr>
                    </tbody>
                </table>
                <div id="numberError" class="error-message">Số áo phải là số và không vượt quá 2 chữ số</div>
                <div id="phoneError" class="error-message">Số điện thoại phải có 10 chữ số và không có ký tự đặc biệt</div>
            </div>
        </div>

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
                        function validateForm() {
                            var numberInput = document.getElementById('number');
                            var phoneInput = document.getElementById('phone');
                            var numberError = document.getElementById('numberError');
                            var phoneError = document.getElementById('phoneError');

                            var numberValid = validateNumber(numberInput.value);
                            var phoneValid = validatePhoneNumber(phoneInput.value);

                            if (!numberValid) {
                                numberError.style.display = 'block';
                            } else {
                                numberError.style.display = 'none';
                            }

                            if (!phoneValid) {
                                phoneError.style.display = 'block';
                            } else {
                                phoneError.style.display = 'none';
                            }

                            return numberValid && phoneValid;
                        }

                        function validateNumber(input) {
                            // Kiểm tra xem số áo có phải là số và không vượt quá 2 chữ số
                            var pattern = /^\d{1,2}$/;
                            return pattern.test(input);
                        }

                        function validatePhoneNumber(input) {
                            // Kiểm tra số điện thoại có 10 chữ số và không có ký tự đặc biệt
                            var pattern = /^\d{10}$/;
                            return pattern.test(input);
                        }
        </script>
    </body>
</html>
