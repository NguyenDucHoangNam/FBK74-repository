/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

public class UserDAO extends DBContext {

    public User getUserByIDAccount(int accountId) {
        String sql = "SELECT [IDAccount]\n"
                + "      ,[Name]\n"
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
                + "       ,[Dob]  "
                + "  FROM [dbo].[Account] where [IDAccount] =?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, accountId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
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
                int status = rs.getInt("Status");
                Date date = rs.getDate("Dob");
                User newUser = new User(id, name, emailReceived, password, gender, phoneNumber, idEmail, idFacebook, bank, bankNumber, role, status, date);
                return newUser;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public User getUserByUserName(String UserName) {
        String sql = "SELECT [IDAccount]\n"
                + "      ,[Name]\n"
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
                + "       ,[Dob]  "
                + "  FROM [dbo].[Account] where UserName=?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, UserName);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
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
                int status = rs.getInt("Status");
                Date date = rs.getDate("Dob");
                User newUser = new User(id, name, emailReceived, password, gender, phoneNumber, idEmail, idFacebook, bank, bankNumber, role, status, date);
                return newUser;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public User getUserByUserEmail(String email) {
        String sql = "SELECT [IDAccount]\n"
                + "      ,[Name]\n"
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
                + "       ,[Dob]  "
                + "  FROM [dbo].[Account] where IDEmail=?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
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
                int status = rs.getInt("Status");
                User newUser = new User(id, name, emailReceived, password, gender, phoneNumber, idEmail, idFacebook, bank, bankNumber, role, status);
                return newUser;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<User> getAllUser() {
        List<User> users = new ArrayList<>();

        String sql = "SELECT [IDAccount]\n"
                + "      ,[Name]\n"
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
                + "       ,[Dob]  "
                + "  FROM [dbo].[Account]";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
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
                int status = rs.getInt("Status");
                User newUser = new User(id, name, emailReceived, password, gender, phoneNumber, idEmail, idFacebook, bank, bankNumber, role, status);
                users.add(newUser);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
    }

    public void insertUserByGoogle(User user) {
        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([IDAccount]\n"
                + "           ,[Name]\n"
                + "           ,[IDEmail]\n"
                + "           ,[Role])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, user.getIDAccount());
            st.setString(2, user.getName());
            st.setString(3, user.getIDEmail());
            st.setInt(4, user.getRole());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public boolean checkEmail(String email) {
        String sql = "SELECT TOP (1000) [IDAccount]\n"
                + "      ,[Name]\n"
                + "      ,[UserName]\n"
                + "      ,[PassWord]\n"
                + "      ,[Gender]\n"
                + "      ,[PhoneNumber]\n"
                + "      ,[IDEmail]\n"
                + "      ,[IDFacebook]\n"
                + "      ,[Bank]\n"
                + "      ,[BankNumber]\n"
                + "      ,[Role]\n"
                + "  FROM [FBK74].[dbo].[Account] where IDEmail = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public int getLengthUser() {
        int i = 0;
        String sql = "SELECT [IDAccount]\n"
                + "      ,[Name]\n"
                + "      ,[UserName]\n"
                + "      ,[PassWord]\n"
                + "      ,[Gender]\n"
                + "      ,[PhoneNumber]\n"
                + "      ,[IDEmail]\n"
                + "      ,[IDFacebook]\n"
                + "      ,[Bank]\n"
                + "      ,[BankNumber]\n"
                + "      ,[Role]\n"
                + "  FROM [dbo].[Account]";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                i++;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return i;
    }

    public boolean addUser(User account) {
        try (Connection connection = getConnection()) {
            String query = "INSERT INTO Account (UserName, [PassWord], [Name], IDEmail, Role, Status, Gender) VALUES (?, ?, ?, ?, ?, ?, ?)";

            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {

                preparedStatement.setString(1, account.getUserName());
                preparedStatement.setString(2, account.getPassWord());
                preparedStatement.setString(3, account.getName());
                preparedStatement.setString(4, account.getIDEmail());
                // set default for user register have role = 1 [Customer] va status = 0;
                preparedStatement.setInt(5, 1);
                preparedStatement.setInt(6, 0);
                preparedStatement.setInt(7, account.getGender());

                //1 la minh duong dan tuyet doi cua tam anh do.
                //2 chuyen tam anh do thanh dang binary de luu duoi db luon.
                // O Quan dang on qua anh k nghe em noi gi ca Van ANh. da em nghe roi 
                int rowsAffected = preparedStatement.executeUpdate();

                return rowsAffected > 0; // Returns true if at least one row was affected
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Print the stack trace for debugging purposes
            System.out.println("Add user unsuccessfully!");
            return false;
        }
    }

    public boolean changePasswordWithOldPassword(String password, String email, String oldPassword) {
        try {
            Connection connection = getConnection();
            String query = "UPDATE Account SET [PassWord] = ? where [IDEmail] = ? AND [PassWord] = ?";

            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, password);
                preparedStatement.setString(2, email);
                preparedStatement.setString(3, oldPassword);
                int rowsAffected = preparedStatement.executeUpdate();
                return rowsAffected > 0;
            }

        } catch (SQLException e) {

        }
        return false;
    }

    public boolean changePassword(String password, String email) {
        try {
            Connection connection = getConnection();
            String query = "UPDATE Account SET [PassWord] = ? where [IDEmail] = ?";

            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, password);
                preparedStatement.setString(2, email);
                int rowsAffected = preparedStatement.executeUpdate();
                return rowsAffected > 0;
            }

        } catch (SQLException e) {

        }
        return false;
    }

    public boolean updateProfile(User user, String Date) {
        String sql = "UPDATE dbo.[Account] SET [Name] = ?, [PhoneNumber] = ?, [IDEmail] = ?, "
                + "[Gender] = ?, [Dob] = ?, [IDFacebook] = ?, [Bank] = ? , [BankNumber] = ? "
                + "WHERE [IDAccount] = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, user.getName());
            st.setString(2, user.getPhoneNumber());
            st.setString(3, user.getIDEmail());
            st.setInt(4, user.getGender());
            // conver tdate
            st.setString(5, Date);
            st.setString(6, user.getIDFacebook());
            st.setString(7, user.getBank());
            st.setString(8, user.getBankNumber());
            st.setInt(9, user.getIDAccount());
            int affectedRow = st.executeUpdate();
            if (affectedRow > 0) {
                return true;
            }
            return false;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public static void main(String[] args) {
        // Replace these values with the user details you want to add
        String testUsername = "abc";
        String testPassword = "testPassword";
        String testName = "Test User";
        String email = "ac@gmail.com";

        // Create a UserDAO instance
        UserDAO userDAO = new UserDAO();
        /*
        public User(String Name, String UserName,String email,String PassWord) {
         */
        User user = new User(testName, testUsername, email, testPassword);
        System.out.println(userDAO.getUserByUserName("nhat123"));

    }

}
