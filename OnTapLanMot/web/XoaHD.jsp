<%-- 
    Document   : XoaHD
    Created on : Dec 8, 2024, 9:08:32 PM
    Author     : truongson
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%@page import="Connect.ConnectDB, Connect.HoDan"%>

<%
    String MaHDAttr = null;
    Boolean is_delete = null;

    Object MaHDQuery = request.getAttribute("MaHD");
    if (MaHDQuery != null) {
        MaHDAttr = MaHDQuery.toString();
    }

    Object IsDeleteQuery = request.getAttribute("is_deleted");
    if (IsDeleteQuery != null) {
        is_delete = (Boolean) IsDeleteQuery;
    }

    ArrayList<HoDan> listHoDan = new ArrayList<>();
    try {
        ConnectDB con = new ConnectDB();
        ResultSet result = con.getData("select * from HoDan");
        while (result.next()) {
            String MaHD = result.getString("MaHD");
            String TenCH = result.getString("TenCH");
            int SoTV = result.getInt("SoTV");
            double ThuNhap = result.getDouble("ThuNhap");

            HoDan hd = new HoDan(MaHD, TenCH, SoTV, ThuNhap);
            listHoDan.add(hd);
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
        <style>

            *{
                box-sizing: border-box;
                padding: 0;
                margin: 0;
                font-family: 'System-UI';
            }

            body{
                font-size: 16px;
            }

            .container{
                max-width: 1320px;
                margin: 0 auto;
            }

            .mt-5{
                margin-top: 3rem;
            }

            table{
                border-collapse: collapse;
                border: 1px solid #ccc;
                width: 100%;
                font-size: 24px;
            }

            th,td{
                border: 1px solid #ccc;
                padding: 10px 16px;
            }

            th{
                font-weight: bold;
            }

            td{
                font-weight: bold;
            }

            .text-center{
                text-align: center;
            }

            .row {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
                width: 100%;
            }

            .col-6{
                width: 100%;
            }

            label{
                display: block;
                font-weight: 700;
            }

            input{
                display: block;
                font-weight: 600;
                flex: 1;
                border: 1px solid #ccc;
                padding: 0px 10px;
                height: 40px;
                border-radius: 6px;
                outline: none;
            }

            .flex{
                display: flex;
                align-items: center;
            }

            button{
                border: 1px solid #ccc;
                padding: 6px 10px;
                outline: none;
                width: 100px;
                font-weight: 700;
            }

            .rounded-sm{
                border-radius: 10px;
            }

            .suceess{
                background-color: #0d6efd;
                padding: 10px 0;
                color: #fff;
            }

            .failure{
                background-color: #ee4d2d;
                padding: 10px 0;
                color: #fff;
            }
            
            .mb-2{
                margin-bottom: 1rem;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1 class='mt-5 text-center'>Nguyen Truong Son - 21103100538 - DHTI15A10HN</h1>
            <div class="mt-5">
                <div class="row">
                    <form class="col-6" action="XLXoaHD">
                        <label>Nhap Ma Ho Dan Can Xoa</label>
                        <div class="flex">
                            <input value="<%= (MaHDAttr != null) ? MaHDAttr : ""%>" name="MaHD" placeholder="Nhap ma ho dan can xoa...." />
                            <button>Xoa</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="mt-5">
                <%
                    if (is_delete != null && is_delete == false) {
                %>
                <h2 class='text-center failure rounded-sm'>Khong co ho dan ma: <%= MaHDAttr%></h2>
                <%
                } else if (is_delete != null && is_delete == true) {
                %>
                <h2 class='text-center suceess rounded-sm'>Xoa Thanh cong ho dan ma: <%= MaHDAttr%></h2>
                <%
                    }
                %>

            </div>
            <div class="mt-5">
                <h2 class=''>Danh Sach Ho Dan</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Ma HD</th>
                            <th>Ten Chu Ho</th>
                            <th>So Luong Thanh Vien</th>
                            <th>Thu Nhap</th>
                            <th>Tro Cap</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%                            if (listHoDan.isEmpty()) {

                        %>
                        <tr>
                            <td colSpan="5">Khong Co Du Lieu</td>
                        </tr>
                        <%                            } else {

                            for (HoDan hd : listHoDan) {
                        %>
                        <tr>
                            <td><%= hd.getMaHD()%></td>                            
                            <td><%= hd.getTenCH()%></td>          
                            <td><%= hd.getSoTV()%></td>          
                            <td><%= hd.getThuNhap()%></td>
                            <td><%= hd.handleRenderTroCap()%></td>          
                        </tr>
                        <%  }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
