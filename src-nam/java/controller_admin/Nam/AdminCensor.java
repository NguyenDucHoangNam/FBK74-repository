/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller_admin.Nam;

import dao.TeamDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Team;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "AdminCensor", urlPatterns = {"/admin/frontend.nam/AdminCensor"})
public class AdminCensor extends HttpServlet {

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
            out.println("<title>Servlet AdminCensor</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminCensor at " + request.getContextPath() + "</h1>");
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
        String IDTournament = request.getParameter("IDTournament");
        List<Team> listPendingApproval = teamDAO.getAllTeamByPendingApproveStatusByTournamentId(Integer.parseInt(IDTournament) );
        List<Team> listPendingCancel = teamDAO.getAllTeamByPendingCancelStatusByTournamentId(Integer.parseInt(IDTournament) );
        UserDAO userDAO = new UserDAO();

        request.setAttribute("listPendingApproval", listPendingApproval);
        request.setAttribute("userDAO", userDAO);
        request.setAttribute("listPendingCancel", listPendingCancel);
        request.setAttribute("IDTournament", IDTournament);
        request.getRequestDispatcher("kiemduyet_nam.jsp").forward(request, response);  
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
        String type = request.getParameter("type");
        String IDTournament = request.getParameter("IDTournament");
        int teamID = Integer.parseInt(request.getParameter("id"));
        TeamDAO teamDAO = new TeamDAO();

        if(type.equalsIgnoreCase("approveRegis")){
            teamDAO.updateStatusToAccepted(teamID);
        } else if(type.equalsIgnoreCase("rejectRegis")){
            teamDAO.updateStatusToRejected(teamID);
        } else if(type.equalsIgnoreCase("approveCancel")){
            teamDAO.updateStatusToCancel(teamID);
        } else if(type.equalsIgnoreCase("rejectCancel")){
            teamDAO.updateStatusToAccepted(teamID); // if reject cancel, then the team is still active
        }
        response.sendRedirect("AdminCensor?IDTournament=" + IDTournament);
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
