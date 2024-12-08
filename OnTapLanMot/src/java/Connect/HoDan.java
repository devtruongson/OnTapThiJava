/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Connect;

/**
 *
 * @author truongson
 */
public class HoDan {

    private String MaHD;
    private String TenCH;
    private int SoTV;
    private double ThuNhap;

    public HoDan() {
    }

    public HoDan(String MaHD, String TenCH, int SoTV, double ThuNhap) {
        this.MaHD = MaHD;
        this.TenCH = TenCH;
        this.SoTV = SoTV;
        this.ThuNhap = ThuNhap;
    }

    public String getMaHD() {
        return MaHD;
    }

    public String getTenCH() {
        return TenCH;
    }

    public int getSoTV() {
        return SoTV;
    }

    public double getThuNhap() {
        return (double)ThuNhap;
    }

    public void setMaHD(String MaHD) {
        this.MaHD = MaHD;
    }

    public void setTenCH(String TenCH) {
        this.TenCH = TenCH;
    }

    public void setSoTV(int SoTV) {
        this.SoTV = SoTV;
    }

    public void setThuNhap(double ThuNhap) {
        this.ThuNhap = ThuNhap;
    }

    public double handleRenderTroCap() {
        if (this.getThuNhap() < 2000000) {
            return (double)200000 * this.getSoTV();
        }

        if (this.getThuNhap() < 3000000) {
            return (double)100000 * this.getSoTV();
        }

        if (this.getThuNhap() < 5000000) {
            return (double)50000 * this.getSoTV();
        }

        return 0;
    }
}
