/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nhatk
 */
public class ProductDetail {
    private int iDProductDetail;
    private int iDProduct;
    private int quantity;
    private int iDBill;
    private int price;

    public ProductDetail() {
    }

    public ProductDetail(int iDProductDetail, int iDProduct, int quantity, int iDBill, int price) {
        this.iDProductDetail = iDProductDetail;
        this.iDProduct = iDProduct;
        this.quantity = quantity;
        this.iDBill = iDBill;
        this.price = price;
    }

    public int getiDProductDetail() {
        return iDProductDetail;
    }

    public void setiDProductDetail(int iDProductDetail) {
        this.iDProductDetail = iDProductDetail;
    }

    public int getiDProduct() {
        return iDProduct;
    }

    public void setiDProduct(int iDProduct) {
        this.iDProduct = iDProduct;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getiDBill() {
        return iDBill;
    }

    public void setiDBill(int iDBill) {
        this.iDBill = iDBill;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
    
}
