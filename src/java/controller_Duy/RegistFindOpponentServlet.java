/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller_Duy;

import dao.RegistFindOpponentDAO;
import java.io.IOException;
import java.io.PrintWriter;

import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.Date;

import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.RegistFindOpponent;
import model.User;

/**
 *
 * @author ngoba
 */
@WebServlet(name = "RegistFindOpponentServlet", urlPatterns = {"/regist-find-opponent"})
public class RegistFindOpponentServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegistFindOpponentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistFindOpponentServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.getRequestDispatcher("dangkylamdoithu_duy.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession sesssion = request.getSession();
        HttpSession sessionRFO = request.getSession();
        RegistFindOpponentDAO RFOdao = new RegistFindOpponentDAO();
        Random rand = new Random();
        int idRFO = rand.nextInt(100) + 1;
        User u = (User) sesssion.getAttribute("account");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String power = request.getParameter("power");
        String[] selectedTimes = request.getParameterValues("times");
        String date = request.getParameter("futureDate");
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        // Tạo chuỗi chứa các thời gian đã chọn
        StringBuilder selectedTimesStr = new StringBuilder();
        for (String times : selectedTimes) {
            selectedTimesStr.append(times).append(", ");
        }
        // Xóa dấu phẩy cuối cùng
        selectedTimesStr.delete(selectedTimesStr.length() - 2, selectedTimesStr.length());
        //Chia thời gian bắt đầu và kết thúc
        for (String timeRange : selectedTimes) {
            // Chia mỗi giá trị thời gian thành thời gian bắt đầu và kết thúc
            String[] times = timeRange.split(" - ");
            String startTime = times[0];
            String endTime = times[1];
// Định dạng cho thời gian
            SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");

            try {
                // Phân tích chuỗi thời gian bắt đầu và kết thúc thành đối tượng Date
                Date startDate = sdf.parse(startTime);
                Date endDate = sdf.parse(endTime);

                // Chuyển đổi đối tượng Date thành đối tượng Time
                Time startTimeConverted = new Time(startDate.getTime());
                Time endTimeConverted = new Time(endDate.getTime());

                // Sử dụng startTimeConverted và endTimeConverted cho việc xử lý tiếp theo
                // Ví dụ: Lưu vào cơ sở dữ liệu, thực hiện tính toán, v.v.
                String[] selectedFF = request.getParameterValues("footballfield");
                // Tạo chuỗi chứa các loại sân đã chọn
                StringBuilder selectedFFStr = new StringBuilder();
                for (String FF : selectedFF) {
                    selectedFFStr.append(FF).append(", ");
                }
                // Xóa dấu phẩy cuối cùng
                selectedFFStr.delete(selectedFFStr.length() - 2, selectedFFStr.length());
                //Chia thời gian bắt đầu và kết thúc
                for (String kindofFields : selectedFF) {
                    // Chuyển đổi giá trị từ kiểu String sang kiểu int
                    int fieldValue = Integer.parseInt(kindofFields);
                    if (u == null) {
                        response.sendRedirect("index.jsp");
                    } else {
                        try {
                            RegistFindOpponent rfo = new RegistFindOpponent(idRFO, u, null, name, phone, startTimeConverted, endTimeConverted, date, power, fieldValue, 100000, 1);
                            RFOdao.insert(u.getIDAccount(), name, phone, startTimeConverted, endTimeConverted, date, power, fieldValue);
                            sessionRFO.getAttribute("idRFO");
                            response.sendRedirect("history-regist-find-opponent");
                        } catch (ClassNotFoundException ex) {
                            Logger.getLogger(RegistFindOpponentServlet.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }

                }
            } catch (ParseException ex) {
                ex.printStackTrace();
                // Xử lý ngoại lệ nếu có lỗi trong quá trình phân tích chuỗi thời gian
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
