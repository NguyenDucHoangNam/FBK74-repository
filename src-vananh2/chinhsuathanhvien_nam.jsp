<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Page</title>
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
                        <!-- Dynamic rows will be added here -->
                        <tr>
                    <form action="EditMemberOfTeam" method="post">
                        <input type="hidden" name="id" value="${teamMember.id}"/>
                        <input type="hidden" name="IDTeam" value="${IDTeam}"/>
                        <td><input type="text" class="form-control" name="name" required value="${teamMember.name}"></td>
                        <td><input type="text" class="form-control" name="number" required value="${teamMember.number}"></td>
                        <td><input type="text" class="form-control" name="phone" required value="${teamMember.phone}"></td>
                        <td><input type="text" class="form-control" name="detail" required value="${teamMember.detail}"></td>
                        <td>
                            <button type="submit" class="btn submit-btn"><i class="fas fa-edit"></i> Chỉnh Sửa</button>
                        </td>
                    </form>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
