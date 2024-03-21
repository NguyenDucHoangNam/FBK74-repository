/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller_admin.nhat;

import dao.RegisteredFootballFieldDAO;
import dao.TotalScheduleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.RegisteredFootballField;
import model.TotalSchedule;

/**
 *
 * @author nhatk
 */
@WebServlet(name = "QuanlysanbongServlet", urlPatterns = {"/admin/quanlysanbong"})
public class QuanlysanbongServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet QuanlysanbongServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuanlysanbongServlet at " + request.getContextPath() + "</h1>");
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
        LocalDate ngayHienTai = LocalDate.now();
        // Định dạng ngày theo định dạng mong muốn (vd: "dd/MM/yyyy")
        DateTimeFormatter dinhDangNgay = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        // Chuyển đổi và in ra màn hình
        String ngay1 = ngayHienTai.format(dinhDangNgay);
        LocalDate ngay = LocalDate.parse(ngay1, dinhDangNgay);
        // Định dạng ngày theo định dạng "yyyy-MM-dd"
        DateTimeFormatter dinhDangNgayMoi = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        // Chuyển đổi và in ra màn hình
        String ngay2 = ngay.format(dinhDangNgayMoi);
        TotalScheduleDAO tsDAO = new TotalScheduleDAO();
        List<TotalSchedule> listTotalSchedule = tsDAO.getTotalSchedule(ngay2);
        Collections.sort(listTotalSchedule, new Comparator<TotalSchedule>() {
            @Override
            public int compare(TotalSchedule obj1, TotalSchedule obj2) {
                if (obj1.getRegisteredFootballField() != null && obj2.getRegisteredFootballField() != null) {
                    return obj1.getRegisteredFootballField().getFootballFieldSchedule().getStartTime()
                            .compareTo(obj2.getRegisteredFootballField().getFootballFieldSchedule().getStartTime());
                } else if (obj1.getRegisteredFootballField() != null && obj2.getScheduleTournament() != null) {
                    return obj1.getRegisteredFootballField().getFootballFieldSchedule().getStartTime()
                            .compareTo(obj2.getScheduleTournament().getFootballFieldSchedule().getStartTime());
                } else if (obj1.getRegisteredFootballField() != null && obj2.getStudySchedule() != null) {
                    return obj1.getRegisteredFootballField().getFootballFieldSchedule().getStartTime()
                            .compareTo(obj2.getStudySchedule().getFootballFieldSchedule().getStartTime());
                } else if (obj1.getScheduleTournament() != null && obj2.getScheduleTournament() != null) {
                    return obj1.getScheduleTournament().getFootballFieldSchedule().getStartTime()
                            .compareTo(obj2.getScheduleTournament().getFootballFieldSchedule().getStartTime());
                } else if (obj1.getStudySchedule() != null && obj2.getStudySchedule() != null) {
                    return obj1.getStudySchedule().getFootballFieldSchedule().getStartTime()
                            .compareTo(obj2.getStudySchedule().getFootballFieldSchedule().getStartTime());
                } else {
                    return obj1.getScheduleTournament().getFootballFieldSchedule().getStartTime()
                            .compareTo(obj2.getStudySchedule().getFootballFieldSchedule().getStartTime());
                }
            }

        });
        request.setAttribute("listTotalSchedule", listTotalSchedule);
        request.setAttribute("ngay1", ngay1);
        request.getRequestDispatcher("quanlysanbong_nhat.jsp").forward(request, response);
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
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        // Định dạng ngày theo định dạng "dd/MM/yyyy"
        DateTimeFormatter dinhDangNgay = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String ngay1 = request.getParameter("ngay1");
        LocalDate ngay = LocalDate.parse(ngay1, dinhDangNgay);
        // Định dạng ngày theo định dạng "yyyy-MM-dd"
        DateTimeFormatter dinhDangNgayMoi = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        // Chuyển đổi và in ra màn hình
        String ngay2 = ngay.format(dinhDangNgayMoi);
        TotalScheduleDAO tsDAO = new TotalScheduleDAO();
        //lấy list với tập hợp 3 bảng lại với nhau
        List<TotalSchedule> listTotalSchedule = tsDAO.getTotalSchedule(ngay2);
        Collections.sort(listTotalSchedule, new Comparator<TotalSchedule>() {
            @Override
            public int compare(TotalSchedule obj1, TotalSchedule obj2) {
                if (obj1.getRegisteredFootballField() != null && obj2.getRegisteredFootballField() != null) {
                    return obj1.getRegisteredFootballField().getFootballFieldSchedule().getStartTime()
                            .compareTo(obj2.getRegisteredFootballField().getFootballFieldSchedule().getStartTime());
                } else if (obj1.getRegisteredFootballField() != null && obj2.getScheduleTournament() != null) {
                    return obj1.getRegisteredFootballField().getFootballFieldSchedule().getStartTime()
                            .compareTo(obj2.getScheduleTournament().getFootballFieldSchedule().getStartTime());
                } else if (obj1.getRegisteredFootballField() != null && obj2.getStudySchedule() != null) {
                    return obj1.getRegisteredFootballField().getFootballFieldSchedule().getStartTime()
                            .compareTo(obj2.getStudySchedule().getFootballFieldSchedule().getStartTime());
                } else if (obj1.getScheduleTournament() != null && obj2.getScheduleTournament() != null) {
                    return obj1.getScheduleTournament().getFootballFieldSchedule().getStartTime()
                            .compareTo(obj2.getScheduleTournament().getFootballFieldSchedule().getStartTime());
                } else if (obj1.getStudySchedule() != null && obj2.getStudySchedule() != null) {
                    return obj1.getStudySchedule().getFootballFieldSchedule().getStartTime()
                            .compareTo(obj2.getStudySchedule().getFootballFieldSchedule().getStartTime());
                } else {
                    return obj1.getScheduleTournament().getFootballFieldSchedule().getStartTime()
                            .compareTo(obj2.getStudySchedule().getFootballFieldSchedule().getStartTime());
                }
            }

        });
        request.setAttribute("listTotalSchedule", listTotalSchedule);
        request.setAttribute("ngay1", ngay1);
        request.getRequestDispatcher("quanlysanbong_nhat.jsp").forward(request, response);
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
