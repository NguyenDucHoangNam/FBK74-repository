package controller_VA;

import dao.UserDAO;
import model.User;
import utils.EmailUtility;
import utils.SoNgauNhien;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

    private String host;
    private String port;
    private String useremail;
    private String pass;

    @Override
    public void init() throws ServletException {
        // Đọc cấu hình SMTP từ web.xml
        host = getServletContext().getInitParameter("host");
        port = getServletContext().getInitParameter("port");
        useremail = getServletContext().getInitParameter("email");
        pass = getServletContext().getInitParameter("pass");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        // Check if the request is for verification
        if (action.equals("verify")) {
            xacThuc(request, response);
        }
        // You can add more GET handlers here if needed
    }

    // Your new xacThuc method should be integrated here:
    private void xacThuc(HttpServletRequest request, HttpServletResponse response) {
        try {
            String IDAccount = request.getParameter("IDAccount");
            String maXacThuc = request.getParameter("MaXacThuc");

            UserDAO userDAO = new UserDAO();

            User Account = userDAO.getUserByIDAccount(Integer.parseInt(IDAccount));

            String msg = "";
            if (Account != null) {
                if (userDAO.verifyUser(Account.getIDAccount(), maXacThuc)) {
                    msg = "Xác thực thành công!";
                } else {
                    // That Bai
                    msg = "Xác thực không thành công!";
                }
            } else {
                msg = "Tài khoản không tồn tại!";
            }
            String url = "/sign-in.jsp";
            request.setAttribute("baoLoi", msg);
            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String repass = req.getParameter("repass");
        String phone = req.getParameter("phone");
        String gender = req.getParameter("gender");
        String pageRedirect = "sign-in.jsp";
        UserDAO userDAO = new UserDAO();

        if (!password.equals(repass)) {
            req.setAttribute("errorMessage", "Mật khẩu và mật khẩu nhập lại không khớp.");
            req.getRequestDispatcher(pageRedirect).forward(req, resp);
            return;
        }

        if (userDAO.getUserByUserEmail(email) != null || userDAO.getUserByUserName(username) != null) {
            req.setAttribute("errorMessage", "Email hoặc Tên người dùng đã tồn tại.");
            req.getRequestDispatcher(pageRedirect).forward(req, resp);
            return;
        }

        String verificationCode = SoNgauNhien.generateVerificationCode();
        User newUser = new User();
        newUser.setName(name);
        newUser.setUserName(username);
        newUser.setPassWord(password);
        newUser.setGender(Integer.parseInt(gender));
        newUser.setPhoneNumber(phone);
        newUser.setIDEmail(email);
        newUser.setRole(1); // Assuming '1' is the role for a regular user
        newUser.setStatus(0); // Assuming '0' indicates an inactive or unverified user
        newUser.setMaXacThuc(verificationCode);
        newUser.setThoiGianMaXacThuc(new Date());
        newUser.setTrangThaiXacThuc(false);

        int idAccount = userDAO.addUser(newUser);
        if (idAccount != -1) {
            String verificationLink = "http://localhost:8080/FBK74_1/register?action=verify&IDAccount=" + idAccount + "&MaXacThuc=" + verificationCode;
            String emailContent = "Hi " + name + ",\n\n"
                    + "This is your confirmation code: " + verificationCode + "\n\n"
                    + "Please click or copy the link below to confirm your email address:\n" + verificationLink;

            try {
                // Sửa lại các tham số cho phù hợp với phương thức sendEmail
                EmailUtility.sendEmail(host, port, useremail, "FBK74", pass, email, "Verify your account", emailContent);
                req.setAttribute("successMessage", "Đăng ký thành công! Vui lòng kiểm tra email để xác thực tài khoản.");
            } catch (Exception e) {
                e.printStackTrace();
                req.setAttribute("errorMessage", "Lỗi khi gửi email xác thực: " + e.getMessage());
            }
        } else {
            req.setAttribute("errorMessage", "Có lỗi khi thêm người dùng vào cơ sở dữ liệu.");
        }

        req.getRequestDispatcher(pageRedirect).forward(req, resp);
    }
}
