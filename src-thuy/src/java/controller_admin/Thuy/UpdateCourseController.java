/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller_admin.thuy;

import dao.YouthTrainingCourseDAO;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.YouthTrainingCourse;

/**
 *
 * @author tungl
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
@WebServlet(name = "UpdateCourseController", urlPatterns = {"/admin/UpdateCourse"})
public class UpdateCourseController extends HttpServlet {

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
        YouthTrainingCourseDAO dao = new YouthTrainingCourseDAO();
        List<YouthTrainingCourse> courses = dao.getAllYouthTrainingCourses();

        String id = request.getParameter("id");
        YouthTrainingCourse c = null;
        if (id != null) {
            try {
                c = dao.getYouthTrainingCourseById(Integer.parseInt(id));
                request.setAttribute("course", c);
            } catch (Exception e) {
                response.sendRedirect("Error.jsp");
            }
        } else {
            int lastId = 0;

            for (YouthTrainingCourse course : courses) {
                int courseId = course.getIdYouthTrainingCourse();
                if (courseId > lastId) {
                    lastId = courseId;
                }
            }
            int newId = lastId + 1;
            request.setAttribute("courseId", newId);
        }
        if (c != null) {
            request.setAttribute("courseId", c.getIdYouthTrainingCourse());
        }
        request.getRequestDispatcher("UpdateCourse_thuy.jsp").forward(request, response);
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
// Call the method to insert the course into the database
        YouthTrainingCourseDAO dao = new YouthTrainingCourseDAO(); // Replace with your actual database handler class
        // Retrieve form parameters
        String name = request.getParameter("name");
        Date timeRegist = Date.valueOf(request.getParameter("timeRegist"));
        Date timeCloseRegist = Date.valueOf(request.getParameter("endDate"));
        Date timeStart = Date.valueOf(request.getParameter("startDate"));
        double tuition = Double.parseDouble(request.getParameter("tuition"));
        String information = request.getParameter("description");
        int courseId = Integer.parseInt(request.getParameter("id"));
        
        //Img
        Part file = request.getPart("img1");
        String imageFileName = file.getSubmittedFileName();
        String uploadPath = "D:/CN3/FBK74/FBK74/web/img_thuy";
        try {
            FileOutputStream fos = new FileOutputStream(uploadPath);
            InputStream is = file.getInputStream();
            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
        } catch (Exception e) {
        }
        
    
        // Create YouthTrainingCourse object
        YouthTrainingCourse course = new YouthTrainingCourse();
        
        course.setImage(imageFileName);
        course.setNameYouthTrainingCourse(name);
        course.setTimeRegist(timeRegist);
        course.setTimeCloseRegist(timeCloseRegist);
        course.setTimeStart(timeStart);
        course.setTuition(tuition);
        course.setInformation(information);
        course.setIdYouthTrainingCourse(courseId);

        try {

            dao.updateYouthTrainingCourse(course);
        } catch (Exception e) {
            request.setAttribute("messError", e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("AddCourse");
            dispatcher.forward(request, response);
        }

        // Set success message attribute
        request.setAttribute("messSuccess", "Add Course successfully!");
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
