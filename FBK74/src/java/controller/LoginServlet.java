/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import dao.UserDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author Van Anh
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("userName");
        String password = req.getParameter("password");
        boolean authenticated = authenticate(userName, password);
        String loginLogging = "error";
        String pageRedirect = "login.jsp";
        if (authenticated) {
            loginLogging = "ok";
            pageRedirect = "index.jsp";
            UserDAO userDAO = new UserDAOImpl();
            User user = userDAO.getUserByEmail(userName);
            req.setAttribute("account", user);
        }
        req.setAttribute("loginLogging", loginLogging);

        
        req.getRequestDispatcher(pageRedirect).forward(req, resp);
    }

    private boolean authenticate(String userName, String password) {
        UserDAO userDAO = new UserDAOImpl();
        User user = userDAO.getUserByEmail(userName);
        if (user != null) {
            return user.getPassWord().equals(password);
        }
        return false;
    }

}
