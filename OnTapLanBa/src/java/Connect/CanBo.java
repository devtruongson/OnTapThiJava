/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Connect;

/**
 *
 * @author truongson
 */
public class CanBo {

    private String macb;
    private String hoTen;
    private String gioitinh;
    private double luong;

    public CanBo() {
    }

    public CanBo(String macb, String hoTen, String gioitinh, double luong) {
        this.macb = macb;
        this.hoTen = hoTen;
        this.gioitinh = gioitinh;
        this.luong = luong;
    }

    public String getMacb() {
        return macb;
    }

    public String getHoTen() {
        return hoTen;
    }

    public String getGioitinh() {
        return gioitinh;
    }

    public double getLuong() {
        return luong;
    }

    public void setMacb(String macb) {
        this.macb = macb;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public void setGioitinh(String gioitinh) {
        this.gioitinh = gioitinh;
    }

    public void setLuong(double luong) {
        this.luong = luong;
    }

    public double handleThue() {
        if (this.getLuong() < 9000000) {
            return 0;
        }

        if (this.getLuong() >= 9000000 && this.getLuong() >= 15000000) {
            return this.getLuong() * 0.1;
        }

        return this.getLuong() * 0.15;
    }
}
