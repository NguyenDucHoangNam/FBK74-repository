/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class ClassEntity {

    private int idClass;
    private int idYouthTrainingCourse;
    private String coachName;
    private String coachPhoneNumber;
    private int numberOfStudent;
    private int status;

    public ClassEntity() {
    }

    public ClassEntity(int idClass, int idYouthTrainingCourse, String coachName, String coachPhoneNumber, int numberOfStudent, int status) {
        this.idClass = idClass;
        this.idYouthTrainingCourse = idYouthTrainingCourse;
        this.coachName = coachName;
        this.coachPhoneNumber = coachPhoneNumber;
        this.numberOfStudent = numberOfStudent;
        this.status = status;
    }

    public int getIdClass() {
        return idClass;
    }

    public void setIdClass(int idClass) {
        this.idClass = idClass;
    }

    public int getIdYouthTrainingCourse() {
        return idYouthTrainingCourse;
    }

    public void setIdYouthTrainingCourse(int idYouthTrainingCourse) {
        this.idYouthTrainingCourse = idYouthTrainingCourse;
    }

    public String getCoachName() {
        return coachName;
    }

    public void setCoachName(String coachName) {
        this.coachName = coachName;
    }

    public String getCoachPhoneNumber() {
        return coachPhoneNumber;
    }

    public void setCoachPhoneNumber(String coachPhoneNumber) {
        this.coachPhoneNumber = coachPhoneNumber;
    }

    public int getNumberOfStudent() {
        return numberOfStudent;
    }

    public void setNumberOfStudent(int numberOfStudent) {
        this.numberOfStudent = numberOfStudent;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "ClassEntity{" + "idClass=" + idClass + ", idYouthTrainingCourse=" + idYouthTrainingCourse + ", coachName=" + coachName + ", coachPhoneNumber=" + coachPhoneNumber + ", numberOfStudent=" + numberOfStudent + ", status=" + status + '}';
    }

    
}
