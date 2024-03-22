/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller_admin.Nam;

import com.sun.javafx.scene.control.skin.VirtualFlow;
import dao.FootballFieldDAO;
import dao.FootballFieldScheduleDAO;
import dao.ScheduleDAO;
import dao.ScheduleTournamentDAO;
import dao.TeamDAO;
import dao.TournamentDAO;
import model.Schedule;
import model.Team;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.FootballField;
import model.FootballFieldSchedule;
import model.ScheduleTournament;

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
        try ( PrintWriter out = response.getWriter()) {
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
        FootballFieldDAO ffDAO = new FootballFieldDAO();
        FootballFieldScheduleDAO ffsDAO = new FootballFieldScheduleDAO();
        //danh sach san bong
        List<FootballField> listFootballField = new ArrayList<>();
        listFootballField = ffDAO.getFootballFields();
        List<Team> teams = teamDAO.getAllTeamByTournament(Integer.parseInt(IDTournament));
        request.setAttribute("teams", teams);
        request.setAttribute("IDTournament", IDTournament);
        request.setAttribute("listFootballField", listFootballField);
        request.getRequestDispatcher("themlich.jsp").forward(request, response);
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
        int IDTournament = Integer.parseInt(request.getParameter("tournamentID"));
        try {

            int teamIDA = Integer.parseInt(request.getParameter("teamIDA"));
            int teamIDB = Integer.parseInt(request.getParameter("teamIDB"));
            String date = request.getParameter("date");
            String footballfieldID_raw = request.getParameter("stadium");
            int footballfieldID = Integer.parseInt(footballfieldID_raw);
            String footballfieldSchedule_raw = request.getParameter("schedule");
            int footballfieldSchedule = Integer.parseInt(footballfieldSchedule_raw);
            String detail = request.getParameter("detail");
            ScheduleTournamentDAO sTDAO = new ScheduleTournamentDAO();
            ScheduleTournament sT = new ScheduleTournament();
            FootballFieldScheduleDAO ffsDAO = new FootballFieldScheduleDAO();
            TeamDAO teamDAO = new TeamDAO();
            TournamentDAO tournamentDAO = new TournamentDAO();
            sT.setFootballFieldSchedule(ffsDAO.getFootballFieldScheduleByID(footballfieldSchedule));
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date dateUtil = sdf.parse(date);
            java.sql.Date sqlDate = new java.sql.Date(dateUtil.getTime());
            sT.setDate(sqlDate);
            sT.setTeamA(teamDAO.getTeamById(teamIDA));
            sT.setTeamB(teamDAO.getTeamById(teamIDB));
            sT.setTournament(tournamentDAO.findByID(IDTournament));
            sT.setDescription(detail);
            sT.setStatus(0);
            sTDAO.insertScheduleTournament(sT);

        } catch (Exception e) {
            e.printStackTrace();
        }
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
