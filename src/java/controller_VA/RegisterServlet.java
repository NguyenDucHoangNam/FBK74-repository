package controller_VA;

import dao.UserDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.User;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve form data from the request
        String name = req.getParameter("name");
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String repass = req.getParameter("repass");
        String phone = req.getParameter("phone");
        String gender = req.getParameter("gender");
        String pageRedirect = "sign-in.jsp";
        UserDAO userDAO = new UserDAO();
        
        if(userDAO.getUserByUserEmail(email) != null){  
            String errorMessage = "Đăng kí không thành công ! Email đã tồn tại";
            req.setAttribute("errorMessage", errorMessage);
            req.getRequestDispatcher(pageRedirect).forward(req, resp);    
        }
        if(userDAO.getUserByUserName(username) != null){ 
            String errorMessage = "Đăng kí không thành công ! Nickname đã tồn tại";
            req.setAttribute("errorMessage", errorMessage);
            req.getRequestDispatcher(pageRedirect).forward(req, resp);    
        }
        
        // Check if passwords match
        if (repass.equals(password)) { 
            int id = userDAO.getLengthUser() +1;
            User newUser = new User(name, username, password, Integer.parseInt(gender), phone);
            newUser.setIDAccount(id);
            newUser.setIDEmail(email);
            boolean addStatus = userDAO.addUser(newUser);
            if(addStatus){
            String successMessage = "Đăng kí thành công!";
            req.setAttribute("successMessage", successMessage);
            }else{
                req.setAttribute("errorMessage", "Có lôi bên server ! Vui long thu lai sau ");
            }
           
        } else{
            String errorMessage = "Đăng kí không thành công ! Mật khẩu không khớp ";
         
            req.setAttribute("errorMessage", errorMessage);
        }
        
        req.getRequestDispatcher(pageRedirect).forward(req, resp);
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("sign-in.jsp");
    }
}
