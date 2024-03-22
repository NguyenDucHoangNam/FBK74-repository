    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller_admin.Nam;

import dao.ScheduleDAO;
import dao.TeamDAO;
import model.Schedule;
import model.Team;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "AdminAddResult", urlPatterns = {"/admin/frontend.nam/AdminAddResult"})
public class AdminAddResult extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminAddResult</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminAddResult at " + request.getContextPath() + "</h1>");
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
        String IDTournament = request.getParameter("IDTournament");
        TeamDAO teamDAO = new TeamDAO();

        List<Team> teams = teamDAO.getAllTeamByTournament(Integer.parseInt(IDTournament));
        request.setAttribute("teams", teams);
        request.setAttribute("IDTournament", IDTournament);
        request.getRequestDispatcher("themketqua.jsp").forward(request, response);

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
        String IDTournament = request.getParameter("tournamentID");
        String teamIDA = request.getParameter("teamIDA");
        String teamIDB = request.getParameter("teamIDB");
        String date = request.getParameter("date");
        String result = request.getParameter("result");
        String detail = request.getParameter("detail");

        ScheduleDAO scheduleDAO = new ScheduleDAO();
        Schedule s = new Schedule();
        s.setFieldName("1");
        s.setDate(LocalDateTime.parse(date));
        s.setTeamA(teamIDA);
        s.setTeamB(teamIDB);
        s.setResult(result);
        s.setDetail(detail);
        scheduleDAO.insertSchedule(s, Integer.parseInt(IDTournament));
        response.sendRedirect("AdminResult?IDTournament=" + IDTournament);
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
