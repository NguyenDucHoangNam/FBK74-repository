/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller_admin.thuy;

import dao.ClassDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ClassEntity;

/**
 *
 * @author ngoba
 */
@WebServlet(name = "UpdateClassServlet", urlPatterns = {"/admin/updateclass"})
public class UpdateClassServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateClassServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateClassServlet at " + request.getContextPath() + "</h1>");
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
        ClassDAO dao = new ClassDAO();
        ClassEntity c = null;
        String id = request.getParameter("id");
        int idClass = Integer.parseInt(id);
        request.setAttribute("classId", idClass);

        request.getRequestDispatcher("UpdateClass_thuy.jsp").forward(request, response);
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
        ClassDAO dao = new ClassDAO();
        String nameheadcoach = request.getParameter("nameheadcoach");
        String phoneheadcoach = request.getParameter("phoneheadcoach");
        int numberStudent = Integer.parseInt(request.getParameter("numberStudent"));
        int idClass = Integer.parseInt(request.getParameter("classId"));

        ClassEntity course = new ClassEntity();
        course.setCoachName(nameheadcoach);
        course.setCoachPhoneNumber(phoneheadcoach);
        course.setNumberOfStudent(numberStudent);
        course.setIdClass(idClass);
        dao.updateClass(course);
        response.sendRedirect("ManagerCourse");

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
