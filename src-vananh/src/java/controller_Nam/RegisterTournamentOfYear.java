/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller_Nam;

import dao.TeamDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Team;
import model.User;

/**
 *
 * @author HoangNam
 */
@WebServlet(name = "RegisterTournamentOfYear", urlPatterns = {"/RegisterTournamentOfYear"})
public class RegisterTournamentOfYear extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterTournamentOfYear</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterTournamentOfYear at " + request.getContextPath() + "</h1>");
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
        String name = request.getParameter("name");
        User user = (User) request.getSession().getAttribute("account");
        if (user == null) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
//        TeamDAO teamDAO = new TeamDAO();
//        List<Team> team = teamDAO.getTeamByUser(user.getIDAccount());
//        if(team.isEmpty() || team == null ) {
//            response.sendRedirect("injex.jsp");
//        }

//        request.setAttribute("team", team.get(0));
        int tournamentID = Integer.parseInt(request.getParameter("tournamentID"));
        request.setAttribute("tournamentID", tournamentID);
        request.setAttribute("name", name);
        request.setAttribute("user", user);
        request.getRequestDispatcher("dangkythamgiagiaidaucuthe_nam.jsp").forward(request, response);
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
        int tournamentID = Integer.parseInt(request.getParameter("tournamentID"));
        User user = (User) request.getSession().getAttribute("account");

        String teamName = request.getParameter("teamName");
        String teamDetail = request.getParameter("teamDetail");
        TeamDAO teamDAO = new TeamDAO();
        Team team = new Team();
        team.setTournamentID(tournamentID);
        team.setAccountID(user.getIDAccount());
        team.setName(teamName);
        team.setDetail(teamDetail);
        teamDAO.insertTeamWithPendingStatus(team);

//        request.getRequestDispatcher("./HistoryServlet").forward(request, response);
        response.sendRedirect("index.jsp");
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
