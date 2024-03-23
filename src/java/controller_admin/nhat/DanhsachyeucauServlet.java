/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller_admin.nhat;

import dao.BillDAO;
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
import model.Bill;
import model.RegistFindOpponent;

/**
 *
 * @author nhatk
 */
@WebServlet(name = "XacnhanyeucauServlet", urlPatterns = {"/admin/danhsachyeucau"})
public class DanhsachyeucauServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet XacnhanyeucauServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet XacnhanyeucauServlet at " + request.getContextPath() + "</h1>");
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
        BillDAO billD = new BillDAO();
        List<Bill> list = new ArrayList<>();
        list = billD.getBills();
        List<Bill> listBill = new ArrayList<>();
        for (Bill bill : list) {
            if (!bill.getInvoice().contains("A")) {
                if ((bill.getRegisteredFootballField()!=null) && (bill.getRegisteredFootballField().getStatus() == 2
                        || bill.getRegisteredFootballField().getStatus() == 4)) {
                    listBill.add(bill);
                }
                if ((bill.getRegistFindOpponent()!=null)&&( bill.getRegistFindOpponent().getStatus() == 2
                        || bill.getRegistFindOpponent().getStatus() == 4)) {
                    listBill.add(bill);
                }

            }
        }
        
        //list cần xác nhận yêu cầu
        request.setAttribute("listBill1", listBill);
        request.getRequestDispatcher("xacnhanyeucau_nhat.jsp").forward(request, response);
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
