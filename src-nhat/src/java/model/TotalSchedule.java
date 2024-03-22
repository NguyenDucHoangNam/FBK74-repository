/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nhatk
 */
//lưu lại danh sách các lịch sân bóng đang có
public class TotalSchedule {
    private RegisteredFootballField registeredFootballField;
    private ScheduleTournament scheduleTournament;
    private StudySchedule studySchedule;

    public TotalSchedule() {
    }

    public TotalSchedule(RegisteredFootballField registeredFootballField, ScheduleTournament scheduleTournament, StudySchedule studySchedule) {
        this.registeredFootballField = registeredFootballField;
        this.scheduleTournament = scheduleTournament;
        this.studySchedule = studySchedule;
    }

    public RegisteredFootballField getRegisteredFootballField() {
        return registeredFootballField;
    }

    public void setRegisteredFootballField(RegisteredFootballField registeredFootballField) {
        this.registeredFootballField = registeredFootballField;
    }

    public ScheduleTournament getScheduleTournament() {
        return scheduleTournament;
    }

    public void setScheduleTournament(ScheduleTournament scheduleTournament) {
        this.scheduleTournament = scheduleTournament;
    }

    public StudySchedule getStudySchedule() {
        return studySchedule;
    }

    public void setStudySchedule(StudySchedule studySchedule) {
        this.studySchedule = studySchedule;
    }

    @Override
    public String toString() {
        return "TotalSchedule{" + "registeredFootballField=" + registeredFootballField + ", scheduleTournament=" + scheduleTournament + ", studySchedule=" + studySchedule + '}';
    }
    

    
    
    
}
