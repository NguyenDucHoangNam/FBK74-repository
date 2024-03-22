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
@WebServlet(name = "AdminAddTeam", urlPatterns = {"/admin/frontend.nam/AdminAddTeam"})
public class AdminAddTeam extends HttpServlet {

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
            out.println("<title>Servlet AdminAddTeam</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminAddTeam at " + request.getContextPath() + "</h1>");
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
        TournamentDAO tournamentDAO = new TournamentDAO();
        TeamDAO teamDAO = new TeamDAO();
        String IDTournament = request.getParameter("IDTournament");

        Tournament tournament = tournamentDAO.findByID(Integer.parseInt(IDTournament));
        request.setAttribute("tournament", tournament);
        UserDAO userDAO = new UserDAO();
        List<User> users = userDAO.getAllUser();
        request.setAttribute("accounts", users);


        request.getRequestDispatcher("themdoibong.jsp").forward(request, response);
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
        String teamName = request.getParameter("teamName");
        String accountID = request.getParameter("accountID");
        String teamDetail = request.getParameter("teamDetail");
        String status = request.getParameter("status");

        TeamDAO teamDAO = new TeamDAO();
        Team team = new Team();
        team.setName(teamName);
        team.setDetail(teamDetail);
        team.setTournamentID(Integer.parseInt(IDTournament));
        team.setAccountID(Integer.parseInt(accountID));
        team.setStatus(status);
        teamDAO.addTeam(team);

        response.sendRedirect("AdminTeamServlet?IDTournament=" + IDTournament);


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
