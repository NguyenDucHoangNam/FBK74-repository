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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;
import model.ProductDetail;

/**
 *
 * @author nhatk
 */
public class ProductDetailDAO extends DBContext {

    public List<ProductDetail> getAllProductDetail() throws SQLException {
        List<ProductDetail> productDetails = new ArrayList<>();
        Connection connection = null;
        try {
            connection = getConnection();
            String sql = "SELECT [IDProductDetail]\n"
                    + "      ,[IDProduct]\n"
                    + "      ,[Quantity]\n"
                    + "      ,[IDBill]\n"
                    + "      ,[Price]\n"
                    + "  FROM [dbo].[ProductDetail]";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("IDProductDetail");
                int idProduct = resultSet.getInt("IDProduct");
                int quantity = resultSet.getInt("Quantity");
                int idBill = resultSet.getInt("IDBill");
                int price = resultSet.getInt("Price");
                ProductDetail productDetail = new ProductDetail(idProduct, idProduct, quantity, idBill, price);
                productDetails.add(productDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        return productDetails;
    }

    public void insertProductDetail(ProductDetail productDetail) {
        String sql = "INSERT INTO [dbo].[ProductDetail]\n"
                + "           ([IDProduct]\n"
                + "           ,[Quantity]\n"
                + "           ,[IDBill]\n"
                + "           ,[Price])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, productDetail.getiDProduct());
            st.setInt(2, productDetail.getQuantity());
            st.setInt(3, productDetail.getiDBill());
            st.setInt(4, productDetail.getPrice());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public List<ProductDetail> getProductDetailByIDBill(int id) {
        List<ProductDetail> list = new ArrayList<>();
        String sql = "SELECT [IDProductDetail]\n"
                    + "      ,[IDProduct]\n"
                    + "      ,[Quantity]\n"
                    + "      ,[IDBill]\n"
                    + "      ,[Price]\n"
                    + "  FROM [dbo].[ProductDetail] where IDBill = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int idProductDetail = rs.getInt("IDProductDetail");
                int idProduct = rs.getInt("IDProduct");
                int quantity = rs.getInt("Quantity");
                int idBill = rs.getInt("IDBill");
                int price = rs.getInt("Price");
                ProductDetail productDetail = new ProductDetail(idProductDetail, idProduct, quantity, idBill, price);
                list.add(productDetail);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public static void main(String[] args) {
        ProductDetailDAO pdDAO = new ProductDetailDAO();
        ProductDetail pd = new ProductDetail(0, 1, 5, 113, 10000);
        System.out.println(pdDAO.getProductDetailByIDBill(113));
    }
}
