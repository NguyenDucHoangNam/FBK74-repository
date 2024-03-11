/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author DELL
 */
public class Tournament {

    private int id;
    private Date timeRegister;
    private Date timeCloseRegister;
    private Date start;
    private Date end;
    private Double award;
    private int NumberTeamRegister;
    private String information;
    private String image;
    private String Name;

    public Tournament() {
    }

    public Tournament(int id, Date timeRegister, Date timeCloseRegister, Date start, Date end, Double award, int NumberTeamRegister, String information, String image, String Name) {
        this.id = id;
        this.timeRegister = timeRegister;
        this.timeCloseRegister = timeCloseRegister;
        this.start = start;
        this.end = end;
        this.award = award;
        this.NumberTeamRegister = NumberTeamRegister;
        this.information = information;
        this.image = image;
        this.Name = Name;
    }
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getTimeRegister() {
        return timeRegister;
    }

    public void setTimeRegister(Date timeRegister) {
        this.timeRegister = timeRegister;
    }

    public Date getTimeCloseRegister() {
        return timeCloseRegister;
    }

    public void setTimeCloseRegister(Date timeCloseRegister) {
        this.timeCloseRegister = timeCloseRegister;
    }

    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public int getNumberTeamRegister() {
        return NumberTeamRegister;
    }

    public void setNumberTeamRegister(int NumberTeamRegister) {
        this.NumberTeamRegister = NumberTeamRegister;
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public Date getEnd() {
        return end;
    }

    public void setEnd(Date end) {
        this.end = end;
    }

    public Double getAward() {
        return award;
    }

    public void setAward(Double award) {
        this.award = award;
    }
    
    
}
