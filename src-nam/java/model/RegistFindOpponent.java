/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author nhatk
 */
public class RegistFindOpponent {

    private int IDRegistFindOppoent;
    private User Account1;
    private User Account2;
    private String Name;
    private String PhoneNumber;
    private Time  TimeStart;
    private Time TimeEnd;
    private Date Date;
    private String Power;
    private int TypeOfFootballField;
    private int Deposit;
    private int status; // 1 da dang ky, 2 da huy, 3 đã đăng ký và được lựa chọn

    public RegistFindOpponent() {
    }

    public RegistFindOpponent(int IDRegistFindOppoent, User Account1, User Account2, String Name, String PhoneNumber, Time TimeStart, Time TimeEnd, Date Date, String Power, int TypeOfFootballField, int Deposit, int status) {
        this.IDRegistFindOppoent = IDRegistFindOppoent;
        this.Account1 = Account1;
        this.Account2 = Account2;
        this.Name = Name;
        this.PhoneNumber = PhoneNumber;
        this.TimeStart = TimeStart;
        this.TimeEnd = TimeEnd;
        this.Date = Date;
        this.Power = Power;
        this.TypeOfFootballField = TypeOfFootballField;
        this.Deposit = Deposit;
        this.status = status;
    }

    public int getIDRegistFindOppoent() {
        return IDRegistFindOppoent;
    }

    public void setIDRegistFindOppoent(int IDRegistFindOppoent) {
        this.IDRegistFindOppoent = IDRegistFindOppoent;
    }

    public User getAccount1() {
        return Account1;
    }

    public void setAccount1(User Account1) {
        this.Account1 = Account1;
    }

    public User getAccount2() {
        return Account2;
    }

    public void setAccount2(User Account2) {
        this.Account2 = Account2;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }

    public Time getTimeStart() {
        return TimeStart;
    }

    public void setTimeStart(Time TimeStart) {
        this.TimeStart = TimeStart;
    }

    public Time getTimeEnd() {
        return TimeEnd;
    }

    public void setTimeEnd(Time TimeEnd) {
        this.TimeEnd = TimeEnd;
    }

    public Date getDate() {
        return Date;
    }

    public void setDate(Date Date) {
        this.Date = Date;
    }

    public String getPower() {
        return Power;
    }

    public void setPower(String Power) {
        this.Power = Power;
    }

    public int getTypeOfFootballField() {
        return TypeOfFootballField;
    }

    public void setTypeOfFootballField(int TypeOfFootballField) {
        this.TypeOfFootballField = TypeOfFootballField;
    }

    public int getDeposit() {
        return Deposit;
    }

    public void setDeposit(int Deposit) {
        this.Deposit = Deposit;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    
    
}
