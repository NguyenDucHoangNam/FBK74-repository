package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {

    public Connection getConnection() throws SQLException {
        try {
            Connection con = null;
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=FBK74; user = sa; password = 612003";
            con = DriverManager.getConnection(url);
            return con;
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return null;
    }
    public static void main(String[] args) throws SQLException {
        DBContext db = new DBContext();
        System.out.println("Test :"+db.getConnection());
    }
}