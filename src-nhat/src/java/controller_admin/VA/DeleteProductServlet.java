/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller_admin.VA;

import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bravee06
 */
@WebServlet(name = "DeleteProductServlet", urlPatterns = {"/admin/delete_product"})
public class DeleteProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Delete Product
        ProductDAO productDAO = new ProductDAO();
        String productId = request.getParameter("id");
        productDAO.deleteProduct(productId); // Handle exception, perhaps redirect to an error page
        // Redirect to doGet to refresh product list
        response.sendRedirect(request.getContextPath() + "/admin/product");

    }

}
