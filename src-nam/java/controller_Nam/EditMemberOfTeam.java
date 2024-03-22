/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller_Nam;

import dao.TeamDAO;
import model.TeamMember;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "EditMemberOfTeam", urlPatterns = {"/EditMemberOfTeam"})
public class EditMemberOfTeam extends HttpServlet {

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
            out.println("<title>Servlet EditMemberOfTeam</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditMemberOfTeam at " + request.getContextPath() + "</h1>");
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
        String memberID = request.getParameter("memberID");
        String IDTeam = request.getParameter("IDTeam");


        TeamDAO teamDAO = new TeamDAO();
        TeamMember teamMember = teamDAO.getTeamMemberByTeamMemberId(Integer.parseInt(memberID));
        request.setAttribute("teamMember", teamMember);
        request.setAttribute("IDTeam", IDTeam);
        request.getRequestDispatcher("chinhsuathanhvien_nam.jsp").forward(request, response);
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
        String memberID = request.getParameter("id");
        String name = request.getParameter("name");
        String number = request.getParameter("number");
        String phone = request.getParameter("phone");
        String detail = request.getParameter("detail");
        String IDTeam = request.getParameter("IDTeam");
        TeamDAO teamDAO = new TeamDAO();
        TeamMember teamMember = new TeamMember();
        teamMember.setId(Integer.parseInt(memberID));
        teamMember.setName(name);
        teamMember.setNumber(number);
        teamMember.setPhone(phone);
        teamMember.setDetail(detail);
        teamDAO.updateTeamMember(teamMember);

        Team team = teamDAO.getTeamById(Integer.parseInt(IDTeam));
        response.sendRedirect("teams?id=" + team.getTournamentID() + "&isFromHistory=isFromHistory");
//        response.sendRedirect("HistoryServlet");
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
