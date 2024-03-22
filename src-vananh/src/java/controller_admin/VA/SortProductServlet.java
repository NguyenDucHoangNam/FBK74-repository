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
@WebServlet(name = "SortProductServlet", urlPatterns = {"/admin/sort"})
public class SortProductServlet extends HttpServlet {

    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String currentPageStr = request.getParameter("currentPage");
//        int currentPage = 1;
//        
//        if(currentPageStr != null){
//           currentPage = Integer.parseInt(currentPageStr);
//        }
//        
//        int productsPerPage = 5; // Set a default value
//        int start = (currentPage - 1) * productsPerPage;
//
//        // Assuming you have a ProductDAO class to interact with the database
//        ProductDAO productDAO = new ProductDAO();
//        try {
//            List<Product> products = productDAO.findProductsWithPagination(start, productsPerPage);
//            products.sort(new Comparator<Product>() {
//                @Override
//                public int compare(Product o1, Product o2) {
//                    return o1.getQuantity() - o2.getQuantity();
//                }
//            });
//            // Set products as an attribute in the request to pass it to the JSP
//            request.setAttribute("products", products);
//            int totalProducts = productDAO.getAllProducts().size();
//            int totalPages = (int) Math.ceil((double) totalProducts / productsPerPage);
//
//            request.setAttribute("products", products);
//            request.setAttribute("currentPage", currentPage);
//            request.setAttribute("totalPages", totalPages);
//
//            // Forward the request to a JSP to render the product list
//            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/product-list_VA.jsp");
//            dispatcher.forward(request, response);
//
//        } catch (SQLException e) {
//            // Handle SQLException, perhaps by logging it
//            e.printStackTrace();
//
//            // Redirect the user to an error page
//            response.sendRedirect("/error.jsp");
//        }
//    }

@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String sortOrder = request.getParameter("sortOrder");
    String currentPageStr = request.getParameter("currentPage");
    int currentPage = currentPageStr != null ? Integer.parseInt(currentPageStr) : 1;
    
    int productsPerPage = 5;
    int start = (currentPage - 1) * productsPerPage;

    ProductDAO productDAO = new ProductDAO();

    try {
        List<Product> products = productDAO.findProductsWithPagination(start, productsPerPage);
        if ("desc".equals(sortOrder)) {
            products.sort((o1, o2) -> Integer.compare(o2.getQuantity(), o1.getQuantity())); // Đảm bảo sắp xếp giảm dần
        } else {
            products.sort(Comparator.comparingInt(Product::getQuantity)); // Sắp xếp tăng dần
        }

        request.setAttribute("products", products);
        int totalProducts = productDAO.getAllProducts().size();
        int totalPages = (int) Math.ceil((double) totalProducts / productsPerPage);

        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/product-list_VA.jsp");
        dispatcher.forward(request, response);
    } catch (SQLException e) {
        e.printStackTrace();
        response.sendRedirect("/error.jsp");
    }
}
}

