/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Tournament;

/**
 *
 * @author DELL
 */
public class TournamentDAO extends DBContext {

    public List<Tournament> getAll() {
        List<Tournament> list = new ArrayList<>();
        String sql = " SELECT [IDTournament]\n" +
                "      ,[TimeRegist]\n" +
                "      ,[TimeCloseRegist]\n" +
                "      ,[TimeStart]\n" +
                "      ,[NumberTeamRegist]\n" +
                "      ,[Information]\n" +
                "      ,[Image]\n" +
                "      ,[Name]\n" +
                "      ,[Award]\n" +
                "      ,[TimeEnd]\n" +
                "  FROM [dbo].[Tournament]\n  WHERE [Status] = 1";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Tournament tournament = new Tournament();
                tournament.setId(rs.getInt("IDTournament"));
                tournament.setTimeRegister(rs.getDate("TimeRegist"));
                tournament.setTimeCloseRegister(rs.getDate("TimeCloseRegist"));
                tournament.setStart(rs.getDate("TimeStart"));
                tournament.setNumberTeamRegister(rs.getInt("NumberTeamRegist"));
                tournament.setInformation(rs.getString("Information"));
                tournament.setImage(rs.getString("Image"));
                tournament.setName(rs.getString("Name"));
                tournament.setAward(rs.getDouble("Award"));
                tournament.setEnd(rs.getDate("TimeEnd"));

                list.add(tournament);
            }
            return list;

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Tournament findByID(int id) {
        String sql = "SELECT [IDTournament]\n"
                + "      ,[TimeRegist]\n"
                + "      ,[TimeCloseRegist]\n"
                + "      ,[TimeStart]\n"
                + "      ,[NumberTeamRegist]\n"
                + "      ,[Information]\n"
                + "      ,[Image]\n"
                + "      ,[Name]\n"
                + "      ,[Award]\n"
                + "      ,[TimeEnd]\n"
                + "  FROM [dbo].[Tournament] where [IDTournament] = ? AND [Status] = 1";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Tournament tournament = new Tournament();
                tournament.setId(rs.getInt(1));
                tournament.setTimeRegister(rs.getDate(2));
                tournament.setTimeCloseRegister(rs.getDate(3));
                tournament.setStart(rs.getDate(4));
                tournament.setNumberTeamRegister(rs.getInt(5));
                tournament.setInformation(rs.getString(6));
                tournament.setImage(rs.getString(7));
                tournament.setName(rs.getString(8));
                tournament.setAward(rs.getDouble(9));
                tournament.setEnd(rs.getDate(10));
                return tournament;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Tournament findBetweenStartDateRegistAndEndDateRegis(int IDTeam, Date timeRegister, Date timeCloseRegister) {
        String sql = "  SELECT tour.[IDTournament]\n" +
                "            ,[TimeRegist]\n" +
                "         ,[TimeCloseRegist]\n" +
                "               ,[TimeStart]\n" +
                "                ,[NumberTeamRegist]\n" +
                "             ,[Information]\n" +
                "          ,[Image]\n" +
                "                ,[Name]\n" +
                "               ,[Award]\n" +
                "        ,[TimeEnd]\n" +
                "                FROM Tournament tour\n" +
                "\t\t\t\tJOIN Team t ON tour.IDTournament = t.IDTournament\n" +
                "\t\t\t\tWHERE GETDATE() between ? and ? and t.IDTeam = ? and tour.Status = 1;";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setDate(1, (java.sql.Date) timeRegister);
            st.setDate(2, (java.sql.Date) timeCloseRegister);
            st.setInt(3, IDTeam);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Tournament tournament = new Tournament();
                tournament.setId(rs.getInt(1));
                tournament.setTimeRegister(rs.getDate(2));
                tournament.setTimeCloseRegister(rs.getDate(3));
                tournament.setStart(rs.getDate(4));
                tournament.setNumberTeamRegister(rs.getInt(5));
                tournament.setInformation(rs.getString(6));
                tournament.setImage(rs.getString(7));
                tournament.setName(rs.getString(8));
                tournament.setAward(rs.getDouble(9));
                tournament.setEnd(rs.getDate(10));
                return tournament;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insert(Tournament tournament) {
        String sql = "INSERT INTO [dbo].[Tournament]\n"
                + "           ([TimeRegist]\n"
                + "           ,[TimeCloseRegist]\n"
                + "           ,[TimeStart]\n"
                + "           ,[NumberTeamRegist]\n"
                + "           ,[Information]\n"
                + "           ,[Image]\n"
                + "           ,[Name]\n"
                + "           ,[Award]\n"
                + "           ,[TimeEnd]\n"
                + "           ,[Status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?,1)";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setDate(1, (java.sql.Date) tournament.getTimeRegister());
            st.setDate(2, (java.sql.Date) tournament.getTimeCloseRegister());
            st.setDate(3, (java.sql.Date) tournament.getStart());
            st.setInt(4, tournament.getNumberTeamRegister());
            st.setString(5, tournament.getInformation());
            st.setString(6, tournament.getImage());
            st.setString(7, tournament.getName());
            st.setDouble(8, tournament.getAward());
            st.setDate(9, (java.sql.Date) tournament.getEnd());
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertAdmin(Tournament tournament) {
        String sql = "INSERT INTO [dbo].[Tournament]\n "

                + "           ([Image] \n"
                + "           ,[Name] \n"
                + "           ,[Status])\n"

                + "     VALUES \n"
                + "      (?,?,1) ";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);

            st.setString(1, tournament.getImage());
            st.setString(2, tournament.getName());

            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateAdmin(Tournament tournament) {
        String sql = "UPDATE [dbo].[Tournament]\n"
                + "   SET [TimeRegist] = ?\n"
                + "      ,[TimeCloseRegist] = ?\n"
                + "      ,[TimeStart] = ?\n"
                + "      ,[Information] = ?\n"
                + "      ,[Name] = ?\n"
                + "      ,[Award] = ?\n"
                + "      ,[TimeEnd] = ?\n"
                + " WHERE [IDTournament] = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setDate(1, (java.sql.Date) tournament.getTimeRegister());
            st.setDate(2, (java.sql.Date) tournament.getTimeCloseRegister());
            st.setDate(3, (java.sql.Date) tournament.getStart());
            st.setString(4, tournament.getInformation());
            st.setString(5, tournament.getName());
            st.setDouble(6, tournament.getAward());
            st.setDate(7, (java.sql.Date) tournament.getEnd());
            st.setInt(8, tournament.getId());
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteAdmin(int id) {
         String sql = "UPDATE [dbo].[Tournament]\n"
                + "   SET [Status] = 0 \n"
                + " WHERE [IDTournament] = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
