/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller_Duy;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "Pagination_Duy", urlPatterns = {"/pagination_duy"})
public class Pagination_Duy extends HttpServlet {

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
            out.println("<title>Servlet Pagination_Duy</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Pagination_Duy at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        int page = 1;
        int recordsPerPage = 7;
        List<RegistFindOpponent> dataList = new ArrayList<>();
        if (session.getAttribute("list") != null) {
            dataList = (List<RegistFindOpponent>) session.getAttribute("list");
        } else if (session.getAttribute("listHistory") != null) {
            dataList = (List<RegistFindOpponent>) session.getAttribute("listHistory");
        }
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        int startIndex = (page - 1) * recordsPerPage;
        int endIndex = Math.min(startIndex + recordsPerPage, dataList.size());

        List<RegistFindOpponent> currentPageData = new ArrayList<>();
        if (startIndex <= endIndex) {
            currentPageData = dataList.subList(startIndex, endIndex);
        }

        request.setAttribute("currentPageData", currentPageData);
        request.setAttribute("totalRecords", dataList.size());
        request.setAttribute("recordsPerPage", recordsPerPage);
        request.setAttribute("currentPage", page);

        if (session.getAttribute("list") != null) {
            request.getRequestDispatcher("timdoithu_duy.jsp").forward(request, response);
        } else if (session.getAttribute("listHistory") != null) {
            request.getRequestDispatcher("lichsutimdoithu_duy.jsp").forward(request, response);
        } 
//        else if (session.getAttribute("listSuggest") != null) {
//            request.getRequestDispatcher("goiydoithu_duy.jsp").forward(request, response);
//        }

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
