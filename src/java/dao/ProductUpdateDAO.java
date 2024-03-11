/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;

/**
 *
 * @author Van Anh
 */
public class ProductUpdateDAO extends DBContext {

     public void addProduct(Product product)  {
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            String sql = "INSERT INTO Product (name, image, price, quantity) VALUES (?, ?, ?, ?)";
            statement = connection.prepareStatement(sql);
            statement.setString(1, product.getName());
            statement.setString(2, product.getImage());
            statement.setDouble(3, product.getPrice());
            statement.setInt(4, product.getQuantity());
            statement.executeUpdate();
        } catch (SQLException ex) {
             Logger.getLogger(ProductUpdateDAO.class.getName()).log(Level.SEVERE, null, ex);
         } finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductUpdateDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductUpdateDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
    public int updateProduct(Product product) {
        Connection connection = null;
        String sql = "";
        if(product.getImage() == null){
               sql = "UPDATE [dbo].[Product]\n"
                    + "   SET [name] =' " + product.getName() + "'\n"
                    + "      ,[price] = " + product.getPrice() + "\n"
                    + "      ,[quantity] = " + product.getQuantity() + "\n"
                    + " WHERE id=" + product.getId() + "";
        }else{
             sql = "UPDATE [dbo].[Product]\n"
                    + "   SET [name] =' " + product.getName() + "'\n"
                    + "      , [image] =' " + product.getImage()+ "'\n"
                    + "      ,[price] = " + product.getPrice() + "\n"
                    + "      ,[quantity] = " + product.getQuantity() + "\n"
                    + " WHERE id=" + product.getId() + "";
        }
                
        try {
            connection = getConnection();
          
            PreparedStatement statement = connection.prepareStatement(sql);

            return statement.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        return 0;
    }

    public static void main(String[] args) {
        ProductUpdateDAO ProductUpdateDAO = new ProductUpdateDAO();

        
        ProductUpdateDAO.updateProduct(new Product("15", "1221", "1212", 1, 1));
    }
}
