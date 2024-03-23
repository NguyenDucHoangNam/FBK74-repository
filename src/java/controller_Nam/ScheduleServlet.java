/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller_Nam;

import dao.ScheduleDAO;
import dao.ScheduleTournamentDAO;
import dao.TournamentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Schedule;
import model.ScheduleTournament;
import model.Tournament;

/**
 *
 * @author HoangNam
 */
@WebServlet(name = "ScheduleServlet", urlPatterns = {"/schedule"})
public class ScheduleServlet extends HttpServlet {

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
            ScheduleDAO scheduleDAO = new ScheduleDAO();
            List<Schedule> list = scheduleDAO.getAll(Integer.parseInt(id));
            request.setAttribute("list", list);
            request.setAttribute("id", id);
            request.setAttribute("tournament", tournament);
            request.getRequestDispatcher("lichthidau_nam.jsp").forward(request, response);
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
        ScheduleTournamentDAO sTDAO = new ScheduleTournamentDAO();
        int iDTournament = Integer.parseInt(request.getParameter("id"));
        List<ScheduleTournament> listST = sTDAO.getScheduleTournamentByIDTournament(iDTournament);
        List<List<ScheduleTournament>> listSTWithDate = new ArrayList<>();
        // Lặp qua từng phần tử trong listST và tạo danh sách các lịch giải đấu cùng ngày
        List<ScheduleTournament> temp = new ArrayList<>();
        Date currentDate = null;
        for (ScheduleTournament scheduleTournament : listST) {
            if (currentDate == null || !scheduleTournament.getDate().equals(currentDate)) {
                if (!temp.isEmpty()) {
                    listSTWithDate.add(new ArrayList<>(temp));
                    temp.clear();
                }
                currentDate = scheduleTournament.getDate();
            }
            temp.add(scheduleTournament);
        }
        //Thêm phần tử cuối cùng vào listSTWithDate nếu cần
        if (!temp.isEmpty()) {
            listSTWithDate.add(new ArrayList<>(temp));
        }
        request.setAttribute("listSTWithDate", listSTWithDate);
        request.getRequestDispatcher("lichthidau_nam.jsp").forward(request, response);
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
