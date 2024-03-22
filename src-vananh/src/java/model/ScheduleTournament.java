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
public class ScheduleTournament {
    private int IDScheduleTournament;
    private FootballFieldSchedule footballFieldSchedule;
    private Date date;
    private int Status;

    public ScheduleTournament() {
    }

    public ScheduleTournament(int IDScheduleTournament, FootballFieldSchedule footballFieldSchedule, Date date, int Status) {
        this.IDScheduleTournament = IDScheduleTournament;
        this.footballFieldSchedule = footballFieldSchedule;
        this.date = date;
        this.Status = Status;
    }

    public int getIDScheduleTournament() {
        return IDScheduleTournament;
    }

    public void setIDScheduleTournament(int IDScheduleTournament) {
        this.IDScheduleTournament = IDScheduleTournament;
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
