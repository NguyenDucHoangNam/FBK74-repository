/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nhatk
 */
public class FootballField {
    private int IDFootballField;
    private String Name;
    private int TypeofFootballField;
    private int Price;
    private String Image;
    private int Status;
// [IDFootballField]
//      ,[Name]
//      ,[TypeofFootballField]
//      ,[Price]

    public FootballField() {
    }  

    public FootballField(int IDFootballField, String Name, int TypeofFootballField, int Price, String Image, int Status) {
        this.IDFootballField = IDFootballField;
        this.Name = Name;
        this.TypeofFootballField = TypeofFootballField;
        this.Price = Price;
        this.Image = Image;
        this.Status = Status;
    }

    public int getIDFootballField() {
        return IDFootballField;
    }

    public void setIDFootballField(int IDFootballField) {
        this.IDFootballField = IDFootballField;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public int getTypeofFootballField() {
        return TypeofFootballField;
    }

    public void setTypeofFootballField(int TypeofFootballField) {
        this.TypeofFootballField = TypeofFootballField;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }
    
    
}
