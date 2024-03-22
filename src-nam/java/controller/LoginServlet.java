/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("sign-in.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("userName");
        String password = req.getParameter("password");
        HttpSession session = req.getSession();
        boolean authenticated = authenticate(userName, password);
        String errorMessage = "Username or password incorrect !";
        String pageRedirect = "sign-in.jsp";
        UserDAO userDAO = new UserDAO();
        // get user info
        User user = userDAO.getUserByUserName(userName);
        //check user info get role neu role = 1 thi k cho login.
        if (user.getStatus() == 1) {
            errorMessage = "Your are not allow to login in this site";
            req.setAttribute("errorMessage", errorMessage);
            req.getRequestDispatcher(pageRedirect).forward(req, resp);
        } else {
            session.setAttribute("account", user);
            if (authenticated && user.getRole() == 1) {
                pageRedirect = "index.jsp";
            } else if (authenticated && (user.getRole() == 3 || user.getRole() == 2)) {
//                pageRedirect = "admin?action=viewList";
                pageRedirect = "admin/index1.jsp";
            }
            resp.sendRedirect(pageRedirect);
        }

    }

    private boolean authenticate(String userName, String password) {
        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserByUserName(userName);
        if (user != null) {
            return user.getPassWord().equals(password);
        }
        return false;
    }

}
