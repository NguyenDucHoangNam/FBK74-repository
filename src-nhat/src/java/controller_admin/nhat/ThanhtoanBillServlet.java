/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller_admin.nhat;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import dao.ProductDAO;
import dao.RegisteredFootballFieldDAO;
import dao.ScheduleTournamentDAO;
import dao.StudyScheduleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;
import model.RegisteredFootballField;
import model.ScheduleTournament;
import model.StudySchedule;
import com.fasterxml.jackson.databind.ObjectMapper;
import dao.BillDAO;
import dao.ProductDetailDAO;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpSession;
import model.Bill;
import model.ProductDetail;
import model.User;

/**
 *
 * @author nhatk
 */
@WebServlet(name = "ThanhtoanBillServlet", urlPatterns = {"/admin/thanhtoanbill"})
public class ThanhtoanBillServlet extends HttpServlet {

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
            out.println("<title>Servlet ThanhtoanBillServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ThanhtoanBillServlet at " + request.getContextPath() + "</h1>");
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
        RegisteredFootballFieldDAO rffDAO = new RegisteredFootballFieldDAO();
        StudyScheduleDAO sSDAO = new StudyScheduleDAO();
        ScheduleTournamentDAO sTDAO = new ScheduleTournamentDAO();
        int idDonthanhtoan = Integer.parseInt(request.getParameter("idDonthanhtoan"));
        String typeDonthanhtoan = request.getParameter("typeDonthanhtoan");
        //rFF: RegisterFF, sT: scheduleTournament, sS: StudySchedule
        if (typeDonthanhtoan.equals("rFF")) {
            RegisteredFootballField donThanhToan = rffDAO.getRegisteredFootballFielByID(idDonthanhtoan);
            request.setAttribute("donThanhToan", donThanhToan);
            request.setAttribute("typeDonthanhtoan", typeDonthanhtoan);
        } else if (typeDonthanhtoan.equals("sT")) {
            ScheduleTournament donThanhToan = sTDAO.getScheduleTournamentByID(idDonthanhtoan);
            request.setAttribute("donThanhToan", donThanhToan);
            request.setAttribute("typeDonthanhtoan", typeDonthanhtoan);
        } else {
            StudySchedule donThanhToan = sSDAO.getStudyScheduleByID(idDonthanhtoan);
            request.setAttribute("donThanhToan", donThanhToan);
            request.setAttribute("typeDonthanhtoan", typeDonthanhtoan);
        }
        ProductDAO productD = new ProductDAO();
        List<Product> listProduct = new ArrayList<>();
        try {
            listProduct = productD.getAllProducts();
        } catch (SQLException ex) {
            Logger.getLogger(ThanhtoanBillServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("idDonthanhtoan", idDonthanhtoan);
        request.setAttribute("typeDonthanhtoan", typeDonthanhtoan);
        request.setAttribute("listProduct", listProduct);
        request.getRequestDispatcher("thanhtoan_nhat.jsp").forward(request, response);
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
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        Gson json = new Gson();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");
        // Lấy thông tin từ request
        String bookingTime = request.getParameter("bookingTime");
        String bookerName = request.getParameter("bookerName");
        String phone = request.getParameter("phone");
        int idDonthanhtoan = Integer.parseInt(request.getParameter("idDonthanhtoan"));
        String typeDonthanhtoan = request.getParameter("typeDonthanhtoan");
        // Lấy thông tin về các loại nước đã thêm
        String[] selectedWaterInfo = request.getParameterValues("selectedWaterInfo");
        List<waterinfo> waterInfoList = new ArrayList<>();
        if (selectedWaterInfo != null) {
            // Chuyển chuỗi JSON thành danh sách đối tượng WaterInfo
            java.lang.reflect.Type listType = new TypeToken<List<waterinfo>>() {
            }.getType();
             waterInfoList = json.fromJson(selectedWaterInfo[0], listType);
            // Lặp qua danh sách và lấy thông tin
        }
        BillDAO billDAO = new BillDAO();
        RegisteredFootballFieldDAO rffDAO = new RegisteredFootballFieldDAO();
        ScheduleTournamentDAO sTDAO = new ScheduleTournamentDAO();
        StudyScheduleDAO sSDAO = new StudyScheduleDAO();
        Bill bill = new Bill();
        //tong bill
        int toltalPrice =0;
        String invoice = "AA" + idDonthanhtoan + typeDonthanhtoan;
        bill.setInvoice(invoice);
        if (typeDonthanhtoan.equals("rFF")) {
            bill.setRegisteredFootballField(rffDAO.getRegisteredFootballFielByID(idDonthanhtoan));
            rffDAO.changeStatusWithIDRegisteredFootballField(3, idDonthanhtoan);
            toltalPrice = rffDAO.getRegisteredFootballFielByID(idDonthanhtoan)
                    .getFootballFieldSchedule().getFootballField().getPrice() - rffDAO.getRegisteredFootballFielByID(idDonthanhtoan)
                    .getDeposit();
            if(rffDAO.getRegisteredFootballFielByID(idDonthanhtoan).getRegistFindOppoent()!=null){
                toltalPrice-=100000;
            }
        } else if (typeDonthanhtoan.equals("sT")) {
            bill.setScheduleTournament(sTDAO.getScheduleTournamentByID(idDonthanhtoan));
            toltalPrice = sTDAO.getScheduleTournamentByID(idDonthanhtoan).getFootballFieldSchedule().getFootballField().getPrice();
        } else {
            bill.setStudySchedule(sSDAO.getStudyScheduleByID(idDonthanhtoan));
            toltalPrice = sSDAO.getStudyScheduleByID(idDonthanhtoan).getFootballFieldSchedule().getFootballField().getPrice();
        }
        bill.setStudySchedule(sSDAO.getStudyScheduleByID(idDonthanhtoan));
        bill.setAccount2(user);
        // Lấy thời gian hiện tại
        Date currentDate = new Date();

        // Định dạng ngày giờ
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        // Chuyển đối tượng Date thành chuỗi
        String dateString = dateFormat.format(currentDate);
        bill.setPaymentDate(dateString);
        if (typeDonthanhtoan.equals("rFF")) {
            billDAO.insertBillWithRegisteredFootballField(bill);
        } else if (typeDonthanhtoan.equals("sT")) {
            billDAO.insertBillWithScheduleTournament(bill);
        } else {
            billDAO.insertBillWithStudySchedule(bill);
        }
        ProductDAO productDAO = new ProductDAO();
        ProductDetailDAO productDetailDAO = new ProductDetailDAO();
        int lastIndexBill = billDAO.getIDBillLastIndex();
        //tong bill
        
        for (waterinfo object : waterInfoList) {
            if(object.getSoLuong()>0){
                ProductDetail productDetail = new ProductDetail();
                productDetail.setiDProduct(productDAO.getProductByName(object.getLoaiNuoc()).getId());
                productDetail.setQuantity(object.getSoLuong());
                productDetail.setiDBill(lastIndexBill);
                productDetail.setPrice(object.getGiaTien());
                productDetailDAO.insertProductDetail(productDetail);
                toltalPrice+=object.getSoLuong()*object.getGiaTien();
            }
        }
        billDAO.updateIDAccount2(lastIndexBill, user.getIDAccount());
        billDAO.updateTotalPricewwithidBillAndTotalPrice(lastIndexBill, toltalPrice);
        response.sendRedirect("quanlysanbong");
        
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
