/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller_Duy;

import dao.RegistFindOpponentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author ngoba
 */
@WebServlet(name = "UpdateHistoryRegistFindOpponent", urlPatterns = {"/update-history-find-opponent"})
public class UpdateHistoryRegistFindOpponent extends HttpServlet {

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
            out.println("<title>Servlet UpdateHistoryRegistFindOpponent</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateHistoryRegistFindOpponent at " + request.getContextPath() + "</h1>");
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
        request.setAttribute("idRFO", request.getParameter("idRFO"));
        request.getRequestDispatcher("chinhsuadangkylamdoithu_duy.jsp").forward(request, response);
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
        String idRFO_raw = request.getParameter("idRFO");
        int idRFO = Integer.parseInt(idRFO_raw);
        RegistFindOpponentDAO RFOdao = new RegistFindOpponentDAO();
        Random rand = new Random();
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
                        RFOdao.update(name, phone, startTime, endTime, date, power, fieldValue, idRFO);
                        response.sendRedirect("history-regist-find-opponent");
                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(RegistFindOpponentServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
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
