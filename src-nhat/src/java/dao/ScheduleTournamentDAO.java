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
import model.ScheduleTournament;
import model.TotalSchedule;

/**
 *
 * @author nhatk
 */
public class ScheduleTournamentDAO extends DBContext {

    public ScheduleTournament getScheduleTournamentByID(int id) {
        FootballFieldScheduleDAO ffsDAO = new FootballFieldScheduleDAO();
        String sql = " SELECT TOP (1000) [IDStudySchedule]\n"
                + "      ,[IDFootballFieldSchedule]\n"
                + "      ,[Date]\n"
                + "      ,[Status]\n"
                + "  FROM [FBK74].[dbo].[StudySchedule] where IDStudySchedule = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ScheduleTournament sT = new ScheduleTournament();
                sT.setIDScheduleTournament(id);
                sT.setFootballFieldSchedule(ffsDAO.getFootballFieldScheduleByID(rs.getInt("IDFootballFieldSchedule")));
                sT.setDate(rs.getDate("Date"));
                sT.setStatus(rs.getInt("Status"));
                return sT;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insertScheduleTournament(ScheduleTournament sT) {
        String sql = "INSERT INTO [dbo].[ScheduleTournament]\n"
                + "           ([IDFootballFieldSchedule]\n"
                + "           ,[Date]\n"
                + "           ,[IDTeam1]\n"
                + "           ,[IDTeam2]\n"
                + "           ,[IDTournament]\n"
                + "           ,[Description]\n"
                + "           ,[Status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, sT.getFootballFieldSchedule().getIDFootballFieldSchedule());
            st.setDate(2, sT.getDate());
            st.setInt(3, sT.getTeamA().getId());
            st.setInt(4, sT.getTeamB().getId());
            st.setInt(5, sT.getTournament().getId());
            st.setString(6, sT.getDescription());
            st.setInt(7, sT.getStatus());
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteScheduleTournament(int id) {
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

    public void updateResultScheduleTournament(int idST, String result) {
        String sql = "UPDATE [dbo].[ScheduleTournament]\n"
                + "   SET   [Result] = ?\n"
                + " WHERE [IDScheduleTournament] = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, result);
            st.setInt(2, idST);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName());
        }
    }

    public ScheduleTournament getScheduleStounamentFullInfoById(int id) {
        FootballFieldScheduleDAO ffsDAO = new FootballFieldScheduleDAO();
        TeamDAO teamDAO = new TeamDAO();
        TournamentDAO tournamentDAO = new TournamentDAO();
        String sql = "SELECT [IDScheduleTournament]\n"
                + "      ,[IDFootballFieldSchedule]\n"
                + "      ,[Date]\n"
                + "      ,[IDTeam1]\n"
                + "      ,[IDTeam2]\n"
                + "      ,[Result]\n"
                + "      ,[IDTournament]\n"
                + "      ,[Description]\n"
                + "      ,[Status]\n"
                + "  FROM [dbo].[ScheduleTournament] where IDScheduleTournament=?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                ScheduleTournament schedule = new ScheduleTournament();
                schedule.setIDScheduleTournament(rs.getInt("IDScheduleTournament"));
                schedule.setFootballFieldSchedule(ffsDAO.getFootballFieldScheduleByID(rs.getInt("IDFootballFieldSchedule")));
                schedule.setTeamA(teamDAO.getTeamById(rs.getInt("IDTeam1")));
                schedule.setTeamB(teamDAO.getTeamById(rs.getInt("IDTeam2")));
                schedule.setResult(rs.getString("Result"));
                schedule.setTournament(tournamentDAO.findByID(rs.getInt("IDTournament")));
                schedule.setDescription(rs.getString("Description"));
                schedule.setStatus(rs.getInt("Status"));
                return schedule;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<ScheduleTournament> getScheduleTournamentByIDTournament(int idTournament) {
        List<ScheduleTournament> list = new ArrayList<>();
        FootballFieldScheduleDAO ffsDAO = new FootballFieldScheduleDAO();
        TeamDAO teamDAO = new TeamDAO();
        TournamentDAO tournamentDAO = new TournamentDAO();
        String sql = "SELECT [IDScheduleTournament]\n"
                + "      ,[IDFootballFieldSchedule]\n"
                + "      ,[Date]\n"
                + "      ,[IDTeam1]\n"
                + "      ,[IDTeam2]\n"
                + "      ,[Result]\n"
                + "      ,[IDTournament]\n"
                + "      ,[Description]\n"
                + "      ,[Status]\n"
                + "  FROM [dbo].[ScheduleTournament]  where [IDTournament] = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, idTournament);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ScheduleTournament sT = new ScheduleTournament();
                sT.setIDScheduleTournament(rs.getInt("IDScheduleTournament"));
                sT.setFootballFieldSchedule(ffsDAO.getFootballFieldScheduleByID(rs.getInt("IDFootballFieldSchedule")));
                sT.setDate(rs.getDate("Date"));
                sT.setTeamA(teamDAO.getTeamById(rs.getInt("IDTeam1")));
                sT.setTeamB(teamDAO.getTeamById(rs.getInt("IDTeam2")));
                sT.setTournament(tournamentDAO.findByID(idTournament));
                sT.setDescription(rs.getString("Description"));
                sT.setStatus(rs.getInt("Status"));
                list.add(sT);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public static void main(String[] args) {
        ScheduleTournamentDAO sTD = new ScheduleTournamentDAO();
        List<ScheduleTournament> list = sTD.getScheduleTournamentByIDTournament(2);
        for (ScheduleTournament scheduleTournament : list) {
            System.out.println(scheduleTournament.toString());
        }
    }
}
