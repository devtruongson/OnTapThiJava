/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Connect;

import java.sql.*;

/**
 *
 * @author truongson
 */
public class ConnectDB {
    private final Connection con;

    public ConnectDB() {
        this.con = connection();
    }

    private Connection connection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/QLHoDan", "root", "Nson091120@");
        } catch (Exception e) {
            System.out.println("Error :" + e.toString());
            return null;
        }
    }
    
    public ResultSet getData(String query) throws SQLException{
        Statement stmt = this.con.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        return rs;
    }
    
    public boolean DeleteData(String MaHD)  throws SQLException{
        String sql = "delete from HoDan where MaHD = ?";
        PreparedStatement prstm = this.con.prepareStatement(sql);
        prstm.setString(1, MaHD);
        int isDelete = prstm.executeUpdate();
        return isDelete != 0;
    }
}
