/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller_VA;

import dao.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author Datnt
 */
@WebServlet(name = "ProfileUserServlet", urlPatterns = {"/profile1"})
public class ProfileUserServlet extends HttpServlet {

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
                url = "profile_VA.jsp";
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
            reps.sendRedirect("profile1");
        } else {
            reps.sendRedirect("sign-in.jsp");
        }
    }

    private void updateProfile(HttpServletRequest req, HttpServletResponse resp) {
        String url = "profile";
        try {
            // Get Paramater by input [Name]
            String name = req.getParameter("name");
            String phone = req.getParameter("phone");
            String email = req.getParameter("email");
            String genderS = req.getParameter("gender");
            String Dob = req.getParameter("Dob");
            String linkFace = req.getParameter("linkFacebook");
            String bankName = req.getParameter("bankName");
            String bankCode = req.getParameter("bankCode");
            String id = req.getParameter("accountId");

            HttpSession session = req.getSession(false);
            UserDAO userDAO = new UserDAO();
            User user = new User();
//            Date date = new SimpleDateFormat("dd/MM/yyyy").parse(Dob);
            // get gender neu nhu la nam thi Male co value thi do la Nam va nguoc lai.
            int gender = 0;
            if (genderS.contains("gender-male")) {
                gender = 1;
            }
            int accountId = Integer.parseInt(id);

            user.setIDAccount(accountId);
            user.setName(name);
            user.setPhoneNumber(phone);
            user.setGender(gender);
//            user.setDob(date);
            user.setIDEmail(email);
            user.setIDFacebook(linkFace);
            user.setBank(bankName);
            user.setBankNumber(bankCode);

            boolean result = userDAO.updateProfile(user, Dob);
            // neu update user thanh cong thi tra ve userObject
            if (result) {
                user = userDAO.getUserById(accountId);
                session.setAttribute("account", user);
                // Nguoc lai update failed
            } else {
                String message = "Update user information error";
                req.setAttribute("updateError", message);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
