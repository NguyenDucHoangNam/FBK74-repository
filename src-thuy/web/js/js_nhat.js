/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */



//check ngày nhập vào

document.addEventListener('DOMContentLoaded', function () {
    var ngayInput = document.getElementById('ngay');

    var myForm = document.getElementById('myForm');

    myForm.addEventListener('submit', function (event) {
        var inputValue = ngayInput.value;

        // Kiểm tra định dạng ngày dd/MM/yyyy
        var dateRegex = /^(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[0-2])\/\d{4}$/;

        if (!dateRegex.test(inputValue)) {
            alert('Vui lòng nhập ngày theo định dạng dd/MM/yyyy.');
            ngayInput.value = ''; // Reset the input value
            event.preventDefault(); // Ngăn chặn sự kiện submit
            return;
        }

        // Kiểm tra ngày không phải là ngày quá khứ
        var selectedDate = moment(inputValue, 'DD/MM/YYYY', true);
        var currentDate = moment();

        if (selectedDate.isBefore(currentDate, 'day')) {
            alert('Ngày không được là ngày quá khứ.');
            ngayInput.value = ''; // Reset the input value
            event.preventDefault(); // Ngăn chặn sự kiện submit
            return;
        }

        // Kiểm tra ngày không quá 7 ngày so với ngày hiện tại
        var maxAllowedDate = currentDate.clone().add(7, 'days');
        if (selectedDate.isAfter(maxAllowedDate, 'day')) {
            alert('Chỉ được chọn ngày trong vòng 7 ngày kể từ ngày hiện tại.');
            ngayInput.value = ''; // Reset the input value
            event.preventDefault(); // Ngăn chặn sự kiện submit
            return;
        }

        errorMessage.innerText = ''; // Clear error message
    });
});



$(document).ready(function () {
    // Hiệu ứng Smooth Scrolling cho tất cả links
    $("a").on('click', function (event) {
        if (this.hash !== "") {
            event.preventDefault();
            var hash = this.hash;
            $('html, body').animate({
                scrollTop: $(hash).offset().top
            }, 800, function () {
                window.location.hash = hash;
            });
        }
    });
});

                            