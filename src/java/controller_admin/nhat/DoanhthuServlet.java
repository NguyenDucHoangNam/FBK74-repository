/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller_admin.nhat;

import dao.BillDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Bill;
import model.User;

/**
 *
 * @author nhatk
 */
@WebServlet(name = "DoanhthuServlet", urlPatterns = {"/admin/doanhthu"})
public class DoanhthuServlet extends HttpServlet {

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
            out.println("<title>Servlet DoanhthuServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DoanhthuServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");
        BillDAO billDAO = new BillDAO();
        List<Bill> listBill = new ArrayList<>();
        int totalDoanhthu = 0;
        if (user.getRole() == 3) {//nesu là admin
            listBill = billDAO.getBills();
            for (Bill bill : listBill) {
                if (bill.getInvoice().contains("A")) {//nếu là hóa đơn sân thì công trực tiếp
                    totalDoanhthu += bill.getTotalPrice();
                } else if (bill.getRegisteredFootballField() != null) {//nếu là tiền cọc sân thì tính
                    if (bill.getRegisteredFootballField().getStatus() != 4
                            && bill.getRegisteredFootballField().getStatus() != 5) {
                        totalDoanhthu += bill.getRegisteredFootballField().getDeposit();
                    }
                }//else xử lý tiền đăng ký đối thủ
            }
        } else {//nếu là staff
            listBill = billDAO.getBillsByIDAccount2(user.getIDAccount());
            for (Bill bill : listBill) {
                if (bill.getInvoice().contains("A")) {//nếu là hóa đơn sân thì công trực tiếp
                    totalDoanhthu += bill.getTotalPrice();
                } else if (bill.getRegisteredFootballField() != null) {//nếu là tiền cọc sân thì tính
                    if (bill.getRegisteredFootballField().getStatus() != 4
                            && bill.getRegisteredFootballField().getStatus() != 5) {
                        totalDoanhthu += bill.getRegisteredFootballField().getDeposit();
                    }
                }//else xử lý tiền đăng ký đối thủ
            }
        }
        Collections.reverse(listBill);
        request.setAttribute("listBill", listBill);
        request.setAttribute("doanhThu", totalDoanhthu);
        request.getRequestDispatcher("doanhthu_nhat.jsp").forward(request, response);
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
        if (request.getParameter("invoiceCode") != null) {
            BillDAO billDAO = new BillDAO();
            String invoice = request.getParameter("invoiceCode");
            Bill bill = new Bill();
            bill = billDAO.getBillByInvoice(invoice);
            if (bill != null) {
                List<Bill> listBill = new ArrayList<>();
                listBill.add(bill);
                request.setAttribute("listBill", listBill);
            } else {
                request.setAttribute("nobill", "Không tìm thấy hóa đơn: " + invoice);
            }
            request.setAttribute("check", 1);
            request.getRequestDispatcher("doanhthu_nhat.jsp").forward(request, response);
        } else {
            //hiển thị ra danh sách các hóa đơn từ ngày đến ngày
            String ngayFrom = request.getParameter("ngayFrom");
            String ngayTo = request.getParameter("ngayTo");
            DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

            // Chuyển đổi chuỗi thành LocalDate
            LocalDate dateFrom = LocalDate.parse(ngayFrom, inputFormatter);
            // Format lại ngày theo định dạng mới
            String outputDateFrom = dateFrom.format(outputFormatter);
            LocalDate dateTo = LocalDate.parse(ngayTo, inputFormatter);
            // Format lại ngày theo định dạng mới
            String outputDateTo = dateTo.format(outputFormatter);

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("account");
            BillDAO billDAO = new BillDAO();
            List<Bill> listBill = new ArrayList<>();
            int totalDoanhthu = 0;
            if (user.getRole() == 3) {//nesu là admin
                listBill = billDAO.getBillsByAdminFromdateTodate(outputDateFrom, outputDateTo);
                for (Bill bill : listBill) {
                    if (bill.getInvoice().contains("A")) {//nếu là hóa đơn sân thì công trực tiếp
                        totalDoanhthu += bill.getTotalPrice();
                    } else if (bill.getRegisteredFootballField() != null) {//nếu là tiền cọc sân thì tính
                        if (bill.getRegisteredFootballField().getStatus() != 4
                                && bill.getRegisteredFootballField().getStatus() != 5) {
                            totalDoanhthu += bill.getRegisteredFootballField().getDeposit();
                        }
                    }//else xử lý tiền đăng ký đối thủ
                }
            } else {//nếu là staff
                listBill = billDAO.getBillsByIDAccount2FromdateTodate(user.getIDAccount(), outputDateFrom, outputDateTo);
                for (Bill bill : listBill) {
                    if (bill.getInvoice().contains("A")) {//nếu là hóa đơn sân thì công trực tiếp
                        totalDoanhthu += bill.getTotalPrice();
                    } else if (bill.getRegisteredFootballField() != null) {//nếu là tiền cọc sân thì tính
                        if (bill.getRegisteredFootballField().getStatus() != 4
                                && bill.getRegisteredFootballField().getStatus() != 5) {
                            totalDoanhthu += bill.getRegisteredFootballField().getDeposit();
                        }
                    }//else xử lý tiền đăng ký đối thủ
                }
            }
            Collections.reverse(listBill);
            request.setAttribute("listBill", listBill);
            request.setAttribute("doanhThu", totalDoanhthu);
            request.getRequestDispatcher("doanhthu_nhat.jsp").forward(request, response);
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
