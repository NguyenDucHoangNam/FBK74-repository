/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.RegisteredFootballFieldDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.RegisteredFootballField;

/**
 *
 * @author nhatk
 */
@WebServlet(name = "UpdateSandadat_nhatServlet", urlPatterns = {"/updatesandadat"})
public class UpdateSandadat_nhatServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateSandadat_nhatServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateSandadat_nhatServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String IDrff_raw = request.getParameter("IDrff");
        int IDrff = Integer.parseInt(IDrff_raw);
        RegisteredFootballFieldDAO rffd = new RegisteredFootballFieldDAO();
        RegisteredFootballField rff = rffd.getRegisteredFootballFielByID(IDrff);
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        String date = sdf.format(rff.getDate());
        request.setAttribute("rff", rff);
        request.setAttribute("date", date);
        request.getRequestDispatcher("updatesandadat_nhat.jsp").forward(request, response);
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
        String id_raw = request.getParameter("id");
        String bookerName = request.getParameter("bookerName");
        String phone = request.getParameter("phone");
        String note = request.getParameter("note");
        int id = Integer.parseInt(id_raw);       
        RegisteredFootballFieldDAO rffd = new RegisteredFootballFieldDAO();
        RegisteredFootballField rff = rffd.getRegisteredFootballFielByID(id);
        rffd.updateRegisteredFootballField(bookerName,phone,note, id);
        response.sendRedirect("sandadat");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
