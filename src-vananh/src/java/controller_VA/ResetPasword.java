package controller_VA;

import services.CustomerServices;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.EmailUtility;

@WebServlet(name = "ResetPasword", urlPatterns = {"/reset_password"})
public class ResetPasword extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private String host;
    private String port;
    private String email;
    private String name;
    private String pass;

    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        email = context.getInitParameter("email");
        name = context.getInitParameter("name");
        pass = context.getInitParameter("pass");
    }

    public ResetPasword() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String page = "forgot-password_VA.jsp";
        request.getRequestDispatcher(page).forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String recipient = request.getParameter("email");
        String subject = "Confirm code come here !";
        String confirmCode ="";
        Random random = new Random();
        int min = 100000; // Giá trị tối thiểu
        int max = 999999; // Giá trị tối đa
        int code = random.nextInt(max - min + 1) + min;
//        CustomerServices customerServices = new CustomerServices();
//        String newPassword = customerServices.resetCustomerPassword(recipient);

        String content = "Hi, this is your confirm code: " + code;
        content += "\nNote: for security reason, "
                + "you must change your password after logging in.";
        String message ="";
        
        try {
            EmailUtility.sendEmail(host, port, email, name, pass,
                    recipient, subject, content);
            confirmCode = code+"";
        } catch (Exception ex) {
            ex.printStackTrace();
            message = "There were an error: " + ex.getMessage();
        } finally {
            request.setAttribute("message", message);
            request.setAttribute("email", recipient);
            HttpSession session = request.getSession();
            session.setAttribute("confirmCode", confirmCode);
            request.getRequestDispatcher("message.jsp").forward(request, response);
        }
    }

}
