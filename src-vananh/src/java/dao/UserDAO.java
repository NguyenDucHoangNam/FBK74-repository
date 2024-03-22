/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

public class UserDAO extends DBContext {

    public boolean updateUserImage(String IDAccount, String imagePath) {
        boolean rowUpdated = false;
        String updateQuery = "UPDATE [FBK74].[dbo].[Account] SET image = ? WHERE IDAccount = ?";

        try ( Connection connection = getConnection();  PreparedStatement statement = connection.prepareStatement(updateQuery)) {

            statement.setString(1, imagePath);
            statement.setString(2, IDAccount);

            rowUpdated = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return rowUpdated;
    }
     private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
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
                + "        ,[MaXacThuc]"
                + "        ,[ThoiGianMaXacThuc]"
                + "        ,[TrangThaiXacThuc]"
                + "  FROM [dbo].[Account] where [IDAccount] =?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, accountId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("IDAccount");
                String name = rs.getString("Name");
                String userName = rs.getString("UserName");
                String password = rs.getString("PassWord");
                int gender = rs.getInt("Gender");
                String phoneNumber = rs.getString("PhoneNumber");
                String idEmail = rs.getString("IDEmail");
                String idFacebook = rs.getString("IDFacebook");
                String bank = rs.getString("Bank");
                String bankNumber = rs.getString("BankNumber");
                int role = rs.getInt("Role");
                int status = rs.getInt("Status");
                Date dob = rs.getDate("Dob");
                String maXacThuc = rs.getString("MaXacThuc");
                Date thoiGianMaXacThuc = rs.getTimestamp("ThoiGianMaXacThuc"); // Adjusted to use as Date
                boolean trangThaiXacThuc = rs.getBoolean("TrangThaiXacThuc"); // Adjusted for boolean type

                User newUser = new User(id, name, userName, password, gender, phoneNumber, idEmail, idFacebook, bank, bankNumber, role, status, dob, maXacThuc, thoiGianMaXacThuc, trangThaiXacThuc);
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
                + "      ,[image]"
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
                 String image = rs.getString("image");
                User newUser = new User(id, name, emailReceived, password, gender, phoneNumber, idEmail, idFacebook, bank, bankNumber, role, status, date);
               newUser.setImage(image);
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

    public int addUser(User account) {
        int userId = -1;
        String query = "INSERT INTO Account (UserName, PassWord, Name, IDEmail, Role, Status, Gender, MaXacThuc, ThoiGianMaXacThuc, TrangThaiXacThuc) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try ( Connection connection = getConnection();  PreparedStatement preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setString(1, account.getUserName());
            preparedStatement.setString(2, account.getPassWord());
            preparedStatement.setString(3, account.getName());
            preparedStatement.setString(4, account.getIDEmail());
            preparedStatement.setInt(5, account.getRole());
            preparedStatement.setInt(6, account.getStatus());
            preparedStatement.setInt(7, account.getGender());
            preparedStatement.setString(8, account.getMaXacThuc());
            preparedStatement.setTimestamp(9, new java.sql.Timestamp(account.getThoiGianMaXacThuc().getTime()));
            preparedStatement.setBoolean(10, account.isTrangThaiXacThuc());

            int rowsAffected = preparedStatement.executeUpdate();
            if (rowsAffected > 0) {
                ResultSet rs = preparedStatement.getGeneratedKeys();
                if (rs.next()) {
                    userId = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userId;
    }

    public boolean changePasswordWithOldPassword(String password, String email, String oldPassword) {
        try {
            Connection connection = getConnection();
            String query = "UPDATE Account SET [PassWord] = ? where [IDEmail] = ? AND [PassWord] = ?";

            try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
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

            try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
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
                + "[Gender] = ?, [Dob] = ?, [IDFacebook] = ?, [Bank] = ? , [BankNumber] = ?, [Image] = ? "
                + "WHERE [IDAccount] = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, user.getName());
            st.setString(2, user.getPhoneNumber());
            st.setString(3, user.getIDEmail());
            st.setInt(4, user.getGender());
            // Chuyển đổi ngày
            st.setString(5, Date);
            st.setString(6, user.getIDFacebook());
            st.setString(7, user.getBank());
            st.setString(8, user.getBankNumber());
            // Thiết lập giá trị cho trường `image`
            st.setString(9, user.getImage());
            // Cập nhật IDAccount ở cuối để phù hợp với dấu ? cuối cùng trong câu lệnh SQL
            st.setInt(10, user.getIDAccount());
            int affectedRow = st.executeUpdate();
            return affectedRow > 0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean updateVerifyInformation(User user, String Date) {
        String sql = "UPDATE dbo.[Account] SET [MaXacThuc] = ?, [ThoiGianMaXacThuc] = ?, [TrangThaiXacThuc] = ? "
                + "WHERE [IDAccount] = ?";

        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, user.getMaXacThuc());
            st.setDate(2, (java.sql.Date) user.getThoiGianMaXacThuc());
            st.setBoolean(3, user.isTrangThaiXacThuc());
            st.setInt(4, user.getIDAccount());
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
        System.out.println(userDAO.getUserByUserName("ManNhi452"));

    }

    public boolean verifyUser(int IDAccount, String maXacThuc) {
        String sql = "UPDATE [dbo].[Account] SET [TrangThaiXacThuc] = 1 WHERE [IDAccount] = ? AND [MaXacThuc] = ? AND [TrangThaiXacThuc] = 0";
        try ( Connection conn = getConnection();  PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, IDAccount);
            ps.setString(2, maXacThuc);

            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public User getUserById(int accountId) {
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

    public List<User> getAllUser() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
