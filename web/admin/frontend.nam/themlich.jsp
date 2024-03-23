<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sân Bóng FBK74</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="path/to/your/custom.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
    <body>
        <div class="container mt-5">
            <h2 class="mb-4">Thêm kết quả mới</h2>
            <form action="AdminAddResult" method="post" class="needs-validation" novalidate>
                <input type="hidden" name="tournamentID" value="${IDTournament}"/>
                <div class="form-group">
                    <label for="teamIDA">Đội Bóng A</label>
                    <select name="teamIDA" class="custom-select" id="teamIDA" required>
                        <c:forEach items="${teams}" var="team">
                            <option value="${team.id}">${team.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="teamIDB">Đội Bóng B</label>
                    <select name="teamIDB" class="custom-select" id="teamIDB" required>
                        <c:forEach items="${teams}" var="team">
                            <option value="${team.id}">${team.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="date">Ngày Thi Đấu</label>
                    <input type="date" class="form-control" id="date" name="date" required/>
                </div>
                <div class="form-group">
                    <label for="stadium">Sân Bóng</label>
                    <select name="stadium" class="custom-select" id="stadium" required>
                        <c:forEach var="ff" items="${listFootballField}">
                            <option value="${ff.IDFootballField}">${ff.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="schedule" id="">Lịch Sân Bóng</label>
                    <select name="schedule" class="custom-select" id="schedule" required>
                    </select>
                </div>
                <div class="form-group">
                    <label for="detail">Thông tin chi tiết</label>
                    <textarea name="detail" id="detail" class="form-control" required placeholder="description"></textarea>
                </div>
                <input class="btn btn-primary" type="submit" value="Xác Nhận">
            </form>
        </div>
        <script>
            $(document).ready(function () {
                $('#stadium').change(function () {
                    var selectedStadiumId = $(this).val();
                    $.ajax({
                        type: "GET",
                        url: "http://localhost:8080/FBK74/admin/frontend.nam/lichsanbong",
                        data: {ffID: selectedStadiumId},
                        dataType: "JSON",
                        success: function (data) {
                            // Xóa tất cả các option hiện có trong select box "stadium"
                            $('#schedule').empty();
                            // Thêm các option mới từ dữ liệu phản hồi
                            $.each(data, function (index, item) {
                                $('#schedule').append('<option value="' + item.IDFootballFieldSchedule + '">' + item.StartTime + ' - ' + item.EndTime + '</option>');
                            });
                        },
                        error: function (e) {
                            console.log(e);
                        }
                    });
                });
            });

            $(document).ready(function () {
                $('#schedule').change(function () {
                    var selectedValue = $(this).val();
                    console.log(selectedValue); // Hiển thị giá trị đã chọn trong console log
                });
            });
        </script>
        <!-- Optional JavaScript and Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
