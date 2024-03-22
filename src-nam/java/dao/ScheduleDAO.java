/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Schedule;

/**
 *
 * @author DELL
 */
public class ScheduleDAO extends DBContext {

    public List<Schedule> getAll(int id) {
        List<Schedule> list = new ArrayList<>();
        String sql = "SELECT [IDScheduleTournament]\n"
                + "      ,f.Name\n"
                + "      ,[Date]\n"
                + "      ,t.TeamName\n"
                + "      ,ta.TeamName\n"
                + "      ,[Result]\n"
                + "      ,s.[Description]\n"
                + "  FROM [dbo].[ScheduleTournament] s join FootballField f on s.IDFootballFieldSchedule = f.IDFootballField \n"
                + "  join Team t on s.IDTeam1 = t.IDTeam join Team ta on s.IDTeam2 = ta.IDTeam where s.TournamentID = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Schedule schedule = new Schedule();
                schedule.setId(rs.getInt(1));
                schedule.setFieldName(rs.getString(2));
                schedule.setDate(rs.getTimestamp(3).toLocalDateTime());
                schedule.setTeamA(rs.getString(4));
                schedule.setTeamB(rs.getString(5));
                schedule.setResult(rs.getString(6));
                schedule.setDetail(rs.getString(7));
                list.add(schedule);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void insertSchedule(Schedule s, int idTournament) {
        String sql = "INSERT INTO [dbo].[ScheduleTournament]\n"
                + "           ([TournamentID]\n"
                + "           ,[IDFootballFieldSchedule]\n"
                + "           ,[Date]\n"
                + "           ,[IDTeam1]\n"
                + "           ,[IDTeam2]\n"
                + "           ,[Result]\n"
                + "           ,[Description])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, idTournament);
            st.setInt(2, Integer.parseInt(s.getFieldName()));
            st.setTimestamp(3, java.sql.Timestamp.valueOf(s.getDate()));
            st.setInt(4, Integer.parseInt(s.getTeamA()));
            st.setInt(5, Integer.parseInt(s.getTeamB()));
            st.setString(6, s.getResult());
            st.setString(7, s.getDetail());
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public  void updateSchedule(Schedule s) {
        String sql = "UPDATE [dbo].[ScheduleTournament]\n"
                + "   SET [IDFootballFieldSchedule] = ?\n"
                + "      ,[Date] = ?\n"
                + "      ,[IDTeam1] = ?\n"
                + "      ,[IDTeam2] = ?\n"
                + "      ,[Result] = ?\n"
                + "      ,[Description] = ?\n"
                + " WHERE [IDScheduleTournament] = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, Integer.parseInt(s.getFieldName()));
            st.setTimestamp(2, java.sql.Timestamp.valueOf(s.getDate()));
            st.setInt(3, Integer.parseInt(s.getTeamA()));
            st.setInt(4, Integer.parseInt(s.getTeamB()));
            st.setString(5, s.getResult());
            st.setString(6, s.getDetail());
            st.setInt(7, s.getId());
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName());
        }
    }

    public void deleteSchedule(int id){
        String sql = "DELETE FROM [dbo].[ScheduleTournament]\n"
                + "      WHERE [IDScheduleTournament] = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName());
        }
    }

    public Schedule getById(int id) {
        String sql = "SELECT [IDScheduleTournament]\n" +
                "      ,[IDFootballFieldSchedule]\n" +
                "      ,[Date]\n" +
                "      ,[IDTeam1]\n" +
                "      ,[IDTeam2]\n" +
                "      ,[Result]\n" +
                "      ,[TournamentID]\n" +
                "      ,[Description]\n" +
                "  FROM [dbo].[ScheduleTournament] WHERE [IDScheduleTournament] = ? \n";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);

            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Schedule schedule = new Schedule();
                schedule.setId(rs.getInt("IDScheduleTournament"));
                schedule.setFieldName(rs.getString("IDFootballFieldSchedule"));
                schedule.setDate(rs.getTimestamp("Date").toLocalDateTime());
                schedule.setTeamA(rs.getString("IDTeam1"));
                schedule.setTeamB(rs.getString("IDTeam2"));
                schedule.setResult(rs.getString("Result"));
                schedule.setDetail(rs.getString("Description"));
                return schedule;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
