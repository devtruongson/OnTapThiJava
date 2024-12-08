<%-- 
    Document   : TimKiem
    Created on : Dec 8, 2024, 10:32:15 PM
    Author     : truongson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%@page import="Connect.ConnectDB, Connect.HoDan"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>

<%
    ArrayList<HoDan> listHoDan = (ArrayList<HoDan>) request.getAttribute("list_hd");
    String MaHD = null;

    Object MaHDAttr = request.getAttribute("MaHD");
    if (MaHDAttr != null) {
        MaHD = MaHDAttr.toString();
    }

    if (listHoDan == null) {
        listHoDan = new ArrayList<>();
        try {
            ConnectDB con = new ConnectDB();
            ResultSet rs = con.getData("select * from HoDan");
            while (rs.next()) {
                String MaHDDB = rs.getString("MaHD");
                String TenCH = rs.getString("TenCH");
                int SoTv = rs.getInt("SoTV");
                double ThuNhap = rs.getDouble("ThuNhap");
                HoDan hd = new HoDan(MaHDDB, TenCH, SoTv, ThuNhap);
                listHoDan.add(hd);
            }
        } catch (Exception e) {
        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            *{
                box-sizing: border-box;
                padding: 0;
                margin: 0;
                font-family: "System-UI";
            }

            .container{
                max-width: 1320px;
                margin: 0 auto;
            }

            .mt-5{
                margin-top: 3rem;
            }

            .mb-2{
                margin-bottom: 1rem;
            }

            .rounded-sm{
                border-radius: 10px;
            }

            table{
                border-collapse: collapse;
                width: 100%;
            }

            th, tr,td{
                border: 1px solid #ccc;
                padding: 5px 10px;
                font-weight: bold;
            }

            buttton{
                border: 1px solid #ccc;
                width: 100px;
                padding: 6px 10px;
                height: 40px;
            }

            input{
                display: block;
                width: 100%;
                border: 1px solid #ccc;
                padding: 0 10px;
                height: 40px;
                outline: none;
            }

            .row{
                display: flex;
                justify-content: space-between;
                flex-wrap: wrap;
            }

            .col-12{
                width: 100%;
            }

            .flex{
                display: flex;
            }

            .text-center{
                text-align: center;
            }

            label{
                display: block;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1 class="text-center mt-5">Nguyen Truong Son - 21103100538 - DHTI15A10HN</h1>
            <div class="mt-5">
                <label>Nhap Ma HD de Tim Kiem</label>
                <form class="flex" action="XLTimKiem">
                    <input value="<%=(MaHD != null) ? MaHD: ""%>" name="MaHD" placeholder="Nhap MaHD De Tim Kiem....." />
                    <buttton class='text-center'>Tim Kiem</buttton>
                </form>
            </div>
            <div class="mt-5">
                <label>Danh Sach Ho Dan</label>
                <table>
                    <thead>
                        <tr>
                            <th>Ma HD</th>                           
                            <th>Ten Chu Ho</th>
                            <th>So Luong TV</th>
                            <th>Thu Nhap</th>
                            <th>Tro Cap</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (listHoDan.isEmpty()) {
                        %>
                        <tr>
                            <td colSpan="5">Khong Tim Thay Ma Nhan vien</td>                           
                        </tr>
                        <%
                        } else {
                            for (HoDan hd : listHoDan) {
                        %>
                        <tr>
                            <td><%=hd.getMaHD()%></td>                           
                            <td><%=hd.getTenCH()%></td>  
                            <td><%=hd.getSoTV()%></td>  
                            <td><%=hd.getThuNhap()%></td>                        
                            <td><%=hd.handleRenderTroCap()%></td>  
                        </tr>
                        <%}
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
