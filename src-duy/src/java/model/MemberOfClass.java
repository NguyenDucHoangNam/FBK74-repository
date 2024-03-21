/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class MemberOfClass {

    private int idMemberOfClass;
    private int idAccount;
    private int idClass;
    private String phoneNumber;
    private String nameStudent;
    private YouthTrainingCourse course;
    private ClassEntity classCourse;
    private int age;
    private int height;
    private int weight;
    private int status1;

    public MemberOfClass() {
    }

    public MemberOfClass(int idMemberOfClass, int idAccount, int idClass, String phoneNumber, String nameStudent, YouthTrainingCourse course, ClassEntity classCourse, int age, int height, int weight, int status1) {
        this.idMemberOfClass = idMemberOfClass;
        this.idAccount = idAccount;
        this.idClass = idClass;
        this.phoneNumber = phoneNumber;
        this.nameStudent = nameStudent;
        this.course = course;
        this.classCourse = classCourse;
        this.age = age;
        this.height = height;
        this.weight = weight;
        this.status1 = status1;
    }

    public int getIdMemberOfClass() {
        return idMemberOfClass;
    }

    public void setIdMemberOfClass(int idMemberOfClass) {
        this.idMemberOfClass = idMemberOfClass;
    }

    public int getIdAccount() {
        return idAccount;
    }

    public void setIdAccount(int idAccount) {
        this.idAccount = idAccount;
    }

    public int getIdClass() {
        return idClass;
    }

    public void setIdClass(int idClass) {
        this.idClass = idClass;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getNameStudent() {
        return nameStudent;
    }

    public void setNameStudent(String nameStudent) {
        this.nameStudent = nameStudent;
    }

    public YouthTrainingCourse getCourse() {
        return course;
    }

    public void setCourse(YouthTrainingCourse course) {
        this.course = course;
    }

    public ClassEntity getClassCourse() {
        return classCourse;
    }

    public void setClassCourse(ClassEntity classCourse) {
        this.classCourse = classCourse;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public int getStatus1() {
        return status1;
    }

    public void setStatus1(int status1) {
        this.status1 = status1;
    }

    @Override
    public String toString() {
        return "MemberOfClass{" + "idMemberOfClass=" + idMemberOfClass + ", idAccount=" + idAccount + ", idClass=" + idClass + ", phoneNumber=" + phoneNumber + ", nameStudent=" + nameStudent + ", course=" + course + ", classCourse=" + classCourse + ", age=" + age + ", height=" + height + ", weight=" + weight + ", status1=" + status1 + '}';
    }



}
