<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="path/to/your/custom.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-5">
            <h2 class="mb-4">Cập nhật kết quả</h2>
            <form action="AdminEditResult" method="post" class="needs-validation" novalidate>
                <input type="hidden" name="tournamentID" value="${IDTournament}"/>
                <input type="hidden" name="scheduleID" value="${schedule.id}"/>
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="teamIDA">Đội Bóng A</label>
                        <select name="teamIDA" class="custom-select" id="teamIDA" required>
                            <c:forEach items="${teams}" var="team">
                                <c:if test="${team.id == schedule.teamA}">
                                    <option value="${team.id}" selected>${team.name}</option>
                                </c:if>
                                <c:if test="${team.id != schedule.teamA}">
                                    <option value="${team.id}">${team.name}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="teamIDB">Đội Bóng B</label>
                        <select name="teamIDB" class="custom-select" id="teamIDB" required>
                            <c:forEach items="${teams}" var="team">
                                <c:if test="${team.id == schedule.teamB}">
                                    <option value="${team.id}" selected>${team.name}</option>
                                </c:if>
                                <c:if test="${team.id != schedule.teamB}">
                                    <option value="${team.id}">${team.name}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="date">Ngày Thi Đấu</label>
                        <input type="datetime-local" class="form-control" id="date" name="date" required value="${schedule.date}"/>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="result">Tỉ Số</label>
                        <input type="text" class="form-control" id="result" name="result" required placeholder="n-n" value="${schedule.result}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="detail">Thông tin chi tiết</label>
                    <textarea name="detail" id="detail" class="form-control" required placeholder="description">${schedule.detail}</textarea>
                </div>
                <button class="btn btn-primary" type="submit">Xác Nhận</button>
            </form>
        </div>
        <!-- Optional JavaScript and Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
