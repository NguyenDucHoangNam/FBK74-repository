/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller_admin.Nam;

import dao.TournamentDAO;
import java.io.File;
import java.io.FileOutputStream;
import model.Tournament;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
@WebServlet(name = "AdminAddTournament", urlPatterns = {"/admin/frontend.nam/AdminAddTournament"})
public class AdminAddTournament extends HttpServlet {

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
            out.println("<title>Servlet AdminAddTournament</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminAddTournament at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.getRequestDispatcher("themgiaidau_nam.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");

//        String image = request.getParameter("image");
        Part file = request.getPart("image1");
        String imageFileName = file.getSubmittedFileName();
        String uploadPath = "D:/Java/FBK74/web/img_nam" + imageFileName;
        try {
            FileOutputStream fos = new FileOutputStream(uploadPath);
            InputStream is = file.getInputStream();
            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
        } catch (Exception e) {
        }

        TournamentDAO tournamentDAO = new TournamentDAO();
        Tournament tournament = new Tournament();
        tournament.setName(name);
//        tournament.setImage(image);
        tournament.setImage(imageFileName);
        tournamentDAO.insertAdmin(tournament);

        response.sendRedirect("AdminTournaments");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
