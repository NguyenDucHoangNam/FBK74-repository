/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Bill;
import model.FootballField;
import model.StudySchedule;

/**
 *
 * @author nhatk
 */
public class BillDAO extends DBContext {

    public void insertBillWithRegisteredFootballField(Bill bill) {
        String sql = "INSERT INTO [dbo].[Bill]\n"
                + "           ([Invoice]\n"
                + "           ,[IDRegisteredFootballField] ,[PaymentDate])"
                + "     VALUES"
                + "           (?,?,?)";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, bill.getInvoice());
            st.setInt(2, bill.getRegisteredFootballField().getIDRegisteredFootballField());
            st.setString(3, bill.getPaymentDate());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertBillWithScheduleTournament(Bill bill) {
        String sql = "INSERT INTO [dbo].[Bill]\n"
                + "           ([Invoice]\n"
                + ",[IDAccount2] \n"
                + "           ,[IDScheduleTournament]\n ,[PaymentDate])"
                + "     VALUES"
                + "           (?,?,?,?)";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, bill.getInvoice());
            st.setInt(2, bill.getAccount2().getIDAccount());
            st.setInt(3, bill.getScheduleTournament().getIDScheduleTournament());
            st.setString(4, bill.getPaymentDate());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertBillWithStudySchedule(Bill bill) {
        String sql = "INSERT INTO [dbo].[Bill]\n"
                + "           ([Invoice]\n"
                + ", [IDAccount2]\n"
                + "           ,[IDStudySchedule]\n ,[PaymentDate])"
                + "     VALUES"
                + "           (?,?,?,?)";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, bill.getInvoice());
            st.setInt(2, bill.getAccount2().getIDAccount());
            st.setInt(3, bill.getStudySchedule().getIDStudySchedule());
            st.setString(4, bill.getPaymentDate());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateTotalPricewwithidBillAndTotalPrice(int idBill, int totalPrice) {
        String sql = "UPDATE [dbo].[Bill]\n"
                + "   SET \n"
                + "      [TotalPrice] = ?\n"
                + " WHERE IDBill = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, totalPrice);
            st.setInt(2, idBill);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateIDAccount2(int idBill, int idAcc2) {
        String sql = "UPDATE [dbo].[Bill]\n"
                + "   SET \n"
                + "      [IDAccount2] = ?\n"
                + " WHERE IDBill = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, idAcc2);
            st.setInt(2, idBill);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public boolean checkIDBill(int id) {
        String sql = "SELECT [IDBill]\n"
                + "  FROM [FBK74].[dbo].[Bill] where IDBill=?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public List<Bill> getBills() {
        List<Bill> list = new ArrayList<>();
        RegisteredFootballFieldDAO rFFD = new RegisteredFootballFieldDAO();
        RegistFindOpponentDAO rFOD = new RegistFindOpponentDAO();
        UserDAO userD = new UserDAO();
        String sql = "SELECT [IDBill]\n"
                + "      ,[Invoice]\n"
                + "      ,[IDRegisteredFootballField]\n"
                + "      ,[IDRegistFindOppoent]\n"
                + "      ,[IDAccount2]\n"
                + "      ,[IDStudySchedule]\n"
                + "      ,[IDScheduleTournament]\n"
                + "      ,[PaymentDate]\n"
                + "      ,[TotalPrice]\n"
                + "  FROM [dbo].[Bill]";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int IDBill = rs.getInt("IDBill");
                String Invoice = rs.getString("Invoice");
                int IDRegisteredFootballField = rs.getInt("IDRegisteredFootballField");
                int IDRegistFindOppoent = rs.getInt("IDRegistFindOppoent");
                int IDAccount2 = rs.getInt("IDAccount2");
                int IDStudySchedule = rs.getInt("IDStudySchedule");
                int IDScheduleTournament = rs.getInt("IDScheduleTournament");
                String PaymentDate = rs.getString("PaymentDate");
                int totalPrice = rs.getInt("TotalPrice");
                Bill bill = new Bill(IDBill, Invoice, rFFD.getRegisteredFootballFielByID(IDRegisteredFootballField),
                        rFOD.getRegistFindOpponentByID(IDRegistFindOppoent), userD.getUserByIDAccount(IDAccount2), null, null, PaymentDate, totalPrice);
                list.add(bill);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Bill getBillByID(int id) {
        RegisteredFootballFieldDAO rFFD = new RegisteredFootballFieldDAO();
        RegistFindOpponentDAO rFOD = new RegistFindOpponentDAO();
        UserDAO userD = new UserDAO();
        String sql = "SELECT [IDBill]\n"
                + "      ,[Invoice]\n"
                + "      ,[IDRegisteredFootballField]\n"
                + "      ,[IDRegistFindOppoent]\n"
                + "      ,[IDAccount2]\n"
                + "      ,[IDStudySchedule]\n"
                + "      ,[IDScheduleTournament]\n"
                + "      ,[PaymentDate]\n"
                + "      ,[TotalPrice]\n"
                + "  FROM [dbo].[Bill] where IDBill = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int IDBill = rs.getInt("IDBill");
                String Invoice = rs.getString("Invoice");
                int IDRegisteredFootballField = rs.getInt("IDRegisteredFootballField");
                int IDRegistFindOppoent = rs.getInt("IDRegistFindOppoent");
                int IDAccount2 = rs.getInt("IDAccount2");
                int IDStudySchedule = rs.getInt("IDStudySchedule");
                int IDScheduleTournament = rs.getInt("IDScheduleTournament");
                String PaymentDate = rs.getString("PaymentDate");
                int totalPrice = rs.getInt("TotalPrice");
                Bill bill = new Bill(IDBill, Invoice, rFFD.getRegisteredFootballFielByID(IDRegisteredFootballField),
                        rFOD.getRegistFindOpponentByID(IDRegistFindOppoent), userD.getUserByIDAccount(IDAccount2), null, null, PaymentDate, totalPrice);
                return bill;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int getIDBillLastIndex() {
        int IDBill = -1;
        String sql = "SELECT TOP 1 [IDBill]\n"
                + "            FROM [dbo].[Bill]\n"
                + "            ORDER BY [IDBill] DESC";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                IDBill = rs.getInt("IDBill");
                return IDBill;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return IDBill;
    }

    public static void main(String[] args) {
        BillDAO billd = new BillDAO();
        RegisteredFootballFieldDAO rFFD = new RegisteredFootballFieldDAO();
        List<Bill> list = new ArrayList<>();
        list = billd.getBills();
        // Specify the input date format
        SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        // Specify the desired output date format
        SimpleDateFormat outputDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        // Parse the input date string
        Bill bill = new Bill();
        bill.setInvoice("abcd");
        bill.setPaymentDate("2024-03-11 17:36:00");
        System.out.println(billd.getIDBillLastIndex());

    }

}
