<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom Stylesheet -->
        <link href="style.css" rel="stylesheet" type="text/css"/>
        <script src="script.js" defer></script>
    </head>
    <body>
        <div class="container mt-5">
            <h2 class="mb-4">Thêm Đội Bóng Mới</h2>
            <form action="AdminAddTeam" method="post" class="needs-validation" novalidate>
                <input type="hidden" name="tournamentID" value="${tournament.id}"/>

                <div class="form-group">
                    <label for="teamName">Tên Đội Bóng</label>
                    <input id="teamName" name="teamName" type="text" class="form-control" required/>
                </div>

                <div class="form-group">
                    <label for="accountID">Account ID người đại diện</label>
                    <select id="accountID" name="accountID" required>
                        <c:forEach items="${accounts}" var="account">
                            <option value="${account.IDAccount}">Name: ${account.userName} - Phone: ${account.phoneNumber}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group">
                    <label for="teamDetail">Số Điện Thoại</label>
                    <input id="teamDetail" name="teamDetail" type="text" class="form-control" required/>
                </div>
                <div class="form-group">
                    <label>Giải Đăng Ký</label>
                    <span>${tournament.name}</span>
                </div>
                <div class="form-group">
                    <label for="status">Trạng Thái</label>
                    <select id="status" name="status" class="custom-select">
                        <option value="1">Duyệt</option>
                        <option value="2">Chờ Để Duyệt</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Xác Nhận</button>
            </form>
        </div>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const inputs = document.querySelectorAll('input, select');
                inputs.forEach(input => {
                    input.addEventListener('focus', () => {
                        document.querySelector('.btn-primary').classList.add('blink');
                    });
                    input.addEventListener('blur', () => {
                        document.querySelector('.btn-primary').classList.remove('blink');
                    });
                });
            });
        </script>
        <script>
            const styleSheet = document.createElement('style');
            styleSheet.innerText = `
               @keyframes blink {
                   50% {
                       background-image: linear-gradient(45deg, #a777e3, #6e8efb);
                   }
               }
               .blink {
                   animation: blink 1s infinite;
               }
               `;
            document.head.appendChild(styleSheet);
        </script>
        <!-- Optional JavaScript; choose one of the two! -->
        <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
