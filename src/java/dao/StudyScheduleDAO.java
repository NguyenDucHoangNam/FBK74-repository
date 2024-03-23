/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.ScheduleTournament;
import model.StudySchedule;

/**
 *
 * @author nhatk
 */
public class StudyScheduleDAO extends DBContext {

    public StudySchedule getStudyScheduleByID(int id) {
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
                StudySchedule sS = new StudySchedule();
                sS.setIDStudySchedule(id);
                sS.setStatus(rs.getInt("Status"));
                sS.setFootballFieldSchedule(ffsDAO.getFootballFieldScheduleByID(rs.getInt("IDFootballFieldSchedule")));
                sS.setDate(rs.getDate("Date"));
                return sS;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
