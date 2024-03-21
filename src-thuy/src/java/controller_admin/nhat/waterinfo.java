/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller_admin.nhat;

/**
 *
 * @author nhatk
 */
class waterinfo {
    private String loaiNuoc;
    private int soLuong;
    private int giaTien;

    public waterinfo(String loaiNuoc, int soLuong, int giaTien) {
        this.loaiNuoc = loaiNuoc;
        this.soLuong = soLuong;
        this.giaTien = giaTien;
    }

    public waterinfo() {
    }

    public String getLoaiNuoc() {
        return loaiNuoc;
    }

    public void setLoaiNuoc(String loaiNuoc) {
        this.loaiNuoc = loaiNuoc;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public int getGiaTien() {
        return giaTien;
    }

    public void setGiaTien(int giaTien) {
        this.giaTien = giaTien;
    }

    @Override
    public String toString() {
        return "waterinfo{" + "loaiNuoc=" + loaiNuoc + ", soLuong=" + soLuong + ", giaTien=" + giaTien + '}';
    }

    
}
