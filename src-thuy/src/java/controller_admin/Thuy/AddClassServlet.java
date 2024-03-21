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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ClassEntity;
import model.YouthTrainingCourse;

/**
 *
 * @author ngoba
 */
@WebServlet(name = "AddClassServlet", urlPatterns = {"/admin/addclass"})
public class AddClassServlet extends HttpServlet {

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
            out.println("<title>Servlet AddClassServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddClassServlet at " + request.getContextPath() + "</h1>");
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
        ClassDAO dao = new ClassDAO();
        String idCourse_raw = request.getParameter("idCourse");
        int idCourse = Integer.parseInt(idCourse_raw);
        List<ClassEntity> classList = dao.getAllClassesByIDCourse(idCourse);
        ClassEntity c = null;
        String id = request.getParameter("id");

        int lastId = 0;

        for (ClassEntity classL : classList) {
            int classId = classL.getIdClass();
            if (classId > lastId) {
                lastId = classId;
            }
        }
        int newId = lastId + 1;
        request.setAttribute("classId", newId);
        request.setAttribute("idCourse", idCourse);

        request.getRequestDispatcher("AddClass_thuy.jsp").forward(request, response);
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
        ClassDAO dao = new ClassDAO();
        String nameheadcoach = request.getParameter("nameheadcoach");
        String phoneheadcoach = request.getParameter("phoneheadcoach");
        int numberStudent = Integer.parseInt(request.getParameter("numberStudent"));
        int idCourse = Integer.parseInt(request.getParameter("idCourse"));

        List<ClassEntity> courses = dao.getAllClassesByIDCourse(idCourse);

        //test
        int lastId = 0;

        for (ClassEntity course : courses) {
            int courseId = course.getIdClass();
            if (courseId > lastId) {
                lastId = courseId;
            }
        }
        int newId = lastId + 1;
        int classId = newId;

        ClassEntity course = new ClassEntity();
        course.setIdYouthTrainingCourse(idCourse);
        course.setCoachName(nameheadcoach);
        course.setCoachPhoneNumber(phoneheadcoach);
        course.setIdClass(classId);
        course.setNumberOfStudent(numberStudent);
        dao.createClass(course);
        response.sendRedirect("class?idCourse=" + idCourse);

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
