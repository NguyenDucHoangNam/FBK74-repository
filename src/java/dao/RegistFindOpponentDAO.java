/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
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
                int IDAccount2 =rs.getInt("IDAccount2");
                User Account2 = userd.getUserByIDAccount(IDAccount2);
                String Name = rs.getString("Name");
                String PhoneNumber = rs.getString("PhoneNumber");
                Time TimeStart = rs.getTime("TimeStart");
                Time TimeEnd = rs.getTime("TimeEnd");
                Date Date = rs.getDate("Date");
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

}
