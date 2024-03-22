<%@ page import="java.net.URLEncoder" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset = UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"></jsp:include>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông tin tài khoản</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <style>

        .input-bordered {
            border: 1px solid #cccccc; /* Màu viền xám nhạt */
            padding: 12px 15px; /* Đệm để nhập liệu không bị sát viền */
            margin: 8px 0; /* Khoảng cách giữa các trường nhập */
            width: 100%; /* Chiều rộng tối đa */
            background-color: #eee; /* Màu nền nhạt cho trường nhập */
            border-radius: 4px; /* Bán kính bo góc cho viền */
        }
        body {
            font-family: 'Inter', sans-serif;
        }
        .radio-button:checked + .radio-label {
            background-color: #f97316;
            border-color: #f97316;
        }
    </style>
    <div class="min-h-screen bg-gray-100 flex items-center justify-center px-4">
        <div class="bg-white shadow-lg rounded-lg p-8 max-w-4xl w-full">
            <div class="flex flex-col md:flex-row justify-between items-start">
                <div class="flex flex-col items-center text-center md:text-left md:items-start">
                    <h2 class="text-2xl text-gray-800 font-semibold mb-4">
                        <i class="fas fa-user-circle mr-2"></i>Thông tin tài khoản
                    </h2>

                    <img src="https://placehold.co/100x100" alt="Profile picture" id="profile-picture" class=" border-3 border-green-500 p-1 mb-3" style="width: 170px; cursor: pointer; margin: 10px auto;border-radius:50%;border: 2px solid #1b730d">

                    <input type="file" id="image-input" style="display: none;">

                    <p class="text-gray-700 mb-1" style="margin: 0 auto">${sessionScope.account.userName}</p>
                <a href="changeUserPassword">
                    <button class="bg-green-500 text-white text-lg px-6 py-2 rounded-full shadow-md hover:shadow-lg transition-shadow duration-300 ease-in-out focus:outline-none focus:ring-2 focus:ring-green-700 focus:ring-opacity-50" style="background-image: linear-gradient(to right top,#45af2a,#3ba023,#30901c,#268215,#1b730d,#1b730d,#1b730d,#1b730d,#268215,#30901c,#3ba023,#45af2a); margin:10px auto">
                        Nhấn để đổi mật khẩu
                    </button>
                </a>


                <a href="index.jsp" style="margin:10px auto">
                    <button class="bg-green-500 text-white text-lg px-6 py-2 rounded-full shadow-md hover:shadow-lg transition-shadow duration-300 ease-in-out focus:outline-none focus:ring-2 focus:ring-green-700 focus:ring-opacity-50" style="background-image: linear-gradient(to right top,#45af2a,#3ba023,#30901c,#268215,#1b730d,#1b730d,#1b730d,#1b730d,#268215,#30901c,#3ba023,#45af2a); ">
                        Trở về trang chủ 
                    </button>
                </a>                   
            </div>
            <div class="mt-8 md:mt-0 md:ml-10 w-full max-w-lg">
                <form class="space-y-4" action="profile1" method="POST">
                    <input type="hidden" name="action" value="updateProfile" />                
                    <input type="hidden" name="accountId" value="${user.IDAccount}" />

                    <div>
                        <label for="surname" class="text-gray-700">Tên</label>
                        <input name="name" value="${user.name}" type="text" id="surname" placeholder="Họ" class="w-full mt-1 px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent" pattern="^[a-zA-Z\s]+$" title="Tên chỉ được chứa chữ cái và khoảng trắng, không chứa số hoặc ký tự đặc biệt.">
                    </div>
                    <div>
                        <label for="Phone" class="text-gray-700">Số Điện Thoại</label>
                        <input name="phone" value="${user.phoneNumber}" type="text" id="Phone" placeholder="Số điện thoại" class="w-full mt-1 px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent" pattern="^\d{1,10}$" title="Số điện thoại phải gồm 10 chữ số và không chứa ký tự đặc biệt." required>
                    </div>
                    <div>
                        <label for="Email" class="text-gray-700">Email</label>
                        <input name="email" value="${user.IDEmail}" type="email" id="Email" placeholder="Email" class="w-full mt-1 px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" title="Email phải chứa ký tự '@' và không được chứa các ký tự đặc biệt không hợp lệ." required>
                    </div>

                    <div class="flex items-center mt-4">
                        <span class="text-gray-700 mr-3">Giới tính</span>

                        <div class="flex items-center mr-4">
                            <input id="genderMale" name="gender" type="radio" value="gender-male"  ${user.gender == 1 ? 'checked="true"' : ''} />
                            <label>Nam</label>
                        </div>
                        <div class="flex items-center mr-4">
                            <input id="genderFemale" name="gender" type="radio" value="gender-female" ${user.gender != 1 ? 'checked="true"' : ''} />
                            <label>Nữ</label>
                        </div>

                    </div>
                    <div>
                        <label for="birthdate" class="text-gray-700">Ngày sinh</label>
                        <input name="Dob" type="date" id="birthdate" value="${user.dob}" class="w-full mt-1 px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent">
                    </div>
                    <div>
                        <label for="bio" class="text-gray-700">FaceBook</label>
                        <input name="linkFacebook" type="tel" id="Email" value="${user.IDFacebook}" placeholder="Link FaceBook" class="w-full mt-1 px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent">
                        <!-- Thêm ô nhập số tài khoản ngân hàng -->
                        <div>
                            <label for="TenNganHang" class="text-gray-700">Tên Ngân Hàng</label>
                            <input name="bankName" type="text" id="TenNganHang" value="${user.bank}"  placeholder="Tên Ngân Hàng" class="w-full mt-1 px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent">
                            <label for="NganHang" class="text-gray-700">Số tài khoản ngân hàng</label>
                            <input name="bankCode" type="text" id="NganHang" value="${user.bankNumber}" placeholder="STK" class="w-full mt-1 px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent">
                        </div>
                    </div>
                    <button type="submit" class="w-full bg-green-500 text-white px-4 py-2 rounded shadow peer-checked:bg-green-500 transition-colors" style="background-image: linear-gradient(to right top,#45af2a,#3ba023,#30901c,#268215,#1b730d,#1b730d,#1b730d,#1b730d,#268215,#30901c,#3ba023,#45af2a);">Lưu</button>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
