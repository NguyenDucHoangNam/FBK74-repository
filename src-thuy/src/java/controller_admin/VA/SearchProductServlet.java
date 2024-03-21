/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller_admin.VA;

import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Comparator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;

/**
 *
 * @author bravee06
 */
@WebServlet(name = "SearchProductServlet", urlPatterns = {"/admin/search"})
public class SearchProductServlet extends HttpServlet {

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
            out.println("<title>Servlet SearchProductServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchProductServlet at " + request.getContextPath() + "</h1>");
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
        String currentPageStr = request.getParameter("currentPage");
        String keyword = request.getParameter("search");
        int currentPage = 1;
        
        if(currentPageStr != null){
           currentPage = Integer.parseInt(currentPageStr);
        }
        
        int productsPerPage = 2; // Set a default value
        int start = (currentPage - 1) * productsPerPage;

        // Assuming you have a ProductDAO class to interact with the database
        ProductDAO productDAO = new ProductDAO();
        try {
            List<Product> products = productDAO.searchProductsWithPagination(start, productsPerPage,keyword);
            System.out.println(products);
            // Set products as an attribute in the request to pass it to the JSP
            request.setAttribute("products", products);
            int totalProducts = products.size();
            int totalPages = (int) Math.ceil((double) totalProducts / productsPerPage);

            request.setAttribute("products", products);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("totalPages", totalPages);

            // Forward the request to a JSP to render the product list
            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/product-list_VA.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            // Handle SQLException, perhaps by logging it
            e.printStackTrace();

            // Redirect the user to an error page
            response.sendRedirect("/error.jsp");
        }
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
