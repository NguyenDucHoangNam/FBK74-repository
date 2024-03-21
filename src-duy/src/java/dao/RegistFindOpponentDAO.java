/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.FootballField;
import model.RegistFindOpponent;
import model.User;

/**
 *
 * @author nhatk
 */
public class RegistFindOpponentDAO extends DBContext {

    public RegistFindOpponent getRegistFindOpponentByID(int id) {
        String sql = "SELECT [IDRegistFindOppoent]\n"
                + "      ,[IDAccount1]\n"
                + "      ,[IDAccount2]\n"
                + "      ,[Name]\n"
                + "      ,[PhoneNumber]\n"
                + "      ,[TimeStart]\n"
                + "      ,[TimeEnd]\n"
                + "      ,[Date]\n"
                + "      ,[Power]\n"
                + "      ,[TypeOfFootballField]\n"
                + "      ,[Deposit]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[RegistFindOpponent] where IDRegistFindOppoent=?";
        UserDAO userd = new UserDAO();
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int IDRegistFindOppoent = rs.getInt("IDRegistFindOppoent");
                int IDAccount1 = rs.getInt("IDAccount1");
                User Account1 = userd.getUserByIDAccount(IDAccount1);
                int IDAccount2 = rs.getInt("IDAccount2");
                User Account2 = userd.getUserByIDAccount(IDAccount2);
                String Name = rs.getString("Name");
                String PhoneNumber = rs.getString("PhoneNumber");
                Time TimeStart = rs.getTime("TimeStart");
                Time TimeEnd = rs.getTime("TimeEnd");
                String Date = rs.getString("Date");
                String Power = rs.getString("Power");
                int TypeOfFootballField = rs.getInt("TypeOfFootballField");
                int Deposit = rs.getInt("Deposit");
                int Status = rs.getInt("Status");
                RegistFindOpponent rfo = new RegistFindOpponent(IDRegistFindOppoent, Account1, Account2, Name, PhoneNumber, TimeStart, TimeEnd, Date, Power, TypeOfFootballField, Deposit, Status);
                return rfo;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    UserDAO ud = new UserDAO();

    public List<RegistFindOpponent> getAllList() {
        List<RegistFindOpponent> list = new ArrayList<>();
        UserDAO ud = new UserDAO();

        String query = "select * from RegistFindOpponent where status = 2\n"
                + "order by date,TimeStart DESC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new RegistFindOpponent(
                        rs.getInt(1),
                        ud.getUserByIDAccount(rs.getInt(2)),
                        ud.getUserByIDAccount(rs.getInt(3)),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getTime(6),
                        rs.getTime(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getDouble(11),
                        rs.getInt(12)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<RegistFindOpponent> getAllListForApprove() {
        List<RegistFindOpponent> list = new ArrayList<>();
        UserDAO ud = new UserDAO();

        String query = "select * from RegistFindOpponent where status = 1\n"
                + "order by date,TimeStart DESC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new RegistFindOpponent(
                        rs.getInt(1),
                        ud.getUserByIDAccount(rs.getInt(2)),
                        ud.getUserByIDAccount(rs.getInt(3)),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getTime(6),
                        rs.getTime(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getDouble(11),
                        rs.getInt(12)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<RegistFindOpponent> suggestOpponent(String date, String timeStart, int typeFootballField) {
        List<RegistFindOpponent> list = new ArrayList<>();
        UserDAO ud = new UserDAO();

        String query = "select * from RegistFindOpponent where status = 1 and Date=? and TimeStart = ? and TypeOfFootballField= ?\n"
                + "order by date,TimeStart DESC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, date);
            ps.setString(2, timeStart);
            ps.setInt(3, typeFootballField);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new RegistFindOpponent(
                        rs.getInt(1),
                        ud.getUserByIDAccount(rs.getInt(2)),
                        ud.getUserByIDAccount(rs.getInt(3)),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getTime(6),
                        rs.getTime(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getDouble(11),
                        rs.getInt(12)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<RegistFindOpponent> historyfindopponent() {
        List<RegistFindOpponent> list = new ArrayList<>();
        String query = "select * from RegistFindOpponent where id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new RegistFindOpponent(
                        rs.getInt(1),
                        ud.getUserByIDAccount(rs.getInt(2)),
                        ud.getUserByIDAccount(rs.getInt(3)),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getTime(6),
                        rs.getTime(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getDouble(11),
                        rs.getInt(12)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void insert(int idAccount1, String name, String phone, Time timeStart, Time timeEnd, String date, String power, int typeFootballField) throws ClassNotFoundException {
        String query = "insert into RegistFindOpponent\n"
                + "  values (?,null,?,?,?,?,?,?,?,'100.000',1)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, idAccount1);
            ps.setNString(2, name);
            ps.setString(3, phone);
            ps.setTime(4, timeStart);
            ps.setTime(5, timeEnd);
            ps.setString(6, date);
            ps.setNString(7, power);
            ps.setInt(8, typeFootballField);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
//    

    public boolean checkID(int idRFO) throws ClassNotFoundException {
        String query = "select * from RegistFindOpponent\n"
                + "where IDRegistFindOppoent =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, idRFO);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
        }
        return false;
    }

    public List<RegistFindOpponent> checkidRFOExist(int idAccount1) {
        List<RegistFindOpponent> list = new ArrayList<>();
        String query = "select * from RegistFindOpponent\n"
                + "where IDAccount1 =?\n"
                + "order by status  ASC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, idAccount1);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new RegistFindOpponent(
                        rs.getInt(1),
                        ud.getUserByIDAccount(rs.getInt(2)),
                        ud.getUserByIDAccount(rs.getInt(3)),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getTime(6),
                        rs.getTime(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getDouble(11),
                        rs.getInt(12)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public void delete(int idRFO) {
        String query = "DELETE FROM [dbo].[RegistFindOpponent]\n"
                + "      WHERE IDRegistFindOppoent= ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, idRFO);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void deleteRegistFindOpponent(int idRFO) throws ClassNotFoundException {
        String query = "update RegistFindOpponent\n"
                + "  set status = 2\n"
                + "where IDRegistFindOppoent = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, idRFO);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void update(String name, String phone, String timeStart, String timeEnd, String date, String power, int typeFootballField, int idRFO) throws ClassNotFoundException {
        String query = "  update RegistFindOpponent \n"
                + "  set Name=?, PhoneNumber=?,TimeStart=?,TimeEnd=?, Date=?,Power=?,TypeOfFootballField=?\n"
                + "  where IDRegistFindOppoent= ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, timeStart);
            ps.setString(4, timeEnd);
            ps.setString(5, date);
            ps.setString(6, power);
            ps.setInt(7, typeFootballField);
            ps.setInt(8, idRFO);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void approveMember(int idRFO) throws ClassNotFoundException {
        String sql = "update RegistFindOpponent\n"
                + "  set status = 2\n"
                + "where IDRegistFindOppoent = ?";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, idRFO);
            ResultSet resultSet = preparedStatement.executeQuery();
        } catch (SQLException e) {
        }
    }

    public void cancelMemberAndNoRefund(int idRFO) throws ClassNotFoundException {
        String sql = "update RegistFindOpponent\n"
                + "  set status = 6\n"
                + "where IDRegistFindOppoent = ?";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, idRFO);
            ResultSet resultSet = preparedStatement.executeQuery();
        } catch (SQLException e) {
        }
    }

    public void cancelMemberAndWaitRefund(int idRFO) throws ClassNotFoundException {
        String sql = "update RegistFindOpponent\n"
                + "  set status = 4\n"
                + "where IDRegistFindOppoent = ?";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, idRFO);
            ResultSet resultSet = preparedStatement.executeQuery();
        } catch (SQLException e) {
        }
    }

    public List<RegistFindOpponent> getListByIdRFO(int idRFO) {
        List<RegistFindOpponent> list = new ArrayList<>();
        String query = "  select *\n"
                + "  from RegistFindOpponent\n"
                + "  where IDRegistFindOppoent = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, idRFO);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new RegistFindOpponent(
                        rs.getInt(1),
                        ud.getUserByIDAccount(rs.getInt(2)),
                        ud.getUserByIDAccount(rs.getInt(3)),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getTime(6),
                        rs.getTime(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getDouble(11),
                        rs.getInt(12)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        RegistFindOpponentDAO dao = new RegistFindOpponentDAO();
        try {
            dao.approveMember(5);
//        RegistFindOpponent list = dao.getRegistFindOpponentByID(1);
//        System.out.println(list);
//        try {
//            dao.insert(1, "Bảo", "0777530341", "7:30", "8:30", "9/2/2024", "Sinh vien ă ư", 5);
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(RegistFindOpponentDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }

//-- history
//        List<RegistFindOpponent> list = dao.checkidRFOExist(1);
//        for (RegistFindOpponent o : list) {
//            System.out.println(o);
//        }
//-- check ID
//        boolean check;
//        check = dao.checkID(1);
//        System.out.println(check);
//        
//-- insert RFO
//          dao.checkidRFOExist(1);
//-- list 
//        List<RegistFindOpponent> list = dao.getAllList();
//        for (RegistFindOpponent o : list) {
//            System.out.println(o);
//        }
//--suggest
//List<RegistFindOpponent> list=dao.suggestOpponent("2024-09-02","07:30",5);
//for(RegistFindOpponent o : list){
//        System.out.println(o);
//       }
//-- delete
//dao.deleteRegistFindOpponent(30);
//-- delete information find oppnent of register
//dao.deleteRegistFindOpponent(1);
//--update
//dao.update("DuyNgo", "0777530341", "7:30", "8:30", "9/2/2024", "Sinh vien giao luu", 5, 24);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegistFindOpponentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
