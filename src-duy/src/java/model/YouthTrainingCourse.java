/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

public class YouthTrainingCourse {
   private int idYouthTrainingCourse;
    private String nameYouthTrainingCourse;
    private Date timeRegist;
    private Date timeCloseRegist;
    private Date timeStart;
    private double tuition;
    private String information;
    private String image;

    // Constructor
    public YouthTrainingCourse() {
    }

    // Getter and Setter methods

    public YouthTrainingCourse(int idYouthTrainingCourse, String nameYouthTrainingCourse, Date timeRegist, Date timeCloseRegist, Date timeStart, double tuition, String information, String image) {
       this.idYouthTrainingCourse = idYouthTrainingCourse;
        this.nameYouthTrainingCourse = nameYouthTrainingCourse;
        this.timeRegist = timeRegist;
        this.timeCloseRegist = timeCloseRegist;
        this.timeStart = timeStart;
        this.tuition = tuition;
        this.information = information;
        this.image = image;
    }

    public int getIdYouthTrainingCourse() {
       return idYouthTrainingCourse;
    }

    public void setIdYouthTrainingCourse(int idYouthTrainingCourse) {
        this.idYouthTrainingCourse = idYouthTrainingCourse;
   }

    public String getNameYouthTrainingCourse() {
        return nameYouthTrainingCourse;
    }

    public void setNameYouthTrainingCourse(String nameYouthTrainingCourse) {
        this.nameYouthTrainingCourse = nameYouthTrainingCourse;
    }

    public Date getTimeRegist() {
        return timeRegist;
    }

    public void setTimeRegist(Date timeRegist) {
        this.timeRegist = timeRegist;
    }

    public Date getTimeCloseRegist() {
        return timeCloseRegist;
    }

    public void setTimeCloseRegist(Date timeCloseRegist) {
        this.timeCloseRegist = timeCloseRegist;
    }

    public Date getTimeStart() {
        return timeStart;
    }

    public void setTimeStart(Date timeStart) {
        this.timeStart = timeStart;
    }

    public double getTuition() {
        return tuition;
    }

    public void setTuition(double tuition) {
        this.tuition = tuition;
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

    @Override
    public String toString() {
       return "YouthTrainingCourse{" + "idYouthTrainingCourse=" + idYouthTrainingCourse + ", nameYouthTrainingCourse=" + nameYouthTrainingCourse + ", timeRegist=" + timeRegist + ", timeCloseRegist=" + timeCloseRegist + ", timeStart=" + timeStart + ", tuition=" + tuition + ", information=" + information + ", image=" + image + '}';
   }

    
    
}
