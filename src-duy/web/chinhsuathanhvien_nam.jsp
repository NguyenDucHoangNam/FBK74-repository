<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sân Bóng FBK74</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
        <style>
            body {
                padding: 20px;
            }
            .table-responsive {
                margin-top: 20px;
            }
            .submit-btn {
                color: #fff;
                background-color: #007bff;
                border-color: #007bff;
            }
        </style>
    </head>
    <body>
        <script>
            function validateJerseyNumber(input) {
                // Kiểm tra xem số áo có phải là số và không vượt quá 2 chữ số
                var pattern = /^\d{1,2}$/;
                return pattern.test(input);
            }

            function validatePhoneNumber(input) {
                // Kiểm tra số điện thoại có 10 chữ số và không có ký tự đặc biệt
                var pattern = /^\d{10}$/;
                return pattern.test(input);
            }

            function validateForm() {
                var jerseyInput = document.getElementById('jerseyNumber');
                var phoneInput = document.getElementById('phoneNumber');
                var jerseyError = document.getElementById('jerseyError');
                var phoneError = document.getElementById('phoneError');

                var jerseyValid = validateJerseyNumber(jerseyInput.value);
                var phoneValid = validatePhoneNumber(phoneInput.value);

                if (!jerseyValid) {
                    jerseyError.style.display = 'block';
                } else {
                    jerseyError.style.display = 'none';
                }

                if (!phoneValid) {
                    phoneError.style.display = 'block';
                } else {
                    phoneError.style.display = 'none';
                }

                return jerseyValid && phoneValid;
            }
        </script>


        <div class="container">
            <h2 class="text-center">Chỉnh Sửa Thành Viên Đội Bóng</h2>
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
                        <tr>
                    <form action="EditMemberOfTeam" method="post" onsubmit="return validateForm()">
                        <input type="hidden" name="id" value="${teamMember.id}"/>
                        <input type="hidden" name="IDTeam" value="${IDTeam}"/>
                        <td><input type="text" class="form-control" name="name" required value="${teamMember.name}"></td>
                        <td><input type="text" class="form-control" id="jerseyNumber" name="number" required value="${teamMember.number}"></td>
                        <td><input type="text" class="form-control" id="phoneNumber" name="phone" required value="${teamMember.phone}"></td>
                        <td><input type="text" class="form-control" name="detail" required value="${teamMember.detail}"></td>
                        <td>
                            <button type="submit" class="btn submit-btn"><i class="fas fa-edit"></i> Chỉnh Sửa</button>
                        </td>
                    </form>
                    </tr>
                    </tbody>
                </table>
                <div id="jerseyError" style="color: red; display: none;">Số áo phải là số và có đúng 2 chữ số</div>
                <div id="phoneError" style="color: red; display: none;">Số điện thoại phải có 10 chữ số và không có ký tự đặc biệt</div>
            </div>
        </div>


        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
