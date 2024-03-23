/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author ngoba
 */
public class RegistFindOpponent {
    private int idRFO;
    private User idAccount1;
    private User idAccount2;
    private String name;
    private String phone;
    private Time timeStart;
    private Time timeEnd;
    private String date;
    private String power;
    private int typeFootballField;
    private double Deposit;
    private int status;

    public RegistFindOpponent(int idRFO, User idAccount1, User idAccount2, String name, String phone, Time timeStart, Time timeEnd, String date, String power, int typeFootballField, double Deposit, int status) {
        this.idRFO = idRFO;
        this.idAccount1 = idAccount1;
        this.idAccount2 = idAccount2;
        this.name = name;
        this.phone = phone;
        this.timeStart = timeStart;
        this.timeEnd = timeEnd;
        this.date = date;
        this.power = power;
        this.typeFootballField = typeFootballField;
        this.Deposit = Deposit;
        this.status = status;
    }

    public int getIdRFO() {
        return idRFO;
    }

    public void setIdRFO(int idRFO) {
        this.idRFO = idRFO;
    }

    public User getIdAccount1() {
        return idAccount1;
    }

    public void setIdAccount1(User idAccount1) {
        this.idAccount1 = idAccount1;
    }

    public User getIdAccount2() {
        return idAccount2;
    }

    public void setIdAccount2(User idAccount2) {
        this.idAccount2 = idAccount2;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Time getTimeStart() {
        return timeStart;
    }

    public void setTimeStart(Time timeStart) {
        this.timeStart = timeStart;
    }

    public Time getTimeEnd() {
        return timeEnd;
    }

    public void setTimeEnd(Time timeEnd) {
        this.timeEnd = timeEnd;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getPower() {
        return power;
    }

    public void setPower(String power) {
        this.power = power;
    }

    public int getTypeFootballField() {
        return typeFootballField;
    }

    public void setTypeFootballField(int typeFootballField) {
        this.typeFootballField = typeFootballField;
    }

    public double getDeposit() {
        return Deposit;
    }

    public void setDeposit(double Deposit) {
        this.Deposit = Deposit;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "RegistFindOpponent{" + "idRFO=" + idRFO + ", idAccount1=" + idAccount1 + ", idAccount2=" + idAccount2 + ", name=" + name + ", phone=" + phone + ", timeStart=" + timeStart + ", timeEnd=" + timeEnd + ", date=" + date + ", power=" + power + ", typeFootballField=" + typeFootballField + ", Deposit=" + Deposit + ", status=" + status + '}';
    }

    

    

}