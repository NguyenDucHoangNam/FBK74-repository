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
}
