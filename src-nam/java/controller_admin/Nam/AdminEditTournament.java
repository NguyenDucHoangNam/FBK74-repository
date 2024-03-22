/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller_admin.Nam;

import dao.TournamentDAO;
import model.Tournament;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "AdminEditTournament", urlPatterns = {"/admin/frontend.nam/AdminEditTournament"})
public class AdminEditTournament extends HttpServlet {

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
            out.println("<title>Servlet AdminEditTournament</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminEditTournament at " + request.getContextPath() + "</h1>");
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
        int IDTournament = Integer.parseInt(request.getParameter("IDTournament"));
        Tournament tournament = tournamentDAO.findByID(IDTournament);
        request.setAttribute("tournament", tournament);

        request.getRequestDispatcher("chinhsuagiaidau_nam.jsp").forward(request, response);
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
        String name = request.getParameter("name");
        String timeRegister = request.getParameter("timeRegister");
        String timeEndRegister = request.getParameter("timeEndRegister");
        String start = request.getParameter("start");
        String end = request.getParameter("end");
        String award = request.getParameter("award");
        String information = request.getParameter("information");

        TournamentDAO tournamentDAO = new TournamentDAO();
        Tournament tournament = new Tournament();
        tournament.setId(Integer.parseInt(id));
        tournament.setName(name);
        tournament.setTimeRegister(java.sql.Date.valueOf(timeRegister));
        tournament.setTimeCloseRegister(java.sql.Date.valueOf(timeEndRegister));
        tournament.setStart(java.sql.Date.valueOf(start));
        tournament.setEnd(java.sql.Date.valueOf(end));
        tournament.setAward(Double.parseDouble(award));
        tournament.setInformation(information);

        tournamentDAO.updateAdmin(tournament);

        response.sendRedirect("AdminTournaments");
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
