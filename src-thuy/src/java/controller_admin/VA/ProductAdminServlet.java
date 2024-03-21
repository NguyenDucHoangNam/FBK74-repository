/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller_admin.VA;

import dao.ProductDAO;
import dao.ProductUpdateDAO;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import java.sql.SQLException;
import java.util.List;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.Product;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB

@WebServlet(name = "ProductAdminServlet", urlPatterns = {"/admin/product"})
public class ProductAdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String currentPageStr = request.getParameter("currentPage");
        int currentPage = 1;

        if (currentPageStr != null) {
            currentPage = Integer.parseInt(currentPageStr);
        }

        int productsPerPage = 5; // Set a default value
        int start = (currentPage - 1) * productsPerPage;

        // Assuming you have a ProductDAO class to interact with the database
        ProductDAO productDAO = new ProductDAO();
        try {
            List<Product> products = productDAO.findProductsWithPagination(start, productsPerPage);
            System.out.println(products);
            // Set products as an attribute in the request to pass it to the JSP
            request.setAttribute("products", products);
            int totalProducts = productDAO.getAllProducts().size();
            int totalPages = (int) Math.ceil((double) totalProducts / productsPerPage);

            request.setAttribute("products", products);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("totalPages", totalPages);

            // Forward the request to a JSP to render the product list
            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/product-list_VA.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            // Handle SQLException, perhaps by logging it
            e.printStackTrace();

            // Redirect the user to an error pages
            response.sendRedirect("/error.jsp");
        }
    }

    private String saveImage(HttpServletRequest request) throws IOException, ServletException {
        Part filePart = request.getPart("image"); // Retrieves <input type="file" name="image">
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.

        // Generate a unique file name or use a fixed location/name based on your requirement
        String uniqueFileName = generateUniqueFileName(fileName);

        // Define where to save the image
        String savePath = "D:\\Java\\FBK74\\web\\img_VA" + File.separator + uniqueFileName;

        // Saves the file on disk
        File fileSaveDir = new File(savePath);
        filePart.write(fileSaveDir.getAbsolutePath());

        // Return the path or a reference (e.g., URL or relative path) to the saved image
        // This example returns a relative path
        return uniqueFileName.trim();
    }

    private String generateUniqueFileName(String originalFileName) {
        // Implement logic to generate a unique file name
        // This could be as simple as appending a timestamp or UUID to the original file name
        return System.currentTimeMillis() + "_" + originalFileName;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        ProductDAO productDAO = new ProductDAO();
        if (action != null) {
            switch (action) {
                case "add":
                    try {
                    String name = request.getParameter("name");

                    int quantity = Integer.parseInt(request.getParameter("quantity"));
                    // Lấy phần tải lên từ request
                    Part filePart = request.getPart("image"); // Lấy thông tin file từ form
                    String fileName = UUID.randomUUID().toString() + "_"+Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.

                    // Xác định đường dẫn lưu trữ file trong thư mục webapp/img
                    String appPath = request.getServletContext().getRealPath("");
                    String savePath = appPath + "img" + File.separator + fileName;

                    // Tạo thư mục nếu nó không tồn tại
                    File fileSaveDir = new File(savePath).getParentFile();
                    if (!fileSaveDir.exists()) {
                        fileSaveDir.mkdirs();
                    }

                    // Lưu file
                    filePart.write(savePath);
                    
                    
                    Product product = new Product();
                    product.setName(name);

                    product.setQuantity(quantity);
                    product.setImage(fileName);

                    productDAO.addProduct(product);

                    response.sendRedirect(request.getContextPath() + "/admin/product");
                } catch (IOException | NumberFormatException | SQLException | ServletException e) {
                    PrintWriter print = response.getWriter();
                    print.print(e.getMessage());
                }
                break;

                case "update":
                    // Update Product
                    String productId = request.getParameter("id");
                    String name = request.getParameter("name");
                    String oldImage = request.getParameter("oldImage");
                    
                    int quantity = Integer.parseInt(request.getParameter("quantity"));
                    // Lấy phần tải lên từ request
                    Part filePart = request.getPart("image"); // Lấy thông tin file từ form
                    String fileName = UUID.randomUUID().toString() + "_"+Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
                    if (fileName != null && !fileName.isEmpty()) {
                        // Xác định đường dẫn lưu trữ file trong thư mục webapp/img
                    String appPath = request.getServletContext().getRealPath("");
                    String savePath = appPath + "img" + File.separator + fileName;

                    // Tạo thư mục nếu nó không tồn tại
                    File fileSaveDir = new File(savePath).getParentFile();
                    if (!fileSaveDir.exists()) {
                        fileSaveDir.mkdirs();
                    }

                    // Lưu file
                    filePart.write(savePath);
                    oldImage = fileName;
                    }
                    
                    
                    Product product = new Product();
                    product.setId(Integer.parseInt(productId));
                    product.setName(name);

                    product.setQuantity(quantity);
                    product.setImage(oldImage);

                    ProductDAO p = new ProductDAO();
                   ;
                       

                    
                    
                     p.updateProduct(product);
                     doGet(request, response);
                    break;

                default:
                    response.sendRedirect("/error.jsp");
                    break;
            }
        }
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
