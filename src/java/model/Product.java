
package model;


public class Product {
    private int id;
    private String name;
    private String image;
    private int quantity;

    public Product() {
    }

    public Product(int id, String name, String image, int quantity) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.quantity = quantity;
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", image=" + image + ", quantity=" + quantity + '}';
    }
    
    

}
