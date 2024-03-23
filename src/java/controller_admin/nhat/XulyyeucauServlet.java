/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller_admin.nhat;

import com.google.gson.Gson;
import dao.BillDAO;
import dao.FootballFieldScheduleDAO;
import dao.RegistFindOpponentDAO;
import dao.RegisteredFootballFieldDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Bill;
import model.FootballFieldSchedule;
import model.RegisteredFootballField;
import model.User;

/**
 *
 * @author nhatk
 */
@WebServlet(name = "XulyyeucauServlet", urlPatterns = {"/admin/xulyyeucau"})
public class XulyyeucauServlet extends HttpServlet {

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
            out.println("<title>Servlet XulyyeucauServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet XulyyeucauServlet at " + request.getContextPath() + "</h1>");
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
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        Gson json = new Gson();       
        BillDAO billDAO = new BillDAO();
        RegisteredFootballFieldDAO rffDAO = new RegisteredFootballFieldDAO();
        String idBill_raw = request.getParameter("idBill");
        int idBill = Integer.parseInt(idBill_raw);
        int status = Integer.parseInt(request.getParameter("status"));
        String requestStatus = request.getParameter("requestStatus");
        if(requestStatus.equals("duyet")){
            if(status==5) {
                RegisteredFootballField rff = billDAO.getBillByID(idBill).getRegisteredFootballField();
                String test = json.toJson(rff);
                out.print(test);
            }
            else{
                String test = json.toJson("Xác nhận đơn duyệt");
                out.print(test);
            }
        }else{
            if(status==5){
                RegisteredFootballField rff = billDAO.getBillByID(idBill).getRegisteredFootballField();
                String test = json.toJson(rff);
                out.print(test);
            } else{
                String test = json.toJson("Từ chối đơn duyệt");
                out.print(test);
            }
        }
        out.flush();
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
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        Gson json = new Gson();       
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");
        String idBill_raw = request.getParameter("idBill");
        String status_raw = request.getParameter("status");
        int idBill = Integer.parseInt(idBill_raw);
        int status = Integer.parseInt(status_raw);
        BillDAO billD = new BillDAO();
        RegisteredFootballFieldDAO rFFD = new RegisteredFootballFieldDAO();
        RegistFindOpponentDAO rfoDAO = new RegistFindOpponentDAO();
        RegisteredFootballField rFF = billD.getBillByID(idBill).getRegisteredFootballField();
        int idrFF = rFF.getIDRegisteredFootballField();
        rFFD.changeStatusWithIDRegisteredFootballField(status, idrFF);
        if(rFF.getRegistFindOppoent()!=null){
            try {
                rfoDAO.approveMember(rFF.getRegistFindOppoent().getIdRFO());
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(XulyyeucauServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        billD.updateIDAccount2(idBill,user.getIDAccount());
        String test = json.toJson("thanh cong");
        out.print(test);
        out.flush();
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
