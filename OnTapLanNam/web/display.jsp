<%-- 
    Document   : display.jsp
    Created on : Dec 10, 2024, 10:32:23 PM
    Author     : truongson
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Connect.ConnectDB, Connect.SinhVien"%>
<%@page import="java.sql.*"%>


<%
    ArrayList<SinhVien> listSinhVien = new ArrayList<>();
    String sort = request.getParameter("sort") != null ? request.getParameter("sort") : "";

    String query = "select * from SinhVien";

    if (sort.equalsIgnoreCase("desc")) {
        query += " order by DiemGPA DESC";
    }

    if (sort.equalsIgnoreCase("asc")) {
        query += " order by DiemGPA ASC";
    }

    try {
        ConnectDB con = new ConnectDB();
        ResultSet rs = con.getData(query);
        while (rs.next()) {
            String MaSV = rs.getString("MaSV");
            String TenSV = rs.getString("TenSV");
            double DiemGPA = rs.getDouble("DiemGPA");
            SinhVien sv = new SinhVien(MaSV, TenSV, DiemGPA);
            listSinhVien.add(sv);
        }
    } catch (Exception e) {
        System.err.println("Err: " + e.toString());
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form>
            <input type="radio" name="sort"  value="default" <% if(sort.equalsIgnoreCase("default") || sort.equalsIgnoreCase(""))  %> checked<% %> /><span>Mac Dinh</span>           
            <input type="radio" name="sort"  value="asc" <% if(sort.equalsIgnoreCase("asc"))  %> checked<% %> /><span>Tang Dan</span>
            <input type="radio" name="sort" value="desc" <% if(sort.equalsIgnoreCase("desc"))  %> checked<% %> /><span>Giam Dan</span>
            <button>SORT</button>
        </form>
        <table>
            <thead>
                <tr>
                    <th>Ma SV</th>                    
                    <th>Ten SV</th>
                    <th>Diem GPA SV</th>
                </tr>
            </thead>
            <tbody>
                <%                    if (listSinhVien.isEmpty()) {
                %>
                <tr>
                    <td colSpan="3">Khong co sinh vien</td>
                </tr>
                <%
                } else {
                    for (SinhVien sv : listSinhVien) {
                %>
                <tr>
                    <td><%=sv.getMaSV()%></td>
                    <td><%=sv.getTenSV()%></td>
                    <td><%=sv.getDiemGPA()%></td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
    </body>
</html>
