/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller_thuy;

import dao.ClassDAO;
import dao.MemberOfClassDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author ngoba
 */
@WebServlet(name = "RegistMember", urlPatterns = {"/regist-member"})
public class RegistMember extends HttpServlet {

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
            out.println("<title>Servlet RegistMember</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistMember at " + request.getContextPath() + "</h1>");
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
        String classID_raw = request.getParameter("idClass");
        int classID = Integer.parseInt(classID_raw);
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("account");
        if (u == null) {
            response.sendRedirect("sign-in.jsp");
            return;
        }
        ClassDAO cDAO = new ClassDAO();
        request.setAttribute("classID", classID);
        request.getRequestDispatcher("RegistClass_thuy.jsp").forward(request, response);

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
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("account");
        int accountId = u.getIDAccount();
        MemberOfClassDAO mDAO = new MemberOfClassDAO();
        int classId = Integer.parseInt(request.getParameter("classId"));
        String phone = request.getParameter("phoneNumber");
        String name = request.getParameter("nameStudent");
        int age = Integer.parseInt(request.getParameter("age"));
        int height = Integer.parseInt(request.getParameter("height"));
        int weight = Integer.parseInt(request.getParameter("weight"));
        mDAO.addMember(accountId, classId, phone, name, age, height, weight);
        response.sendRedirect("CustomerCourse");

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
