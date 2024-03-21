/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller_admin.nhat;

import dao.FootballFieldDAO;
import dao.FootballFieldScheduleDAO;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.FootballField;
import model.FootballFieldSchedule;

/**
 *
 * @author nhatk
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
@WebServlet(name = "AddsanbongServlet", urlPatterns = {"/admin/addsanbong"})
public class AddsanbongServlet extends HttpServlet {

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
            out.println("<title>Servlet AddsanbongServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddsanbongServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("addsanbong_nhat.jsp").forward(request, response);
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
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        FootballFieldDAO ffDAO = new FootballFieldDAO();
        String nameFF = request.getParameter("fieldName");
        int typeofFF = Integer.parseInt(request.getParameter("fieldType"));
        int Price = Integer.parseInt(request.getParameter("fieldPrice"));
        Part file = request.getPart("fieldImage");
        String imageFileName = file.getSubmittedFileName();
        String uploadPath = "D:/Java/FBK74/web/img_nhat/" + imageFileName;
        try {
            FileOutputStream fos = new FileOutputStream(uploadPath);
            InputStream is = file.getInputStream();
            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
            FootballFieldDAO ffD = new FootballFieldDAO();
            if (file != null) { 
                FootballField ff = new FootballField();
                ff.setName(nameFF);
                ff.setTypeofFootballField(typeofFF);
                ff.setPrice(Price);
                ff.setImage(imageFileName);
                ff.setStatus(0);
                ffDAO.insertFootballField(ff);
            } else {
                FootballField ff = new FootballField();
                ff.setName(nameFF);
                ff.setTypeofFootballField(typeofFF);
                ff.setPrice(Price);
                ff.setStatus(0);
                ffDAO.insertFootballField(ff);
            }
        } catch (Exception e) {
        }
        int idFootballField = ffDAO.getFootballFieldWithLastIndex();
        //Xử lý chèn lịch sân
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
        String[] selectedTimes = request.getParameterValues("selectedTimes");
        if (selectedTimes != null) {
            List<String> selectedTimesList = new ArrayList<>(Arrays.asList(selectedTimes));
            FootballFieldScheduleDAO ffsD = new FootballFieldScheduleDAO();
            //xử lý insert các time chưa có vào
            for (String string : selectedTimesList) {
                String[] timesplit = string.split("-");
                timesplit[0] = timesplit[0].trim();
                timesplit[1] = timesplit[1].trim();
                ffsD.insertFootballFieldSchedule(timesplit[0], timesplit[1], idFootballField, 0);
            }
        }
        response.sendRedirect("danhsachsanbong");

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
