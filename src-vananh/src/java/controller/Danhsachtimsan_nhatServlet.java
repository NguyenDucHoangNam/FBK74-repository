/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.FootballFieldScheduleDAO;
import dao.RegisteredFootballFieldDAO;
import java.io.IOException;
import java.io.PrintWriter;

import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.FootballFieldSchedule;
import model.RegisteredFootballField;

/**
 *
 * @author nhatk
 */
@WebServlet(name = "Danhsachtimsan_nhatServlet", urlPatterns = {"/danhsachtimsan"})
public class Danhsachtimsan_nhatServlet extends HttpServlet {

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
            out.println("<title>Servlet Danhsachtimsan_nhatServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Danhsachtimsan_nhatServlet at " + request.getContextPath() + "</h1>");
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
        String ngay_raw = request.getParameter("ngay");
        String gio_raw = request.getParameter("gio");
        String loaisan_raw = request.getParameter("loaisan");
        
//      lấy ngày
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        String currentDate = "";
        Date currentDate1;
        if (ngay_raw == null) {
            // Sử dụng java.util.Calendar để lấy thời gian hiện tại
            Calendar calendar = Calendar.getInstance();

            // Lấy thời gian hiện tại dưới dạng java.util.Date
            Date date = calendar.getTime();
            currentDate = df.format(date);
            currentDate1 = date;
        } else {
            try {
                currentDate1 = df.parse(ngay_raw);
                currentDate = df.format(currentDate1);
            } catch (ParseException ex) {
                Logger.getLogger(Danhsachtimsan_nhatServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        FootballFieldScheduleDAO ffsd = new FootballFieldScheduleDAO();
        List<List<FootballFieldSchedule>> list = new ArrayList<>();
//        Lấy time
        int startTime1;
        LocalTime startTime;
        if (gio_raw == null) {
            startTime = LocalTime.now();
        } else {
            String[] gio_test = gio_raw.split(":");
            if (gio_test[0].length()== 1) gio_raw = "0"+gio_raw;
            startTime = LocalTime.parse(gio_raw);
        }
        int minute = startTime.getMinute();
        if (minute < 30) {
            startTime1 = startTime.getHour() - 1;
        } else {
            startTime1 = startTime.getHour();
        }
        if (startTime1 != 0 && startTime1>0) {
            startTime = LocalTime.of(startTime1, 30);
        } else {
            startTime = LocalTime.of(23, 30);
        }

        LocalTime endTime = LocalTime.of(0, 30);
        List<FootballFieldSchedule> listSchedule = new ArrayList<>();
        // B?t d?u vòng l?p
        for (LocalTime currentTime = startTime; !currentTime.equals(endTime); currentTime = currentTime.plusHours(1)) {
            // Chuy?n d?i LocalTime sang java.sql.Time (n?u c?n)
            Time sqlTime = Time.valueOf(currentTime);
            listSchedule = ffsd.getFootballFieldScheduleByStartTimeAndStatus0AndStatusFF0(sqlTime);
            if (listSchedule.size() != 0) {
                list.add(listSchedule);
            }
        }
        int i = 10 / list.get(0).size();
        // Chuyển định dang ngày dd/MM/yyyy -> yyyy/MM/dd
        // Xử lý để lấy ra danh sách ngày hiện tại
        String[] dateSplit = currentDate.split("/");        
        String currentDateChange = dateSplit[2] + dateSplit[1] + dateSplit[0];
        List<Integer> listIDFFS = new ArrayList<>();
        //lấy ra id với status = 1
        List<RegisteredFootballField> listRFF = new ArrayList<>();
        RegisteredFootballFieldDAO rFFD = new RegisteredFootballFieldDAO();
        listRFF = rFFD.getRegisteredFootballFielWithStatusAndDate(1, currentDateChange);
        for (RegisteredFootballField registeredFootballField : listRFF) {
            listIDFFS.add(registeredFootballField.getFootballFieldSchedule().getIDFootballFieldSchedule());
        }
        //lấy ra id với status = 2
        listRFF = rFFD.getRegisteredFootballFielWithStatusAndDate(2, currentDateChange);
        for (RegisteredFootballField registeredFootballField : listRFF) {
            listIDFFS.add(registeredFootballField.getFootballFieldSchedule().getIDFootballFieldSchedule());
        }
        HttpSession session = request.getSession();
        session.setAttribute("currentDate", currentDate);
        session.setAttribute("currentTime", startTime);
        session.setAttribute("currentHour", startTime1);
        session.setAttribute("listIDFFS", listIDFFS);
        session.setAttribute("size", i);
        session.setAttribute("listffs", list);
        request.getRequestDispatcher("pagination").forward(request, response);
    }

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
