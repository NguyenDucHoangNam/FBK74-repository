/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller_Duy;

import dao.RegistFindOpponentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.RegistFindOpponent;

/**
 *
 * @author ngoba
 */
@WebServlet(name = "SuggestOpponentServlet", urlPatterns = {"/suggest_opponent"})
public class SugestOpponentServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SugestOpponentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SugestOpponentServlet at " + request.getContextPath() + "</h1>");
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
        RegistFindOpponentDAO pro = new RegistFindOpponentDAO();
        List<RegistFindOpponent> list1 = new ArrayList<>();
        HttpSession session = request.getSession();
//        if (session != null) {
//            session.removeAttribute("list");
//        }
        String date = request.getParameter("futureDate");
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        String kindff_raw = request.getParameter("loaisan");
        int kindff = Integer.parseInt(kindff_raw);
        String startTime = request.getParameter("times");
        //Chia thời gian bắt đầu và kết thúc

        list1 = pro.suggestOpponent(date, startTime, kindff);
               session.setAttribute("listSuggest", list1);
        if (list1 != null) {
            request.getRequestDispatcher("goiydoithu_duy.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
//            if (session != null) {
//                session.removeAttribute("list");
//            }
//        session.setAttribute("listSuggest", list1);
//        request.getRequestDispatcher("goiydoithu_duy.jsp").forward(request, response);
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
    }// </editor-fold>

}
