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
public class StudySchedule {
    private int IDStudySchedule;
    private FootballFieldSchedule footballFieldSchedule;
    private Date date;
    private int Status;

    public StudySchedule() {
    }

    public StudySchedule(int IDStudySchedule, FootballFieldSchedule footballFieldSchedule, Date date, int Status) {
        this.IDStudySchedule = IDStudySchedule;
        this.footballFieldSchedule = footballFieldSchedule;
        this.date = date;
        this.Status = Status;
    }

    public int getIDStudySchedule() {
        return IDStudySchedule;
    }

    public void setIDStudySchedule(int IDStudySchedule) {
        this.IDStudySchedule = IDStudySchedule;
    }

    public FootballFieldSchedule getFootballFieldSchedule() {
        return footballFieldSchedule;
    }

    public void setFootballFieldSchedule(FootballFieldSchedule footballFieldSchedule) {
        this.footballFieldSchedule = footballFieldSchedule;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }

    

   
}
