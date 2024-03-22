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

/**
 *
 * @author nhatk
 */
public class FootballFieldDAO extends DBContext {

    public List<FootballField> getFootballFields() {
        List<FootballField> list = new ArrayList<>();
        String sql = "SELECT [IDFootballField]\n"
                + "      ,[Name]\n"
                + "      ,[TypeofFootballField]\n"
                + "      ,[Price]\n"
                + "      ,[Image]\n"
                + "      ,[Status]\n"
                + "  FROM [dbo].[FootballField]";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int IDFootballField = rs.getInt("IDFootballField");
                String Name = rs.getString("Name");
                int TypeofFootballField = rs.getInt("TypeofFootballField");
                int Price = rs.getInt("Price");
                String Image = rs.getString("Image");
                int Status = rs.getInt("Status");
                FootballField fbf = new FootballField(IDFootballField, Name, TypeofFootballField, Price, Image, Status);
                list.add(fbf);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public FootballField getFootballFieldByID(int id) {
        String sql = "SELECT [IDFootballField]\n"
                + "      ,[Name]\n"
                + "      ,[TypeofFootballField]\n"
                + "      ,[Price]\n"
                + "      ,[Image]\n"
                + ",[Status]"
                + "  FROM [dbo].[FootballField] where IDFootballField=?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int IDFootballField = rs.getInt("IDFootballField");
                String Name = rs.getString("Name");
                int TypeofFootballField = rs.getInt("TypeofFootballField");
                int Price = rs.getInt("Price");
                String Image = rs.getString("Image");
                int Status = rs.getInt("Status");
                FootballField fbf = new FootballField(IDFootballField, Name, TypeofFootballField, Price, Image, Status);
                return fbf;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public void updateFootballField(FootballField ff) {
        String sql = "UPDATE [dbo].[FootballField]\n"
                + "   SET "
                + "   [Name] = ?\n"
                + "   ,[TypeofFootballField] = ?\n"
                + "      ,[Price] = ?\n"
                + "      ,[Image] = ?\n"
                + " WHERE IDFootballField = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, ff.getName());
            st.setInt(2, ff.getTypeofFootballField());
            st.setInt(3, ff.getPrice());
            st.setString(4, ff.getImage());
            st.setInt(5, ff.getIDFootballField());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        FootballFieldDAO fbfDao = new FootballFieldDAO();
        List<FootballField> list = new ArrayList<>();
//        list = fbfDao.getFootballFields();
//        for (FootballField footballField : list) {
//            System.out.println(footballField.toString());
//        }
        FootballField ff = new FootballField(4, "Sân 4", 5, 300000, "AVATAR.png",0);
        fbfDao.updateFootballField(ff);
    }

}
