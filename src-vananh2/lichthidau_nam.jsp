<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Lịch Học Tuần</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
        <style>
            /* Tùy chỉnh CSS tại đây */
            .calendar-container {
                margin: 20px;
            }
            .calendar-header {
                margin-bottom: 10px;
            }
            .calendar-table th,
            .calendar-table td {
                text-align: center;
                vertical-align: middle;
            }
            .calendar-table .absent {
                background-color: #ffcccc;
            }
            .calendar-table .attended {
                background-color: #ccffcc;
            }
            .calendar-table .not-yet {
                background-color: #ccccff;
            }
            .calendar-table-container {
                width: 100%; /* Chiều rộng cố định hoặc bạn có thể đặt một giá trị cụ thể như 800px */
                max-height: 500px; /* Chiều cao tối đa của bảng, bạn có thể điều chỉnh con số này */
                overflow-y: auto; /* Cho phép cuộn dọc nếu nội dung vượt quá chiều cao */
                margin-bottom: 20px; /* Khoảng cách phía dưới */
            }

            /* Điều chỉnh chiều rộng của cột 'Slot' và các cột khác nếu cần */
            .calendar-table th,
            .calendar-table td {
                width: 12.5%; /* Điều chỉnh theo tỉ lệ phù hợp */
            }

            /* Điều chỉnh độ cao cho các hàng, đặt một giá trị cố định nếu muốn */
            .calendar-table tr {
                height: 50px; /* Điều chỉnh theo yêu cầu */
            }
        </style>
    </head>
    <body>
        <div class="container calendar-container">
            <div class="row calendar-header">
                <div class="col-md-2">
                    <select class="form-control" id="yearSelect">
                        <!-- JavaScript sẽ điền options ở đây -->
                    </select>
                </div>
                <div class="col-md-2">
                    <select class="form-control" id="weekSelect">
                        <!-- JavaScript sẽ điền options ở đây -->
                    </select>
                </div>
            </div>

            <div class="calendar-table-container">
                <table class="table table-bordered calendar-table">
                    <!-- Table header -->
                    <thead class="thead-dark">
                        <tr>
                            <th>Khung giờ</th>
                            <th>Thứ 2</th>
                            <th>Thứ 3</th>
                            <th>Thứ 4</th>
                            <th>Thứ 5</th>
                            <th>Thứ 6</th>
                            <th>Thứ 7</th>
                            <th>Chủ nhật</th>
                        </tr>
                    </thead>
                    <!-- Table body -->
                    <tbody>
                        <!-- JavaScript sẽ điền dữ liệu lịch ở đây -->
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Các tệp JavaScript bên thứ ba -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <!-- Mã JavaScript của bạn bắt đầu ở đây -->
        <script>
            // Hàm để lấy ngày đầu tiên của năm
            function getFirstDayOfYear(year) {
                return new Date(year, 0, 1);
            }

            // Hàm để lấy ngày bắt đầu của tuần thứ n trong năm
            function getStartOfWeek(year, weekNumber) {
                let firstDayOfYear = getFirstDayOfYear(year);
                let firstDayOfWeek = new Date(
                        firstDayOfYear.setDate(
                                firstDayOfYear.getDate() + (weekNumber - 1) * 7
                                )
                        );
                firstDayOfWeek = new Date(
                        firstDayOfWeek.setDate(
                                firstDayOfWeek.getDate() - firstDayOfWeek.getDay() + 1
                                )
                        );
                return firstDayOfWeek;
            }

            // Hàm để cập nhật các options của tuần khi năm thay đổi
            function updateWeekOptions(year) {
                weekSelect.innerHTML = ""; // Clear current options
                for (let week = 1; week <= 52; week++) {
                    let startOfWeek = getStartOfWeek(year, week);
                    let endOfWeek = new Date(startOfWeek);
                    endOfWeek.setDate(startOfWeek.getDate() + 6);
                    let optionText = `${startOfWeek.getDate()}/${
                                startOfWeek.getMonth() + 1
                                } to ${endOfWeek.getDate()}/${endOfWeek.getMonth() + 1}`;
                          let option = new Option(optionText, week);
                          weekSelect.add(option);
                      }
                  }

                  // Hàm để cập nhật dữ liệu lịch
                  function updateCalendarData() {
                      const year = parseInt(yearSelect.value);
                      const week = parseInt(weekSelect.value);
                      const tbody = document.querySelector(".calendar-table tbody");
                      tbody.innerHTML = ""; // Clear current table body

                      // Thêm dữ liệu mẫu vào bảng
                      for (let slot = 1; slot <= 8; slot++) {
                          // Giả sử có 8 slot
                          let row = tbody.insertRow();
                          let slotCell = row.insertCell(0);
                          slotCell.textContent = `Slot ${slot}`;
                          for (let day = 1; day <= 7; day++) {
                              // 7 cột cho 7 ngày
                              let cell = row.insertCell(day);
                              // Định dạng dữ liệu mẫu với ngày thực tế
                              let dayOfWeek = getStartOfWeek(year, week);
                              dayOfWeek.setDate(dayOfWeek.getDate() + day - 1); // Ngày trong tuần
                              cell.textContent = `Dữ liệu mẫu ${dayOfWeek.getDate()}/${
                                              dayOfWeek.getMonth() + 1
            }`;
                          }
                      }
                  }

                  // Cập nhật tuần khi năm thay đổi
                  yearSelect.addEventListener("change", () => {
                      updateWeekOptions(parseInt(yearSelect.value));
                      updateCalendarData();
                  });

                  weekSelect.addEventListener("change", updateCalendarData);

                  // Tạo options cho năm từ 2024 đến 2030
                  for (let year = 2024; year <= 2030; year++) {
                      yearSelect.add(new Option(year, year));
                  }

                  // Cập nhật lần đầu khi trang được tải
                  updateWeekOptions(parseInt(yearSelect.value));
                  updateCalendarData();
        </script>
    </body>
</html>
