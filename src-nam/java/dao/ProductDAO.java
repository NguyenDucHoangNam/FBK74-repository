package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Product;

public class ProductDAO extends DBContext {

    public void addProduct(Product product) throws SQLException {
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
        } finally {
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
    }

    public List<Product> getAllProducts() throws SQLException {
        List<Product> products = new ArrayList<>();
        Connection connection = null;
        try {
            connection = getConnection();
            String sql = "SELECT * FROM Product";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString("id");
                String name = resultSet.getString("name");
                String image = resultSet.getString("image");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                Product product = new Product(id, name, image, price, quantity);
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        return products;
    }

    public Product findProductById(String id) {
        Product product = null;
        Connection connection = null;
        try {
            connection = getConnection();
            String sql = "SELECT * FROM Product where id=" + id;
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {

                String name = resultSet.getString("name");
                String image = resultSet.getString("image");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                product = new Product(id, name, image, price, quantity);
                return product;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        return product;
    }

    public void updateProduct(Product product) {
        Connection connection = null;
        try {
            connection = getConnection();
            String sql = "UPDATE [dbo].[Product]\n" +
"   SET [name] = "+product.getName()+"\n" +
"      ,[image] = "+product.getImage()+"\n" +
"      ,[price] = "+product.getPrice()+"\n" +
"      ,[quantity] = "+product.getQuantity()+"\n" +
" WHERE id="+product.getId()+"";
            PreparedStatement statement = connection.prepareStatement(sql);
            
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }
    }

    public void deleteProduct(String productId) {
        Connection connection = null;

        try {
            connection = getConnection();
            String sql = "DELETE FROM Product WHERE id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, productId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }
    }

    public static void main(String[] args) {
        ProductDAO productDAO = new ProductDAO();
     
           productDAO.updateProduct(new Product("1", "a", "abc", 1, 1));
        System.out.println("ok");
    }

    public List<Product> findProductsWithPagination(int start, int productsPerPage) {
        List<Product> products = new ArrayList<>();
        Connection connection = null;
        try {
            connection = getConnection();
            String sql = "SELECT * FROM Product\n"
                    + "ORDER BY id ASC\n"
                    + "OFFSET ? ROWS\n"
                    + "FETCH NEXT ? ROWS ONLY;";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(2, productsPerPage);
            statement.setInt(1, start);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString("id");
                String name = resultSet.getString("name");
                String image = resultSet.getString("image");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                Product product = new Product(id, name, image, price, quantity);
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        return products;
    }

    public List<Product> searchProductsWithPagination(int start, int productsPerPage, String keyword) {
        List<Product> products = new ArrayList<>();
        Connection connection = null;
        try {
            connection = getConnection();
            String sql = "SELECT * FROM Product\n"
                    + "where name like '%"+keyword+"%' \n"
                    + "ORDER BY id ASC\n"
                    + "OFFSET "+start+" ROWS\n"
                    + "FETCH NEXT "+productsPerPage+" ROWS ONLY;";
            PreparedStatement statement = connection.prepareStatement(sql);
            
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString("id");
                String name = resultSet.getString("name");
                String image = resultSet.getString("image");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                Product product = new Product(id, name, image, price, quantity);
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        return products;
    }
    
}
