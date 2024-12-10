/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Connect;

/**
 *
 * @author truongson
 */
public class SinhVien {
    private String MaSV;
    private String TenSV;
    private double DiemGPA;

    public SinhVien(String MaSV, String TenSV, double DiemGPA) {
        this.MaSV = MaSV;
        this.TenSV = TenSV;
        this.DiemGPA = DiemGPA;
    }

    public String getMaSV() {
        return MaSV;
    }

    public String getTenSV() {
        return TenSV;
    }

    public double getDiemGPA() {
        return DiemGPA;
    }

    public void setMaSV(String MaSV) {
        this.MaSV = MaSV;
    }

    public void setTenSV(String TenSV) {
        this.TenSV = TenSV;
    }

    public void setDiemGPA(double DiemGPA) {
        this.DiemGPA = DiemGPA;
    }
}
