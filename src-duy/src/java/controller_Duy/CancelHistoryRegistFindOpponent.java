/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller_Duy;

import dao.RegistFindOpponentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.RegistFindOpponent;

/**
 *
 * @author ngoba
 */
@WebServlet(name = "CancelHistoryRegistFindOpponent", urlPatterns = {"/cancel-history-find-opponent"})
public class CancelHistoryRegistFindOpponent extends HttpServlet {

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
            out.println("<title>Servlet CancelHistoryRegistFindOpponent</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CancelHistoryRegistFindOpponent at " + request.getContextPath() + "</h1>");
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
        RegistFindOpponentDAO dao = new RegistFindOpponentDAO();
        int idRFO = Integer.parseInt(request.getParameter("idRFO"));

// Lấy thông tin từ CSDL dựa trên idRFO
        List<RegistFindOpponent> list = dao.getListByIdRFO(idRFO); // Cần triển khai hàm này

        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        for (RegistFindOpponent registFindOpponent : list) {
            String stringDate = registFindOpponent.getDate();
            Date date;

            try {
                date = df.parse(stringDate);

// Kiểm tra xem danh sách có phần tử không và thời gian hủy so với thời gian bắt đầu
                LocalTime startTime = registFindOpponent.getTimeStart().toLocalTime();
                LocalTime now = LocalTime.now();
                int differenceMinutes = (int) startTime.until(now, java.time.temporal.ChronoUnit.MINUTES);
                int differenceHours = differenceMinutes / -60; // Số giờ chênh lệch                // Lấy ngày hiện tại
                Calendar calendar = Calendar.getInstance();
                Date currentDate = calendar.getTime();

                // Chuyển đổi thành java.sql.Date
                if (differenceHours >= 1 && currentDate.equals(date)) {
                    try {
                        dao.cancelMemberAndWaitRefund(idRFO);
                        response.sendRedirect("history-regist-find-opponent");
                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(CancelHistoryRegistFindOpponent.class.getName()).log(Level.SEVERE, null, ex);
                    }

                } else if (!currentDate.equals(date)) {
                    dao.cancelMemberAndWaitRefund(idRFO);
                    response.sendRedirect("history-regist-find-opponent");
                } else {
                    try {
                        dao.cancelMemberAndNoRefund(idRFO);
                        response.sendRedirect("history-regist-find-opponent");

                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(CancelHistoryRegistFindOpponent.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                //nếu >=1 thì cho phép hủy sân và hoàn cọc set status = 4, còn không thì mất cọc status = 6
//        if (differenceHours >= 1 && sqlDate.equals(rFFD.getRegisteredFootballFielByID(IDrff).getDate())) {
//            rFFD.changeStatusWithIDRegisteredFootballField(4, IDrff);
//        } else if (!sqlDate.equals(rFFD.getRegisteredFootballFielByID(IDrff).getDate())) {
//            rFFD.changeStatusWithIDRegisteredFootballField(4, IDrff);
//        } else {
//            rFFD.changeStatusWithIDRegisteredFootballField(6, IDrff);
//        }
            } catch (ParseException ex) {
                Logger.getLogger(CancelHistoryRegistFindOpponent.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(CancelHistoryRegistFindOpponent.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
// Redirect tới trang phù hợp dựa trên kết quả

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
        processRequest(request, response);
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
