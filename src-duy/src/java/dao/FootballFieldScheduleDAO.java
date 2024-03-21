/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.FootballField;
import model.FootballFieldSchedule;

/**
 *
 * @author nhatk
 */
public class FootballFieldScheduleDAO extends DBContext {

    public List<FootballFieldSchedule> getFootballFieldScheduleByStartTimeAndStatus0AndStatusFF0(Time StartTime) {
        List<FootballFieldSchedule> list = new ArrayList<>();
        String sql = "SELECT \n"
                + "    [FFS].[IDFootballFieldSchedule],\n"
                + "    [FFS].[StartTime],\n"
                + "    [FFS].[Endtime],\n"
                + "    [FFS].[IDFootballField],\n"
                + "    [FFS].[Status]\n"
                + "FROM \n"
                + "    [FBK74].[dbo].[FootballFieldSchedule] AS [FFS]\n"
                + "JOIN \n"
                + "    [FBK74].[dbo].[FootballField] AS [FF]\n"
                + "ON \n"
                + "    [FFS].[IDFootballField] = [FF].[IDFootballField]"
                + " WHERE CONVERT(time, FFS.[StartTime]) = CONVERT(time, ?) AND ([FFS].[Status] = 0 OR [FFS].[Status] IS NULL)\n"
                + "    AND ([FF].[Status] = 0 OR [FF].[Status] IS NULL);";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setTime(1, StartTime);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int IDFootballFieldSchedule = rs.getInt("IDFootballFieldSchedule");
                Time startTime = rs.getTime("StartTime");
                Time Endtime = rs.getTime("Endtime");
                int IDFootballField = rs.getInt("IDFootballField");
                FootballFieldDAO ffd = new FootballFieldDAO();
                FootballField ff = ffd.getFootballFieldByID(IDFootballField);
                int Status = rs.getInt("Status");
                FootballFieldSchedule ffs = new FootballFieldSchedule(IDFootballFieldSchedule, startTime, Endtime, ff, Status);
                list.add(ffs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<FootballFieldSchedule> getFootballFieldScheduleByIDFootballField(int id) {
        List<FootballFieldSchedule> list = new ArrayList<>();
        String sql = "SELECT [IDFootballFieldSchedule]\n"
                + "      ,[StartTime]\n"
                + "      ,[Endtime]\n"
                + "      ,[IDFootballField]\n"
                + ",[Status]"
                + "  FROM [dbo].[FootballFieldSchedule] WHERE IDFootballField=?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int IDFootballFieldSchedule = rs.getInt("IDFootballFieldSchedule");
                Time startTime = rs.getTime("StartTime");
                Time Endtime = rs.getTime("Endtime");
                int IDFootballField = rs.getInt("IDFootballField");
                FootballFieldDAO ffd = new FootballFieldDAO();
                FootballField ff = ffd.getFootballFieldByID(IDFootballField);
                int Status = rs.getInt("Status");
                FootballFieldSchedule ffs = new FootballFieldSchedule(IDFootballFieldSchedule, startTime, Endtime, ff, Status);
                list.add(ffs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<FootballFieldSchedule> getFootballFieldScheduleByIDFootballFieldWithStatus(int id) {
        List<FootballFieldSchedule> list = new ArrayList<>();
        String sql = "SELECT [IDFootballFieldSchedule]\n"
                + "      ,[StartTime]\n"
                + "      ,[Endtime]\n"
                + "      ,[IDFootballField]\n"
                + ",[Status]"
                + "  FROM [dbo].[FootballFieldSchedule] WHERE IDFootballField=? and (status is NULL or status = 0)";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int IDFootballFieldSchedule = rs.getInt("IDFootballFieldSchedule");
                Time startTime = rs.getTime("StartTime");
                Time Endtime = rs.getTime("Endtime");
                int IDFootballField = rs.getInt("IDFootballField");
                FootballFieldDAO ffd = new FootballFieldDAO();
                FootballField ff = ffd.getFootballFieldByID(IDFootballField);
                int Status = rs.getInt("Status");
                FootballFieldSchedule ffs = new FootballFieldSchedule(IDFootballFieldSchedule, startTime, Endtime, ff, Status);
                list.add(ffs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<FootballFieldSchedule> getFootballFieldScheduleByIDFootballFieldWithStatus1(int id) {
        List<FootballFieldSchedule> list = new ArrayList<>();
        String sql = "SELECT [IDFootballFieldSchedule]\n"
                + "      ,[StartTime]\n"
                + "      ,[Endtime]\n"
                + "      ,[IDFootballField]\n"
                + ",[Status]"
                + "  FROM [dbo].[FootballFieldSchedule] WHERE IDFootballField=? and (status = 1)";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int IDFootballFieldSchedule = rs.getInt("IDFootballFieldSchedule");
                Time startTime = rs.getTime("StartTime");
                Time Endtime = rs.getTime("Endtime");
                int IDFootballField = rs.getInt("IDFootballField");
                FootballFieldDAO ffd = new FootballFieldDAO();
                FootballField ff = ffd.getFootballFieldByID(IDFootballField);
                int Status = rs.getInt("Status");
                FootballFieldSchedule ffs = new FootballFieldSchedule(IDFootballFieldSchedule, startTime, Endtime, ff, Status);
                list.add(ffs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public FootballFieldSchedule getFootballFieldScheduleByID(int id) {
        FootballFieldDAO ffd = new FootballFieldDAO();
        String sql = "SELECT [IDFootballFieldSchedule]\n"
                + "      ,[StartTime]\n"
                + "      ,[Endtime]\n"
                + "      ,[IDFootballField]\n"
                + ",[Status]"
                + "  FROM [dbo].[FootballFieldSchedule] WHERE IDFootballFieldSchedule = ?";
        UserDAO userd = new UserDAO();
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int IDFootballFieldSchedule = rs.getInt("IDFootballFieldSchedule");
                Time StartTime = rs.getTime("StartTime");
                Time Endtime = rs.getTime("Endtime");
                int IDFootballField = rs.getInt("IDFootballField");
                FootballField ff = ffd.getFootballFieldByID(IDFootballField);
                int Status = rs.getInt("Status");
                FootballFieldSchedule ffs = new FootballFieldSchedule(IDFootballFieldSchedule, StartTime, Endtime, ff, Status);
                return ffs;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    //Xử lý xóa các time khong được chọn = set status =1
    public void changeStatusWithIDFootballFieldSchedule(int status, int id) {
        String sql = "UPDATE [dbo].[FootballFieldSchedule]\n"
                + "   SET [Status] = ?\n"
                + " WHERE IDFootballFieldSchedule = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, status);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void changeStatusWithIDFootballField(int status, int id) {
        String sql = "UPDATE [dbo].[FootballFieldSchedule]\n"
                + "   SET \n"
                + "      [Status] = ?\n"
                + " WHERE [IDFootballField] = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, status);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertFootballFieldSchedule(String startTime, String endTime, int idff, int status) {
        String sql = "INSERT INTO [dbo].[FootballFieldSchedule]\n"
                + "           ([StartTime]\n"
                + "           ,[Endtime]\n"
                + "           ,[IDFootballField]\n"
                + "           ,[Status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, startTime);
            st.setString(2, endTime);
            st.setInt(3, idff);
            st.setInt(4, status);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        FootballFieldScheduleDAO ffDao = new FootballFieldScheduleDAO();
        List<FootballFieldSchedule> list = new ArrayList<>();
        Time sqlTime = Time.valueOf("9:30:00");

//        for (FootballFieldSchedule footballFieldSchedule : list) {
//            System.out.println(footballFieldSchedule.getStartTime());
//        }
    }

}
