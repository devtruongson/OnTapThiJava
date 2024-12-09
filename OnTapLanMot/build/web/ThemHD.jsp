<%-- 
    Document   : ThemHD
    Created on : Dec 8, 2024, 11:09:36 PM
    Author     : truongson
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%@page import="Connect.ConnectDB, Connect.HoDan"%>
<%@page import="java.sql.*"%>

<%
    String MaHDQuery = null;
    String TenCHQuery = null;
    int SoTVQuery = 0;
    double ThuNhapQuery = 0;
    Boolean isInserted = null;

    Object MaHDAttr = request.getAttribute("MaHD");
    Object TenCHAttr = request.getAttribute("TenCH");
    Object SoTVAttr = request.getAttribute("SoTV");
    Object ThuNhapAttr = request.getAttribute("ThuNhap");
    Object IsInstedAttr = request.getAttribute("is_inserted");

    if (MaHDAttr != null) {
        MaHDQuery = MaHDAttr.toString();
    }

    if (IsInstedAttr != null) {
        isInserted = (Boolean) IsInstedAttr;
    }

    if (TenCHAttr != null) {
        TenCHQuery = TenCHAttr.toString();
    }

    if (SoTVAttr != null) {
        SoTVQuery = Integer.parseInt(SoTVAttr.toString());
    }

    if (ThuNhapAttr != null) {
        ThuNhapQuery = Double.parseDouble(ThuNhapAttr.toString());
    }

    ArrayList<HoDan> listHoDan = new ArrayList<>();
    try {
        ConnectDB con = new ConnectDB();
        ResultSet rs = con.getData("select * from HoDan");
        while (rs.next()) {
            String MaHD = rs.getString("MaHD");
            String TenCH = rs.getString("TenCH");
            int SoTV = rs.getInt("SoTV");
            double ThuNhap = rs.getDouble("ThuNhap");
            HoDan hd = new HoDan(MaHD, TenCH, SoTV, ThuNhap);
            listHoDan.add(hd);
        }
    } catch (Exception e) {
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
            }

            .container{
                max-width: 1320px;
                margin: 0 auto;
            }

            html {
                font-family: "System-UI";
            }

            .flex{
                display: flex;
            }

            .row{
                display: flex;
                justify-content: space-between;
                flex-wrap: wrap;
            }

            .col-6{
                width: 48%;
            }

            input{
                width: 100%;
                height: 40px;
                padding: 0 10px;
                outline: none;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            label{
                display: block;
                font-weight: 600;
            }

            .mt-5{
                margin-top: 3rem;
            }

            button{
                height: 40px;
                outline: none;
                padding: 0 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                margin-top: 10px;
            }

            table{
                border-collapse: collapse;
                width: 100%;
            }

            th,tr,td{
                border: 1px solid #ccc;
                padding: 6px 10px;
            }

            .text-center{
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="mt-5 container">
            <h1 class="text-center">Nguyen Truong Son - DHTI15A10HN - 21103100538</h1>
            <div>
                <form class="row" action="ThemHD" method="POST">
                    <div class="col-6">
                        <label>Ma Ho Dan</label>
                        <input value="<%=(MaHDQuery != null) ? MaHDQuery : ""%>" placeholder="Nhap Ma Ho Dan...." name="MaHD" required />
                    </div>
                    <div class="col-6">
                        <label>Ten Chu Ho</label>
                        <input value="<%=(TenCHQuery != null) ? TenCHQuery : ""%>" placeholder="Nhap Ten Chu Ho...." name="TenCH" required />
                    </div>
                    <div class="col-6">
                        <label>So Thanh Vien</label>
                        <input value="<%=(SoTVQuery != 0) ? SoTVQuery : ""%>" placeholder="Nhap So Thanh Vien...." name="SoTV" required />
                    </div>
                    <div class="col-6">
                        <label>Thu Nhap Gia Dinh</label>
                        <input value="<%=(ThuNhapQuery != 0) ? ThuNhapQuery : ""%>" placeholder="Nhap Thu Nhap...." name="ThuNhap" required />
                    </div>
                    <button>Them Moi Ho Dan</button>
                </form>
            </div>
        </div>
        <div class="mt-5 container">
            <%               if (isInserted != null && isInserted == false) {
            %>  
            <h2>Khong The Them Ho Dan Do Trung Ma: <%= MaHDQuery%></h2>
            <%
            } else if (isInserted != null && isInserted == true) {
            %>  
            <h2>Them Ho Dan Thanh Cong Co Ma: <%= MaHDQuery%></h2>
            <%
                }
            %>
        </div>
        <div class="mt-5 container">
            <h2>Danh Sach Ho Dan</h2>
            <div>
                <table>
                    <thead>
                        <tr>
                            <th>Ma Ho Dan</th>
                            <th>Ten Chu Ho</th>
                            <th>So Thanh Vien</th>
                            <th>Thu Nhap</th>
                            <th>Tro Cap</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%                            if (listHoDan.isEmpty()) {
                        %>
                        <tr>
                            <td colSpan='5'>Khong Co Ho Dan Nao</td>
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
                        <%
                                }
                            }

                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
