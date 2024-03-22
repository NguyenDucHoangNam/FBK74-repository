/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller_admin.nhat;

import dao.FootballFieldDAO;
import dao.FootballFieldScheduleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.FootballField;
import model.FootballFieldSchedule;

/**
 *
 * @author nhatk
 */
@WebServlet(name = "Capnhatsanbong", urlPatterns = {"/admin/danhsachsanbong"})
public class Danhsachsanbong extends HttpServlet {

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
            out.println("<title>Servlet Capnhatsanbong</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Capnhatsanbong at " + request.getContextPath() + "</h1>");
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
        FootballFieldDAO ffD = new FootballFieldDAO();
        FootballFieldScheduleDAO ffsD = new FootballFieldScheduleDAO();
        List<FootballField> listFF = new ArrayList<>();
        
        listFF = ffD.getFootballFields();
//        listffandffs lưu lại danh sách lịch sân với id từng sân
        List<List<FootballFieldSchedule>> listffandffs = new ArrayList<>();
        for (FootballField footballField : listFF) {
            List<FootballFieldSchedule> listffs = ffsD.getFootballFieldScheduleByIDFootballFieldWithStatus(footballField.getIDFootballField());
            if(listffs.size()==0){
                FootballFieldSchedule ffs = new FootballFieldSchedule(0, null, null, footballField, 0);
                listffs.add(0, ffs);
            }
            listffandffs.add(listffs);
        }    
       request.setAttribute("listffandffs", listffandffs);
        request.getRequestDispatcher("danhsachsanbong_nhat.jsp").forward(request, response);
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
