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
                + "           ,[IDRegisteredFootballField]\n ,[PaymentDate])"
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
                Bill bill = new Bill(IDBill, Invoice, rFFD.getRegisteredFootballFielByID(IDRegisteredFootballField),
                        rFOD.getRegistFindOpponentByID(IDRegistFindOppoent), userD.getUserByIDAccount(IDAccount2), null, null, PaymentDate);
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
                Bill bill = new Bill(IDBill, Invoice, rFFD.getRegisteredFootballFielByID(IDRegisteredFootballField),
                        rFOD.getRegistFindOpponentByID(IDRegistFindOppoent), userD.getUserByIDAccount(IDAccount2), null, null, PaymentDate);
                return bill;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void main(String[] args) {
        BillDAO billd = new BillDAO();
        RegisteredFootballFieldDAO rFFD = new RegisteredFootballFieldDAO();
        List<Bill> list = new ArrayList<>();
        list = billd.getBills();
//        for (Bill bill : list) {
//            System.out.println(bill.getPaymentDate());
//        }
        // Specify the input date format
        SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        // Specify the desired output date format
        SimpleDateFormat outputDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        // Parse the input date string
        try {
            Date date = inputDateFormat.parse("20240227050601");
            // Format the date to the desired output format
            String formattedDate = outputDateFormat.format(date);
//            Bill billT = new Bill("4000000", rFFD.getRegisteredFootballFielByID(74), null, null, null, null, formattedDate);
            Bill billT = new Bill();
            billT.setInvoice("40000000");
            billT.setRegisteredFootballField(rFFD.getRegisteredFootballFielByID(41));
            billT.setPaymentDate(formattedDate);
            billd.insertBillWithRegisteredFootballField(billT);
            
        } catch (Exception e) {

        }
    }

}
