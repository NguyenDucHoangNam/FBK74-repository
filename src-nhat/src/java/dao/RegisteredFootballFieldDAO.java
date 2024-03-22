/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.FootballFieldSchedule;
import model.RegistFindOpponent;
import model.RegisteredFootballField;
import model.User;

/**
 *
 * @author nhatk
 */
public class RegisteredFootballFieldDAO extends DBContext {

    public List<RegisteredFootballField> getRegisteredFootballFielWithStatus(int status) {
        List<RegisteredFootballField> list = new ArrayList<>();
        UserDAO userd = new UserDAO();
        RegistFindOpponentDAO rfod = new RegistFindOpponentDAO();
        FootballFieldScheduleDAO ffsd = new FootballFieldScheduleDAO();
        String sql = "SELECT [IDRegisteredFootballField]\n"
                + "      ,[IDAccount1]\n"
                + "      ,[IDAccount2]\n"
                + "      ,[IDRegistFindOppoent]\n"
                + "      ,[IDFootballFieldSchedule]\n"
                + "      ,[Date]\n"
                + "      ,[Name]\n"
                + "      ,[PhoneNumber]\n"
                + "      ,[Deposit]\n"
                + "      ,[Status]\n"
                + "      ,[Note]"
                + "  FROM [dbo].[RegisteredFootballField] where Status = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, status);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int IDRegisteredFootballField = rs.getInt("IDRegisteredFootballField");
                int IDAccount1 = rs.getInt("IDAccount1");
                User Account1 = userd.getUserByIDAccount(IDAccount1);
                int IDAccount2 = rs.getInt("IDAccount2");
                User Account2 = userd.getUserByIDAccount(IDAccount2);
                int IDRegistFindOppoent = rs.getInt("IDRegistFindOppoent");
                RegistFindOpponent rFO = rfod.getRegistFindOpponentByID(IDRegistFindOppoent);
                int IDFootballFieldSchedule = rs.getInt("IDFootballFieldSchedule");
                FootballFieldSchedule fFS = ffsd.getFootballFieldScheduleByID(IDFootballFieldSchedule);
                Date Date = rs.getDate("Date");
                String Name = rs.getString("Name");
                String PhoneNumber = rs.getString("PhoneNumber");
                int Deposit = rs.getInt("Deposit");
                int Status = rs.getInt("Status");
                String Note = rs.getString("Note");
                RegisteredFootballField rFF = new RegisteredFootballField(IDRegisteredFootballField, Account1, Account2, rFO, fFS, Date, Name, PhoneNumber, Deposit, Status, Note);
                list.add(rFF);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<RegisteredFootballField> getRegisteredFootballFielWithStatusAndDate(int status, String date1) {
        List<RegisteredFootballField> list = new ArrayList<>();
        UserDAO userd = new UserDAO();
        RegistFindOpponentDAO rfod = new RegistFindOpponentDAO();
        FootballFieldScheduleDAO ffsd = new FootballFieldScheduleDAO();
        String sql = "SELECT [IDRegisteredFootballField]\n"
                + "      ,[IDAccount1]\n"
                + "      ,[IDAccount2]\n"
                + "      ,[IDRegistFindOppoent]\n"
                + "      ,[IDFootballFieldSchedule]\n"
                + "      ,[Date]\n"
                + "      ,[Name]\n"
                + "      ,[PhoneNumber]\n"
                + "      ,[Deposit]\n"
                + "      ,[Status]\n"
                + "      ,[Note]"
                + "  FROM [dbo].[RegisteredFootballField] where Status = ? and Date = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, status);
            st.setString(2, date1);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int IDRegisteredFootballField = rs.getInt("IDRegisteredFootballField");
                int IDAccount1 = rs.getInt("IDAccount1");
                User Account1 = userd.getUserByIDAccount(IDAccount1);
                int IDAccount2 = rs.getInt("IDAccount2");
                User Account2 = userd.getUserByIDAccount(IDAccount2);
                int IDRegistFindOppoent = rs.getInt("IDRegistFindOppoent");
                RegistFindOpponent rFO = rfod.getRegistFindOpponentByID(IDRegistFindOppoent);
                int IDFootballFieldSchedule = rs.getInt("IDFootballFieldSchedule");
                FootballFieldSchedule fFS = ffsd.getFootballFieldScheduleByID(IDFootballFieldSchedule);
                Date Date = rs.getDate("Date");
                String Name = rs.getString("Name");
                String PhoneNumber = rs.getString("PhoneNumber");
                int Deposit = rs.getInt("Deposit");
                int Status = rs.getInt("Status");
                String Note = rs.getString("Note");
                RegisteredFootballField rFF = new RegisteredFootballField(IDRegisteredFootballField, Account1, Account2, rFO, fFS, Date, Name, PhoneNumber, Deposit, Status, Note);
                list.add(rFF);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public boolean checkRegisteredFFID(int id) {
        String sql = "SELECT [IDRegisteredFootballField]\n"
                + "  FROM [dbo].[RegisteredFootballField] where IDRegisteredFootballField=?";
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

    public void insertRFF(RegisteredFootballField rff) {
        String sql = "INSERT INTO [dbo].[RegisteredFootballField]\n"
                + "           ([IDAccount1]\n"
                + "           ,[IDFootballFieldSchedule]\n"
                + "           ,[Date]\n"
                + "           ,[Name]\n"
                + "           ,[PhoneNumber]\n"
                + "           ,[Deposit]\n"
                + "           ,[Status]\n"
                + "           ,[Note])\n"
                + "     VALUES"
                + "           (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, rff.getAccount1().getIDAccount());
            st.setInt(2, rff.getFootballFieldSchedule().getIDFootballFieldSchedule());
            st.setDate(3, rff.getDate());
            st.setString(4, rff.getName());
            st.setString(5, rff.getPhoneNumber());
            st.setInt(6, rff.getDeposit());
            st.setInt(7, rff.getStatus());
            st.setString(8, rff.getNote());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertRFFWithRegistFindOpponent(RegisteredFootballField rff) {
        String sql = "INSERT INTO [dbo].[RegisteredFootballField]\n"
                + "           ([IDAccount1]\n"
                + "           ,[IDFootballFieldSchedule]\n"
                + "           ,[Date]\n"
                + "           ,[Name]\n"
                + "           ,[PhoneNumber]\n"
                + "           ,[Deposit]\n"
                + "           ,[Status]\n"
                + "           ,[Note]\n"
                + "           ,[IDRegistFindOppoent])\n"
                + "     VALUES"
                + "           (?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, rff.getAccount1().getIDAccount());
            st.setInt(2, rff.getFootballFieldSchedule().getIDFootballFieldSchedule());
            st.setDate(3, rff.getDate());
            st.setString(4, rff.getName());
            st.setString(5, rff.getPhoneNumber());
            st.setInt(6, rff.getDeposit());
            st.setInt(7, rff.getStatus());
            st.setString(8, rff.getNote());
            st.setInt(9, rff.getRegistFindOppoent().getIdRFO());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteByIDRegisteredFootballField(int IDrff) {
        String sql = "DELETE FROM [dbo].[RegisteredFootballField]\n"
                + "      WHERE IDRegisteredFootballField = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, IDrff);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void changeStatusWithIDRegisteredFootballField(int status, int id) {
        String sql = "UPDATE [dbo].[RegisteredFootballField]\n"
                + "   SET \n"
                + "      [Status] = ?"
                + "\n"
                + " WHERE IDRegisteredFootballField = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, status);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateRegisteredFootballField(String name, String phone, String note, int id) {
        String sql = "UPDATE [dbo].[RegisteredFootballField]\n"
                + "   SET \n"
                + "      [Name] = ?\n"
                + "      ,[PhoneNumber] = ?\n"
                + "      ,[Note] = ?\n"
                + " WHERE IDRegisteredFootballField = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);

            // Sử dụng setNString để đảm bảo sử dụng kiểu dữ liệu nvarchar
            st.setNString(1, name);
            st.setString(2, phone);
            st.setNString(3, note);
            st.setInt(4, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<RegisteredFootballField> getRegisteredFootballFielByIDAccount1(int id) {
        List<RegisteredFootballField> list = new ArrayList<>();
        UserDAO userd = new UserDAO();
        RegistFindOpponentDAO rfod = new RegistFindOpponentDAO();
        FootballFieldScheduleDAO ffsd = new FootballFieldScheduleDAO();
        String sql = "SELECT [IDRegisteredFootballField]\n"
                + "      ,[IDAccount1]\n"
                + "      ,[IDAccount2]\n"
                + "      ,[IDRegistFindOppoent]\n"
                + "      ,[IDFootballFieldSchedule]\n"
                + "      ,[Date]\n"
                + "      ,[Name]\n"
                + "      ,[PhoneNumber]\n"
                + "      ,[Deposit]\n"
                + "      ,[Status]\n"
                + "      ,[Note]"
                + "  FROM [dbo].[RegisteredFootballField] where IDAccount1 = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int IDRegisteredFootballField = rs.getInt("IDRegisteredFootballField");
                int IDAccount1 = rs.getInt("IDAccount1");
                User Account1 = userd.getUserByIDAccount(IDAccount1);
                int IDAccount2 = rs.getInt("IDAccount2");
                User Account2 = userd.getUserByIDAccount(IDAccount2);
                int IDRegistFindOppoent = rs.getInt("IDRegistFindOppoent");
                RegistFindOpponent rFO = rfod.getRegistFindOpponentByID(IDRegistFindOppoent);
                int IDFootballFieldSchedule = rs.getInt("IDFootballFieldSchedule");
                FootballFieldSchedule fFS = ffsd.getFootballFieldScheduleByID(IDFootballFieldSchedule);
                Date Date = rs.getDate("Date");
                String Name = rs.getString("Name");
                String PhoneNumber = rs.getString("PhoneNumber");
                int Deposit = rs.getInt("Deposit");
                int Status = rs.getInt("Status");
                String Note = rs.getString("Note");
                RegisteredFootballField rFF = new RegisteredFootballField(IDRegisteredFootballField, Account1, Account2, rFO, fFS, Date, Name, PhoneNumber, Deposit, Status, Note);
                list.add(rFF);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public RegisteredFootballField getRegisteredFootballFielByID(int id) {
        UserDAO userd = new UserDAO();
        RegistFindOpponentDAO rfod = new RegistFindOpponentDAO();
        FootballFieldScheduleDAO ffsd = new FootballFieldScheduleDAO();
        String sql = "SELECT [IDRegisteredFootballField]\n"
                + "      ,[IDAccount1]\n"
                + "      ,[IDAccount2]\n"
                + "      ,[IDRegistFindOppoent]\n"
                + "      ,[IDFootballFieldSchedule]\n"
                + "      ,[Date]\n"
                + "      ,[Name]\n"
                + "      ,[PhoneNumber]\n"
                + "      ,[Deposit]\n"
                + "      ,[Status]\n"
                + "      ,[Note]"
                + "  FROM [dbo].[RegisteredFootballField] where IDRegisteredFootballField = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int IDRegisteredFootballField = rs.getInt("IDRegisteredFootballField");
                int IDAccount1 = rs.getInt("IDAccount1");
                User Account1 = userd.getUserByIDAccount(IDAccount1);
                int IDAccount2 = rs.getInt("IDAccount2");
                User Account2 = userd.getUserByIDAccount(IDAccount2);
                int IDRegistFindOppoent = rs.getInt("IDRegistFindOppoent");
                RegistFindOpponent rFO = rfod.getRegistFindOpponentByID(IDRegistFindOppoent);
                int IDFootballFieldSchedule = rs.getInt("IDFootballFieldSchedule");
                FootballFieldSchedule fFS = ffsd.getFootballFieldScheduleByID(IDFootballFieldSchedule);
                Date Date = rs.getDate("Date");
                String Name = rs.getString("Name");
                String PhoneNumber = rs.getString("PhoneNumber");
                int Deposit = rs.getInt("Deposit");
                int Status = rs.getInt("Status");
                String Note = rs.getString("Note");
                RegisteredFootballField rFF = new RegisteredFootballField(IDRegisteredFootballField, Account1, Account2, rFO, fFS, Date, Name, PhoneNumber, Deposit, Status, Note);
                return rFF;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int getRegisteredFootballFieldWithLastIndex() {
        int id = -1;
        String sql = "SELECT TOP 1 IDRegisteredFootballField\n"
                + "FROM [dbo].[RegisteredFootballField]\n"
                + "ORDER BY IDRegisteredFootballField DESC;";

        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                id = rs.getInt("IDRegisteredFootballField");
                return id;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public static void main(String[] args) {
        RegisteredFootballFieldDAO rFFD = new RegisteredFootballFieldDAO();
        List<RegisteredFootballField> list = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        String test = "18/02/2024";
        String[] dateSplit = test.split("/");
        String currentDateChange = dateSplit[2] + dateSplit[1] + dateSplit[0];

        List<RegisteredFootballField> listRFF = new ArrayList<>();
        listRFF = rFFD.getRegisteredFootballFielWithStatusAndDate(4, "2024-02-24");
//        for (RegisteredFootballField integer : listRFF) {
//            System.out.println(integer);
//        }
System.out.println(rFFD.getRegisteredFootballFieldWithLastIndex());
        
    }

}
