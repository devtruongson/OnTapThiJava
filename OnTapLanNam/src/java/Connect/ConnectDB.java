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
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/QLSVTHI", "root", "Nson091120@");
        } catch (Exception e) {
            return null;
        }
    }
    
    public ResultSet getData(String query) throws SQLException {
        Statement stm = this.con.createStatement();
        return stm.executeQuery(query);
    }
}
