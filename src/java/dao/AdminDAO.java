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
import model.User;

/**
 *
 * @author Datnt
 */
public class AdminDAO extends DBContext {

    public int getTotalUser() throws SQLException {
        PreparedStatement st = null;
        ResultSet rs = null;
        String sql = "SELECT COUNT(*) FROM dbo.[Account] WHERE Role != 3";
        try {
            st = getConnection().prepareStatement(sql);
            rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (st != null) {
                st.close();
            }
        }
        return 0;
    }

    public List<User> getUsers(int index) throws SQLException {
        PreparedStatement st = null;
        ResultSet rs = null;
        List<User> listUsers = new ArrayList();
        String sql = "SELECT [IDAccount]\n"
                + "      ,[UserName]\n"
                + "      ,[PassWord]\n"
                + "      ,[Gender]\n"
                + "      ,[PhoneNumber]\n"
                + "      ,[IDEmail]\n"
                + "      ,[IDFacebook]\n"
                + "      ,[Bank]\n"
                + "      ,[BankNumber]\n"
                + "      ,[Role]\n"
                + "      ,[Status]\n"
                + "       ,[Name]  "
                + "  FROM [dbo].[Account] where Role != 3 order by Gender desc offset ? row fetch next 10 rows only";
        try {
            st = getConnection().prepareStatement(sql);
            st.setInt(1, (index -1) * 10);
            rs = st.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setIDAccount(rs.getInt("IDAccount"));
                user.setName(rs.getString("Name"));
                user.setUserName(rs.getString("UserName"));
                user.setPassWord(rs.getString("Password"));
                user.setGender(rs.getInt("Gender"));
                user.setPhoneNumber(rs.getString("PhoneNumber"));
                user.setIDEmail(rs.getString("IDEmail"));
                user.setIDFacebook(rs.getString("IDFacebook"));
                user.setBank(rs.getString("Bank"));
                user.setBankNumber(rs.getString("BankNumber"));
                user.setRole(rs.getInt("Role"));
                user.setStatus(rs.getInt("Status"));
                
                listUsers.add(user);
            }
            return listUsers;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (st != null) {
                st.close();
            }
        }
        return null;
    }

    public int disableUser(int accId) throws SQLException {
        PreparedStatement st = null;
        ResultSet rs = null;
        String sql = "UPDATE dbo.Account SET Status = 1 WHERE IDAccount = ?  ";
        try {
            st = getConnection().prepareStatement(sql);
            st.setInt(1, accId);
            int affectedRow = st.executeUpdate();
            if (affectedRow > 0) {
                return 1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (st != null) {
                st.close();
            }
        }
        return 0;
    }

    public int enableUser(int accId) throws SQLException {
        PreparedStatement st = null;
        ResultSet rs = null;
        String sql = "UPDATE dbo.Account SET Status = 0 WHERE IDAccount = ?  ";
        try {
            st = getConnection().prepareStatement(sql);
            st.setInt(1, accId);
            int affectedRow = st.executeUpdate();
            if (affectedRow > 0) {
                return 1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (st != null) {
                st.close();
            }
        }
        return 0;
    }

    public int setRoleUser(int accountId, int RoleId) throws SQLException {
        PreparedStatement st = null;
        ResultSet rs = null;
        String sql = "UPDATE dbo.Account SET Role = ? WHERE IDAccount = ?  ";
        try {
            st = getConnection().prepareStatement(sql);
            st.setInt(1, RoleId);
            st.setInt(2, accountId);
            int affectedRow = st.executeUpdate();
            if (affectedRow > 0) {
                return 1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (st != null) {
                st.close();
            }
        }
        return 0;
    }
}
