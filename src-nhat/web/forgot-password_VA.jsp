<%@ page import="java.net.URLEncoder" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset = UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Password Change Form</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Inter', sans-serif;
    }
    .form-container {
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
      overflow: hidden;
    }
  </style>
</head>
<body>
  <div class="max-w-lg mx-auto mt-10">
    <div class="form-container">
        <form action="reset_password" method="post">
                      <div class="bg-green-600 text-white text-center py-4" style="background-image: linear-gradient(to right top,#45af2a,#3ba023,#30901c,#268215,#1b730d,#1b730d,#1b730d,#1b730d,#268215,#30901c,#3ba023,#45af2a);">
        <h1 class="text-xl font-semibold" >QUÊN MẬT KHẨU</h1>
      </div>
      <div class="p-6">
        <label class="block text-gray-700 text-sm font-bold mb-2" for="email">
          Địa chỉ Email:
        </label>
        <input name="email" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline" id="email" type="text" placeholder="Email">

        <!-- <label class="block text-gray-700 text-sm font-bold mb-2" for="current-password">
          Mật khẩu cũ:
        </label>
        <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline" id="current-password" type="password" placeholder="••••••••">

        <label class="block text-gray-700 text-sm font-bold mb-2" for="new-password">
          Mật khẩu mới:
        </label>
        <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline" id="new-password" type="password" placeholder="••••••••">

        <label class="block text-gray-700 text-sm font-bold mb-2" for="confirm-password">
          Nhập lại mật khẩu:
        </label>
        <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline" id="confirm-password" type="password" placeholder="••••••••"> -->
      </div>
      <div class="px-6 py-4"  >
        <button type="submit" class="bg-green-600 hover:bg-green-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline w-full" type="button" >
          Gửi
        </button>
      </div>
                  </form>
      
    </div>
  </div>
</body>
</html>