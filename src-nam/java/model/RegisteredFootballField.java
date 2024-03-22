/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author nhatk
 */
public class RegisteredFootballField {
//[IDRegisteredFootballField]
//      ,[IDAccount1]
//      ,[IDAccount2]
//      ,[IDRegistFindOppoent]
//      ,[IDFootballFieldSchedule]
//      ,[Date]
//      ,[Name]
//      ,[PhoneNumber]
//      ,[Deposit]
//      ,[Status]    
    private int IDRegisteredFootballField;
    private User Account1;
    private User Account2;
    private RegistFindOpponent RegistFindOppoent;
    private FootballFieldSchedule FootballFieldSchedule;
    private Date Date;
    private String Name;
    private String PhoneNumber;
    private int Deposit;
    private int Status; //1 đã đăng ký(đang diễn ra),2 chờ xét duyệt, 3 đã diễn ra, 4 Hủy-chờ hoàn tiền , 5 Đã hủy-hoàn tiền, 6 Đã hủy-không hoàn, 7 từ chối
    private String Note;

    public RegisteredFootballField() {
    }

    public RegisteredFootballField(int IDRegisteredFootballField, User Account1, User Account2, RegistFindOpponent RegistFindOppoent, FootballFieldSchedule FootballFieldSchedule, Date Date, String Name, String PhoneNumber, int Deposit, int Status, String Note) {
        this.IDRegisteredFootballField = IDRegisteredFootballField;
        this.Account1 = Account1;
        this.Account2 = Account2;
        this.RegistFindOppoent = RegistFindOppoent;
        this.FootballFieldSchedule = FootballFieldSchedule;
        this.Date = Date;
        this.Name = Name;
        this.PhoneNumber = PhoneNumber;
        this.Deposit = Deposit;
        this.Status = Status;
        this.Note = Note;
    }

    public int getIDRegisteredFootballField() {
        return IDRegisteredFootballField;
    }

    public void setIDRegisteredFootballField(int IDRegisteredFootballField) {
        this.IDRegisteredFootballField = IDRegisteredFootballField;
    }

    public User getAccount1() {
        return Account1;
    }

    public void setAccount1(User IDAccount1) {
        this.Account1 = IDAccount1;
    }

    public User getAccount2() {
        return Account2;
    }

    public void setAccount2(User IDAccount2) {
        this.Account2 = IDAccount2;
    }

    public RegistFindOpponent getRegistFindOppoent() {
        return RegistFindOppoent;
    }

    public void setRegistFindOppoent(RegistFindOpponent RegistFindOppoent) {
        this.RegistFindOppoent = RegistFindOppoent;
    }

    public FootballFieldSchedule getFootballFieldSchedule() {
        return FootballFieldSchedule;
    }

    public void setFootballFieldSchedule(FootballFieldSchedule FootballFieldSchedule) {
        this.FootballFieldSchedule = FootballFieldSchedule;
    }

    public Date getDate() {
        return Date;
    }

    public void setDate(Date Date) {
        this.Date = Date;
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

    public int getDeposit() {
        return Deposit;
    }

    public void setDeposit(int Deposit) {
        this.Deposit = Deposit;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }

    public String getNote() {
        return Note;
    }

    public void setNote(String Note) {
        this.Note = Note;
    }

    @Override
    public String toString() {
        return "RegisteredFootballField{" + "IDRegisteredFootballField=" + IDRegisteredFootballField + ", IDAccount1=" + Account1 + ", IDAccount2=" + Account2 + ", RegistFindOppoent=" + RegistFindOppoent + ", FootballFieldSchedule=" + FootballFieldSchedule + ", Date=" + Date + ", Name=" + Name + ", PhoneNumber=" + PhoneNumber + ", Deposit=" + Deposit + ", Status=" + Status + ", Note=" + Note + '}';
    }

    
    
    

}
