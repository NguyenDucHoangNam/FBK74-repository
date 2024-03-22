/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller_Nam;

import dao.TeamDAO;
import dao.TournamentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Team;
import model.Tournament;
import model.User;

/**
 *
 * @author HoangNam
 */
@WebServlet(name = "CancelRegisTournament", urlPatterns = {"/CancelRegisTournament"})
public class CancelRegisTournament extends HttpServlet {

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
            out.println("<title>Servlet CancelRegisTournament</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CancelRegisTournament at " + request.getContextPath() + "</h1>");
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
        int tournamentID = Integer.parseInt(request.getParameter("tournamentID"));
        TournamentDAO tournamentDAO = new TournamentDAO();
        TeamDAO teamDAO = new TeamDAO();
        User user = (User) request.getSession().getAttribute("account");

        Tournament tournament = tournamentDAO.findByID(tournamentID);
        Team team = teamDAO.getTeamByUserAndTournament(user.getIDAccount(), tournament.getId());
        Tournament tournamentNeedToCancel = tournamentDAO.findBetweenStartDateRegistAndEndDateRegis(team.getId(), tournament.getTimeRegister(), tournament.getTimeCloseRegister());
        if (tournamentNeedToCancel == null) {
            response.sendRedirect("index.jsp");
        } else {
            teamDAO.updateStatusToPendingCancel(team.getId());
            response.sendRedirect("HistoryServlet");

        }
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
    }// <

}
