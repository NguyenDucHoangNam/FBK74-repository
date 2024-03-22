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
    private Team teamA;
    private Team teamB;
    private String result;
    private Tournament tournament;
    private String description;    
    private int Status;

    public ScheduleTournament() {
    }

    public ScheduleTournament(int IDScheduleTournament, FootballFieldSchedule footballFieldSchedule, Date date, int Status) {
        this.IDScheduleTournament = IDScheduleTournament;
        this.footballFieldSchedule = footballFieldSchedule;
        this.date = date;
        this.Status = Status;
    }

    public ScheduleTournament(int IDScheduleTournament, FootballFieldSchedule footballFieldSchedule, Date date, Team teamA, Team teamB, String result, Tournament tournament, String description, int Status) {
        this.IDScheduleTournament = IDScheduleTournament;
        this.footballFieldSchedule = footballFieldSchedule;
        this.date = date;
        this.teamA = teamA;
        this.teamB = teamB;
        this.result = result;
        this.tournament = tournament;
        this.description = description;
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

    public Team getTeamA() {
        return teamA;
    }

    public void setTeamA(Team teamA) {
        this.teamA = teamA;
    }

    public Team getTeamB() {
        return teamB;
    }

    public void setTeamB(Team teamB) {
        this.teamB = teamB;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public Tournament getTournament() {
        return tournament;
    }

    public void setTournament(Tournament tournament) {
        this.tournament = tournament;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }

    @Override
    public String toString() {
        return "ScheduleTournament{" + "IDScheduleTournament=" + IDScheduleTournament + ", footballFieldSchedule=" + footballFieldSchedule + ", date=" + date + ", teamA=" + teamA + ", teamB=" + teamB + ", result=" + result + ", tournament=" + tournament + ", description=" + description + ", Status=" + Status + '}';
    }

    public void setDate(String date) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
      
}
