/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller_VA;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author bravee06
 */
@WebServlet(name = "ConfirmCodeServlet", urlPatterns = {"/confirm_code"})
public class ConfirmCodeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       HttpSession session = request.getSession();
       String confirmCodeFromSession = (String) session.getAttribute("confirmCode");
       String code1 = request.getParameter("code1");
       String code2 = request.getParameter("code2");
       String code3 = request.getParameter("code3");
       String code4 = request.getParameter("code4");
       String code5 = request.getParameter("code5");
        String code6 = request.getParameter("code6");
       String email = request.getParameter("email");
       request.setAttribute("email", email);
        System.out.println(email);
        System.out.println(confirmCodeFromSession);
        // Kiểm tra xem mã xác nhận có khớp với mã đã lưu trong session hay không
       if (confirmCodeFromSession != null && confirmCodeFromSession.equals(code1 + code2 + code3 +code4+code5+code6)) {
        // Mã xác nhận hợp lệ, thực hiện hành động tiếp theo
        try {
            // Thực hiện các thao tác cần thiết khi xác nhận thành công, ví dụ:
            // - Chuyển hướng đến trang khác
            
            session.removeAttribute("confirmCode");
            
            // - Cập nhật dữ liệu
            // - Gửi email xác nhận
            request.getRequestDispatcher("changePasswordAfterConfirm_VA.jsp").forward(request, response);
        } catch (Exception e) {
            // Xử lý lỗi nếu có
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Chuyển hướng đến trang báo lỗi
        }
    } else {
        // Mã xác nhận không hợp lệ, hiển thị thông báo lỗi
        request.setAttribute("error", "Mã xác nhận không hợp lệ!");
        request.getRequestDispatcher("message.jsp").forward(request, response);
    }
    }

    

}
