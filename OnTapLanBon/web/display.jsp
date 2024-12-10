<%-- 
    Document   : display.jsp
    Created on : Dec 10, 2024, 12:49:40 PM
    Author     : truongson
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Connect.ConnectDB, Connect.Product"%>
<%@page import="java.sql.*"%>

<%
    ArrayList<Product> listProduct = (ArrayList<Product>) request.getAttribute("list");
    String IDQuery = request.getAttribute("ID") != null ? request.getAttribute("ID").toString() : "";
    Double sum = request.getAttribute("sum") != null ? Double.parseDouble(request.getAttribute("sum").toString()) : null;

    if (listProduct == null) {
        listProduct = new ArrayList<>();
        try {
            ConnectDB con = new ConnectDB();
            ResultSet rs = con.getData("select * from Product");
            while (rs.next()) {
                String ID = rs.getString("ID");
                String ten = rs.getString("ten");
                int soluong = rs.getInt("soluong");
                double dongia = rs.getDouble("dongia");

                Product pr = new Product(ID, ten, soluong, dongia);
                listProduct.add(pr);
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
            }

            .container{
                max-width: 1320px;
                margin: 0 auto;
            }

            .text-center{
                text-align: center;
            }

            .mt-5{
                margin-top: 3rem;
            }

            .row{
                display: flex;
                justify-content: space-between;
                flex-wrap: wrap;
            }

            .col-6{
                width: 48%;
            }

            label{
                display: block;
                font-weight: 700;
            }

            input{
                border: 1px solid #ccc;
                height: 40px;
                border-radius: 6px;
                padding: 0 10px;
                width: 100%;
            }

            button{
                border: 1px solid #ccc;
                height: 40px;
                padding: 0 10px;
                border-radius: 6px;
                margin-top: 10px;
            }

            h2{
                font-size: 24px;
                background: #ee4d2d;
                text-align: center;
                padding: 10px 0;
                margin-top: 10px;
                border-radius: 10px;
            }

            table{
                width: 100%;
                border-collapse: collapse;
            }

            th,th,td{
                border: 1px solid #ccc;
                padding: 6px 10px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1 class="text-center mt-5">Nguyen Truong Son - DHTI15A10HN - 21103100538</h1>
            <form class="mt-5" action="XLTimKiem">
                <label>Nhap ID San Pham De Tim Kiem</label>
                <input value="<%=IDQuery%>" name="ID" placeholder="Nhap ID San Pham...." />
                <button>
                    Tim Kiem
                </button>
            </form>
            <div class="mt-5">
                <h3>Danh Sach San Pham</h3>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Ten</th>
                            <th>So Luong</th>
                            <th>Don Gia</th>
                            <th>Thanh Tien</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%                           if (listProduct.isEmpty()) {
                        %>
                        <tr>
                            <td colSpan="5"> Không Có Sản Phẩm Nào <%=IDQuery%>!</td>
                        </tr>
                        <%
                        } else {
                            for (Product pr : listProduct) {
                        %>
                        <tr>
                            <td><%=pr.getID()%></td>
                            <td><%=pr.getTen()%></td>
                            <td><%=pr.getSoluong()%></td>
                            <td><%=pr.getDongia()%></td>
                            <td><%=pr.getTongTien()%></td>
                        </tr>
                        <%
                                }
                            }

                        %>
                    </tbody>
                </table>
            </div>
            <form action="XLTinhTong">
                <button>
                    Tong Tien Cac Mat Hang
                </button>
            </form>
            <%                        if (sum != null) {
            %>
            <h3>Tổng Tiền Là: <%=sum%></h3>
            <%
                }
            %>
        </div>
    </body>
</html>
