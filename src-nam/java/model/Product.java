
package model;


public class Product {
    private String id;
    private String name;
    private String image;
    private double price;
    private int quantity;

    public Product() {
    }

    public Product(String id, String name, String image, double price, int quantity) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.price = price;
        this.quantity = quantity;
    }

    
    public Product( String name, String image, double price, int quantity) {
        
        this.name = name;
        this.image = image;
        this.price = price;
        this.quantity = quantity;
    }

    public Product(String productId, String productName, int productQuantity, String productImage) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
}
