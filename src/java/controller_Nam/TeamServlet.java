/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller_Nam;

import dao.TeamDAO;
import dao.TournamentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Team;
import model.TeamMember;
import model.Tournament;
import model.User;

/**
 *
 * @author HoangNam
 */
@WebServlet(name = "TeamServlet", urlPatterns = {"/teams"})
public class TeamServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            String id = request.getParameter("id");

            TournamentDAO tournamentDAO = new TournamentDAO();
            Tournament tournament = tournamentDAO.findByID(Integer.parseInt(id));
            TeamDAO teamDAO = new TeamDAO();
//            List<Team> list = teamDAO.getAll(Integer.parseInt(id));
//            List<Team> teams = teamDAO.getAllTeamByTournament(Integer.parseInt(id));
            User user = (User) request.getSession().getAttribute("account");

            if (request.getParameter("isFromHistory") != null && request.getParameter("isFromHistory") != "") {
//                Team team = teamDAO.getTeamByUserAndTournament(user.getIDAccount(), Integer.parseInt(id));
                Team team = teamDAO.getTeamByUserAndTournamentWithActiveStatus(user.getIDAccount(), Integer.parseInt(id));

                List<TeamMember> members = teamDAO.getTeamMembersByTeamId(team.getId());
                team.setMembers(members);
                request.setAttribute("team", team);
            } else {
                List<Team> teams = teamDAO.getAllTeamByTournament(Integer.parseInt(id));
                for (Team team : teams) {
                    List<TeamMember> members = teamDAO.getTeamMembersByTeamId(team.getId());
                    team.setMembers(members);
                }
                request.setAttribute("teams", teams);
            }

            request.setAttribute("id", id);
            request.setAttribute("tournament", tournament);

            request.getRequestDispatcher("danhsachdoi_nam.jsp").forward(request, response);
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
        processRequest(request, response);
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