<script>


    const profilePicture = document.getElementById('profile-picture');
    const imageInput = document.getElementById('image-input');

    profilePicture.addEventListener('click', () => {
        imageInput.click();
    });

    imageInput.addEventListener('change', () => {
        const file = imageInput.files[0];
        const formData = new FormData();
        formData.append('image', file);

        // Gửi dữ liệu lên server bằng XMLHttpRequest hoặc Axios
        // ...

        // Hiển thị ảnh đã chọn
        const reader = new FileReader();
        reader.onload = () => {
            profilePicture.src = reader.result;
        };
        reader.readAsDataURL(file);
    });
    document.addEventListener("DOMContentLoaded", function () {
        const phoneInput = document.getElementById("Phone");

        phoneInput.addEventListener("input", function () {
            const regex = /^\d{0,10}$/;
            if (!regex.test(phoneInput.value)) {
                // If validation fails, show a custom error message
                phoneInput.setCustomValidity("Số điện thoại phải gồm 10 chữ số và không chứa ký tự đặc biệt.");
            } else {
                // Clear custom error message
                phoneInput.setCustomValidity("");
            }
        });
    });
    document.addEventListener("DOMContentLoaded", function() {
  document.getElementById("yourFormId").addEventListener("submit", function(e) {
    var nameInput = document.getElementById("surname").value;
    if (!/^[a-zA-Z\s]+$/.test(nameInput)) {
      alert("Tên chỉ được chứa chữ cái và khoảng trắng, không chứa số hoặc ký tự đặc biệt.");
      e.preventDefault(); // Prevent form from submitting
    }
  });
});
</script>
<jsp:include page="footer.jsp"></jsp:include>
