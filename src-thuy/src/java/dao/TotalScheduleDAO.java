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
import model.FootballField;
import model.TotalSchedule;

/**
 *
 * @author nhatk
 */
public class TotalScheduleDAO extends DBContext {

    public List<TotalSchedule> getTotalSchedule(String date) {
        List<TotalSchedule> list = new ArrayList<>();
        RegisteredFootballFieldDAO rffDAO = new RegisteredFootballFieldDAO();
        StudyScheduleDAO ssDAO = new StudyScheduleDAO();
        ScheduleTournamentDAO stDAO = new ScheduleTournamentDAO();
        String sql = "SELECT IDStudySchedule, NULL AS IDScheduleTournament, NULL AS IDRegisteredFootballField, [Date]\n"
                + "FROM [dbo].[StudySchedule]\n"
                + "WHERE [Date] = ? and [status] = 0 \n"
                + "UNION ALL\n"
                + "SELECT NULL AS IDStudySchedule, IDScheduleTournament, NULL AS IDRegisteredFootballField, [Date]\n"
                + "FROM [dbo].[ScheduleTournament]\n"
                + "WHERE [Date] = ? and status = 0 \n"
                + "UNION ALL\n"
                + "SELECT NULL AS IDStudySchedule, NULL AS IDScheduleTournament, IDRegisteredFootballField, [Date]\n"
                + "FROM [dbo].[RegisteredFootballField]\n"
                + "WHERE [Date] = ? and status = 1;";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, date);
            st.setString(2, date);
            st.setString(3, date);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int idRegisteredFootballField = rs.getInt("IDRegisteredFootballField");
                int idscheduleTournament = rs.getInt("IDScheduleTournament");
                int idStudySchedule = rs.getInt("IDStudySchedule");
                TotalSchedule totalSchedule = new TotalSchedule();
                totalSchedule.setRegisteredFootballField(rffDAO.getRegisteredFootballFielByID(idRegisteredFootballField));
                totalSchedule.setScheduleTournament(stDAO.getScheduleTournamentByID(idscheduleTournament));
                totalSchedule.setStudySchedule(ssDAO.getStudyScheduleByID(idStudySchedule));
                list.add(totalSchedule);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public static void main(String[] args) {
        TotalScheduleDAO tsDAO = new TotalScheduleDAO();
        List<TotalSchedule> list = new ArrayList<>();
        list = tsDAO.getTotalSchedule("2024-03-08");
        for (TotalSchedule totalSchedule : list) {
            System.out.println(totalSchedule.getScheduleTournament());
        }
    }
}
