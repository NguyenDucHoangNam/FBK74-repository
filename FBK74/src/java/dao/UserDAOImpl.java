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
import model.User;

/**
 *
 * @author Van Anh
 */
public class UserDAOImpl extends DBContext implements UserDAO {

    @Override
    public User getUserByEmail(String UserName) {
        String sql = "SELECT [IDAccount]\n" +
"      ,[Name]\n" +
"      ,[UserName]\n" +
"      ,[PassWord]\n" +
"      ,[Gender]\n" +
"      ,[PhoneNumber]\n" +
"      ,[IDEmail]\n" +
"      ,[IDFacebook]\n" +
"      ,[Bank]\n" +
"      ,[BankNumber]\n" +
"      ,[Role]\n" +
"  FROM [dbo].[Account] where UserName=?";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, UserName);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                int id = rs.getInt("IDAccount");
                String name = rs.getString("Name");
                String emailReceived = rs.getString("UserName");
                String password = rs.getString("password");
                int gender = rs.getInt("Gender");
                String phoneNumber = rs.getString("PhoneNumber");
                String idEmail = rs.getString("IDEmail");
                String idFacebook = rs.getString("IDFacebook");
                String bank = rs.getString("Bank");
                String bankNumber = rs.getString("BankNumber");
                int role = rs.getInt("Role");
                User newUser = new User(id, name, emailReceived, password, gender, phoneNumber, idEmail, idFacebook, bank, bankNumber, role);
                return newUser;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public static void main(String[] args) {
        UserDAO us = new UserDAOImpl();
        System.out.println(us.getUserByEmail("nhatkarit"));
    }
    
}
