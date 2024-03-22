/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.FootballFieldScheduleDAO;
import dao.RegisteredFootballFieldDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
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
import model.FootballFieldSchedule;
import model.RegisteredFootballField;
import model.User;

/**
 *
 * @author nhatk
 */
@WebServlet(name = "DatsanServlet_nhat", urlPatterns = {"/datsan"})
public class DatsanServlet_nhat extends HttpServlet {

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
            out.println("<title>Servlet DatsanServlet_nhat</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DatsanServlet_nhat at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");
        int ffsID =  (int) session.getAttribute("ffsID");
        String bookerName = request.getParameter("bookerName");
        String phone = request.getParameter("phone");
        String note = request.getParameter("note");
        String ngay = (String) session.getAttribute("ngay");
        Random rand = new Random();
        int IDrff = rand.nextInt(100) + 1;
        RegisteredFootballFieldDAO rffd = new RegisteredFootballFieldDAO();
            
        FootballFieldScheduleDAO ffsd = new FootballFieldScheduleDAO();
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");        
        try {
            while (rffd.checkRegisteredFFID(IDrff) == true) {
                IDrff = rand.nextInt(100) + 1;
            }
            java.util.Date date = sdf.parse(ngay);
            java.sql.Date sqlDate = new java.sql.Date(date.getTime());
            RegisteredFootballField rff = new RegisteredFootballField(IDrff, user, null, null, ffsd.getFootballFieldScheduleByID(ffsID), sqlDate, bookerName, phone, 100000, 2, note);
            rffd.insertRFF(rff);
            session.removeAttribute("ffsID");
            session.removeAttribute("ngay");
            session.setAttribute("rffID", rff.getIDRegisteredFootballField());
        } catch (Exception e) {
        }
        response.sendRedirect("vnpay_pay.jsp");
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
