/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller_admin.Nam;

import dao.TeamDAO;
import dao.TournamentDAO;
import dao.UserDAO;
import model.Team;
import model.Tournament;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "AdminEditTeam", urlPatterns = {"/admin/frontend.nam/AdminEditTeam"})
public class AdminEditTeam extends HttpServlet {

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
            out.println("<title>Servlet AdminEditTeam</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminEditTeam at " + request.getContextPath() + "</h1>");
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
        TeamDAO teamDAO = new TeamDAO();
        String IDTeam = request.getParameter("IDTeam");
        Team team = teamDAO.getTeamById(Integer.parseInt(IDTeam));
        request.setAttribute("team", team);
        TournamentDAO tournamentDAO = new TournamentDAO();
        Tournament tournament = tournamentDAO.findByID(team.getTournamentID());
        request.setAttribute("tournament", tournament);
                UserDAO userDAO = new UserDAO();
        List<User> users = userDAO.getAllUser();
        request.setAttribute("accounts", users);

        request.getRequestDispatcher("chinhsuadoibong.jsp").forward(request, response);
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
        String id = request.getParameter("id");
        String teamName = request.getParameter("teamName");
        String accountID = request.getParameter("accountID");
        String teamDetail = request.getParameter("teamDetail");
        String status = request.getParameter("status");

        TeamDAO teamDAO = new TeamDAO();
        Team team = teamDAO.getTeamById(Integer.parseInt(id));

        team.setName(teamName);
        team.setDetail(teamDetail);
        team.setTournamentID(team.getTournamentID());
        team.setAccountID(Integer.parseInt(accountID));
        team.setStatus(status);
        teamDAO.updateTeam(team);
        response.sendRedirect("AdminTeamServlet?IDTournament=" + team.getTournamentID());

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
