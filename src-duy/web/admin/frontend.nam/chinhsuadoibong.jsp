<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sân Bóng FBK74</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                padding-top: 20px;
            }
            .form-container {
                padding: 20px;
                background-color: #f8f9fa;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .form-group {
                margin-bottom: 15px;
            }
            .form-label {
                font-weight: bold;
            }
            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="form-container">
                <h2 class="mb-4">Chỉnh Sửa Đội Bóng</h2>
                <form action="AdminEditTeam" method="post">
                    <input type="hidden" name="id" value="${team.id}"/>
                    <input type="hidden" name="tournamentID" value="${team.tournamentID}"/>

                    <div class="form-group">
                        <label class="form-label">Tên Đội Bóng</label>
                        <input class="form-control" name="teamName" type="text" required value="${team.name}"/>
                    </div>

                    <!--                    <div class="form-group">
                                            <label class="form-label">Account Id người đại diện</label>
                                            <input class="form-control" name="accountID" type="text" required value="${team.accountID}"/>
                                        </div>-->

                    <div class="form-group">
                        <label for="accountID">Account ID người đại diện</label>
                        <select id="accountID" name="accountID" required>
                            <c:forEach items="${accounts}" var="account">
                                <option value="${account.IDAccount}" <c:if test="${account.IDAccount eq team.accountID}">selected</c:if>>Name: ${account.userName} - Phone: ${account.phoneNumber}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Số Điện Thoại</label>
                        <input class="form-control" name="teamDetail" type="text" required pattern="\d{10}" title="Số điện thoại phải có 10 chữ số và không chứa ký tự đặc biệt." value="${team.detail}">
                    </div>


                    <div class="form-group">
                        <label class="form-label">Giải Đăng Ký</label>
                        <p>${tournament.name}</p>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Trạng Thái</label>
                        <select class="form-control" name="status">
                            <option value="1" ${team.status == 1 ? "selected" : ""}>Đã Duyệt</option>
                            <option value="2" ${team.status == 2 ? "selected" : ""}>Chờ Để Duyệt</option>
                        </select>
                    </div>

                    <input class="btn btn-primary" value="Xác Nhận" type="submit">
                </form>
            </div>
        </div>
    </body>
</html>
