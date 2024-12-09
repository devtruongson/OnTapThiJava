<%-- 
    Document   : display.jsp
    Created on : Dec 9, 2024, 10:24:52 PM
    Author     : truongson
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Connect.ConnectDB, Connect.CanBo"%>
<%@page import="java.sql.*"%>

<%
    String macbQuery = request.getAttribute("macb") != null ? request.getAttribute("macb").toString() : "";
    Boolean isDeleted = null;
    Object isDeletedAttr = request.getAttribute("isDeleted");
    if (isDeletedAttr != null) {
        isDeleted = (boolean) isDeletedAttr;
    }

    ArrayList<CanBo> listCanBo = new ArrayList<>();
    try {
        ConnectDB con = new ConnectDB();
        ResultSet rs = con.getData("select * from CanBo");

        while (rs.next()) {
            String macb = rs.getString("macb");
            String hoTen = rs.getString("hoTen");
            String gioitinh = rs.getString("gioitinh");
            double luong = rs.getDouble("luong");
            CanBo cb = new CanBo(macb, hoTen, gioitinh, luong);
            listCanBo.add(cb);
        }
    } catch (Exception e) {
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="XLXoa" method="GET">
            <input value="<%=macbQuery%>" name="macb" placeholder="Nhap macb de xoa...."  required/>
            <button>Xoa</button>
        </form>
        <%
            if (isDeleted != null && isDeleted == false) {
        %>
        <h1>Khong the xoa do ban khi nay khong co: <%=macbQuery%></h1>
        <%
        } else if (isDeleted != null && isDeleted == true) {
        %>
        <h1>Xoa Thanh cong ban khi nay co ma: <%=macbQuery%></h1>
        <%
            }
        %>
        <table>
            <thead>
                <tr>
                    <th>MaCB</th>
                    <th>Ten CB</th>
                    <th>Gioi Tinh</th>
                    <th>Luong</th>
                    <th>Thue</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (listCanBo.isEmpty()) {
                %>
                <tr>
                    <td colSpan="5">Danh Sach Can bo Trong</td>
                </tr>
                <%
                } else {
                    for (CanBo cb : listCanBo) {
                %>
                <tr>
                    <td><%=cb.getMacb()%></td>
                    <td><%=cb.getHoTen()%></td>
                    <td><%=cb.getGioitinh()%></td>
                    <td><%=cb.getLuong()%></td>
                    <td><%=cb.handleThue()%></td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
    </body>
</html>
