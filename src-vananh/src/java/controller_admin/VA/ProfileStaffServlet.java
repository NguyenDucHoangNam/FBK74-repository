/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller_admin.VA;

import dao.UserDAO;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author bravee06
 */
@WebServlet(name = "ProfileServlet", urlPatterns = {"/admin/profile2"})
public class ProfileStaffServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse reqs)
            throws ServletException, IOException {
        try {
            String url = "";
            HttpSession session = req.getSession(false);
            // Get session ra neu khong co session account tuc la chua login thi response ve trang login.
            if (session != null && session.getAttribute("account") != null) {
                User user = (User) session.getAttribute("account");
                // set thong tin cua user vao bien requestScope user
                req.setAttribute("user", user);
                url = "profileStaff_VA.jsp";
            } else {
                // trang login
                url = "sign-in.jsp";
            }
            req.getRequestDispatcher(url).forward(req, reqs);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse reps) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        String action = req.getParameter("action") == null ? "" : req.getParameter("action");
        if (session != null && session.getAttribute("account") != null) {
            switch (action) {
                case "updateProfile":
                    updateProfile(req, reps);
                    break;
            }
            reps.sendRedirect("profile2");
        } else {
            reps.sendRedirect("sign-in.jsp");
        }
    }

 private void updateProfile(HttpServletRequest req, HttpServletResponse resp) {
    String url = "profile";
    try {
        // Lấy thông tin từ request
        String name = req.getParameter("name");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String genderS = req.getParameter("gender");
        String Dob = req.getParameter("Dob");
        String linkFace = req.getParameter("linkFacebook");
        String bankName = req.getParameter("bankName");
        String bankCode = req.getParameter("bankCode");
        String id = req.getParameter("accountId");
        String imageUrl = req.getParameter("image"); // Giả sử tên trường cho hình ảnh là "image"

        HttpSession session = req.getSession(false);
        UserDAO userDAO = new UserDAO();
        User user = new User();

        int gender = genderS != null && genderS.contains("gender-male") ? 1 : 0;
        int accountId = Integer.parseInt(id);

        // Cập nhật đối tượng User, bao gồm URL hình ảnh
        user.setIDAccount(accountId);
        user.setName(name);
        user.setPhoneNumber(phone);
        user.setGender(gender);
        user.setIDEmail(email);
        user.setIDFacebook(linkFace);
        user.setBank(bankName);
        user.setBankNumber(bankCode);
        user.setImage(imageUrl); // Thiết lập URL hình ảnh

        boolean result = userDAO.updateProfile(user, Dob);
        if (result) {
            // Nếu cập nhật thành công
            user = userDAO.getUserById(accountId);
            session.setAttribute("account", user);
        } else {
            // Nếu cập nhật không thành công
            req.setAttribute("updateError", "Update user information error");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
}


}