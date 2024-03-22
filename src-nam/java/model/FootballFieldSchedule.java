/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Time;

/**
 *
 * @author nhatk
 */
public class FootballFieldSchedule {
//    [IDFootballFieldSchedule]
//      ,[StartTime]
//      ,[Endtime]
//      ,[IDFootballField]
    private int IDFootballFieldSchedule;
    private Time StartTime;
    private Time EndTime;
    private FootballField FootballField;
    private int Status;

    public FootballFieldSchedule() {
    }

    public FootballFieldSchedule(int IDFootballFieldSchedule, Time StartTime, Time EndTime, FootballField FootballField, int Status) {
        this.IDFootballFieldSchedule = IDFootballFieldSchedule;
        this.StartTime = StartTime;
        this.EndTime = EndTime;
        this.FootballField = FootballField;
        this.Status = Status;
    }

    public int getIDFootballFieldSchedule() {
        return IDFootballFieldSchedule;
    }

    public void setIDFootballFieldSchedule(int IDFootballFieldSchedule) {
        this.IDFootballFieldSchedule = IDFootballFieldSchedule;
    }

    public Time getStartTime() {
        return StartTime;
    }

    public void setStartTime(Time StartTime) {
        this.StartTime = StartTime;
    }

    public Time getEndTime() {
        return EndTime;
    }

    public void setEndTime(Time EndTime) {
        this.EndTime = EndTime;
    }

    public FootballField getFootballField() {
        return FootballField;
    }

    public void setFootballField(FootballField FootballField) {
        this.FootballField = FootballField;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }

    
       
    
}
