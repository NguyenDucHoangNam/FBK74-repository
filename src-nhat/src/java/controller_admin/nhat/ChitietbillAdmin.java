/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller_admin.nhat;

import com.google.gson.Gson;
import dao.BillDAO;
import dao.ProductDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Bill;
import model.ProductDetail;

/**
 *
 * @author nhatk
 */
@WebServlet(name = "ChitietbillAdmin", urlPatterns = {"/admin/chitiethoadon"})
public class ChitietbillAdmin extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChitietbillAdmin</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChitietbillAdmin at " + request.getContextPath() + "</h1>");
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
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        Gson json = new Gson();
        String idBill_raw = request.getParameter("idBill");
        int idBill = Integer.parseInt(idBill_raw);
        ProductDetailDAO productDetailDAO = new ProductDetailDAO();
        BillDAO billDAO = new BillDAO();
        Bill bill = billDAO.getBillByID(idBill);
        int deposit=0;
        if(bill.getRegisteredFootballField()!=null){
            request.setAttribute("tenSan", bill.getRegisteredFootballField().getFootballFieldSchedule().getFootballField().getName());
            request.setAttribute("loaiSan", bill.getRegisteredFootballField().getFootballFieldSchedule().getFootballField().getTypeofFootballField());
            request.setAttribute("startTime", bill.getRegisteredFootballField().getFootballFieldSchedule().getStartTime());
            request.setAttribute("endTime", bill.getRegisteredFootballField().getFootballFieldSchedule().getEndTime());
            request.setAttribute("priceFF", bill.getRegisteredFootballField().getFootballFieldSchedule().getFootballField().getPrice());
            if(bill.getRegisteredFootballField().getRegistFindOppoent()!=null){
                deposit = bill.getRegisteredFootballField().getDeposit()*2;
                request.setAttribute("deposit", bill.getRegisteredFootballField().getDeposit()*2);
                request.setAttribute("bookerNameRegist", bill.getRegisteredFootballField().getRegistFindOppoent().getName());
                request.setAttribute("phoneRegist", bill.getRegisteredFootballField().getRegistFindOppoent().getPhone());
            } else {
                request.setAttribute("deposit", bill.getRegisteredFootballField().getDeposit());
                deposit = bill.getRegisteredFootballField().getDeposit();
            }
            request.setAttribute("bookerName", bill.getRegisteredFootballField().getName());
            request.setAttribute("phone", bill.getRegisteredFootballField().getPhoneNumber());
            
        } else if(bill.getStudySchedule()!=null){
            request.setAttribute("tenSan", bill.getStudySchedule().getFootballFieldSchedule().getFootballField().getName());
            request.setAttribute("loaiSan", bill.getStudySchedule().getFootballFieldSchedule().getFootballField().getTypeofFootballField());
            request.setAttribute("startTime", bill.getStudySchedule().getFootballFieldSchedule().getStartTime());
            request.setAttribute("endTime", bill.getStudySchedule().getFootballFieldSchedule().getEndTime());
            request.setAttribute("priceFF", bill.getStudySchedule().getFootballFieldSchedule().getFootballField().getPrice());
            request.setAttribute("bookerName", "Tên khóa học");
        }else if(bill.getScheduleTournament()!=null){
            request.setAttribute("tenSan", bill.getScheduleTournament().getFootballFieldSchedule().getFootballField().getName());
            request.setAttribute("loaiSan", bill.getScheduleTournament().getFootballFieldSchedule().getFootballField().getTypeofFootballField());
            request.setAttribute("startTime", bill.getScheduleTournament().getFootballFieldSchedule().getStartTime());
            request.setAttribute("endTime", bill.getScheduleTournament().getFootballFieldSchedule().getEndTime());
            request.setAttribute("priceFF", bill.getScheduleTournament().getFootballFieldSchedule().getFootballField().getPrice());
            request.setAttribute("bookerName", "Tên giải đấu");
        }
        
        List<ProductDetail> listProductDetail = productDetailDAO.getProductDetailByIDBill(idBill);
        request.setAttribute("listProductDT", listProductDetail);
        request.setAttribute("bill", bill);    
        request.setAttribute("totalBill", deposit+bill.getTotalPrice());
        request.getRequestDispatcher("chitiethoadon_nhat.jsp").forward(request, response);
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
